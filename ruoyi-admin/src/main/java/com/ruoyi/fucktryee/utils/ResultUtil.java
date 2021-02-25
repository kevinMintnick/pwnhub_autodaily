package com.ruoyi.fucktryee.utils;


import com.ruoyi.fucktryee.pojo.Result;

public class ResultUtil {

    public static <T> Result<T> defineSuccess(int code, T data, String msg) {
        Result result = new Result<>();
        return result.setCode(code).setData(data).setMessage(msg);
    }

    public static <T> Result<T> success(int code,T data,String msg) {
        Result result = new Result();
        result.setCode(code).setData(data).setMessage(msg);
        return result;
    }

    public static <T> Result<T> fail(int code,String msg) {
        Result result = new Result();
        result.setCode(code).setMessage(msg);
        return result;
    }

    public static <T> Result<T> defineFail(int code, String msg){
        Result result = new Result();
        result.setCode(code).setMessage(msg);
        return result;
    }

    public static <T> Result<T> define(int code, String msg, T data){
        Result result = new Result();
        result.setCode(code).setMessage(msg).setData(data);
        return result;
    }
}
