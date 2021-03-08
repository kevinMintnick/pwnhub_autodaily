package com.ruoyi.fucktryee.enums;

public enum SignStatusEnum {
    /**
     * 签到成功
     */
    SIGNED_SUCCESSFUL(0,"签到成功"),
    NOT_IN_THE_CHECK_IN_TIME_RANGE(500,"当前非签到时间,无法签到!"),
    SIGNED_IN(500,"您已签到"),
    SIGNED_FAIL(301,"签到出错");

    public int code;
    public String status;

    SignStatusEnum(int code,String status) {
        this.code = code;
        this.status = status;
    }
}
