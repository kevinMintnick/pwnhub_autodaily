package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SignSetting;

/**
 * 签到系统设置Mapper接口
 * 
 * @author ruoyi
 * @date 2021-02-06
 */
public interface SignSettingMapper 
{
    /**
     * 查询签到系统设置
     * 
     * @param settingName 签到系统设置ID
     * @return 签到系统设置
     */
    public SignSetting selectSignSettingById(String settingName);

    /**
     * 查询签到系统设置列表
     * 
     * @param signSetting 签到系统设置
     * @return 签到系统设置集合
     */
    public List<SignSetting> selectSignSettingList(SignSetting signSetting);

    /**
     * 新增签到系统设置
     * 
     * @param signSetting 签到系统设置
     * @return 结果
     */
    public int insertSignSetting(SignSetting signSetting);

    /**
     * 修改签到系统设置
     * 
     * @param signSetting 签到系统设置
     * @return 结果
     */
    public int updateSignSetting(SignSetting signSetting);

    /**
     * 删除签到系统设置
     * 
     * @param settingName 签到系统设置ID
     * @return 结果
     */
    public int deleteSignSettingById(String settingName);

    /**
     * 批量删除签到系统设置
     * 
     * @param settingNames 需要删除的数据ID
     * @return 结果
     */
    public int deleteSignSettingByIds(String[] settingNames);
}
