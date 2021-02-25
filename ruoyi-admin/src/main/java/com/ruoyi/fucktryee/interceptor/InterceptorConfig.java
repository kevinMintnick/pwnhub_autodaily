package com.ruoyi.fucktryee.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Autowired
    RegisterInterceptor registerInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry){

        //注册RegisterInterceptor 拦截器
        InterceptorRegistration interceptor = registry.addInterceptor(registerInterceptor);
        //设置拦截路径
        interceptor.addPathPatterns("/addUser");


    }
}
