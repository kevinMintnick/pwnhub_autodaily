package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 签到系统设置对象 sign_setting
 * 
 * @author ruoyi
 * @date 2021-02-06
 */
public class SignSetting extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 设置名称 */
    @Excel(name = "设置名称")
    private String settingName;

    /** 设置值 */
    @Excel(name = "设置值")
    private String settingValue;

    /** 备注 */
    @Excel(name = "备注")
    private String settingExplain;

    public void setSettingName(String settingName) 
    {
        this.settingName = settingName;
    }

    public String getSettingName() 
    {
        return settingName;
    }
    public void setSettingValue(String settingValue) 
    {
        this.settingValue = settingValue;
    }

    public String getSettingValue() 
    {
        return settingValue;
    }
    public void setSettingExplain(String settingExplain) 
    {
        this.settingExplain = settingExplain;
    }

    public String getSettingExplain() 
    {
        return settingExplain;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("settingName", getSettingName())
            .append("settingValue", getSettingValue())
            .append("settingExplain", getSettingExplain())
            .toString();
    }
}
