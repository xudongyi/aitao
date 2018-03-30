package com.business.system.model;


import com.business.system.bean.GoodsSortBean;

import java.util.List;

/**
 * 父类+子类类型的商品类bean
 * @author zhangqiang
 * @create 2017-04-11 19:53
 */
public class Cate_SonBean {

    public GoodsSortBean fatherBean;   //父类
    public List<GoodsSortBean> son_list;  //子类


    public GoodsSortBean getFatherBean() {
        return fatherBean;
    }

    public void setFatherBean(GoodsSortBean fatherBean) {
        this.fatherBean = fatherBean;
    }

    public List<GoodsSortBean> getSon_list() {
        return son_list;
    }

    public void setSon_list(List<GoodsSortBean> son_list) {
        this.son_list = son_list;
    }
}
