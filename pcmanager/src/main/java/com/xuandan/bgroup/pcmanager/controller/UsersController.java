package com.xuandan.bgroup.pcmanager.controller;

import com.xuandan.bgroup.common.model.entity.Users;
import com.xuandan.bgroup.pcmanager.service.UsersService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class UsersController {

    @Resource
    private UsersService usersService;



    //展示用户信息列表 ↓
    @RequestMapping("getAllUsers")
    public String getAllUsers(Model model){
        List<Users>usersList=usersService.queryAllUsers();
        model.addAttribute("usersList",usersList);
        return "ftl/showUsers";
    }
    //去添加用户界面 ↓
    @RequestMapping("toAddUsers")
    public String toAddUsers(){
        return "ftl/addUsers";
    }
    //执行添加用户方法 ↓
    @RequestMapping("doAddUsers")
    public String doAddUsers(Users users){
        if (usersService.addUsers(users)){
            return "getAllUsers";
        }
        return "getAllUsers";
    }

    //删除用户
    @RequestMapping("doDelete")
    public String doDelete(Users users){
        if (usersService.deleteUsers(users)){
            return "getAllUsers";
        }
        return "getAllUsers";
    }

    //去修改界面  根据id获取要修改的对象
    @RequestMapping("toUpdateUsers")
    public String getUsersById(String uid,Model model){
        Users users=usersService.detailUsers(uid);
        model.addAttribute("users",users);
        return "ftl/updateUsers";
    }
    //做修改操作
    @RequestMapping("doUpdateUsers")
    public String doUpdateUsers(Users users){
        if (usersService.updateUsers(users)){
            return "getAllUsers";
        }
        return "getAllUsers";
    }




}
