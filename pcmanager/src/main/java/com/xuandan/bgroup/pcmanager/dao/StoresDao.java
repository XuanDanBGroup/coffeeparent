package com.xuandan.bgroup.pcmanager.dao;

import com.xuandan.bgroup.common.model.entity.Stores;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

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

    /**
     * 修改店铺信息
     * @param stores 店铺实体
     * @return 1成功0失败
     */
    int  updateStores(Stores stores);

    /**
     * 删除店铺信息（待定）
     * @param storeid 店铺id
     * @return 1成功0失败
     */
    int delStores(String storeid);

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
