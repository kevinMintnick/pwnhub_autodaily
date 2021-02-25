package com.ruoyi.fucktryee.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletionService;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorCompletionService;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import com.ruoyi.fucktryee.commons.thread.HandleCallable;
import com.ruoyi.fucktryee.commons.thread.ITask;
import com.ruoyi.fucktryee.commons.thread.ResultBean;
import com.ruoyi.fucktryee.pojo.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 *
 * @ClassName: MultiThreadUtils.java
 * @Description: 多线程工具类
 */

public class MultiThreadUtils<T> {

    private static Logger logger = LoggerFactory.getLogger(MultiThreadUtils.class);

    // 线程个数，如不赋值，默认为5
    private int threadCount = 5;
    // 具体业务任务
    private ITask<ResultBean<String>, T> task;
    // 线程池管理器
    private CompletionService<ResultBean> pool = null;

    /**
     * 初始化线程池和线程个数
     */
    public static MultiThreadUtils newInstance(int threadCount) {
        MultiThreadUtils instance = new MultiThreadUtils();
        threadCount = threadCount;
        instance.setThreadCount(threadCount);
        return instance;
    }

    /**
     *
     * 多线程分批执行list中的任务
     * 方法名：execute
     */
    public ResultBean execute(List<User> data, Map<String, Object> params, ITask<ResultBean<Object>, User> task) {
        // 创建线程池
        ExecutorService threadpool = Executors.newFixedThreadPool(threadCount);
        // 根据线程池初始化线程池管理器
        pool = new ExecutorCompletionService<ResultBean>(threadpool);
        // 开始时间（ms）
        long l = System.currentTimeMillis();
        // 数据量大小
        int length = data.size();
        // 每个线程处理的数据个数
        int taskCount = length / threadCount;
        // 划分每个线程调用的数据
        for (int i = 0; i < threadCount; i++) {
            // 每个线程任务数据list
            List<T> subData = null;
            if (i == (threadCount - 1)) {
                subData = (List<T>) data.subList(i * taskCount, length);
            } else {
                subData = (List<T>) data.subList(i * taskCount, (i + 1) * taskCount);
            }
            // 将数据分配给各个线程
            HandleCallable execute = new HandleCallable<T>(String.valueOf(i), subData, params, (ITask<ResultBean<Object>, T>) task);
            // 将线程加入到线程池
            pool.submit(execute);
        }

        // 总的返回结果集
        List<ResultBean<String>> result = new ArrayList<>();
        for (int i = 0; i < threadCount; i++) {
            // 每个线程处理结果集
            ResultBean<List<ResultBean<String>>> threadResult;
            try {
                threadResult = pool.take().get();
                result.addAll(threadResult.getData());
            } catch (InterruptedException | ExecutionException e) {
                e.printStackTrace();
            }

        }
        // 关闭线程池
        threadpool.shutdownNow();
        // 执行结束时间
        long end_l = System.currentTimeMillis();
        logger.info("总耗时:{}ms", (end_l - l));
        return ResultBean.newInstance().setData(result);
    }

    public int getThreadCount() {
        return threadCount;
    }

    public void setThreadCount(int threadCount) {
        this.threadCount = threadCount;
    }
}