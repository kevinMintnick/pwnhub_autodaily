package com.ruoyi.fucktryee.mapper;


import com.ruoyi.fucktryee.pojo.Setting;
import org.apache.ibatis.annotations.*;

@Mapper
public interface ISystemSettingMapper {
    //根据settingName查询setting;

    /**
     * 设置类->数据库的映射
     */
    @Results(id = "Setting",value = {
            @Result(property = "settingName", column = "setting_name"),
            @Result(property = "settingValue", column = "setting_value"),
            @Result(property = "settingExplain",column = "setting_explain"),
    })

    @Select("SELECT setting_name,setting_value FROM sign_setting WHERE setting_name=#{settingName} LIMIT 1")
    Setting selectSetting(String settingName);


    @Results(id = "Setting",value = {
            @Result(property = "settingName", column = "setting_name"),
            @Result(property = "settingValue", column = "setting_value"),
            @Result(property = "settingExplain",column = "setting_explain"),
    })
    @Update("UPDATE sign_setting SET setting_value = #{settingValue} WHERE setting_name = 'encrypt'")
    Integer updateEncrypt(String encryptValue);

}
