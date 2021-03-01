package com.ruoyi.fucktryee.service;

import com.ruoyi.fucktryee.pojo.User;

import java.util.List;

public interface ISystemUserServices {
    Integer insertNewUser(User user);
    User selectUser(String stuNumber);
    List<User> selectAllSignUser();
    Integer updateLastSignDate(String stuNumber);
    Integer countPlatformUserNum();
    User selectUserAuth(String stuNumber,String key);
    Integer updateLastSignStatus(Integer lastSignStatus,String stuNumber);
    List<User> selectResignList();
    Integer deleteUserByStuNumberAndPassword(String stuNumber,String platformKey);
}
