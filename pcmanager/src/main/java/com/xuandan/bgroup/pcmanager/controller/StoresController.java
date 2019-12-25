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
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

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

    /**
     * 去新增商铺页面
     * @return
     */
    @RequestMapping("/toManagerAddStores")
    public String toManagerAddStores(){
        return "ftl/managerAddStores";
    }

    /**
     * 新增商铺信息
     * @param file 商铺图片
     * @param stores 商铺信息
     * @return
     * @throws IOException
     */
    @RequestMapping("/managerAddStores")
    public String managerAddStores(@RequestParam("file")MultipartFile file, Stores stores)throws IOException {
        Response response = qnService.uploadFile(file.getInputStream());
        DefaultPutRet putRet=new Gson().fromJson(response.bodyString(),DefaultPutRet.class);
        String url=path+"/"+putRet.key;
        stores.setSpic(url);
        if(!storesService.addStores(stores)){
            return "500";
        }
        return "redirect:/showStores";


    }

    /**
     * 去修改界面
     * @param request 返回这条商铺信息
     * @param storeid 点击时获取的id
     * @return 修改界面
     */
     @RequestMapping("/toManagerUpdateStores")
    public String toManagerUpdateStores(HttpServletRequest request ,String storeid){

        Stores stores=storesService.selOneStore(storeid);
        request.setAttribute("store" ,stores);
        return "ftl/managerUpdateStores";
    }

    /**
     * 修改用户信息
     * @param request  修改成功信息
     * @param file 图片
     * @param stores 修改完的信息
     * @return  展示界面
     * @throws IOException
     */
    @RequestMapping("/doManagerUpdateStores")
    public  String doManagerUpdateStores(HttpServletRequest request ,@RequestParam("file")MultipartFile file, Stores stores)throws IOException{
      String storesid=stores.getStoreid();
      Response response = qnService.uploadFile(file.getInputStream());
      DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
      String url = path + "/" + putRet.key;
      stores.setSpic(url);
      stores.setStoreid(storesid);
        if(!storesService.updateStores(stores)){
            return "500";
        }
        request.setAttribute("info","修改成功");
        return "redirect:/showStores";
    }

    /**
     * 删除商铺（修改商铺的状态）
     * @param request
     * @param storeid
     * @return
     */
    @RequestMapping("/updateStoresStatus")
    public  String updateStoresStatus(HttpServletRequest request ,String storeid){
        Stores stores=new Stores();
        stores.setStoreid(storeid);
        System.out.println(storeid);
        stores.setStatus(0);
        if(!storesService.updateStores(stores)){
            return "500";
        }
        request.setAttribute("info","删除成功");
        return "redirect:/showStores";
    }

    /**
     * 展示所有商铺 或按名称模糊查询
     * @param request 返回所有商铺的信息
     * @return 展示所有界面
     */
    @RequestMapping("/showStores")
    public  String managerShowStores(HttpServletRequest request){
        List <Stores> storeList= storesService.showStores(null);
        request.setAttribute("storeList",storeList);
         return "ftl/showStores";
    }





}
