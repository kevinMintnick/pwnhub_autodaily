package com.ruoyi.fucktryee.utils;

import java.net.URLEncoder;

/**
 * 中文字符串和unicode互转工具类 <br>
 *
 * @author hkb <br>
 */
public class UnicodeConvertUtils {

    public static String escape(String input) {
        int len = input.length();
        int i;
        char j;
        StringBuffer result = new StringBuffer();
        result.ensureCapacity(len * 6);
        for (i = 0; i < len; i++) {
            j = input.charAt(i);
            if (Character.isDigit(j) || Character.isLowerCase(j) || Character.isUpperCase(j)) {
                result.append(j);
            } else if (j < 256) {
                result.append("%");
                if (j < 16) {
                    result.append("0");
                }
                result.append(Integer.toString(j, 16));
            } else {
                result.append("%u");
                result.append(Integer.toString(j, 16));
            }
        }
        return result.toString();

    }

    /**
     * 实现js的unescape函数
     *
     * @param input 待传入字符串
     * @return
     */
    public static String unescape(String input) {
        int len = input.length();
        StringBuffer result = new StringBuffer();
        result.ensureCapacity(len);
        int lastPos = 0, pos = 0;
        char ch;
        while (lastPos < len) {
            pos = input.indexOf("%", lastPos);
            if (pos == lastPos) {
                if (input.charAt(pos + 1) == 'u') {
                    ch = (char) Integer.parseInt(input.substring(pos + 2, pos + 6), 16);
                    result.append(ch);
                    lastPos = pos + 6;
                } else {
                    ch = (char) Integer.parseInt(input.substring(pos + 1, pos + 3), 16);
                    result.append(ch);
                    lastPos = pos + 3;
                }
            } else {
                if (pos == -1) {
                    result.append(input.substring(lastPos));
                    lastPos = len;
                } else {
                    result.append(input.substring(lastPos, pos));
                    lastPos = pos;
                }
            }
        }
        return result.toString();
    }

    /**
     * unicode转中文
     *
     * @param input 待传入字符串
     * @return
     */
    public static String toGb2312(String input) {
        input = input.trim().replaceAll("(?i)\\\\u", "%u");
        return unescape(input);
    }

    /**
     * 中文字符串转unicode
     *
     * @param input 待传入字符串
     * @return
     */
    public static String toUnicode(String input) {
        input = input.trim();
        String output = URLEncoder.encode(input);
        return output;
    }

    /**
     * 测试
     *
     * @param args
     */
    public static void main(String[] args) {
        System.out.println(toUnicode("浙江省宁波市镇海区明海南路255号靠近公元世家1期"));
        System.out.println(toGb2312("\u4f60\u597d"));
        // 等同于上面
        System.out.println(toGb2312("\\u4f60\\u597d"));
    }
}