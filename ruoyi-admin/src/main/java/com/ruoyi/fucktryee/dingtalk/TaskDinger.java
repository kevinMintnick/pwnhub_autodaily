package com.ruoyi.fucktryee.dingtalk;

import com.jaemon.dingtalk.dinger.annatations.DingerMarkdown;
import com.jaemon.dingtalk.dinger.annatations.DingerText;
import com.jaemon.dingtalk.dinger.annatations.Parameter;
import com.jaemon.dingtalk.entity.DingTalkResult;

import java.math.BigDecimal;

public interface TaskDinger {
    // 发送text类型消息
    @DingerText(value = "${msg}")
    DingTalkResult taskSuccess(@Parameter("msg") String msg);

    // 发送markdown类型消息
    @DingerMarkdown(
            value = "#### {msg}",
            title = "胖哈勃实验室 - 体温自动签到系统"
    )
    DingTalkResult taskFailed(@Parameter("msg") String msg);
}
