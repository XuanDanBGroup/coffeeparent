package com.xuandan.bgroup.pcmanager.service.impl;

import com.xuandan.bgroup.common.model.entity.Stores;
import com.xuandan.bgroup.common.utils.IdWorker;
import com.xuandan.bgroup.pcmanager.dao.StoresDao;
import com.xuandan.bgroup.pcmanager.service.StoresService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description
 * @Author 赵泽明
 * @Version 1.0
 */
@Component
public class StoresServiceImpl implements StoresService {
    @Resource
    private StoresDao storesDao;
    @Override
    public boolean addStores(Stores stores) {
        stores.setStoreid(IdWorker.getId());
        stores.setStatus(1);

       if(storesDao.addStores(stores)>0){
           return true;
       }
       return false;
    }

    @Override
    public boolean updateStores(Stores stores) {
        if(storesDao.updateStores(stores)>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean delStores(String storeid) {
        if(storesDao.delStores(storeid)>0){
            return true;
        }
        return false;
    }

    @Override
    public List<Stores> showStores(String sname) {
        return storesDao.showStores(sname);
    }

    @Override
    public Stores selOneStore(String storeid) {
        return storesDao.selOneStore(storeid);
    }

}
