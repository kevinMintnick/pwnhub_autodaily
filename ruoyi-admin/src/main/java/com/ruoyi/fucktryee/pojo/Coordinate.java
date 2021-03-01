package com.ruoyi.fucktryee.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Coordinate {
    /**
     * 经度
     */
    private String lat;
    /**
     * 纬度
     */
    private String lng;
}

