package com.ruoyi.fucktryee.task;

import com.ruoyi.fucktryee.pojo.Setting;
import com.ruoyi.fucktryee.service.impl.SystemSettingServicesImpl;
import com.ruoyi.fucktryee.utils.RequestSignUtil;
import com.ruoyi.fucktryee.utils.ServerChanUtil;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;

/**
 * 每1小时测试加密串
 */
@Component("testEncryptTask")
public class TestEncryptTask {
    @Resource
    SystemSettingServicesImpl settingServices;

    //@Scheduled(cron = "0 0 */1 * * ?")
    public void task() throws IOException, ParseException {
        Setting encrypt = settingServices.selectSetting("encrypt");
        String response = RequestSignUtil.doPostTestEncrypt(encrypt.getSettingValue());
        System.out.println(response);
        if (response.contains("101") || response.contains("朋友你这样做是不对的哟！")){
            ServerChanUtil serverChanUtil = new ServerChanUtil();
            String desp = String.format("无法请求接口，被101拦截。");
            serverChanUtil.send("脚本被101拦截",desp);
        }
    }
}
