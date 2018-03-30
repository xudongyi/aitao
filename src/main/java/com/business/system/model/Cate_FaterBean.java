package com.business.system.model;

import com.business.system.bean.GoodsSortBean;
import com.business.system.bean.GoodsSortPropertyBean;

import java.util.List;

/**
 * 父类+子类类型的商品类bean
 * @author zhangqiang
 * @create 2017-04-11 19:53
 */
public class Cate_FaterBean {

    public GoodsSortBean fatherBean;   //父类
    public List<Cate_SonBean> son_list;  ///子类
    public List<GoodsSortPropertyBean> pic_list;  //图片类

    public List<GoodsSortPropertyBean> getPic_list() {
        return pic_list;
    }

    public void setPic_list(List<GoodsSortPropertyBean> pic_list) {
        this.pic_list = pic_list;
    }

    public GoodsSortBean getFatherBean() {
        return fatherBean;
    }

    public void setFatherBean(GoodsSortBean fatherBean) {
        this.fatherBean = fatherBean;
    }

    public List<Cate_SonBean> getSon_list() {
        return son_list;
    }

    public void setSon_list(List<Cate_SonBean> son_list) {
        this.son_list = son_list;
    }
}
