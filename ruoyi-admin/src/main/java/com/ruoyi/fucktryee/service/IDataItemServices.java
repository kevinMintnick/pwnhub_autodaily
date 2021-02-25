package com.ruoyi.fucktryee.service;

import org.springframework.cache.annotation.Cacheable;

public interface IDataItemServices {

    String selectByDatasourceKey(String dataSource, String key);
}
