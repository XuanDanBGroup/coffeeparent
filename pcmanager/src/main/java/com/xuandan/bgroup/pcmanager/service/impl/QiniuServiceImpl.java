package com.xuandan.bgroup.pcmanager.service.impl;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import com.xuandan.bgroup.pcmanager.service.QiniuService;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.InputStream;

@Service
public class QiniuServiceImpl implements QiniuService, InitializingBean {

    @Autowired
    private UploadManager uploadManager;
    @Autowired
    private BucketManager bucketManager;
    @Autowired
    private Auth auth;
    @Value("${qiniu.bucket}")
    private String bucket;

    /**
     * 定义上传策略
     */
    private StringMap putPolicy;

    @Override
    public Response uploadFile(File file) throws QiniuException {
        Response response=this.uploadManager.put(file,null,getUploadToken());
        int trytimes=0;
        while (response.needRetry()&&trytimes<3){
            response=this.uploadManager.put(file,null,getUploadToken());
            trytimes++;
        }
        return response;
    }

    @Override
    public Response uploadFile(InputStream inputStream) throws QiniuException {
        String upToken  = getUploadToken();
        System.out.println(upToken);
        System.out.println(inputStream);
        Response response=this.uploadManager.put(inputStream,null, upToken,null,null);

        int trytimes=0;
        while (response.needRetry()&&trytimes<3){
            response=this.uploadManager.put(inputStream,null,getUploadToken(),null,null);
            trytimes++;
        }
        return response;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        this.putPolicy = new StringMap();
        putPolicy.put("returnBody", "{\"key\":\"$(key)\",\"hash\":\"$(etag)\",\"bucket\":\"$(bucket)\",\"fsize\":$(fsize)}");
    }

    /*
     *获取上传凭证
     */
    private String getUploadToken(){
        return this.auth.uploadToken(bucket,null,3600,putPolicy);
    }


}
