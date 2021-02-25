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
import com.ruoyi.system.domain.SignConfig;
import com.ruoyi.system.service.ISignConfigService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户配置Controller
 * 
 * @author ruoyi
 * @date 2021-02-06
 */
@Controller
@RequestMapping("/system/signConfig")
public class SignConfigController extends BaseController
{
    private String prefix = "system/signConfig";

    @Autowired
    private ISignConfigService signConfigService;

    @RequiresPermissions("system:signConfig:view")
    @GetMapping()
    public String signConfig()
    {
        return prefix + "/signConfig";
    }

    /**
     * 查询用户配置列表
     */
    @RequiresPermissions("system:signConfig:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SignConfig signConfig)
    {
        startPage();
        List<SignConfig> list = signConfigService.selectSignConfigList(signConfig);
        return getDataTable(list);
    }

    /**
     * 导出用户配置列表
     */
    @RequiresPermissions("system:signConfig:export")
    @Log(title = "用户配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SignConfig signConfig)
    {
        List<SignConfig> list = signConfigService.selectSignConfigList(signConfig);
        ExcelUtil<SignConfig> util = new ExcelUtil<SignConfig>(SignConfig.class);
        return util.exportExcel(list, "signConfig");
    }

    /**
     * 新增用户配置
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存用户配置
     */
    @RequiresPermissions("system:signConfig:add")
    @Log(title = "用户配置", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SignConfig signConfig)
    {
        return toAjax(signConfigService.insertSignConfig(signConfig));
    }

    /**
     * 修改用户配置
     */
    @GetMapping("/edit/{configId}")
    public String edit(@PathVariable("configId") Long configId, ModelMap mmap)
    {
        SignConfig signConfig = signConfigService.selectSignConfigById(configId);
        mmap.put("signConfig", signConfig);
        return prefix + "/edit";
    }

    /**
     * 修改保存用户配置
     */
    @RequiresPermissions("system:signConfig:edit")
    @Log(title = "用户配置", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SignConfig signConfig)
    {
        return toAjax(signConfigService.updateSignConfig(signConfig));
    }

    /**
     * 删除用户配置
     */
    @RequiresPermissions("system:signConfig:remove")
    @Log(title = "用户配置", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(signConfigService.deleteSignConfigByIds(ids));
    }
}
