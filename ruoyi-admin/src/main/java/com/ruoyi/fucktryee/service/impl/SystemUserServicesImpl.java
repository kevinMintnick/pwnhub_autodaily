package com.ruoyi.fucktryee.service.impl;

import com.ruoyi.fucktryee.mapper.ISystemUserMapper;
import com.ruoyi.fucktryee.pojo.User;
import com.ruoyi.fucktryee.service.ISystemUserServices;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("SystemUser")
public class SystemUserServicesImpl implements ISystemUserServices {

    @Resource
    ISystemUserMapper userMapper;

    @Override
    public Integer insertNewUser(User user) {
        return userMapper.insertNewUser(user);
    }

    @Override
    public User selectUser(String stuNumber) {
        return userMapper.selectUser(stuNumber);
    }

    @Override
    public List<User> selectAllSignUser() {
        return userMapper.selectAllSignUser();
    }

    @Override
    public Integer updateLastSignDate(String stuNumber) {
        return userMapper.updateLastSignDate(stuNumber);
    }

    @Override
    public Integer countPlatformUserNum() {
        return userMapper.countPlatformUserNum();
    }

    @Override
    public User selectUserAuth(String stuNumber, String key) {
        return userMapper.selectUserAuth(stuNumber,key);
    }

    @Override
    public Integer updateLastSignStatus(Integer lastSignStatus, String stuNumber) {
        return userMapper.updateLastSignStatus(lastSignStatus,stuNumber);
    }

    @Override
    public List<User> selectResignList() {
        return userMapper.selectResignList();
    }
}
