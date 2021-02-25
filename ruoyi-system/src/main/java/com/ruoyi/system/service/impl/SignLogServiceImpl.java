package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SignLogMapper;
import com.ruoyi.system.domain.SignLog;
import com.ruoyi.system.service.ISignLogService;
import com.ruoyi.common.core.text.Convert;

/**
 * 签到日志Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-02-06
 */
@Service
public class SignLogServiceImpl implements ISignLogService 
{
    @Autowired
    private SignLogMapper signLogMapper;

    /**
     * 查询签到日志
     * 
     * @param logId 签到日志ID
     * @return 签到日志
     */
    @Override
    public SignLog selectSignLogById(Long logId)
    {
        return signLogMapper.selectSignLogById(logId);
    }

    /**
     * 查询签到日志列表
     * 
     * @param signLog 签到日志
     * @return 签到日志
     */
    @Override
    public List<SignLog> selectSignLogList(SignLog signLog)
    {
        return signLogMapper.selectSignLogList(signLog);
    }

    /**
     * 新增签到日志
     * 
     * @param signLog 签到日志
     * @return 结果
     */
    @Override
    public int insertSignLog(SignLog signLog)
    {
        return signLogMapper.insertSignLog(signLog);
    }

    /**
     * 修改签到日志
     * 
     * @param signLog 签到日志
     * @return 结果
     */
    @Override
    public int updateSignLog(SignLog signLog)
    {
        return signLogMapper.updateSignLog(signLog);
    }

    /**
     * 删除签到日志对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSignLogByIds(String ids)
    {
        return signLogMapper.deleteSignLogByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除签到日志信息
     * 
     * @param logId 签到日志ID
     * @return 结果
     */
    @Override
    public int deleteSignLogById(Long logId)
    {
        return signLogMapper.deleteSignLogById(logId);
    }
}
