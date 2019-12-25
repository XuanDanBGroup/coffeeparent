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
    /**
     * 跳转登录页
     * @return
     */
    @RequestMapping("/PCManager")
    public String PCManger(){
        return "loginManager";
    }

    /**
     * 登录登录成功去首页，不成功在登录页
     * @param username
     * @param password
     * @return
     */
    @RequestMapping("/loginManager")
    public String loginManger(String username,String password ){
        if(username.equals("admin")&&password.equals("123456")){
            return "ftl/home";
        }
        return "loginManager";
    }

    /**
     * 首页展示内容页面
     * @return
     */
    @RequestMapping("/first")
    public String first(){
        return "ftl/first";
    }

}
