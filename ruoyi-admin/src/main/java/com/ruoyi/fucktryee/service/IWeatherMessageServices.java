package com.ruoyi.fucktryee.service;

import com.ruoyi.fucktryee.pojo.Weather;

import java.util.List;

public interface IWeatherMessageServices {

    boolean sendSimpleMessage();

    List<Weather> getWeather();

}
