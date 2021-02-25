package com.ruoyi.fucktryee.mapper;



import com.ruoyi.fucktryee.pojo.Config;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface IUserConfigMapper {
    /**
     * 配置类->数据库的映射
     */
    @Results(id = "UserConfig",value = {
            @Result(property = "stuNumber", column = "stuNumber"),
            @Result(property = "stuName", column = "stuName"),
            @Result(property = "stuClass",column = "stuClass"),
            @Result(property = "stuUUID",column = "stuUUID"),
            @Result(property = "stuToken",column = "stuToken"),
            @Result(property = "stuSystemId",column = "stuSystemId"),
    })

    //根据学号查询Config
    @Select("SELECT * FROM sign_config WHERE stuNumber=#{stuNumber} LIMIT 1")
    Config selectConfig(String stuNumber);
}
