package com.xuandan.bgroup.pcmanager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description 初始化请求
 * @Author 赵泽明
 * @Version 1.0
 */
@Controller
public class InitController {

    @RequestMapping("/PCManager")
    public String PCManger(){
        return "loginManager";
    }

    @RequestMapping("/loginManager")
    public String loginManger(String username,String password ){
        if(username.equals("admin")&&password.equals("123456")){
            return "managerAddStores";
        }
        return "";
    }


}
