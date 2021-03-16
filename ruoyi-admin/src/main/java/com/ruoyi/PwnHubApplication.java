package com.ruoyi;

import com.jaemon.dingtalk.dinger.annatations.DingerScan;
import com.ruoyi.framework.web.service.PermissionService;
import org.apache.catalina.Context;
import org.apache.catalina.connector.Connector;
import org.apache.tomcat.util.descriptor.web.SecurityCollection;
import org.apache.tomcat.util.descriptor.web.SecurityConstraint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * 启动程序
 *
 * @author ruoyi
 */
@EnableScheduling
@EnableCaching
@Configuration
@DingerScan(basePackages = "com.ruoyi.fucktryee.dingtalk")
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class PwnHubApplication
{
    private static final Logger log = LoggerFactory.getLogger(PwnHubApplication.class);
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(PwnHubApplication.class, args);
        log.info("胖哈勃信息安全实验室 - 启动完成");

    }
}