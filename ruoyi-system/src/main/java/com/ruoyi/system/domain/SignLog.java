package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 签到日志对象 sign_log
 * 
 * @author ruoyi
 * @date 2021-02-06
 */
public class SignLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 日志编号 */
    private Long logId;

    /** 学号 */
    @Excel(name = "学号")
    private String stuNumber;

    /** 系统编号 */
    @Excel(name = "系统编号")
    private String systemId;

    /** 体温 */
    @Excel(name = "体温")
    private String temperature;

    /** 地址 */
    @Excel(name = "地址")
    private String address;

    /** 经度 */
    @Excel(name = "经度")
    private String lat;

    /** 纬度 */
    @Excel(name = "纬度")
    private String lng;

    /** 签到状态 */
    @Excel(name = "签到状态")
    private Long status;

    /** 响应 */
    @Excel(name = "响应")
    private String response;

    /** 加密值 */
    @Excel(name = "加密值")
    private String encryptKey;

    /** 日志日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "日志日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date logDate;

    public void setLogId(Long logId) 
    {
        this.logId = logId;
    }

    public Long getLogId() 
    {
        return logId;
    }
    public void setStuNumber(String stuNumber) 
    {
        this.stuNumber = stuNumber;
    }

    public String getStuNumber() 
    {
        return stuNumber;
    }
    public void setSystemId(String systemId) 
    {
        this.systemId = systemId;
    }

    public String getSystemId() 
    {
        return systemId;
    }
    public void setTemperature(String temperature) 
    {
        this.temperature = temperature;
    }

    public String getTemperature() 
    {
        return temperature;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setLat(String lat) 
    {
        this.lat = lat;
    }

    public String getLat() 
    {
        return lat;
    }
    public void setLng(String lng) 
    {
        this.lng = lng;
    }

    public String getLng() 
    {
        return lng;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }
    public void setResponse(String response) 
    {
        this.response = response;
    }

    public String getResponse() 
    {
        return response;
    }
    public void setEncryptKey(String encryptKey) 
    {
        this.encryptKey = encryptKey;
    }

    public String getEncryptKey() 
    {
        return encryptKey;
    }
    public void setLogDate(Date logDate) 
    {
        this.logDate = logDate;
    }

    public Date getLogDate() 
    {
        return logDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("logId", getLogId())
            .append("stuNumber", getStuNumber())
            .append("systemId", getSystemId())
            .append("temperature", getTemperature())
            .append("address", getAddress())
            .append("lat", getLat())
            .append("lng", getLng())
            .append("status", getStatus())
            .append("response", getResponse())
            .append("encryptKey", getEncryptKey())
            .append("logDate", getLogDate())
            .toString();
    }
}
