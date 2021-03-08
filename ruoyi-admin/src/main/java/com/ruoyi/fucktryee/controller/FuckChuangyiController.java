package com.ruoyi.fucktryee.controller;

import ch.qos.logback.core.joran.event.SaxEventRecorder;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.annotation.JsonAlias;

import com.github.pagehelper.PageHelper;
import com.ruoyi.common.utils.AddressUtils;
import com.ruoyi.common.utils.IpUtils;
import com.ruoyi.fucktryee.enums.ResultEnum;
import com.ruoyi.fucktryee.pojo.Config;
import com.ruoyi.fucktryee.pojo.Result;
import com.ruoyi.fucktryee.pojo.SignLog;
import com.ruoyi.fucktryee.pojo.User;
import com.ruoyi.fucktryee.service.impl.SystemSettingServicesImpl;
import com.ruoyi.fucktryee.service.impl.SystemUserServicesImpl;
import com.ruoyi.fucktryee.service.impl.TemperatureSignLogServicesImpl;
import com.ruoyi.fucktryee.service.impl.UserConfigServicesImpl;
import com.ruoyi.fucktryee.utils.ResultUtil;
import com.ruoyi.fucktryee.utils.ServerChanUtil;
import com.ruoyi.fucktryee.utils.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import sun.net.util.IPAddressUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 胖哈勃实验室 法克创艺 综合控制器
 */
@RestController
public class FuckChuangyiController {

    @Resource
    UserConfigServicesImpl configServices;

    @Resource
    SystemUserServicesImpl userServices;

    @Resource
    TemperatureSignLogServicesImpl signLogServices;

    @Resource
    SystemSettingServicesImpl settingServices;

    @RequestMapping(value = {"home"})
    public ModelAndView home(HttpServletRequest httpServletRequest) {
        //实例化一个ModelAndView
        ModelAndView mv = new ModelAndView("home");
        mv.setViewName("home");
        //跳转到首页
        //统计平台用户数量
        Integer platformUserNum = userServices.countPlatformUserNum();
        boolean allowRegister = Boolean.parseBoolean(settingServices.selectSetting("allow_register").getSettingValue());
        //统计签到记录条数
        Integer signCount = signLogServices.countSign();
        //获取最后签到时间
        SignLog lastSignDate = signLogServices.querylastSignDate();
        mv.addObject("allowRegister", allowRegister);
        mv.addObject("platformUserNum", platformUserNum);
        mv.addObject("signCount", signCount);
        SimpleDateFormat spf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss EE");
        mv.addObject("lastSignDate", spf.format(lastSignDate.getLogDate()));
        String ipAddress = IpUtils.getIpAddr(httpServletRequest).replaceAll("\\s*|\t|\r|\n","");
        mv.addObject("ipAddress",ipAddress +  "[" +  AddressUtils.getRealAddressByIP(ipAddress) + "]");

        return mv;
    }

    @RequestMapping(value = "add")
    public ModelAndView add() {
        //实例化一个ModelAndView
        ModelAndView mv = new ModelAndView("add");
        //跳转到新增页面
        return mv;
    }

    /**
     * 新增用户
     */
    @PostMapping(value = "addUser")
    @ResponseBody
    public Result addUser(
            @RequestParam(value = "stuNumber") String stuNumber,
            @RequestParam(value = "key") String key,
            @RequestParam(value = "address") String address,
            @RequestParam(value = "areaType") String areaType,
            @RequestParam(value = "latlng") String latlng
    ) throws ParseException {
        //过滤非法字符
        address = StringUtils.stringFilter(address);
        //实例化JSONObject;
        JSONObject jsonObject = new JSONObject();
        //地址配置区
        //String address1 = "浙江省宁波市江北区明海南路101号靠近浙江纺织服装职业技术学院生活区##浙江省宁波市江北区浙江纺织服装职业技术学院生活区##浙江省宁波市镇海区明海南路255号靠近公园世家1期##浙江省宁波市镇海区浙江纺织服装职业技术学院生活区(南门)";
        //String address2 = "浙江省宁波市镇海区毓秀路488号宁大学生村##浙江省宁波市镇海区宁波大学毓秀路488号学府东苑##浙江省宁波市镇海区宁大步行街128号附近学府东苑七公寓##浙江省宁波市镇海区庄市大道121号";
        if (StringUtils.isEmpty(address)) {
            return ResultUtil.fail(ResultEnum.FAIL.code, "地址信息为空或异常，注册失败！");
        }
        Config config = configServices.selectConfig(stuNumber);
        //如果config不为空，则新增用户。
        if (config != null) {
            //先判断数据库是否有这个用户了
            User auser = userServices.selectUser(stuNumber);
            if (auser == null) {
                auser = new User();
                auser.setStuNumber(stuNumber);
                auser.setAddress(address);
                auser.setLatlng(latlng);
                auser.setPlatformKey(key);
                auser.setAreaType(areaType);
                auser.setEnabled(1);
                auser.setCreateDate(new Date());
                DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                auser.setLastSignDate(sdf.parse("1970/01/01 12:00:00"));
                auser.setLastSignStatus(0);
                Integer result = userServices.insertNewUser(auser);
                if (result > 0) {
                    jsonObject.put("user", auser);
                    jsonObject.put("config", config);
                    return ResultUtil.success(ResultEnum.SUCCESS.code, jsonObject, "注册成功");
                } else {
                    return ResultUtil.fail(ResultEnum.FAIL.code, "注册失败");
                }
            } else {
                return ResultUtil.fail(ResultEnum.FAIL.code, "您已经注册过了，如果需要删除账户请联系邮箱：i@pwnhub.net");
            }
        } else {
            return ResultUtil.fail(ResultEnum.FAIL.code, "在平台找不到这个学号的配置信息，目前仅支持信息学院部分学生。");
        }
    }

    /**
     * 删除用户
     *
     * @param stuNumber
     * @param key
     * @return
     */

    @PostMapping(value = "deleteUser")
    @ResponseBody
    public Result deleteUser(
            @RequestParam(value = "stuNumber", required = true) String stuNumber,
            @RequestParam(value = "key", required = true) String key,HttpServletRequest request) {
        System.out.println("进入删除用户控制器");
        ServerChanUtil serverChanUtil = new ServerChanUtil();

        String ip = IpUtils.getIpAddr(request);
        JSONObject jsonObject = new JSONObject();
        //判断key和学号是否正确
        if (!"".equals(stuNumber) && !"".equals(key)) {
            User auser = userServices.selectUserAuth(stuNumber, key);
            if (auser != null) {
                //删除用户
                Integer result = userServices.deleteUserByStuNumberAndPassword(stuNumber, key);
                jsonObject.put("user",auser.getStuNumber());
                if (result > 0) {
                    serverChanUtil.send("用户删除提醒","IP地址:" + ip + "||删除用户：" + auser.getStuNumber() + "-失败。");
                    return ResultUtil.success(ResultEnum.SUCCESS.code, jsonObject, "删除成功~");

                } else {
                    serverChanUtil.send("用户删除提醒","IP地址:" + ip + "||删除用户：" + auser.getStuNumber() + "-失败。");
                    return ResultUtil.fail(ResultEnum.FAIL.code, "删除失败，请检查学号和秘钥是否正确~");
                }
            }
            serverChanUtil.send("用户删除提醒","IP地址:" + ip + "||删除用户：" + stuNumber + "-失败。");
        }
        return ResultUtil.fail(ResultEnum.FAIL.code, "删除失败，请检查学号和秘钥是否正确~");
    }
}