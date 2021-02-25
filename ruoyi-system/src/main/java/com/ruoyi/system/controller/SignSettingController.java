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
import com.ruoyi.system.domain.SignSetting;
import com.ruoyi.system.service.ISignSettingService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 签到系统设置Controller
 * 
 * @author ruoyi
 * @date 2021-02-06
 */
@Controller
@RequestMapping("/system/signSetting")
public class SignSettingController extends BaseController
{
    private String prefix = "system/signSetting";

    @Autowired
    private ISignSettingService signSettingService;

    @RequiresPermissions("system:signSetting:view")
    @GetMapping()
    public String signSetting()
    {
        return prefix + "/signSetting";
    }

    /**
     * 查询签到系统设置列表
     */
    @RequiresPermissions("system:signSetting:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SignSetting signSetting)
    {
        startPage();
        List<SignSetting> list = signSettingService.selectSignSettingList(signSetting);
        return getDataTable(list);
    }

    /**
     * 导出签到系统设置列表
     */
    @RequiresPermissions("system:signSetting:export")
    @Log(title = "签到系统设置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SignSetting signSetting)
    {
        List<SignSetting> list = signSettingService.selectSignSettingList(signSetting);
        ExcelUtil<SignSetting> util = new ExcelUtil<SignSetting>(SignSetting.class);
        return util.exportExcel(list, "signSetting");
    }

    /**
     * 新增签到系统设置
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存签到系统设置
     */
    @RequiresPermissions("system:signSetting:add")
    @Log(title = "签到系统设置", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SignSetting signSetting)
    {
        return toAjax(signSettingService.insertSignSetting(signSetting));
    }

    /**
     * 修改签到系统设置
     */
    @GetMapping("/edit/{settingName}")
    public String edit(@PathVariable("settingName") String settingName, ModelMap mmap)
    {
        SignSetting signSetting = signSettingService.selectSignSettingById(settingName);
        mmap.put("signSetting", signSetting);
        return prefix + "/edit";
    }

    /**
     * 修改保存签到系统设置
     */
    @RequiresPermissions("system:signSetting:edit")
    @Log(title = "签到系统设置", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SignSetting signSetting)
    {
        return toAjax(signSettingService.updateSignSetting(signSetting));
    }

    /**
     * 删除签到系统设置
     */
    @RequiresPermissions("system:signSetting:remove")
    @Log(title = "签到系统设置", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(signSettingService.deleteSignSettingByIds(ids));
    }
}
