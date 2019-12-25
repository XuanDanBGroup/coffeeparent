package com.xuandan.bgroup.pcmanager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
    @RequestMapping("/")
    public String home(){
        return "ftl/home";
    }
    @RequestMapping("/first")
    public String first(){
        return "ftl/first";
    }

}
