package com.business.system.action;

import com.business.system.bean.GoodsBean;
import com.business.system.bean.GoodsSortBean;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.service.Service;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 创建人: xudy
 * 创建日期: 2017/04/14 11:22
 * 类描述:关注中心
 */
@Controller
@RequestMapping("user/addition")
public class MUserAdditionAction {

    /**
     * @Description:根据用户的收藏商品进行分类显示
     * @author:zhangqiang
     */
    @ResponseBody
    @RequestMapping("getFollowGoodsBySort.do")
    public Map<String, List<GoodsBean>> getFollowGoodsBySort(Service service, String userid) {
        BeanDAO dao = new BeanDAO(service);
        BeanSQL query = dao.getQuerySQL();
        query.setEntityClass(GoodsSortBean.class);
        query.setSQL("SELECT gs.* FROM goods g " +
                "LEFT JOIN goods_attention_log ga on g.GOODS_NO = ga.GOODS_NO " +
                "LEFT JOIN goods_sort gs on g.SORT_NO = gs.SORT_NO " +
                "where ga.USER_ID=?");
        query.addParameter(userid);
        List<GoodsSortBean> gs_list = dao.list();

        query.setEntityClass(GoodsBean.class);
        query.setSQL("SELECT g.* FROM goods g " +
                "LEFT JOIN goods_attention_log ga on g.GOODS_NO = ga.GOODS_NO " +
                "LEFT JOIN goods_sort gs on g.SORT_NO = gs.SORT_NO " +
                "where ga.USER_ID=?" +
                " order by g.SORT_NO");
        query.addParameter(userid);
        List<GoodsBean> goods_list = dao.list();

        Map<String, List<GoodsBean>> map = new HashMap<>();
        for (GoodsSortBean gs : gs_list) {
            List<GoodsBean> new_list = new ArrayList<>();
            for (GoodsBean goodsBean : goods_list) {
                if (goodsBean.getSortNo().equals(gs.getSortNo())) {
                    new_list.add(goodsBean);
                }
                map.put(gs.getSortName(),new_list);
            }
        }
        return map;
    }

    /**
     * @Description:关注商品的推荐商品(4)
     * 暂时查询商品表fine=1时的商品
     * @author:zhangqiang
     */
    @ResponseBody
    @RequestMapping("getFollowRecommend.do")
    public List<Object> getFollowRecommend(Service service) {
        BeanDAO dao = new BeanDAO(service);
        BeanSQL query = dao.getQuerySQL();
        query.setEntityClass(GoodsBean.class);
        query.createSql("fine", 1);
        return dao.list();
    }

}