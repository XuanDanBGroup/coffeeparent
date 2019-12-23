package com.xuandan.bgroup.common.model.entity;

import java.io.Serializable;

/**
 * @Description 用户实体
 * @Author 赵泽明
 * @Version 1.0
 */
public class Users implements Serializable {
    //用户id 用户在业务中的名字 微信号 手机号 邮箱 个人描述(默认值：这个人很懒，什么都没写)
   private String uid,uname,wxaccount,phone,email,desc;
   //信用积分 默认值 100  0:注册失败，1:正常，2:被禁用 默认值  1
   private Integer credit,status;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getWxaccount() {
        return wxaccount;
    }

    public void setWxaccount(String wxaccount) {
        this.wxaccount = wxaccount;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
