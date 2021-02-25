package com.ruoyi.fucktryee.interceptor;


import com.alibaba.fastjson.JSONObject;
import com.ruoyi.fucktryee.pojo.Setting;
import com.ruoyi.fucktryee.service.impl.SystemSettingServicesImpl;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@Component
public class RegisterInterceptor implements HandlerInterceptor {

    @Resource
    SystemSettingServicesImpl settingServices;

    /**
     * 在FuckChuangyiController的方法执行之前（在请求处理之前进行调用）
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        //是否允许注册的标记
        Setting allow_register = settingServices.selectSetting("allow_register");
        //判断是否注册
        if (!"true".equals(allow_register.getSettingValue())) {
            try {
                JSONObject res = new JSONObject();
                PrintWriter out = null;
                response.setContentType("json/html; charset=utf-8");
                res.put("code", -110);
                res.put("message", settingServices.selectSetting("ProhibitRegistrationTips").getSettingValue());
                out = response.getWriter();
                out.append(res.toString());
                return false;
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }
        return true;
    }
}
