package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SignLog;

/**
 * 签到日志Mapper接口
 * 
 * @author ruoyi
 * @date 2021-02-06
 */
public interface SignLogMapper 
{
    /**
     * 查询签到日志
     * 
     * @param logId 签到日志ID
     * @return 签到日志
     */
    public SignLog selectSignLogById(Long logId);

    /**
     * 查询签到日志列表
     * 
     * @param signLog 签到日志
     * @return 签到日志集合
     */
    public List<SignLog> selectSignLogList(SignLog signLog);

    /**
     * 新增签到日志
     * 
     * @param signLog 签到日志
     * @return 结果
     */
    public int insertSignLog(SignLog signLog);

    /**
     * 修改签到日志
     * 
     * @param signLog 签到日志
     * @return 结果
     */
    public int updateSignLog(SignLog signLog);

    /**
     * 删除签到日志
     * 
     * @param logId 签到日志ID
     * @return 结果
     */
    public int deleteSignLogById(Long logId);

    /**
     * 批量删除签到日志
     * 
     * @param logIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSignLogByIds(String[] logIds);
}
