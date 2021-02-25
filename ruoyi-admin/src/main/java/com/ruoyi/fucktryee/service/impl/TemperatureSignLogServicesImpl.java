package com.ruoyi.fucktryee.service.impl;


import com.ruoyi.fucktryee.mapper.ITemperatureSignLogMapper;
import com.ruoyi.fucktryee.pojo.SignLog;
import com.ruoyi.fucktryee.service.ITemperatureSignLogServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class TemperatureSignLogServicesImpl implements ITemperatureSignLogServices {
    @Autowired
    private ITemperatureSignLogMapper signLogMapper;
    @Override
    public Integer insertNewSignLog(SignLog signLog) {
        return signLogMapper.insertNewSignLog(signLog);
    }

    @Override
    public Integer countSign() {
        return signLogMapper.countSign();
    }

    @Override
    public List<SignLog> queryUserSignLog(String stuNumber) {
        return signLogMapper.queryUserSignLog(stuNumber);
    }

    @Override
    public Integer querySignSuccessfullyAsTodayMorning() {
        return signLogMapper.querySignSuccessfullyAsTodayMorning();
    }

    @Override
    public Integer querySignSuccessfullyAsTodayNight() {
        return signLogMapper.querySignSuccessfullyAsTodayNight();
    }

    @Override
    public SignLog querylastSignDate() {
        return signLogMapper.querylastSignDate();
    }
}
