package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户管理对象 sign_user
 * 
 * @author ruoyi
 * @date 2021-02-06
 */
public class SignUser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 签到平台ID */
    private Long platformId;

    /** 学号 */
    @Excel(name = "学号")
    private Long stuNumber;

    /** 自定义密钥 */
    @Excel(name = "自定义密钥")
    private String platformKey;

    /** 区域类型 */
    @Excel(name = "区域类型")
    private Long areaType;

    /** 地址 */
    @Excel(name = "地址")
    private String address;

    /** 经纬度 */
    @Excel(name = "经纬度")
    private String latlng;

    /** 最后签到日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "最后签到日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date lastSignDate;

    /** 最后签到状态 */
    @Excel(name = "最后签到状态")
    private Long lastSignStatus;

    /** 是否启用 */
    @Excel(name = "是否启用")
    private Long enabled;

    /** 注册日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "注册日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    public void setPlatformId(Long platformId) 
    {
        this.platformId = platformId;
    }

    public Long getPlatformId() 
    {
        return platformId;
    }
    public void setStuNumber(Long stuNumber) 
    {
        this.stuNumber = stuNumber;
    }

    public Long getStuNumber() 
    {
        return stuNumber;
    }
    public void setPlatformKey(String platformKey) 
    {
        this.platformKey = platformKey;
    }

    public String getPlatformKey() 
    {
        return platformKey;
    }
    public void setAreaType(Long areaType) 
    {
        this.areaType = areaType;
    }

    public Long getAreaType() 
    {
        return areaType;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setLatlng(String latlng) 
    {
        this.latlng = latlng;
    }

    public String getLatlng() 
    {
        return latlng;
    }
    public void setLastSignDate(Date lastSignDate) 
    {
        this.lastSignDate = lastSignDate;
    }

    public Date getLastSignDate() 
    {
        return lastSignDate;
    }
    public void setLastSignStatus(Long lastSignStatus) 
    {
        this.lastSignStatus = lastSignStatus;
    }

    public Long getLastSignStatus() 
    {
        return lastSignStatus;
    }
    public void setEnabled(Long enabled) 
    {
        this.enabled = enabled;
    }

    public Long getEnabled() 
    {
        return enabled;
    }
    public void setCreateDate(Date createDate) 
    {
        this.createDate = createDate;
    }

    public Date getCreateDate() 
    {
        return createDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("platformId", getPlatformId())
            .append("stuNumber", getStuNumber())
            .append("platformKey", getPlatformKey())
            .append("areaType", getAreaType())
            .append("address", getAddress())
            .append("latlng", getLatlng())
            .append("lastSignDate", getLastSignDate())
            .append("lastSignStatus", getLastSignStatus())
            .append("enabled", getEnabled())
            .append("createDate", getCreateDate())
            .toString();
    }
}
