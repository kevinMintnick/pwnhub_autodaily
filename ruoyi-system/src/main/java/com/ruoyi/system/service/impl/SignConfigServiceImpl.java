package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SignConfigMapper;
import com.ruoyi.system.domain.SignConfig;
import com.ruoyi.system.service.ISignConfigService;
import com.ruoyi.common.core.text.Convert;

/**
 * 用户配置Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-02-06
 */
@Service
public class SignConfigServiceImpl implements ISignConfigService 
{
    @Autowired
    private SignConfigMapper signConfigMapper;

    /**
     * 查询用户配置
     * 
     * @param configId 用户配置ID
     * @return 用户配置
     */
    @Override
    public SignConfig selectSignConfigById(Long configId)
    {
        return signConfigMapper.selectSignConfigById(configId);
    }

    /**
     * 查询用户配置列表
     * 
     * @param signConfig 用户配置
     * @return 用户配置
     */
    @Override
    public List<SignConfig> selectSignConfigList(SignConfig signConfig)
    {
        return signConfigMapper.selectSignConfigList(signConfig);
    }

    /**
     * 新增用户配置
     * 
     * @param signConfig 用户配置
     * @return 结果
     */
    @Override
    public int insertSignConfig(SignConfig signConfig)
    {
        return signConfigMapper.insertSignConfig(signConfig);
    }

    /**
     * 修改用户配置
     * 
     * @param signConfig 用户配置
     * @return 结果
     */
    @Override
    public int updateSignConfig(SignConfig signConfig)
    {
        return signConfigMapper.updateSignConfig(signConfig);
    }

    /**
     * 删除用户配置对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSignConfigByIds(String ids)
    {
        return signConfigMapper.deleteSignConfigByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除用户配置信息
     * 
     * @param configId 用户配置ID
     * @return 结果
     */
    @Override
    public int deleteSignConfigById(Long configId)
    {
        return signConfigMapper.deleteSignConfigById(configId);
    }
}
