package com.ruoyi.fucktryee.mapper;


import com.ruoyi.fucktryee.pojo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author Administrator
 */
@Mapper
public interface ISystemUserMapper {
    /**
     * 用户类->数据库的映射
     */
    @Results(id = "SystemUser",value = {
            @Result(property = "platformId", column = "platform_id"),
            @Result(property = "stuNumber", column = "stu_number"),
            @Result(property = "platformKey",column = "platform_key"),
            @Result(property = "areaType",column = "areaType"),
            @Result(property = "address",column = "address"),
            @Result(property = "latlng",column = "latlng"),
            @Result(property = "lastSignDate",column = "last_sign_date"),
            @Result(property = "lastSignStatus",column = "last_sign_status"),
            @Result(property = "enabled",column = "enabled"),
            @Result(property = "createDate",column = "createDate")
    })
    //新增用户
    //INSERT INTO 表名称 VALUES (值1, 值2,....)
    @Insert("INSERT INTO sign_user VALUES(NULL,#{stuNumber},#{platformKey},#{areaType},#{address},#{latlng},#{lastSignDate},#{lastSignStatus},#{enabled},#{createDate})")
    Integer insertNewUser(User user);

    //根据学号查询用户
    @Select("SELECT * FROM sign_user WHERE stu_number=#{stuNumber} LIMIT 1")
    User selectUser(String stuNumber);

    //获取需要签到的用户列表
    @Select("SELECT * FROM sign_user t WHERE EXISTS(SELECT 1 FROM sign_user GROUP BY stu_number HAVING MAX(platform_id) = t.platform_id) AND enabled=1")
    @Results(id = "User",value = {
            @Result(property = "platformId", column = "platform_id"),
            @Result(property = "stuNumber", column = "stu_number"),
            @Result(property = "platformKey",column = "platform_key"),
            @Result(property = "areaType",column = "areaType"),
            @Result(property = "address",column = "address"),
            @Result(property = "latlng",column = "latlng"),
            @Result(property = "lastSignDate",column = "last_sign_date"),
            @Result(property = "createDate",column = "createDate")
    })
    List<User> selectAllSignUser();

    //更新最后签到日期
    @Update("UPDATE sign_user SET last_sign_date=Now() WHERE stu_number=#{stuNumber}")
    Integer updateLastSignDate(String stuNumber);

    //更新签到状态
    @Update("UPDATE sign_user SET last_sign_status=#{lastSignStatus} WHERE stu_number=#{stuNumber}")
    Integer updateLastSignStatus(@Param("lastSignStatus") Integer lastSignStatus,@Param("stuNumber") String stuNumber);

    @Select("SELECT COUNT(*) FROM sign_user t WHERE EXISTS(SELECT 1 FROM sign_user GROUP BY stu_number HAVING MAX(platform_id) = t.platform_id)")
    Integer countPlatformUserNum();

    //根据学号和key查询用户
    @Select("SELECT * FROM sign_user WHERE stu_number = #{stuNumber} AND platform_key = #{platformKey} LIMIT 1")
    @ResultMap("User")
    User selectUserAuth(@Param("stuNumber") String stuNumber,@Param("platformKey") String key);

    //获取需要重签的用户列表
    @Select("SELECT * FROM sign_user t WHERE EXISTS(SELECT 1 FROM sign_user GROUP BY stu_number HAVING MAX(platform_id) = t.platform_id) AND enabled=1 AND last_sign_status=0")
    @Results(id = "User2",value = {
            @Result(property = "platformId", column = "platform_id"),
            @Result(property = "stuNumber", column = "stu_number"),
            @Result(property = "platformKey",column = "platform_key"),
            @Result(property = "areaType",column = "areaType"),
            @Result(property = "address",column = "address"),
            @Result(property = "latlng",column = "latlng"),
            @Result(property = "lastSignDate",column = "last_sign_date"),
            @Result(property = "enabled",column = "enabled"),
            @Result(property = "createDate",column = "createDate")
    })
    List<User> selectResignList();

}
