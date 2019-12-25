package com.xuandan.bgroup.pcmanager.dao;

import com.xuandan.bgroup.common.model.entity.Stores;
import org.apache.ibatis.annotations.Mapper;

/**
 * @Description 店铺数据层
 * @Author 赵泽明
 * @Version 1.0
 */
@Mapper
public interface StoresDao {

    /**
     * 增加一个店铺信息
     * @param stores 店铺信息实体
     * @return
     */
    int addStores(Stores stores);
}
