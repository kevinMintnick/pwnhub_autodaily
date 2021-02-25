package com.ruoyi.fucktryee.mapper;


import com.ruoyi.fucktryee.pojo.DataDict;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface IDataDictMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DataDict record);

    int insertSelective(DataDict record);

    DataDict selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DataDict record);

    int updateByPrimaryKey(DataDict record);
}