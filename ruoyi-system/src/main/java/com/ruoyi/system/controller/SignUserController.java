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
import com.ruoyi.system.domain.SignUser;
import com.ruoyi.system.service.ISignUserService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户管理Controller
 * 
 * @author ruoyi
 * @date 2021-02-06
 */
@Controller
@RequestMapping("/system/signUser")
public class SignUserController extends BaseController
{
    private String prefix = "system/signUser";

    @Autowired
    private ISignUserService signUserService;

    @RequiresPermissions("system:signUser:view")
    @GetMapping()
    public String signUser()
    {
        return prefix + "/signUser";
    }

    /**
     * 查询用户管理列表
     */
    @RequiresPermissions("system:signUser:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SignUser signUser)
    {
        startPage();
        List<SignUser> list = signUserService.selectSignUserList(signUser);
        return getDataTable(list);
    }

    /**
     * 导出用户管理列表
     */
    @RequiresPermissions("system:signUser:export")
    @Log(title = "用户管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SignUser signUser)
    {
        List<SignUser> list = signUserService.selectSignUserList(signUser);
        ExcelUtil<SignUser> util = new ExcelUtil<SignUser>(SignUser.class);
        return util.exportExcel(list, "signUser");
    }

    /**
     * 新增用户管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存用户管理
     */
    @RequiresPermissions("system:signUser:add")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SignUser signUser)
    {
        return toAjax(signUserService.insertSignUser(signUser));
    }

    /**
     * 修改用户管理
     */
    @GetMapping("/edit/{platformId}")
    public String edit(@PathVariable("platformId") Long platformId, ModelMap mmap)
    {
        SignUser signUser = signUserService.selectSignUserById(platformId);
        mmap.put("signUser", signUser);
        return prefix + "/edit";
    }

    /**
     * 修改保存用户管理
     */
    @RequiresPermissions("system:signUser:edit")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SignUser signUser)
    {
        return toAjax(signUserService.updateSignUser(signUser));
    }

    /**
     * 删除用户管理
     */
    @RequiresPermissions("system:signUser:remove")
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(signUserService.deleteSignUserByIds(ids));
    }
}
