package com.xuandan.bgroup.pcmanager.service;

import com.xuandan.bgroup.common.model.entity.Item;

import java.util.List;

public interface ItemService {
    //展示所有新闻
    List<Item> queryAllItem();
    //添加新闻
    int addItem(Item item);
    //删除(修改新闻)
    int delItemByStatus(String id);
    //修改新闻
    int updateItem(Item item);
    Item getItem(String id);

}
