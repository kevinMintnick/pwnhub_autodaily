package com.ruoyi.fucktryee.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author Administrator
 */
@Data
public class SignLog {
    private Integer logId;
    private String stuNumber;
    private String systemId;
    private String address;
    private String temperature;
    private String lat;
    private String lng;
    private String status;
    private String response;
    private String encryptKey;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date logDate;
    private String code;

    public SignLog() {
    }
}
