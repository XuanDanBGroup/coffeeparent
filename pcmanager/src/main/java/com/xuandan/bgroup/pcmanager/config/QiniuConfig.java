package com.xuandan.bgroup.pcmanager.config;

import com.google.gson.Gson;
import com.qiniu.common.Zone;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class QiniuConfig {
    /**
     * 配置自己空间所在地区
     */
    @Bean
    public com.qiniu.storage.Configuration qiniuconfig(){
        return new com.qiniu.storage.Configuration(Zone.zone0());
    }


    /**
     *构建一个七牛云上传工具实例
     */
    @Bean
    public UploadManager uploadManager(){
        return new UploadManager(qiniuconfig());
    }
    @Value("${qiniu.accessKey}")
    private String accessKey;
    @Value("${qiniu.secretKey}")
    private String secretKey;

    /**
     * 认证信息实例
     */
    @Bean
    public Auth auth(){
        return Auth.create(accessKey,secretKey);
    }
    /**
     *构建七牛云空间管理工具
     */
    @Bean
    public BucketManager bucketManager(){
        return new BucketManager(auth(),qiniuconfig());
    }

    @Bean
    public Gson gson(){
        return new Gson();
    }

}
