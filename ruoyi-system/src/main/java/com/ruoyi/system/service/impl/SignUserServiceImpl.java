package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SignUserMapper;
import com.ruoyi.system.domain.SignUser;
import com.ruoyi.system.service.ISignUserService;
import com.ruoyi.common.core.text.Convert;

/**
 * 用户管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-02-06
 */
@Service
public class SignUserServiceImpl implements ISignUserService 
{
    @Autowired
    private SignUserMapper signUserMapper;

    /**
     * 查询用户管理
     * 
     * @param platformId 用户管理ID
     * @return 用户管理
     */
    @Override
    public SignUser selectSignUserById(Long platformId)
    {
        return signUserMapper.selectSignUserById(platformId);
    }

    /**
     * 查询用户管理列表
     * 
     * @param signUser 用户管理
     * @return 用户管理
     */
    @Override
    public List<SignUser> selectSignUserList(SignUser signUser)
    {
        return signUserMapper.selectSignUserList(signUser);
    }

    /**
     * 新增用户管理
     * 
     * @param signUser 用户管理
     * @return 结果
     */
    @Override
    public int insertSignUser(SignUser signUser)
    {
        return signUserMapper.insertSignUser(signUser);
    }

    /**
     * 修改用户管理
     * 
     * @param signUser 用户管理
     * @return 结果
     */
    @Override
    public int updateSignUser(SignUser signUser)
    {
        return signUserMapper.updateSignUser(signUser);
    }

    /**
     * 删除用户管理对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSignUserByIds(String ids)
    {
        return signUserMapper.deleteSignUserByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除用户管理信息
     * 
     * @param platformId 用户管理ID
     * @return 结果
     */
    @Override
    public int deleteSignUserById(Long platformId)
    {
        return signUserMapper.deleteSignUserById(platformId);
    }
}
