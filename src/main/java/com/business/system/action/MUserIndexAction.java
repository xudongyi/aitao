package com.business.system.action;
import com.business.system.bean.GoodsBean;
import com.business.system.bean.SellerBean;
import com.business.system.bean.UserBean;
import com.business.system.service.UserService;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.dao.MapDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.query.MapSQL;
import net.sf.rose.jdbc.service.Service;
import net.sf.rose.web.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 创建人: zhangqiang
 * 创建日期: 2017/04/13 15:46
 * 类描述:用户中心首页
 */
@Controller
@RequestMapping("user/index")
public class MUserIndexAction {

    @Autowired
    UserService userService;


    /**
     * @Description:根据用户id获取用户信息
     * @date:2017/4/14 0014 10:21
     * @author:zhangqiang
     */
    @ResponseBody
    @RequestMapping("getUserInfo.do")
    public UserBean getUserInfo(Service service, String id){
        BeanDAO dao = new BeanDAO(service);
        return userService.load(dao,id);
    }


    /**
     * @Description:会员推荐(4个首页显示的商品),暂时查询商品表fine=1时的商品
     * @author:zhangqiang
     */
    @ResponseBody
    @RequestMapping("userRecommend.do")
    public List<GoodsBean> userRecommend(Service service){
        BeanDAO dao = new BeanDAO(service);
        BeanSQL query = dao.getQuerySQL();
        query.setEntityClass(GoodsBean.class);
        query.createSql("fine", 1);
        return dao.list();
    }

    /**
     * @Description:收藏的店铺(4个)
     * @author:zhangqiang
     */
    @ResponseBody
    @RequestMapping("collectionShop.do")
    public List<SellerBean> collectionShop(HttpServletResponse response, Service service, String userid) throws IOException {
        BeanDAO dao = new BeanDAO(service);
        BeanSQL query = dao.getQuerySQL();
        query.setEntityClass(SellerBean.class);
        query.setSQL("SELECT * FROM seller s LEFT JOIN seller_attention_log l on s.SELLER_NO = l.SELLER_NO WHERE l.USER_ID=? ORDER BY l.CREATE_TIME DESC LIMIT 0,4 ");
        query.addParameter(userid);
        return dao.list();
    }

    /**
     * @Description: //浏览历史和我的足迹(),暂时查询最新的6个商品
     * @date:2017/4/14 0014 10:25
     * @author:zhangqiang
     */
    @ResponseBody
    @RequestMapping("viewHistory.do")
    public List<GoodsBean> viewHistory(Service service){
        BeanDAO dao = new BeanDAO(service);
        BeanSQL query = dao.getQuerySQL();
        query.setEntityClass(GoodsBean.class);
        query.setSQL("SELECT * FROM goods ORDER BY CREATE_TIME DESC LIMIT 0,6");
        return dao.list();
    }

    /**
     * @Description:关注的商品
     * @date:2017/4/14 0014 10:33
     * @author:zhangqiang
     */
    @ResponseBody
    @RequestMapping("followGoods.do")
    public List<GoodsBean> followGoods(Service service, String userid) throws IOException{
        BeanDAO dao = new BeanDAO(service);
        BeanSQL query = dao.getQuerySQL();
        query.setEntityClass(GoodsBean.class);
        query.setSQL("SELECT * FROM goods g  LEFT JOIN goods_attention_log l on g.GOODS_NO = l.GOODS_NO where l.USER_ID=? ORDER BY l.CREATE_TIME DESC LIMIT 0,4 ");
        query.addParameter(userid);
        return dao.list();
    }


}