package com.business.system.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.business.system.bean.GoodsBean;
import com.business.system.bean.GoodsSortBean;
import com.business.system.bean.SellerBean;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.dao.MapDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.query.MapSQL;
import net.sf.rose.jdbc.service.Service;
import net.sf.rose.web.utils.WebUtils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 创建人: xudy 创建日期: 2017/04/11 9:18 类描述:移动端首页
 */
@Controller
@RequestMapping("home")
public class MHomeAction {

	/**
	 * @Description:获取全部分类
	 * @date:2017/4/11 14:17
	 * @author:xudy
	 */
	@RequestMapping("sortsList.do")
	@ResponseBody
	public List<GoodsSortBean> sortsList(HttpServletRequest request, Service service) {

		List<GoodsSortBean> result = new ArrayList<>();
		// 查询所有父节点分类
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsSortBean.class);
		query.setSQL("select * from GOODS_SORT where ON_USE = 1 and (PARENT_NO is null or PARENT_NO = '') order by SORT_ORDER");
		List<GoodsSortBean> parentList = dao.list();
		if (parentList.size() > 0) {
			// 父类大于13
			if (parentList.size() > 13) {

				// 查询所有二级以下分类
				query.setSQL("select * from GOODS_SORT where ON_USE = 1 and PARENT_NO is not null and PARENT_NO <> '' order by PARENT_NO,SORT_ORDER ");
				result = dao.list();

				// 排在13及之后的所有父分类
				Map<String, String> map = new HashMap<String, String>();
				String id = "";
				int size = parentList.size();
				for (int i = 12; i < size; i++) {
					String no = parentList.get(i).getSortNo();
					map.put(no, no);
					id = id + no + ",";
				}
				id = id.substring(0, id.length() - 1);
				// 删除12以后的父节点数据
				for (int i = 12; i < size; i++) {
					parentList.remove(12);
				}

				// 创建其他分类
				GoodsSortBean other = new GoodsSortBean();
				other.setSortNo(id);
				other.setSortName("其他");
				parentList.add(other);

				// 将数据中以13条以后的父分类为父节点的数据父节点改为其他
				for (GoodsSortBean bean : result) {
					if (map.containsKey(bean.getParentNO()))
						bean.setParentNO(id);
				}

				result.addAll(parentList);
			} else {
				query.createSql("onUse", 1);
				query.addOrderby("parentNO");
				query.addOrderby("sortOrder");
				result = dao.list();
			}
		}
		return result;
	}

	/**
	 * @Description: 首页分类展示
	 * @date:2017/4/20 0020 16:40
	 * @author:xudy
	 */
	@RequestMapping("getIndexSort.do")
    @ResponseBody
	public List<GoodsSortBean> getIndexSort(HttpServletRequest request, Service service) {
		String sql = "select * from GOODS_SORT WHERE SHOW_INDEX=1";
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsSortBean.class);
		query.setSQL(sql);
		List<GoodsSortBean> result = dao.list();
		if(result.size()>5){
            result = result.subList(0,5);
        }
		return result;
	}

	/**
	 * @Description:首页轮播
	 * @date:2017/4/11 14:17
	 * @author:xudy
	 */
	@RequestMapping("indexImg.do")
	@ResponseBody
	public List<String> indexImg(HttpServletRequest request, Service service) {
		List<String> result = new ArrayList<>();
		result.add("../img/home/banner.png");
		result.add("../img/home/banner.png");
		result.add("../img/home/banner.png");
		result.add("../img/home/banner.png");
		return result;
	}

	/**
	 * @Description:公告列表
	 * @date:2017/4/11 14:17
	 * @author:xudy
	 */
	@RequestMapping("noticeList.do")
	@ResponseBody
	public List noticeList(HttpServletRequest request, Service service) {

		return null;
	}

	/**
	 * @Description:入驻商家,注册会员
	 * @date:2017/4/11 14:17
	 * @author:xudy
	 *
	 */
	@RequestMapping("statistics.do")
	@ResponseBody
	public String[] statistics(Service service) {
		String[] result = new String[2];
		// 查询入驻商家数量
		MapDAO dao = new MapDAO(service);
		MapSQL query = dao.getQuerySQL();
		query.setSQL("select count(1) as NUM from SELLER");
		Map<String, Object> num = dao.load();
		result[0] = num.get("NUM").toString();

		// 查询注册会员数量
		query.setSQL("select count(1) as NUM from USER");
		num = dao.load();

		result[1] = num.get("NUM").toString();
		return result;
	}

	/**
	 * @Description:TODO 品牌网商和最新商家的图片信息
	 * @date:2017/4/11 14:18
	 * @author:xudy
	 */
	@RequestMapping("brandAndnewShop.do")
	@ResponseBody
	public List<String[]> brandAndnewShop(HttpServletRequest request, Service service) {
		List<String[]> result = new ArrayList<>();
		result.add(new String[] { "../img/home/xtyjf.png", "../img/home/xtyjf.png" });
		result.add(new String[] { "../img/home/xtyjf.png", "../img/home/xtyjf.png" });
		return result;
	}

	/**
	 * @Description:天天爆款
	 * @date:2017/4/11 14:01
	 * @author:xudy
	 */
	@RequestMapping("getTTBK.do")
	@ResponseBody
	public Map<String, List<GoodsBean>> getTTBK(Service service) {
		Map<String, List<GoodsBean>> result = new HashMap<>();

		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		// 爆款商品
		query.setEntityClass(GoodsBean.class);
		query.setSQL("select * from GOODS where POPULAR_SALES = 1 and ON_SHELVE = 0 order by UPDATE_TIME desc limit 1");
		GoodsBean bean = dao.get();
		List<GoodsBean> beans = new ArrayList<>();
		beans.add(bean);
		result.put("bk", beans);

		// 热销商品
		query.setEntityClass(GoodsBean.class);
		query.setSQL("select * from GOODS where HOT_SALES = 1 and ON_SHELVE = 0 order by UPDATE_TIME desc limit 1");
		bean = dao.get();
		beans = new ArrayList<>();
		beans.add(bean);
		result.put("rx", beans);

		// 最新商品
		query.setEntityClass(GoodsBean.class);
		query.setSQL("select * from GOODS where NEW_GOODS = 1 and ON_SHELVE = 0 order by UPDATE_TIME desc limit 4");
		List<GoodsBean> list = dao.list();
		result.put("zx", list);

		return result;
	}

	/**
	 * @Description:实力商家(16)
	 * @date:2017/4/11 14:02
	 * @author:xudy
	 */
	@RequestMapping("getSLSJ.do")
	@ResponseBody
	public List<SellerBean> getSLSJ(HttpServletRequest request, Service service) {
		List<SellerBean> result = new ArrayList<>();
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(SellerBean.class);
		query.setSQL("select * from SELLER where STR_SELLER = 1 order by SELLER_ORDER limit 16");
		result = dao.list();
		return result;
	}

	/**
	 * @Description:新品上市(5),商城推荐(5)
	 * @date:2017/4/11 14:02
	 * @author:xudy
	 */
	@RequestMapping("getGoods.do")
	@ResponseBody
	public List<GoodsBean> getGoods(HttpServletRequest request, Service service) {
		Map<String, Object> params = WebUtils.getRequestData(request);
		Object type = params.get("type");

		if (type == null)
			return null;

		String goodSql = "select * from GOODS where ON_SHELVE = 0";
		if ("1".equals(type)) {
			goodSql = goodSql + " and NEW_GOODS = 1";
		} else {
			goodSql = goodSql + " and REC_SALES = 1";
		}
		goodSql = goodSql + " order by UPDATE_TIME desc limit 5";

		List<GoodsBean> result = new ArrayList<>();
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsBean.class);
		query.setSQL(goodSql);
		result = dao.list();

		return result;
	}

	/**
	 * @Description:根据参数信息获取对应分类下的商品
	 * @date:2017/4/11 14:11
	 * @author:xudy
	 */
	@RequestMapping("getSortsById.do")
	@ResponseBody
	public List<GoodsBean> getSortsById(HttpServletRequest request, Service service) {
		// 获取request中的参数信息(?sortId=)
		Map<String, Object> params = WebUtils.getRequestData(request);
		Object sortId = params.get("sortId");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sortNo", sortId);
		map.put("onShelve", 0);

		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		// 爆款商品
		query.setEntityClass(GoodsBean.class);
		query.createSql(map);
		query.addOrderby("goodOrder");

		List<GoodsBean> result = dao.list();
		return result;
	}
}