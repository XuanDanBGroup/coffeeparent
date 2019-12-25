package com.xuandan.bgroup.common.model.entity;

import java.io.Serializable;

/**
 * @Description 新闻实体
 * @Author 赵泽明
 * @Version 1.0
 */
public class Item implements Serializable {
    //新闻id  新闻图片   新闻标题  新闻内容  状态：1，正常；0，失效
      private  String itemid,ipic,ititle,icontent,status ;

    public String getItemid() {
        return itemid;
    }

    public void setItemid(String itemid) {
        this.itemid = itemid;
    }

    public String getIpic() {
        return ipic;
    }

    public void setIpic(String ipic) {
        this.ipic = ipic;
    }

    public String getItitle() {
        return ititle;
    }

    public void setItitle(String ititle) {
        this.ititle = ititle;
    }

    public String getIcontent() {
        return icontent;
    }

    public void setIcontent(String icontent) {
        this.icontent = icontent;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Item{" +
                "itemid='" + itemid + '\'' +
                ", ipic='" + ipic + '\'' +
                ", ititle='" + ititle + '\'' +
                ", icontent='" + icontent + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
