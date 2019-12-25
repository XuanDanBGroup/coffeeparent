package com.xuandan.bgroup.pcmanager.dao;

import com.xuandan.bgroup.common.model.entity.Users;

import java.util.List;

public interface UserDao {

    List<Users> queryAllUsers();//查询所有

    int addUsers(Users users);//增加一条

    int updateUsers(Users users);//修改一条

    int deleteUsers(Users users);//删除（修改状态）

    Users detailUsers(String uid);//查看一条
}
