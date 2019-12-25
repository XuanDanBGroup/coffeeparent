package com.xuandan.bgroup.pcmanager.service.impl;

import com.xuandan.bgroup.common.model.entity.Item;
import com.xuandan.bgroup.pcmanager.dao.ItemsDao;
import com.xuandan.bgroup.pcmanager.service.ItemService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {
    @Resource
    private ItemsDao itemsDao;
    @Override
    public List<Item> queryAllItem() {
        return itemsDao.queryAllItem();
    }

    @Override
    public int addItem(Item item) {
        return itemsDao.addItem(item);
    }

    @Override
    public int delItemByStatus(String id) {
        return itemsDao.delItemByStatus(id);
    }

    @Override
    public int updateItem(Item item) {
        return itemsDao.updateItem(item);
    }

    @Override
    public Item getItem(String id) {
        return itemsDao.getItem(id);
    }
}
