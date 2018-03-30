package com.business.system.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.business.system.bean.GoodsCommentLogBean;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.dao.MapDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.query.MapSQL;
import net.sf.rose.jdbc.service.Service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 创建人: zhangqiang
 * 创建日期: 2017/04/14 13:27
 * 类描述:
 */
@Controller
@RequestMapping("user/discuss")
public class MUserDiscussAction {

    /**
     * @Description:根据收藏的商品列出未评价的商品列表
     * @author:zhangqiang
     */
    @ResponseBody
    @RequestMapping("getDiscuss.do")
    public List getDiscuss(Service service, String userid){
        MapDAO dao = new MapDAO(service);
        MapSQL query = dao.getQuerySQL();
        String sql = "SELECT * FROM goods_attention_log ga LEFT JOIN goods g on ga.GOODS_NO = g.GOODS_NO WHERE ga.USER_ID =? AND ga.GOODS_NO NOT IN (SELECT gc.GOODS_NO FROM goods_comment_log gc where gc.USER_ID = ? ) ";
        query.setSQL(sql);
        query.addParameter(userid);
        query.addParameter(userid);
        return dao.list();

    }

    /**
     * @Description:获取全部已评价的列表
     * @author:zhangqiang
     */
    @ResponseBody
    @RequestMapping("getIsDiscuss.do")
    public List getIsDiscuss(Service service, String userid) {
        MapDAO dao = new MapDAO(service);
        MapSQL query = dao.getQuerySQL();
        query.setSQL("SELECT * FROM goods_comment_log gc LEFT JOIN goods g on gc.GOODS_NO = g.GOODS_NO where gc.USER_ID = ? ");
        query.addParameter(userid);
        return dao.list();
    }

    /**
     * @Description:评价
     * @author:zhangqiang
     */
    @ResponseBody
    @RequestMapping("discuss.do")
    public int discuss(Service service, GoodsCommentLogBean gcLogBean){
        BeanDAO dao = new BeanDAO(service);
        BeanSQL query = dao.getQuerySQL();
        query.setEntityClass(GoodsCommentLogBean.class);
        gcLogBean.setCreateTime(new Date());
        query.createSaveSql(gcLogBean);
        return dao.update();
    }

}