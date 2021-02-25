package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SignLog;

/**
 * 签到日志Service接口
 * 
 * @author ruoyi
 * @date 2021-02-06
 */
public interface ISignLogService 
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
     * 批量删除签到日志
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSignLogByIds(String ids);

    /**
     * 删除签到日志信息
     * 
     * @param logId 签到日志ID
     * @return 结果
     */
    public int deleteSignLogById(Long logId);
}
