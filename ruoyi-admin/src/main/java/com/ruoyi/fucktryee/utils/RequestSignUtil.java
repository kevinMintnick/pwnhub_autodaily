package com.ruoyi.fucktryee.utils;


import com.ruoyi.fucktryee.pojo.*;

import com.ruoyi.fucktryee.service.impl.TemperatureSignLogServicesImpl;
import okhttp3.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Component
public class RequestSignUtil {

    @Autowired
    private TemperatureSignLogServicesImpl signLogServices;

    private static RequestSignUtil requestSignUtil;

    @PostConstruct
    public void init() {
        requestSignUtil = this;
        requestSignUtil.signLogServices = this.signLogServices;
    }




    //TODO 传参增加Setting，用于获取动态KEY
    public static String doPostTemperatureSign(User user, Config config,String encrypt) throws IOException, ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat df = new SimpleDateFormat("HH:mm");
        SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");

        String signType = "1";
        String areaType = "A";

        if ("1".equals(user.getAreaType())){
            //学府东苑
            areaType = "学府东苑";
        }else if ("2".equals(user.getAreaType())){
            //学府西苑
            areaType = "学府西苑";
        }

        Date now = df.parse(df.format(new Date()));
        if (BelongCalendarUtil.belongCalendar(now,df.parse("06:30"), df.parse("08:30"))){
            signType = "1";
        }else if (BelongCalendarUtil.belongCalendar(now,df.parse("21:00"), df.parse("23:00"))){
            signType = "3";
        }

        //随机生成一个温度
        double temperature = (36.1 + ((36.9 - 36.1) * new Random().nextDouble()));
        //格式化温度
        String newTemperature = FormatTemperature.formateRate(Double.toString(temperature));
        //处理地址
        String[] address = user.getAddress().split("##");;
        //获取地址数量
        int addressCount = address.length;
        String lat;
        String lng;
        if ("学府西苑".equals(areaType)){
            //生成学府西苑的坐标
            Coordinate coord = GenCoordinateUtils.getWestSignCoordinate();
            lat = coord.getLat();
            lng = coord.getLng();
        }else if ("学府东苑".equals(areaType)){
            //生成学府东苑的坐标
            Coordinate coord = GenCoordinateUtils.getEastSignCoordinate();
            lat = coord.getLat();
            lng = coord.getLng();
        }else{
            String[] latlng = user.getLatlng().split(",");
            lat = latlng[0];
            lng = latlng[1];
        }
        //TODO 处理经纬度
        //产生一个随机数用于抽取随机地址
        Random r = new Random();
        int randomNum = r.nextInt(addressCount);
        //System.out.println(address[randomNum]);
        //实例化一个OkHttpClient
        OkHttpClient client = new OkHttpClient();
        try {
            //将参数封装到HashMap

            Map<String, String> paramsMap = new HashMap<>(9);
            paramsMap.put("studentId",  config.getStuSystemId());
            paramsMap.put("lat",lat);
            paramsMap.put("lng",lng);
            paramsMap.put("areaType",user.getAreaType());
            paramsMap.put("temperature",newTemperature);
            paramsMap.put("signType", signType);
            paramsMap.put("signTypeStatus", "1");
            paramsMap.put("address", address[randomNum]);
            paramsMap.put("qrcodeColor", "0");
            paramsMap.put("token",config.getStuToken());
            paramsMap.put("uuid", config.getStuUUID());

            //循环处理参数




            //将封装的表单构建为FormBody
            FormBody.Builder builder = new FormBody.Builder();
            for (String key : paramsMap.keySet()) {
                //追加表单信息
                builder.add(key, paramsMap.get(key));
            }
            //计算chuangyi
            String chuangyi = calcChuangyiValue(paramsMap,encrypt);
            RequestBody formBody = builder.build();
            Request request = new Request.Builder()
                    .post(formBody)
                    .url("https://fyyx.cunminss.com/api/s/temperatureSign")//接口地址
                    .header("token", config.getStuToken())
                    .header("origin","https://fyyx.cunminss.com")
                    .header("User-Agent", "Mozilla/5.0 (Linux; U; Android 10; zh-CN; GM1910 Build/QKQ1.190825.002)" +
                            " AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/69.0.3497.100 UWS/3.22.0.30 Mobile Safari/537.36 AliApp(DingTalk/5.1.6) " +
                            "com.alibaba.android.rimet/13241367 Channel/700159 language/zh-CN UT4Aplus/0.2.25 colorScheme/light")
                    .header("chuangyi", chuangyi)
                  //  .header("chaofeng", "ni_shi_yi_ge_chui_zi_de_tian_cai")
                    .build();
            Response response = client.newCall(request).execute();
            //将签到日志写入数据库
            SignLog signLog = new SignLog();
            //==================
            String responeMessage = Objects.requireNonNull(response.body()).string();
            signLog.setTemperature(newTemperature);
            signLog.setEncryptKey(chuangyi);
            signLog.setLat(lat);
            signLog.setLng(lng);
            signLog.setAddress(address[randomNum]);
            signLog.setSystemId(config.getStuSystemId());
            signLog.setResponse(responeMessage);
            //System.out.println(new Date());
            signLog.setLogDate(new Date());
            signLog.setStuNumber(user.getStuNumber());
            if (responeMessage.contains("签到成功") || responeMessage.contains("您已签到")){
                signLog.setStatus("1");
            }else{
                signLog.setStatus("0");
            }
            Integer result = requestSignUtil.signLogServices.insertNewSignLog(signLog);
            //==================
            //签到失败尝试重签
            return responeMessage;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "未知错误";
    }
    public static String calcChuangyiValue(Map<String, String> params,String encrypt) throws Exception {

        Set<String> keys = params.keySet();
        for (String key : keys) { params.put(key, URLEncoder.encode(String.valueOf(params.get(key)), "UTF-8")); }
        // 拼接参数
        String encodeStr = EncryptUtil.createLinkString(params);
        // AES 加密
        String sign = EncryptUtil.aesEncrypt(encodeStr, encrypt);
        // MD5 摘要加密
        sign = Md5Utils.hash(sign);
        return sign;
    }
    public static String doPostTestEncrypt(String encrypt) throws IOException, ParseException {
        //实例化一个OkHttpClient
        OkHttpClient client = new OkHttpClient();
        try {
            //将参数封装到HashMap
            Map<String, String> paramsMap = new HashMap<>(9);
            paramsMap.put("studentId", "2503");
            paramsMap.put("token", "outl5w76qZvM0w0ocinWnyJyXLR0");
            //将封装的表单构建为FormBody
            FormBody.Builder builder = new FormBody.Builder();
            for (String key : paramsMap.keySet()) {
                //追加表单信息
                builder.add(key, paramsMap.get(key));
            }
            //计算chuangyi
            String chuangyi = calcChuangyiValue(paramsMap,encrypt);
            RequestBody formBody = builder.build();
            Request request = new Request.Builder()
                    .post(formBody)
                    .url("https://fyyx.cunminss.com/api/s/getMenuListDing")//接口地址
                    .header("token", "outl5w76qZvM0w0ocinWnyJyXLR0")
                    .header("origin","https://fyyx.cunminss.com")
                    .header("User-Agent", "Mozilla/5.0 (Linux; U; Android 10; zh-CN; GM1910 Build/QKQ1.190825.002)" +
                            " AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/69.0.3497.100 UWS/3.22.0.30 Mobile Safari/537.36 AliApp(DingTalk/5.1.6) " +
                            "com.alibaba.android.rimet/13241367 Channel/700159 language/zh-CN UT4Aplus/0.2.25 colorScheme/light")
                    .header("chuangyi", chuangyi)
//                    .header("chaofeng", "ni_shi_yi_ge_chui_zi_de_tian_cai")
                    .build();
            Response response = client.newCall(request).execute();
            return Objects.requireNonNull(response.body()).string();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "接口炸了";
    }
}
