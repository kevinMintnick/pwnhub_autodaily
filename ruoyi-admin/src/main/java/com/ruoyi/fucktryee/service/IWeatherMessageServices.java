package com.ruoyi.fucktryee.service;

import com.ruoyi.fucktryee.pojo.Weather;
import org.springframework.stereotype.Service;

import java.util.List;

public interface IWeatherMessageServices {

    List<Weather> getWeather();

}
