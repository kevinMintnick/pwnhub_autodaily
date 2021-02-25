package com.ruoyi.fucktryee.service;

import com.ruoyi.fucktryee.pojo.Setting;

public interface ISystemSettingServices {
    Setting selectSetting(String settingName);
    Integer updateEncrypt(String encryptValue);
}
