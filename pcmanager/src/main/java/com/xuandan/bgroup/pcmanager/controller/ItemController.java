package com.xuandan.bgroup.pcmanager.controller;

import com.google.gson.Gson;
import com.qiniu.http.Response;
import com.qiniu.storage.model.DefaultPutRet;
import com.xuandan.bgroup.common.model.entity.Item;
import com.xuandan.bgroup.common.utils.IdWorker;
import com.xuandan.bgroup.pcmanager.service.ItemService;
import com.xuandan.bgroup.pcmanager.service.QiniuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class ItemController {
    @Resource
    private QiniuService qnService;
    @Value("${qiniu.path}")
    private String path;

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
        return "ftl/addItems";
    }
    @RequestMapping("/doAddItem")
    public String doAddItem (Model model,Item item,@RequestParam("file") MultipartFile file) throws Exception{
        item.setItemid(IdWorker.getId());
        Response response = qnService.uploadFile(file.getInputStream());
        DefaultPutRet putRet=new Gson().fromJson(response.bodyString(),DefaultPutRet.class);
        String url=path+"/"+putRet.key;
        item.setIpic(url);
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
        return "ftl/updateItems";
    }
    @RequestMapping("/doUpdateItem")
    public String doUpdateItem(Model model,Item item,@RequestParam("file") MultipartFile file) throws Exception{
        Response response = qnService.uploadFile(file.getInputStream());
        DefaultPutRet putRet=new Gson().fromJson(response.bodyString(),DefaultPutRet.class);
        String url=path+"/"+putRet.key;
        item.setIpic(url);
        int i = itemService.updateItem(item);
        model.addAttribute("mess",i);
        return "redirect:showItem";
    }


}
