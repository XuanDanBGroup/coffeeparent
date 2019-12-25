package com.xuandan.bgroup.pcmanager.service;

import com.xuandan.bgroup.common.model.entity.Stores;

/**
 * @Description 店铺业务层
 * @Author 赵泽明
 * @Version 1.0
 */
public interface StoresService {
    /**
     * 添加一个店铺
     * @param stores 店铺实体
     * @return
     */
    boolean addStores(Stores stores);
}
