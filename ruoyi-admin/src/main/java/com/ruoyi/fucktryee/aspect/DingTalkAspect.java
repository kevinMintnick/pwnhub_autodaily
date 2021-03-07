package com.ruoyi.fucktryee.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class DingTalkAspect {

    @Pointcut("@annotation(com.ruoyi.fucktryee.annotation.DingTalkRobot)")
    public void pointcut() { }

    @Around("pointcut()")
    public Object around(ProceedingJoinPoint point) {
        //在这里发送钉钉机器人消息
        return null;
    }
}
