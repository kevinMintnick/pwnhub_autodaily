package com.ruoyi.fucktryee.utils;

public class GenNumberUtils {

    /**
     * 生成m到n（包含）的随机数
     * 公式：Math.random() * (n + 1 - m)+ m
     *
     * @param m 最小
     * @param n 最大
     * @return
     */
    public static int genRange(int m, int n) {
        return (int) (Math.random() * (n + 1 - m)) + m;
    }

    /**
     * 生成m到n（包含）的随机数，并且最后一位不为0
     * 公式：Math.random() * (n + 1 - m)+ m。
     *
     * @param m 最小
     * @param n 最大
     * @return
     */
    public static int genRangeNot0(int m, int n) {
        while (true) {
            int num = (int) (Math.random() * (n + 1 - m)) + m;
            int i = num % 10;
            if (i == 0) {
                continue;
            }
            return num;
        }
    }

}
