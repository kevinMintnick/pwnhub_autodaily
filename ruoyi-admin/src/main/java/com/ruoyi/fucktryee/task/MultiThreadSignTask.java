package com.ruoyi.fucktryee.task;

import com.alibaba.fastjson.JSON;
import com.jaemon.dingtalk.entity.DingTalkResult;
import com.ruoyi.fucktryee.commons.thread.ITask;
import com.ruoyi.fucktryee.commons.thread.ResultBean;
import com.ruoyi.fucktryee.dingtalk.TaskDinger;
import com.ruoyi.fucktryee.enums.SignStatusEnum;
import com.ruoyi.fucktryee.pojo.Config;
import com.ruoyi.fucktryee.pojo.Setting;
import com.ruoyi.fucktryee.pojo.SignLog;
import com.ruoyi.fucktryee.pojo.User;
import com.ruoyi.fucktryee.service.impl.SystemSettingServicesImpl;
import com.ruoyi.fucktryee.service.impl.SystemUserServicesImpl;
import com.ruoyi.fucktryee.service.impl.TemperatureSignLogServicesImpl;
import com.ruoyi.fucktryee.service.impl.UserConfigServicesImpl;
import com.ruoyi.fucktryee.utils.*;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.annotation.Schedules;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.lang.reflect.Array;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 试验性功能：多线程处理签到任务
 * 存在问题：因随机经纬度可能产生偏差，导致被创艺拦截。
 * @author Administrator
 */
@Component("multiThreadSignTask")
public class MultiThreadSignTask implements InitializingBean {

    private static Logger logger = LoggerFactory.getLogger(MultiThreadSignTask.class);

    @Resource
    SystemUserServicesImpl userServices;
    @Resource
    UserConfigServicesImpl configServices;
    @Resource
    TemperatureSignLogServicesImpl signLogServices;
    @Resource
    SystemSettingServicesImpl settingServices;
    @Resource
    private TaskDinger taskDinger;

    Integer success = 0;
    ArrayList<Config> fail_sign_user = new ArrayList<>();

    public void task() throws IOException, InterruptedException, ParseException {
        //重置List和success
        fail_sign_user.clear();
        success = 0;

        //获取加密秘钥
        Setting encrypt = settingServices.selectSetting("encrypt");

        logger.info("开始多线程任务");
        //获取所有待签到的用户列表（需要多线程处理的List列表）
        List<User> signUser = userServices.selectAllSignUser();
        //列表乱序
        Collections.shuffle(signUser);
        //循环执行签到（每个线程延迟随机）
        logger.info("共计需签到的用户数量:{}",signUser.size());

        //创建多线程处理任务，并指定线程数量。
        MultiThreadUtils<User> threadUtils = MultiThreadUtils.newInstance(3);

        // 辅助参数
        Map<String, Object> params = new HashMap<>(9);

        ResultBean<List<ResultBean<Object>>> resultBean = threadUtils.execute(signUser, params, new  ITask<ResultBean<Object>, User>(){
            @Override
            public ResultBean<Object> execute(User auser, Map<String, Object> params) throws IOException, ParseException, InterruptedException {
                /**
                 * 具体业务逻辑：签到
                 */
                Config config = configServices.selectConfig(auser.getStuNumber());
                if ("".equals(config.getStuToken()) || config.getStuToken()==null){ config.setStuToken("outl5w4BlI5n8XMDBUHM3Jb4iD_A"); }
                String response = RequestSignUtil.doPostTemperatureSign(auser, config,encrypt.getSettingValue());
                //输出签到结果
                logger.info("签到结果：学号：{}，姓名：{}，本次签到状态：{}。",auser.getStuNumber(),config.getStuName(),response);
                //TODO 判断是否需要重签
                if (!response.contains(SignStatusEnum.SIGNED_SUCCESSFUL.status) && !response.contains(SignStatusEnum.SIGNED_IN.status)
                        && !response.contains(SignStatusEnum.NOT_IN_THE_CHECK_IN_TIME_RANGE.status)){
                    //TODO 尝试重签五次
                    resign(auser,config,encrypt);
                }else{
                    success++;
                    userServices.updateLastSignStatus(1,auser.getStuNumber());
                }
                //更新最后签到日期
                userServices.updateLastSignDate(auser.getStuNumber());
                ResultBean<Object> resultBean = ResultBean.newInstance();
                resultBean.setData(response);

                //随机延迟
                int sleepRandom = RandomUtil.getRandomForIntegerBounded3(1000,5000);
                logger.info("签到随机延迟:{}ms",sleepRandom);
                Thread.sleep(sleepRandom);
                return resultBean;
            }
        });
        logger.info("多线程任务签到完成!");
        logger.info("success:{}",success);
        //发信
        String message = handleMessageData(signUser);
        sendDingTalkMessage(message);
        sendServerChanMessage(message);
    }

    @Override
    public void afterPropertiesSet() throws Exception {

    }

    private void resign(User auser,Config config,Setting encrypt) throws InterruptedException, IOException, ParseException {
        for (int i = 1; i <= 5; i++) {
            Thread.sleep(500);
            logger.info("开始对学号：{}，姓名：{}，进行第{}次重签操作。",auser.getStuNumber(),config.getStuName(),i);
            String result = RequestSignUtil.doPostTemperatureSign(auser, config,encrypt.getSettingValue());
            logger.info("{}第{}次签到结果：{}",config.getStuName(),i,result);
            if (result.contains(SignStatusEnum.SIGNED_IN.status)||result.contains(SignStatusEnum.SIGNED_SUCCESSFUL.status)){
                userServices.updateLastSignStatus(1,auser.getStuNumber());
                success++;
                break;
            }
            if (i==5){
                //将签到失败的用户加入到List用于发信
                fail_sign_user.add(config);
                userServices.updateLastSignStatus(0,auser.getStuNumber());
            }
        }
    }

    private String handleMessageData(List<User>signUser){
        /**
         * (2020年12月5日21:22:43)总计为83个用户执行签到，成功签到82个用户，失败签到1个用户。\n\n============失败签到名单==============\n\n班级：               姓名：\n\n18移动1 张三\n\n18移动2 李四
         */
        String message;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String desp = String.format("（%s）总计为%s个用户执行签到，成功签到%d个用户，失败签到%d个用户。\n\n",sdf.format(new Date()),signUser.size(),success,signUser.size()-success);
        String failSignList="";
        if (signUser.size()!=success) {
            failSignList = "===============失败签到名单===============\n\n";
            failSignList = failSignList + "班级  姓名  学号\n\n";
        }
        for (Config config : fail_sign_user) { failSignList = failSignList + config.getStuClass() + " " + config.getStuName() + " " + config.getStuNumber() + "\n\n"; }
        message = desp + failSignList;
        return message;
    }


    private void sendDingTalkMessage(String message){
        DingTalkResult dingTalkResult;
        //发信(钉钉机器人)
        dingTalkResult = taskDinger.taskSuccess(message);
        logger.info("钉钉机器人回调信息：{}",JSON.toJSONString(dingTalkResult));
    }

    private void sendServerChanMessage(String message){
        ServerChanUtil serverChanUtil = new ServerChanUtil();
        //发信(Server酱)
        serverChanUtil.send("体温签到平台消息通知",message);
    }
}
