package com.xuandan.bgroup.pcmanager.service.impl;

import com.xuandan.bgroup.common.model.entity.Users;
import com.xuandan.bgroup.common.utils.IdWorker;
import com.xuandan.bgroup.pcmanager.dao.UserDao;
import com.xuandan.bgroup.pcmanager.service.UsersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class UsersServiceimpl implements UsersService {

    @Resource
    private UserDao usersDao;

    @Override
    public List<Users> queryAllUsers() {
        return usersDao.queryAllUsers();
    }

    @Override
    public Boolean addUsers(Users users) {
        users.setUid(IdWorker.getId());
       if (usersDao.addUsers(users)!=0){
           return true;
       }
       return false;
    }

    @Override
    public Boolean updateUsers(Users users) {
       if (usersDao.updateUsers(users)!=0){
           return true;
       }
       return false;
    }

    @Override
    public Boolean deleteUsers(Users users) {
        if (usersDao.deleteUsers(users)!=0){
            return true;
        }
        return false;
    }

    @Override
    public Users detailUsers(String uid) {
        return usersDao.detailUsers(uid);
    }
}
