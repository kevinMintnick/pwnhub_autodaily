package com.ruoyi.fucktryee.service.impl;


import com.ruoyi.fucktryee.mapper.IDataItemMapper;
import com.ruoyi.fucktryee.pojo.DataItem;
import com.ruoyi.fucktryee.service.IDataItemServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("DataItemServices")
public class DataItemServicesImpl implements IDataItemServices {
    @Autowired
    private IDataItemMapper dataItemMapper;

    @Override
    public String selectByDatasourceKey(String dataSource, String key) {
        DataItem dataItem = new DataItem();
        dataItem.setDatasource(dataSource);
        dataItem.setCode(key);
        return dataItemMapper.selectByDatasourceCode(dataItem).getVal();
    }
}
