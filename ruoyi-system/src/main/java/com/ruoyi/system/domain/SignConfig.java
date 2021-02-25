package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户配置对象 sign_config
 * 
 * @author ruoyi
 * @date 2021-02-06
 */
public class SignConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 配置编号 */
    @Excel(name = "配置编号")
    private Long configId;

    /** 学号 */
    @Excel(name = "学号")
    private Long stuNumber;

    /** 系统ID */
    @Excel(name = "系统ID")
    private String stuSystemId;

    /** 学生姓名 */
    @Excel(name = "学生姓名")
    private String stuName;

    /** 班级 */
    @Excel(name = "班级")
    private String stuClass;

    /** 设备ID */
    @Excel(name = "设备ID")
    private String stuUUID;

    /** 标识符 */
    @Excel(name = "标识符")
    private String stuToken;

    public void setConfigId(Long configId) 
    {
        this.configId = configId;
    }

    public Long getConfigId() 
    {
        return configId;
    }
    public void setStuNumber(Long stuNumber) 
    {
        this.stuNumber = stuNumber;
    }

    public Long getStuNumber() 
    {
        return stuNumber;
    }
    public void setStuSystemId(String stuSystemId) 
    {
        this.stuSystemId = stuSystemId;
    }

    public String getStuSystemId() 
    {
        return stuSystemId;
    }
    public void setStuName(String stuName) 
    {
        this.stuName = stuName;
    }

    public String getStuName() 
    {
        return stuName;
    }
    public void setStuClass(String stuClass) 
    {
        this.stuClass = stuClass;
    }

    public String getStuClass() 
    {
        return stuClass;
    }
    public void setStuUUID(String stuUUID) 
    {
        this.stuUUID = stuUUID;
    }

    public String getStuUUID() 
    {
        return stuUUID;
    }
    public void setStuToken(String stuToken) 
    {
        this.stuToken = stuToken;
    }

    public String getStuToken() 
    {
        return stuToken;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("configId", getConfigId())
            .append("stuNumber", getStuNumber())
            .append("stuSystemId", getStuSystemId())
            .append("stuName", getStuName())
            .append("stuClass", getStuClass())
            .append("stuUUID", getStuUUID())
            .append("stuToken", getStuToken())
            .toString();
    }
}
