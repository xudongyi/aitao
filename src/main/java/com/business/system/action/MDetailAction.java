package com.business.system.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.business.system.bean.*;
import com.business.system.service.GoodService;
import com.business.system.service.UserService;
import net.sf.rose.jdbc.DBUtils;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.service.Service;
import net.sf.rose.web.utils.WebUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.alibaba.fastjson.JSON;

/**
 * @创建人: xudy
 * @创建日期: 2017/04/13 10:05
 * @类描述:商品详细页数据API
 */
@Controller
@RequestMapping("detail")
public class MDetailAction {

	@Autowired
	protected GoodService goodService;
    @Autowired
	protected UserService userService;

	/**
	 * @Description:获取对应商品的各级分类名称引用MCategoryAction->getCategoryName.do
	 * @date:2017/4/13 10:11
	 * @author:xudy
	 */

	/**
	 * @Description:获取商品详细信息
	 * @date:2017/4/13 10:08
	 * @param goodsNo
	 *            商品编号
	 * @author:xudy
	 */
	@RequestMapping("getDetail.do")
	@ResponseBody
	public GoodsBean getDetail(HttpServletRequest request, Service service) {
		Map<String, Object> params = WebUtils.getRequestData(request);
		GoodsBean goodsBean = DBUtils.getBean(service, GoodsBean.class, params);
		return goodsBean;
	}


    /**
     * @Description:获取对应商品的轮播图片
     * @date:2017/4/17 0017 17:12
     * @param goodsNo
     * @author:xudy
     */
    @RequestMapping("getGoodsMainImg.do")
    @ResponseBody
    public List<GoodsFileBean> getGoodsMainImg(HttpServletRequest request, Service service) {
        Map<String, Object> params = WebUtils.getRequestData(request);
        params.put("fileType", 1);// 商品详细
        return DBUtils.getBeanList(service, GoodsFileBean.class, params);
    }

	/**
	 * @Description:获取对应商品的详细图片
	 * @date:2017/4/17 0017 17:12
	 * @param goodsNo
	 * @author:xudy
	 */
	@RequestMapping("getGoodsImg.do")
	@ResponseBody
	public List<GoodsFileBean> getGoodsImg(HttpServletRequest request, Service service) {
		Map<String, Object> params = WebUtils.getRequestData(request);
		params.put("fileType", 2);// 商品详细
		return DBUtils.getBeanList(service, GoodsFileBean.class, params);
	}

	/**
	 * @Description:根据商品的分类和商品,获取对应分类属性的全部属性值
	 * @date:2017/4/15 0015 10:14
	 * @param goodsNo
	 *            商品GoodsNo
	 * @author:xudy
	 */
	@RequestMapping("getPropertyAndValue.do")
	@ResponseBody
	public Map<String, Map<String, GoodsPriceBean>> getPropertyAndValue(HttpServletRequest request, Service service) {
		Map<String, Object> params = WebUtils.getRequestData(request);
		Object goodsNo = params.get("goodsNo");// 商品分类
		// 直接从service中获取
		Map<String, Map<String, GoodsPriceBean>> results = goodService.getPriceBeanList(service, goodsNo == null ? "" : goodsNo.toString());
		return results;

	}

	/**
	 * @Description:根据sellerNo获取商家的具体信息
	 * @date:2017/4/13 13:35
	 * @param sellerNo
	 *            商家编号
	 * @author:xudy
	 */
	@RequestMapping("getSeller.do")
	@ResponseBody
	public SellerBean getSeller(HttpServletRequest request, Service service) {
		Map<String, Object> params = WebUtils.getRequestData(request);
		SellerBean bean = DBUtils.getBean(service, SellerBean.class, params);
		return bean;
	}

	/**
	 * @Description:根据商品的属性组合获取对应的一条属性记录
	 * @date:2017/4/13 0013 13:31
	 * @param propertis
	 *            传递过来的参数集合字符串
	 * @author:xudy
	 */
	@RequestMapping("getPriceByKeyAndValue.do")
	@ResponseBody
	public GoodsPriceBean getPriceByKeyAndValue(HttpServletRequest request, Service service) {
		Map<String, Object> params = WebUtils.getRequestData(request);
		Object properties = params.get("properties");
		Object goodsNo = params.get("goodsNo");
		if (properties == null)
			return null;
		Map<String, String> proMap = JSON.parseObject(properties.toString(), Map.class);
		GoodsPriceBean price = null;
		// 根据选中的key和value筛选出对应的GoodsPriceBean
		if (proMap != null) {
			price = goodService.getByKeyAndValue(proMap, goodsNo, service);
		}
		return price;
	}

	/**
	 * @Description:商品评价表(shang)
	 * @date:2017/4/13 10:59
	 * @param goodsNo
	 * @author:xudy
	 */
	@RequestMapping("getGoodsComments.do")
	@ResponseBody
	public Map<String, Object> getGoodsComments(HttpServletRequest request, Service service) {
		Map<String, Object> params = WebUtils.getRequestData(request);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsCommentLogBean.class);
		query.createSql(params);
		List<GoodsCommentLogBean> result = dao.list();
		// 好评(good),中评(middle),差评(bad)
		Map<String, List<GoodsCommentLogBean>> stringListMap = new HashMap<>();
		List<GoodsCommentLogBean> good = new ArrayList<>();
		List<GoodsCommentLogBean> middle = new ArrayList<>();
		List<GoodsCommentLogBean> bad = new ArrayList<>();
		for (GoodsCommentLogBean logBean : result) {
			if (logBean.getGrade() == 0 || logBean.getGrade() >= 5) {
				good.add(logBean);
			} else if (logBean.getGrade() >= 3 && logBean.getGrade() < 5) {
				middle.add(logBean);
			} else if (logBean.getGrade() >= 1 && logBean.getGrade() < 3) {
				bad.add(logBean);
			}
		}

		stringListMap.put("good", good);
		stringListMap.put("middle", middle);
		stringListMap.put("bad", bad);

		// 计算该商品的好评度(percent,(pgood,pmiddle,pbad))
		Map<String, Double> doubleHashMap = new HashMap<>();
		doubleHashMap.put("pgood", result.size()==0?0:good.size() * 1.0 / result.size());
		doubleHashMap.put("pmiddle",  result.size()==0?0:middle.size() * 1.0 / result.size());
		doubleHashMap.put("pbad",  result.size()==0?0:bad.size() * 1.0 / result.size());

		Map<String, Object> data = new HashMap<>();

		data.put("data", stringListMap);// 分类数据
		data.put("percent", doubleHashMap);// 分类统计数据
		data.put("total", result);// 全部评价

		return data;
	}

    /**
     * @Description: 同类新品
     * @date:2017/4/21 0021 14:50
     * @param sortNo
     * @author:xudy
     */
    @RequestMapping("sameSort.do")
    @ResponseBody
    public List<GoodsBean> sameSort(HttpServletRequest request,Service service){
	    Map<String,Object> params = WebUtils.getRequestData(request);
	    params.put("newGoods",1);//新品字段
        List<GoodsBean> result = DBUtils.getBeanList(service,GoodsBean.class,params);
        return result;
    }


    /**
     * @Description: 商品收藏
     * @date:2017/5/2 0002 20:11
     * @param goodsNo
     * @param userID
     * @author:xudy
     */
    @RequestMapping("addCollection.do")
    @ResponseBody
    public int addCollection(HttpServletRequest request, Service service){
        Map<String,Object> params = WebUtils.getRequestData(request);
        GoodsAttentionLogBean log = DBUtils.getBean(service,GoodsAttentionLogBean.class,params);
        if(log!=null){
            return -1;
        }
        GoodsAttentionLogBean bean = new GoodsAttentionLogBean();
        bean.setUserID(params.get("userID").toString());
        BeanDAO dao = new BeanDAO(service);
        UserBean user = userService.load(dao,bean.getUserID());
        bean.setGoodsNo(params.get("goodsNo").toString());//商品编号
        bean.setUserName(user!=null?user.getUserName():"");
        int i = DBUtils.update(service,bean);
        return i;
    }



	/**
	 * @Description:商品收藏记录
	 * @param goodsNo 商品编号
	 * @date:2017/4/13 13:17
	 * @author:xudy
	 */
	@RequestMapping("getCollectInfo.do")
	@ResponseBody
	public List<GoodsAttentionLogBean> getCollectInfo(HttpServletRequest request, Service service) {
		Map<String, Object> params = WebUtils.getRequestData(request);
		List<GoodsAttentionLogBean> result = DBUtils.getBeanList(service, GoodsAttentionLogBean.class, params);
		return result;
	}

	/**
	 * @Description:详细页面右侧的看了又看记录 TODO 看了又看疑问?
	 * @date:2017/4/13 0013 13:32
	 * @author:xudy
	 */
	@RequestMapping("getKLYK.do")
	@ResponseBody
	public List<GoodsBean> getKLYK(HttpServletRequest request, Service service) {
		List<GoodsBean> goods = null;
		return goods;
	}

	/**
	 * @Description:该商家的同类别的其他商品
	 * @date:2017/4/13 0013 13:37
	 * @param sellerNo
	 * @param sortNo
	 * @author:xudy
	 */
	@RequestMapping("getTLSP.do")
	@ResponseBody
	public List<GoodsBean> getTLSP(HttpServletRequest request, Service service) {
		Map<String, Object> params = WebUtils.getRequestData(request);
		List<GoodsBean> result = DBUtils.getBeanList(service, GoodsBean.class, params);
		return result;
	}

	/**
	 * @Description:推荐商品引用MHomeAction中的getGoods.do?type=2中的商品
	 * @date:2017/4/13 13:40
	 * @author:xudy
	 */

}