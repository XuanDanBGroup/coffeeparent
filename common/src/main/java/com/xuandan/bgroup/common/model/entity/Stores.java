package com.xuandan.bgroup.common.model.entity;

import java.io.Serializable;

/**
 * @Description 商铺实体
 * @Author 赵泽明
 * @Version 1.0
 */
public class Stores  implements Serializable {
        //商户id  商户名称  电话   商户地址   商户的首页图
    private String storeid,sname,sphone ,saddress ,spic   ;
    //  评分 默认值100    状态：1:正常，0:不正常，2:被禁用
    private Integer score,status;

    public String getStoreid() {
        return storeid;
    }

    public void setStoreid(String storeid) {
        this.storeid = storeid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSphone() {
        return sphone;
    }

    public void setSphone(String sphone) {
        this.sphone = sphone;
    }

    public String getSaddress() {
        return saddress;
    }

    public void setSaddress(String saddress) {
        this.saddress = saddress;
    }

    public String getSpic() {
        return spic;
    }

    public void setSpic(String spic) {
        this.spic = spic;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Stores{" +
                "storeid='" + storeid + '\'' +
                ", sname='" + sname + '\'' +
                ", sphone='" + sphone + '\'' +
                ", saddress='" + saddress + '\'' +
                ", spic='" + spic + '\'' +
                ", score=" + score +
                ", status=" + status +
                '}';
    }
}
