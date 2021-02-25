package com.ruoyi.fucktryee.task;


import com.ruoyi.fucktryee.pojo.Setting;
import com.ruoyi.fucktryee.service.ISystemSettingServices;

import com.ruoyi.fucktryee.service.impl.SystemSettingServicesImpl;
import com.ruoyi.fucktryee.utils.OkHttp3Util;
import com.ruoyi.fucktryee.utils.ServerChanUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component("obtainEncryptKeyTask")
public class ObtainEncryptKeyTask {

    @Resource
    SystemSettingServicesImpl settingServices;

    private static Logger logger = LoggerFactory.getLogger(ObtainEncryptKeyTask.class);

    public void task() throws IOException, InterruptedException, ParseException {
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
            //查询加密串
            Setting setting = settingServices.selectSetting("encrypt");
            String encryptValue = m2.group(1).replace("(\"","").replace("\")","");
            //System.out.println("哈哈哈哈哈" + encrypt);
            if (!setting.getSettingValue().equals(encryptValue)){
                //比对两值是否不一致,如果不一致则更新
                settingServices.updateEncrypt(encryptValue);
                logger.info("更新加密串");
                ServerChanUtil serverChanUtil = new ServerChanUtil();
                String desp = String.format("加密串更新为：%s",encryptValue);
                serverChanUtil.send("体温签到平台-加密串更新通知",desp);
            }else{
                logger.info("无需更新加密串");
            }
        }
    }
}
