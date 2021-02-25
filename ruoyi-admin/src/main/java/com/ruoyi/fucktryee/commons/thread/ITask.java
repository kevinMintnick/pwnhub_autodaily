package com.ruoyi.fucktryee.commons.thread;

import java.io.IOException;
import java.text.ParseException;
import java.util.Map;

/**
 * 任务处理接口
 * 具体业务逻辑可实现该接口
 *  T 返回值类型
 *  E 传入值类型
 */
public interface ITask<T, E> {

    /**
     * 任务执行方法接口<BR>
     * 方法名：execute<BR>
     * @param e 传入对象
     * @param params 其他辅助参数
     * @return T<BR> 返回值类型
     */
    T execute(E e, Map<String, Object> params) throws IOException, InterruptedException, ParseException;
}