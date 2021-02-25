package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SignSettingMapper;
import com.ruoyi.system.domain.SignSetting;
import com.ruoyi.system.service.ISignSettingService;
import com.ruoyi.common.core.text.Convert;

/**
 * 签到系统设置Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-02-06
 */
@Service
public class SignSettingServiceImpl implements ISignSettingService 
{
    @Autowired
    private SignSettingMapper signSettingMapper;

    /**
     * 查询签到系统设置
     * 
     * @param settingName 签到系统设置ID
     * @return 签到系统设置
     */
    @Override
    public SignSetting selectSignSettingById(String settingName)
    {
        return signSettingMapper.selectSignSettingById(settingName);
    }

    /**
     * 查询签到系统设置列表
     * 
     * @param signSetting 签到系统设置
     * @return 签到系统设置
     */
    @Override
    public List<SignSetting> selectSignSettingList(SignSetting signSetting)
    {
        return signSettingMapper.selectSignSettingList(signSetting);
    }

    /**
     * 新增签到系统设置
     * 
     * @param signSetting 签到系统设置
     * @return 结果
     */
    @Override
    public int insertSignSetting(SignSetting signSetting)
    {
        return signSettingMapper.insertSignSetting(signSetting);
    }

    /**
     * 修改签到系统设置
     * 
     * @param signSetting 签到系统设置
     * @return 结果
     */
    @Override
    public int updateSignSetting(SignSetting signSetting)
    {
        return signSettingMapper.updateSignSetting(signSetting);
    }

    /**
     * 删除签到系统设置对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSignSettingByIds(String ids)
    {
        return signSettingMapper.deleteSignSettingByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除签到系统设置信息
     * 
     * @param settingName 签到系统设置ID
     * @return 结果
     */
    @Override
    public int deleteSignSettingById(String settingName)
    {
        return signSettingMapper.deleteSignSettingById(settingName);
    }
}
