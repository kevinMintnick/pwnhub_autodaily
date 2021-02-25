package com.ruoyi.fucktryee.utils;

/**
 * @author hd
 * @create 2020-09-12 9:42
 */


import com.ruoyi.fucktryee.service.impl.SystemSettingServicesImpl;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import sun.misc.BASE64Decoder;

import javax.annotation.PostConstruct;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletRequest;
import java.net.URLEncoder;
import java.util.*;

@Component
public class EncryptUtil {

    @Autowired
    private SystemSettingServicesImpl settingServices;

    private static EncryptUtil encryptUtil;

    @PostConstruct
    public void init() {
        encryptUtil = this;
        encryptUtil.settingServices = this.settingServices;
    }



    //public static final String KEY = "woshiyigetiancai";
    public static String KEY = "JLS3yTeedOQbLqA3";

    private static final String ALGORITHMSTR = "AES/ECB/PKCS5Padding";

    public static String base64Encode(byte[] bytes) {
        return Base64.encodeBase64String(bytes);
    }

    public static byte[] base64Decode(String base64Code) throws Exception {
        return new BASE64Decoder().decodeBuffer(base64Code);
    }

    public static byte[] aesEncryptToBytes(String content, String encryptKey) throws Exception {
        KeyGenerator kgen = KeyGenerator.getInstance("AES");
        kgen.init(128);
        Cipher cipher = Cipher.getInstance(ALGORITHMSTR);
        cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(encryptKey.getBytes(), "AES"));

        return cipher.doFinal(content.getBytes("utf-8"));
    }

    public static String aesEncrypt(String content, String encryptKey) throws Exception {
        return base64Encode(aesEncryptToBytes(content, encryptKey));
    }

    public static String aesDecryptByBytes(byte[] encryptBytes, String decryptKey) throws Exception {
        KeyGenerator kgen = KeyGenerator.getInstance("AES");
        kgen.init(128);

        Cipher cipher = Cipher.getInstance(ALGORITHMSTR);
        cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(decryptKey.getBytes(), "AES"));
        byte[] decryptBytes = cipher.doFinal(encryptBytes);

        return new String(decryptBytes);
    }

    public static String aesDecrypt(String encryptStr, String decryptKey) throws Exception {
        return aesDecryptByBytes(base64Decode(encryptStr), decryptKey);
    }

    /**
     * 获取request 中的参数，以map形式返回
     *
     * @param request
     * @return
     */
    public static Map<String, Object> getParamMap(ServletRequest request) {
        //Assert.notNull(request,"参数不能为空");
        Map<String, Object> map = new HashMap<>();
        Enumeration<String> en = request.getParameterNames();
        while (en.hasMoreElements()) {
            String name = en.nextElement();
            String[] values = request.getParameterValues(name);
            if (values == null || values.length == 0) {
                continue;
            }
            String value = values[0];
            if (value != null) {
                map.put(name, value);
            }
        }
        return map;
    }

    /**
     * 把数组所有元素，按字母排序，然后按照“参数=参数值”的模式用“&”字符拼接成字符串
     *
     * @param params 需要签名的参数
     * @return 签名的字符串
     */
    public static String createLinkString(Map<String, String> params) {
        /**
         * 拼接字符串参数
         */
        List<String> keys = new ArrayList<>(params.keySet());
        Collections.sort(keys);
        StringBuilder signStr = new StringBuilder();
        for (String key : keys) {
            if (StringUtils.isEmpty(params.get(key).toString())) {
                continue;
            }
            signStr.append(key).append("=").append(params.get(key)).append("&");
        }
        if (signStr.length() > 0) {
            return signStr.deleteCharAt(signStr.length() - 1).toString();
        } else {
            return signStr.deleteCharAt(signStr.length()).toString();
        }
    }

    /**
     * 将请求参数进行加密。
     *
     * @param map 所有请求参数
     * @return
     */
    private static String getChuangyi(Map<String, String> map) throws Exception {
        Set<String> keys = map.keySet();
        for (String key : keys) {
            map.put(key, URLEncoder.encode(String.valueOf(map.get(key)), "UTF-8"));
        }
        // 把数组所有元素，按字母排序，然后按照“参数=参数值”的模式用“&”字符拼接成字符串（例如：studentId=4197&token=256966686126630990）
        String str = EncryptUtil.createLinkString(map);
        // AES 加密
        String sign = EncryptUtil.aesEncrypt(str, KEY);
        // MD5 摘要加密
        return Md5Utils.hash(sign);
    }


    /**
     * 测试
     */
    public static void main(String[] args) throws Exception {

        System.out.println("密钥：" + KEY);
        /*
         * 我的个人测试
         * 测试接口
         * 测试接口：/api/s/getMenuListDing
         * 请求参数：studentId=4197&token=256966686126630990
         * 请求头chuangyi参数值：fa0a25f857c61b61790387cd71cc9a99（这个值是前端计算出来传的，然后后端在更具请求参数再计算一次进行对比）
         */
        System.out.println("==================== 我的测试 ====================");
        // chuangyi请求头参数
        String front = "79e8b3f8b129d36fe09ca770a8ec33d4";

        // 后端加密
        // 请求参数字符串
        String str = "studentId=4197&lat=29.923990796792&lng=121.625799268&areaType=2&temperature=36.6&signType=3&signTypeStatus=1&address=%E6%B5%99%E6%B1%9F%E7%9C%81%E5%AE%81%E6%B3%A2%E5%B8%82%E9%95%87%E6%B5%B7%E5%8C%BA%E6%98%8E%E6%B5%B7%E5%8D%97%E8%B7%AF255%E5%8F%B7%E9%9D%A0%E8%BF%91%E5%85%AC%E5%85%83%E4%B8%96%E5%AE%B61%E6%9C%9F&qrcodeColor=0&uuid=acaf0f98b8803e42dee1a6bbc9a39e";
        // 加密key（最顶上的key值）
        String key = "JLS3yTeedOQbLqA3";
        // AES 加密
        String sign = EncryptUtil.aesEncrypt(str, key);
        // MD5 摘要加密
        sign = Md5Utils.hash(sign);
        // 加密后值
        System.out.println("抓包值：" + front);
        System.out.println("加密后的值：" + sign);

        // 两者是否相等（不相等则拦截）
        System.out.println(sign.equals(front));
    }


}