package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SignUser;

/**
 * 用户管理Service接口
 * 
 * @author ruoyi
 * @date 2021-02-06
 */
public interface ISignUserService 
{
    /**
     * 查询用户管理
     * 
     * @param platformId 用户管理ID
     * @return 用户管理
     */
    public SignUser selectSignUserById(Long platformId);

    /**
     * 查询用户管理列表
     * 
     * @param signUser 用户管理
     * @return 用户管理集合
     */
    public List<SignUser> selectSignUserList(SignUser signUser);

    /**
     * 新增用户管理
     * 
     * @param signUser 用户管理
     * @return 结果
     */
    public int insertSignUser(SignUser signUser);

    /**
     * 修改用户管理
     * 
     * @param signUser 用户管理
     * @return 结果
     */
    public int updateSignUser(SignUser signUser);

    /**
     * 批量删除用户管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSignUserByIds(String ids);

    /**
     * 删除用户管理信息
     * 
     * @param platformId 用户管理ID
     * @return 结果
     */
    public int deleteSignUserById(Long platformId);
}
