package com.ruoyi.system.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SignLog;
import com.ruoyi.system.service.ISignLogService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 签到日志Controller
 * 
 * @author ruoyi
 * @date 2021-02-06
 */
@Controller
@RequestMapping("/system/log")
public class SignLogController extends BaseController
{
    private String prefix = "system/log";

    @Autowired
    private ISignLogService signLogService;

    @RequiresPermissions("system:log:view")
    @GetMapping()
    public String log()
    {
        return prefix + "/log";
    }

    /**
     * 查询签到日志列表
     */
    @RequiresPermissions("system:log:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SignLog signLog)
    {
        startPage();
        List<SignLog> list = signLogService.selectSignLogList(signLog);
        return getDataTable(list);
    }

    /**
     * 导出签到日志列表
     */
    @RequiresPermissions("system:log:export")
    @Log(title = "签到日志", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SignLog signLog)
    {
        List<SignLog> list = signLogService.selectSignLogList(signLog);
        ExcelUtil<SignLog> util = new ExcelUtil<SignLog>(SignLog.class);
        return util.exportExcel(list, "log");
    }

    /**
     * 新增签到日志
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存签到日志
     */
    @RequiresPermissions("system:log:add")
    @Log(title = "签到日志", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SignLog signLog)
    {
        return toAjax(signLogService.insertSignLog(signLog));
    }

    /**
     * 修改签到日志
     */
    @GetMapping("/edit/{logId}")
    public String edit(@PathVariable("logId") Long logId, ModelMap mmap)
    {
        SignLog signLog = signLogService.selectSignLogById(logId);
        mmap.put("signLog", signLog);
        return prefix + "/edit";
    }

    /**
     * 修改保存签到日志
     */
    @RequiresPermissions("system:log:edit")
    @Log(title = "签到日志", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SignLog signLog)
    {
        return toAjax(signLogService.updateSignLog(signLog));
    }

    /**
     * 删除签到日志
     */
    @RequiresPermissions("system:log:remove")
    @Log(title = "签到日志", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(signLogService.deleteSignLogByIds(ids));
    }
}
