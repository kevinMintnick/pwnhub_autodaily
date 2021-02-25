package com.ruoyi.fucktryee.service;


import com.ruoyi.fucktryee.pojo.SignLog;

import java.util.Date;
import java.util.List;

public interface ITemperatureSignLogServices {
    Integer insertNewSignLog(SignLog signLog);
    Integer countSign();
    List<SignLog> queryUserSignLog(String stuNumber);
    Integer querySignSuccessfullyAsTodayMorning();
    Integer querySignSuccessfullyAsTodayNight();
    SignLog querylastSignDate();
}
