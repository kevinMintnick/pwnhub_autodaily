package com.ruoyi.fucktryee.annotation;

import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@Documented
public @interface DingTalkRobot {
    String value() default "";
}
