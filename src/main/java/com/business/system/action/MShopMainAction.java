package com.business.system.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.business.system.bean.GoodsBean;
import com.business.system.bean.GoodsSortBean;
import com.business.system.bean.SellerAttentionLogBean;
import net.sf.rose.jdbc.DBUtils;
import net.sf.rose.jdbc.service.Service;
import net.sf.rose.web.utils.WebUtils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 创建人: xudy
 * 创建日期: 2017/04/13 13:45
 * 类描述:商家首页
 */
@Controller
@RequestMapping("shopmain")
public class MShopMainAction {
    /**
     * @Description:根据sellerNo 获取商城的基本信息MDetailAction->getSeller.do
     * @date:2017/4/13 14:03
     * @author:xudy
     */


    /**
     * @Description:关注商家
     * @param sellerNo
     * @param userId
     * @date:2017/5/15 0015 19:08
     * @author:xudy
     */
    @RequestMapping("followSeller.do")
    @ResponseBody
    public Map<String,Object> followSeller(HttpServletRequest request,Service service){
        Map<String,Object> params = WebUtils.getRequestData(request);
        Map<String,Object> result = new HashMap<>();

        String sellerNo = (String) params.get("sellerNo");
        String userId = (String) params.get("userId");
        SellerAttentionLogBean bean =DBUtils.getBean(service,SellerAttentionLogBean.class,params);
        if(bean!=null){
            result.put("msg","已关注,无需重新关注!");
            result.put("state",-1);
        }
        else{
            bean = new SellerAttentionLogBean();
            bean.setUserID(userId);
            bean.setSellerNo(sellerNo);
            int i = DBUtils.update(service,bean);
            if(i>0){
                result.put("msg","关注成功!");
                result.put("state",1);
            }else{
                result.put("msg","关注失败!");
                result.put("state",0);
            }
        }
        return result;
    }



    /**
     * @Description:根据商家对应的分类,获取全部下级分类(主要展示在导航栏上的)
     * @date:2017/4/13 14:12
     * @author:xudy
     */
    @RequestMapping("getSortAll.do")
    @ResponseBody
    public  List<GoodsSortBean> getSortAll(HttpServletRequest request, Service service){
        Map<String,Object> params = WebUtils.getRequestData(request);
        //商家的分类编号
        Object sort = params.get("parentNO");
        List<GoodsSortBean> sortBeans = DBUtils.getBeanList(service,GoodsSortBean.class,params);
        return sortBeans;

    }

    /**
     * @Description:商家首页热卖推荐
     * @date:2017/4/13 14:17
     * @param sellerNo 商家编号
     * @param hotSales
     * @author:xudy
     */
    @RequestMapping("getHotRecommend.do")
    @ResponseBody
    public List<GoodsBean> getHotRecommend(HttpServletRequest request, Service service){
         Map<String,Object> params = WebUtils.getRequestData(request);
         List<GoodsBean> result = DBUtils.getBeanList(service,GoodsBean.class,params);
         return result;

    }

    /**
     * @Description:商家每个分类下的商品的列表(3)
     * @date:2017/4/13 14:18
     * @param sellerNo 商家编号
     * @param sortNo 分类编号
     * @author:xudy
     */
    @RequestMapping("getSortGoods.do")
    @ResponseBody
    public List<GoodsBean> getSortGoods(HttpServletRequest request, Service service){
        Map<String,Object> params = WebUtils.getRequestData(request);
        List<GoodsBean> result = DBUtils.getBeanList(service,GoodsBean.class,params);
        return result;
    }


}