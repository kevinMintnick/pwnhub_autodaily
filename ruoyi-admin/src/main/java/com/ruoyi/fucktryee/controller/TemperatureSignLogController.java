package com.ruoyi.fucktryee.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.ruoyi.fucktryee.enums.ResultEnum;
import com.ruoyi.fucktryee.pojo.Config;
import com.ruoyi.fucktryee.pojo.Result;
import com.ruoyi.fucktryee.pojo.SignLog;
import com.ruoyi.fucktryee.pojo.User;
import com.ruoyi.fucktryee.service.impl.*;

import com.ruoyi.fucktryee.utils.ResultUtil;
import org.apache.commons.text.StringEscapeUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@RestController
public class TemperatureSignLogController {

    @Resource
    UserConfigServicesImpl configServices;

    @Resource
    SystemUserServicesImpl userServices;

    @Resource
    DataItemServicesImpl dataItemServices;

    @Resource
    TemperatureSignLogServicesImpl logServices;


    @GetMapping("signlog")
    public ModelAndView signLog(){
        ModelAndView mv = new ModelAndView("signlog");
        return mv;
    }

    @GetMapping("querySignLog")
    @ResponseBody
    public Result querySignLog(
            @RequestParam(value = "stuNumber",required = true) String stuNumber,
            @RequestParam(value = "key",required = true) String key){
        JSONObject jsonObject = new JSONObject();
        //判断key和学号是否正确
        if (!"".equals(stuNumber) && !"".equals(key)) {
            User auser = userServices.selectUserAuth(stuNumber, key);
            if (auser != null) {
                auser.setAreaType(dataItemServices.selectByDatasourceKey("area_type",auser.getAreaType()));

                PageHelper.startPage(1, 20);
                List<SignLog> signlog = logServices.queryUserSignLog(auser.getStuNumber());

                Config config = configServices.selectConfig(auser.getStuNumber());

                //处理signLog
                //JSON串转成实体对象

                for (SignLog signLog : signlog) {
                    JSONObject signLogBean = JSON.parseObject(signLog.getResponse());
                    String code;
                    String message;
                    String areaType;
                    //TODO ==========================
                    code = signLogBean.getString("code");
                    boolean flag = signLogBean.getString("msg")!=null;
                    message = flag? signLogBean.getString("msg"):signLogBean.getString("message");
                    signLog.setResponse(message);
                    signLog.setCode(code);
                }

                jsonObject.put("config",config);
                jsonObject.put("user",auser);
                jsonObject.put("signlog",signlog);

                return ResultUtil.success(ResultEnum.SUCCESS.code,jsonObject,"获取成功~");
            }else{
                return ResultUtil.fail(ResultEnum.FAIL.code,"查询失败，请检查秘钥是否正确~");
            }
        }else{
            return ResultUtil.fail(ResultEnum.FAIL.code, "学号或秘钥为空~");
        }
    }

}