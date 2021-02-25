package com.ruoyi.fucktryee.service.impl;

import com.ruoyi.fucktryee.mapper.ISystemSettingMapper;
import com.ruoyi.fucktryee.pojo.Setting;
import com.ruoyi.fucktryee.service.ISystemSettingServices;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class SystemSettingServicesImpl implements ISystemSettingServices {
    @Autowired
    ISystemSettingMapper settingMapper;

    @Override
    public Setting selectSetting(String settingName) {
        return settingMapper.selectSetting(settingName);
    }

    @Override
    public Integer updateEncrypt(String encryptValue) {
        return settingMapper.updateEncrypt(encryptValue);
    }
}
