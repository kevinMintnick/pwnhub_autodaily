package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SignConfig;

/**
 * 用户配置Mapper接口
 * 
 * @author ruoyi
 * @date 2021-02-06
 */
public interface SignConfigMapper 
{
    /**
     * 查询用户配置
     * 
     * @param configId 用户配置ID
     * @return 用户配置
     */
    public SignConfig selectSignConfigById(Long configId);

    /**
     * 查询用户配置列表
     * 
     * @param signConfig 用户配置
     * @return 用户配置集合
     */
    public List<SignConfig> selectSignConfigList(SignConfig signConfig);

    /**
     * 新增用户配置
     * 
     * @param signConfig 用户配置
     * @return 结果
     */
    public int insertSignConfig(SignConfig signConfig);

    /**
     * 修改用户配置
     * 
     * @param signConfig 用户配置
     * @return 结果
     */
    public int updateSignConfig(SignConfig signConfig);

    /**
     * 删除用户配置
     * 
     * @param configId 用户配置ID
     * @return 结果
     */
    public int deleteSignConfigById(Long configId);

    /**
     * 批量删除用户配置
     * 
     * @param configIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSignConfigByIds(String[] configIds);
}
