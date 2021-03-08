package com.ruoyi.fucktryee.service.impl;

import com.alibaba.fastjson.JSON;
import com.ruoyi.fucktryee.pojo.Hitokoto;
import com.ruoyi.fucktryee.pojo.Weather;
import com.ruoyi.fucktryee.service.HitokotoMessageServices;
import com.ruoyi.fucktryee.utils.OkHttp3Util;
import org.springframework.stereotype.Service;

@Service
public class HitokotoMessageServicesImpl implements HitokotoMessageServices {
    @Override
    public Hitokoto getHitokoto() {
        String resp = OkHttp3Util.get("https://v1.hitokoto.cn/");
        Hitokoto data = JSON.parseObject(resp,Hitokoto.class);
        return data;
    }
}
