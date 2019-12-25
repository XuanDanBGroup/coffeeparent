package com.xuandan.bgroup.pcmanager.controller;

import com.google.gson.Gson;
import com.qiniu.http.Response;
import com.qiniu.storage.model.DefaultPutRet;
import com.xuandan.bgroup.common.model.entity.Stores;
import com.xuandan.bgroup.pcmanager.service.QiniuService;
import com.xuandan.bgroup.pcmanager.service.StoresService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;

/**
 * @Description
 * @Author 赵泽明
 * @Version 1.0
 */
@Controller
public class StoresController {

    @Resource
    private QiniuService qnService;
    @Value("${qiniu.path}")
    private String path;
    @Autowired
    private StoresService storesService;
    @RequestMapping("/managerAddStores")
    public String managerAddStores(@RequestParam("file")MultipartFile file, Stores stores)throws IOException {
        Response response = qnService.uploadFile(file.getInputStream());
        DefaultPutRet putRet=new Gson().fromJson(response.bodyString(),DefaultPutRet.class);
        String url=path+"/"+putRet.key;
        stores.setSpic(url);
        if(!storesService.addStores(stores)){
            return "500";
        }
        return "managerAddStores";


    }


}
