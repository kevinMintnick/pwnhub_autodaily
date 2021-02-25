package com.ruoyi.fucktryee.service.impl;

import com.ruoyi.fucktryee.mapper.IUserConfigMapper;
import com.ruoyi.fucktryee.pojo.Config;
import com.ruoyi.fucktryee.service.IUserConfigServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserConfigServicesImpl implements IUserConfigServices {

    @Autowired
    private IUserConfigMapper userConfigMapper;

    @Override
    public Config selectConfig(String stuNumber) {
        return userConfigMapper.selectConfig(stuNumber);
    }
}
