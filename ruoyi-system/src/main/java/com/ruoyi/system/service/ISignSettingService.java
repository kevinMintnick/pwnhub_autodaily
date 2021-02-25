package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SignSetting;

/**
 * 签到系统设置Service接口
 * 
 * @author ruoyi
 * @date 2021-02-06
 */
public interface ISignSettingService 
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
     * 批量删除签到系统设置
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSignSettingByIds(String ids);

    /**
     * 删除签到系统设置信息
     * 
     * @param settingName 签到系统设置ID
     * @return 结果
     */
    public int deleteSignSettingById(String settingName);
}
