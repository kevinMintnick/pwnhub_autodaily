package com.ruoyi.fucktryee.service;


import com.ruoyi.fucktryee.pojo.Config;
import org.springframework.stereotype.Service;


public interface IUserConfigServices {
    Config selectConfig(String stuNumber);
}
