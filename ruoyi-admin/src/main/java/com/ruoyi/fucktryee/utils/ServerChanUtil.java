package com.ruoyi.fucktryee.utils;

import okhttp3.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * Server酱发信工具类
 */
@Component
@Configuration
public class ServerChanUtil {

    private  String serverChanSckey = "SCU99919T9ba41e35e126d6f83c63703e87dce7a35ed2621d362a5";
    private  String url = "https://sc.ftqq.com/";

    public String getServerChanSckey() {
        return serverChanSckey;
    }

    public void send(String text, String desp) {
        String requestUrl = "";
        ServerChanUtil serverChanUtil = new ServerChanUtil();
        //实例化一个OkHttpClient
        OkHttpClient client = new OkHttpClient();
        //拼接url
        if (!"".equals(serverChanUtil.serverChanSckey)) {
            requestUrl = serverChanUtil.url + serverChanUtil.serverChanSckey + ".send";
        }
        try {
            //将参数封装到HashMap
            Map<String, String> paramsMap = new HashMap<>(9);
            paramsMap.put("text", text);
            paramsMap.put("desp", desp);

            //将封装的表单构建为FormBody
            FormBody.Builder builder = new FormBody.Builder();
            for (String key : paramsMap.keySet()) {
                //追加表单信息
                builder.add(key, paramsMap.get(key));
            }
            RequestBody formBody = builder.build();
            Request request = new Request.Builder()
                    .post(formBody)
                    .url(requestUrl)//接口地址
                    .build();
            Response response = client.newCall(request).execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
