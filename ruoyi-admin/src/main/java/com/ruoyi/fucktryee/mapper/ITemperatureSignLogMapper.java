package com.ruoyi.fucktryee.mapper;



import com.ruoyi.fucktryee.pojo.SignLog;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Mapper
@Repository
public interface ITemperatureSignLogMapper {
    /**
     * 日志类->数据库的映射
     */
    @Results(id = "TemperatureSignLog",value = {
            @Result(property = "logId", column = "log_id"),
            @Result(property = "stuNumber", column = "stu_number"),
            @Result(property = "system_id",column = "systemId"),
            @Result(property = "temperature",column = "temperature"),
            @Result(property = "address",column = "address"),
            @Result(property = "lat",column = "lat"),
            @Result(property = "lng",column = "lng"),
            @Result(property = "status",column = "status"),
            @Result(property = "response",column = "response"),
            @Result(property = "encryptKey",column = "encrypt_key"),
            @Result(property = "logDate",column = "logDate"),
    })
    //往数据库插入一条签到日志
    @Insert("INSERT INTO sign_log VALUES(NULL,#{stuNumber},#{systemId},#{temperature},#{address},#{lat},#{lng},#{status},#{response},#{encryptKey},#{logDate})")
    Integer insertNewSignLog(SignLog signLog);
    //统计有多少条签到记录
    @Select("SELECT COUNT(*) FROM sign_log")
    Integer countSign();
    //根据学号查询签到记录
    @Results(id = "TemperatureSignLog",value = {
            @Result(property = "logId", column = "log_id"),
            @Result(property = "stuNumber", column = "stu_number"),
            @Result(property = "system_id",column = "systemId"),
            @Result(property = "temperature",column = "temperature"),
            @Result(property = "address",column = "address"),
            @Result(property = "lat",column = "lat"),
            @Result(property = "lng",column = "lng"),
            @Result(property = "status",column = "status"),
            @Result(property = "response",column = "response"),
            @Result(property = "encryptKey",column = "encrypt_key"),
            @Result(property = "logDate",column = "logDate")
    })
    @Select("SELECT * FROM sign_log WHERE stu_number = #{stuNumber} ORDER BY log_id DESC")
    List<SignLog> queryUserSignLog(String stuNumber);

    /**
     * TODO 已废弃
     * @return
     */
    @Select("SELECT COUNT(*) FROM sign_log WHERE `status` = '1'  AND TO_DAYS(logDate) = TO_DAYS(NOW()) AND DATE_FORMAT(logDate,'%H:%i:%s') BETWEEN '06:30:00' AND '12:00:00'")
    Integer querySignSuccessfullyAsTodayMorning();
    @Select("SELECT COUNT(*) FROM sign_log WHERE `status` = '1'  AND TO_DAYS(logDate) = TO_DAYS(NOW()) AND DATE_FORMAT(logDate,'%H:%i:%s') BETWEEN '21:00:00' AND '23:00:00'")
    Integer querySignSuccessfullyAsTodayNight();

    @Select("SELECT logDate FROM sign_log order by log_id desc limit 1")

    SignLog querylastSignDate();
}
