package com.xuandan.bgroup.pcmanager.controller;

import com.xuandan.bgroup.common.model.entity.Item;
import com.xuandan.bgroup.pcmanager.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class ItemController {
    @Autowired
    private ItemService itemService;
    @RequestMapping("/showItem")
    public String showItem(Model model){
        List<Item> items = itemService.queryAllItem();
        model.addAttribute("itemList",items);
        return "ftl/showItem";
    }
    @RequestMapping("/addItem")
    public String addItem(){
        return "ftl/addItem";
    }
    @RequestMapping("/doAddItem")
    public String doAddItem(Model model,Item item){
        int i = itemService.addItem(item);
        model.addAttribute("mess",i);
        return "redirect:showItem";
    }


    @RequestMapping("/delItemByStatus")
    public String delItemByStatus(Model model,String id){
        System.out.println(id);
        int i = itemService.delItemByStatus(id);
        model.addAttribute("mess",i);
        return "redirect:showItem";
    }
    @RequestMapping("/updateItem")
    public String updateItem(Model model,String id){
        Item item = itemService.getItem(id);
        model.addAttribute("item",item);
        return "ftl/updateItem";
    }
    @RequestMapping("/doUpdateItem")
    public String doUpdateItem(Model model,Item item){
        int i = itemService.updateItem(item);
        model.addAttribute("mess",i);
        return "ftl/updateItem";
    }


}
