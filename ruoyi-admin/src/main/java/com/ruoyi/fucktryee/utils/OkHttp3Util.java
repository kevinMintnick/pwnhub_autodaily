package com.ruoyi.fucktryee.utils;

import okhttp3.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

public class OkHttp3Util {
    private static final Logger LOGGER = LoggerFactory.getLogger(OkHttp3Util.class);

    public static final MediaType APPLICATION_JSON_CHARSET_UTF_8 = MediaType.get("application/json;charset=utf8");

    private static final OkHttpClient OK_HTTP_CLIENT = new OkHttpClient().newBuilder()
            .callTimeout(60, TimeUnit.SECONDS)    // 设置请求超时时间
            .connectTimeout(60, TimeUnit.SECONDS)    // 设置连接超时时间
            .readTimeout(60, TimeUnit.SECONDS)    // 设置socket读写超时时间
            .writeTimeout(60, TimeUnit.SECONDS)
            .build();

    public static String get(String url) {

        System.out.println("HTTP GET URL——" + url);

        Request getRequest = new Request.Builder().get().url(url).build();

        Call call = OK_HTTP_CLIENT.newCall(getRequest);

        try (Response getResponse = call.execute()) {
            return handle(getResponse);
        } catch (IOException e) {
            return "异常URL:" + String.format("URL: {%s}", url);
        }
    }

    public static String post(String url, String body) {

        System.out.println("HTTP POST URL——" + url);

        RequestBody requestBody = RequestBody.create(APPLICATION_JSON_CHARSET_UTF_8, body);

        Request postRequest = new Request.Builder().post(requestBody).url(url).build();

        Call call = OK_HTTP_CLIENT.newCall(postRequest);

        try (Response postResponse = call.execute()) {
            return handle(postResponse);
        } catch (IOException e) {
            return "异常URL:" + String.format("URL: {%s}", url);
        }
    }

    private static String handle(Response httpResponse) throws IOException {

        // 从响应模型中获取响应实体
        ResponseBody responseBody = httpResponse.body();

        if (httpResponse.isSuccessful()) {
            if (Objects.nonNull(responseBody)) {
                LOGGER.info("Success");
                LOGGER.error(String.format("Response Content Length: {%d}", responseBody.contentLength()));
                return responseBody.string();
            } else {
                return  "Response: {NULL}";
            }
        } else {
            LOGGER.error("Failure");
            if (Objects.nonNull(responseBody)) {
                LOGGER.error(String.format("Response Content Length: {%d}", responseBody.contentLength()));
                LOGGER.error(responseBody.string());
            }
           return String.format("ResponseStatus: {%s}", httpResponse.code());
        }
    }
}
