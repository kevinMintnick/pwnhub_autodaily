package com.ruoyi.fucktryee.utils;

import com.ruoyi.fucktryee.pojo.Coordinate;
import org.springframework.stereotype.Service;

@Service
public class GenCoordinateUtils {

    /**
     * 获取学府西苑签到坐标。
     * 思路：在矩形中生成随机坐标
     *
     * @return 经纬度坐标
     */
    public static Coordinate getWestSignCoordinate() {
        // 西苑的范围 - 最小经纬度：121.626192,29.921513  最大经纬度：121.627764,29.923837
        // 前缀经纬度
        int  prefixLat = 29, prefixLng = 121;
        // 经纬度小数的前6位
        int front6Lat = GenNumberUtils.genRange(923574, 923575);
        int front6Lng = GenNumberUtils.genRange(626292, 626293);
        // 经纬度小数的后6位。
        int back6Lat = GenNumberUtils.genRangeNot0(100001, 999999);
        int backLng = GenNumberUtils.genRangeNot0(100001, 999999);
        // 生成的西苑范围随机经纬度
        String genLat = prefixLat + "." + front6Lat + back6Lat;
        String genLng = prefixLng + "." + front6Lng + backLng;
        /*
        // 定死地址，必须是这地址，这是西苑
        String genLat = "29.923574561424";
        String genLng = "121.62629250982";
        */
        // 返回经纬度坐标
        return new Coordinate(genLat, genLng);
    }
    /**
     * 获取学府东苑签到坐标。
     * 思路：在矩形中生成随机坐标
     *
     * @return 经纬度坐标
     */
    public static Coordinate getEastSignCoordinate() {
        // 西苑的范围 - 最小经纬度：121.626192,29.921513  最大经纬度：121.627764,29.923837
        // 前缀经纬度
        int  prefixLat = 29, prefixLng = 121;
        // 经纬度小数的前6位
        int front6Lat = GenNumberUtils.genRange(924900, 924953);
        int front6Lng = GenNumberUtils.genRange(640700, 640719);
        // 经纬度小数的后6位。
        int back6Lat = GenNumberUtils.genRangeNot0(100001, 999999);
        int backLng = GenNumberUtils.genRangeNot0(100001, 999999);
        // 生成的西苑范围随机经纬度
        String genLat = prefixLat + "." + front6Lat + back6Lat;
        String genLng = prefixLng + "." + front6Lng + backLng;
        /*
        // 定死地址，必须是这地址，这是西苑
        String genLat = "29.923574561424";
        String genLng = "121.62629250982";
        */
        // 返回经纬度坐标
        return new Coordinate(genLat, genLng);
    }
}
