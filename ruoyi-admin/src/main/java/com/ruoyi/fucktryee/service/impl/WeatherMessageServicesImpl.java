package com.ruoyi.fucktryee.service.impl;


import com.alibaba.fastjson.JSON;
import com.ruoyi.fucktryee.pojo.Weather;
import com.ruoyi.fucktryee.service.IWeatherMessageServices;
import com.ruoyi.fucktryee.utils.OkHttp3Util;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WeatherMessageServicesImpl implements IWeatherMessageServices {
    //天气预报API的APPID
    private final static String WEATHER_APPID = "92368781";
    //天气预报的APPSECRET
    private final static String WEATHER_APPSECRET = "JBMo740Y";


    @Override
    public List<Weather> getWeather() {
        String resp = OkHttp3Util.get("https://www.tianqiapi.com/api?version=v1&" + "appid=" + WEATHER_APPID + "&appsecret=" + WEATHER_APPSECRET + "&cityid=101210403");
        Object data = JSON.parseObject(resp).get("data");
        return JSON.parseArray(JSON.toJSONString(data), Weather.class);
    }
}
