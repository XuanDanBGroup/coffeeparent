package com.xuandan.bgroup.pcmanager.service;

import com.xuandan.bgroup.common.model.entity.Users;

import java.util.List;

public interface UsersService {
    List<Users> queryAllUsers();//查询所有

    Boolean addUsers(Users users);//增加一条

    Boolean updateUsers(Users users);//修改一条

    Boolean deleteUsers(Users users);//删除（修改状态）

    Users detailUsers(String uid);//查看一条
}
