package com.xuandan.bgroup.pcmanager.service;

import com.xuandan.bgroup.common.model.entity.Stores;

import java.util.List;

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
    /**
     * 修改店铺信息
     * @param stores 店铺实体
     * @return 1成功0失败
     */
    boolean  updateStores(Stores stores);

    /**
     * 删除店铺信息（待定）
     * @param storeid 店铺id
     * @return 1成功0失败
     */
    boolean delStores(String storeid);

    /**
     * 查询店铺信息 ，所有或按名称查询
     * @param sname 店铺名
     * @return 所有相关店铺
     */
    List<Stores> showStores(String sname);
    /**
     * 通过id查单条店铺信息
     * @param storeid 店铺id
     * @return 这个店铺全部信息
     */
    Stores selOneStore(String storeid);
}
