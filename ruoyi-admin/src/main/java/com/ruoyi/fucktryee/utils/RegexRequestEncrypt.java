package com.ruoyi.fucktryee.utils;

import okhttp3.OkHttp;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
@Deprecated
public class RegexRequestEncrypt {


    public static void main(String[] args) {
        String resp_url = "";
        String encrypt = "";
        String resp = OkHttp3Util.get("https://fyyx.cunminss.com/zhxg/?code=123&state=STATE#/goback/student/daySign?types");

        String regex1 = "<script type=text/javascript src=/zhxg/static/js/app.(.*?).js></script>";
        String regex2 = "u=r;.*?parse(.*?),";

        Pattern p1 = Pattern.compile(regex1);
        Pattern p2 = Pattern.compile(regex2);

        Matcher m1 = p1.matcher(resp);
        while (m1.find()) {
            //System.out.println(m1.group(1));
            //处理Url
            resp_url = "https://fyyx.cunminss.com/zhxg/static/js/app." + m1.group(1) + ".js";
            System.out.println("resp_url = " + resp_url);
        }

        encrypt = OkHttp3Util.get(resp_url);
        Matcher m2 = p2.matcher(encrypt);
        while (m2.find()) {
            System.out.println(m2.group(1).replace("(\"","").replace("\")",""));
        }
    }
}
