package com.xuandan.bgroup.pcmanager.service;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;

import java.io.File;
import java.io.InputStream;

public interface QiniuService {
    Response uploadFile(File file) throws QiniuException;
    Response uploadFile(InputStream inputStream) throws QiniuException;

}
