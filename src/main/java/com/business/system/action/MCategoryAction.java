package com.business.system.action;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.business.system.bean.GoodsBean;
import com.business.system.bean.GoodsSortBean;
import com.business.system.bean.GoodsSortPropertyBean;
import com.business.system.service.GoodSortService;
import net.sf.rose.jdbc.PageBean;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.service.Service;
import net.sf.rose.web.utils.WebUtils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 创建人: xudy
 * 创建日期: 2017/04/11 16:08
 * 类描述:
 */
@Controller
@RequestMapping("category")
public class MCategoryAction {

	/**
	 * @Description:根据sortId获取对应的分类以及上级分类
	 * @date:2017/4/12 14:14
     * @param sortNo
	 * @author:xudy
	 */
	@RequestMapping("getCategoryName.do")
    @ResponseBody
	public List<GoodsSortBean> getCategoryName(HttpServletRequest request, Service service) {
        Map<String,Object> params = WebUtils.getRequestData(request);
        // 分类No
        String sortNo = params.get("sortNo").toString();
        // 查询所有父级分类
		List<GoodsSortBean> list = new ArrayList<>();
		GoodSortService s = new GoodSortService();
		BeanDAO dao = new BeanDAO(service);
		s.getAllParentSortBean(list, sortNo, dao);
		return list;
	}

	/**
	 * @Description:获取分类属性
	 * @date:2017/4/11 16:31
	 * @author:xudy
	 */
	@RequestMapping("getCategoryProperty.do")
	@ResponseBody
	public Map<String, List<GoodsSortPropertyBean>> getCategoryProperty(HttpServletRequest request, Service service) {
		Map<String, List<GoodsSortPropertyBean>> result = new HashMap<>();
		Map<String,Object> params = WebUtils.getRequestData(request);
        // 分类No
        String sortNo = params.get("sortNo").toString();
        
        BeanDAO dao = new BeanDAO(service);
        GoodSortService s = new GoodSortService();
		
        // 查询所有父分类
        List<String> sortList = new ArrayList<>();
        s.getAllParentSort(sortList, sortNo, dao);
        
        // 获取所有分类属性
        BeanSQL query = dao.getQuerySQL();
        query.setEntityClass(GoodsSortPropertyBean.class);
        StringBuilder sql = new StringBuilder();
        sql.append("select * from GOODS_SORT_PROPERTY where SORT_NO in ( ");
        for (String str : sortList) {
        	sql.append("'").append(str).append("',");
        }
        sql.deleteCharAt(sql.length()-1);
        sql.append(") order by SORT_PRO_NAME,SORT_ORDER");
        query.setSQL(sql.toString());
        List<GoodsSortPropertyBean> allList = dao.list();
        if (allList.size() > 0) {
        	String key = null;
        	List<GoodsSortPropertyBean> list = new ArrayList<>();
        	for (GoodsSortPropertyBean bean : allList) {
        		
        		// 分类属性名
        		String name = bean.getSortPropertyName();
        		
        		// 首次循环
        		if (key == null) key = name;
        		
        		if (key.equals(name)) {
        			list.add(bean);
        		} else {
        			result.put(key, list);
        			key = name;
        			list = new ArrayList<>();
        			list.add(bean);
        		}
        	}
        	
        	// 最后一次循环的值
        	result.put(key, list);
        }
        return result;
	}

	/**
	 * @Description:根据sortNo获取对应分类的商品信息(分页)
	 * @date:2017/4/12 14:20
	 * @author:xudy
	 */
	@RequestMapping("getCategoryGoods.do")
	@ResponseBody
	public PageBean getCategoryGoods(HttpServletRequest request, Service service) {
        PageBean page = WebUtils.getPageBean(request);
        Map<String, Object> map = WebUtils.getRequestData(request);
        map.put("onShelve", 0);
        BeanDAO dao = new BeanDAO(service);
        BeanSQL query = dao.getQuerySQL();
        query.setEntityClass(GoodsBean.class);
        query.createSql(map);
        query.setPage(page);
        dao.list();
		return page;
	}

    /**
     * @Description:掌柜热卖(5:分页)
     * @date:2017/4/12 14:20
     * @author:xudy
     */
    @RequestMapping("getZGRM.do")
    @ResponseBody
    public List<GoodsBean> getZGRM(HttpServletRequest request, Service service) {
    	// sortNo 
        Map<String, Object> map = WebUtils.getRequestData(request);
        String sortNo = map.get("sortNo").toString();
        BeanDAO dao = new BeanDAO(service);
        BeanSQL query = dao.getQuerySQL();
        query.setEntityClass(GoodsBean.class);
        query.setSQL("select * from GOODS where SORT_NO = ? and ON_SHELVE = 0 and HOT_SALES = 1 order by UPDATE_TIME desc limit 5");
        query.addParameter(sortNo);
        List<GoodsBean> result = dao.list();
        return result;
    }
	
	/**
	 * @Description:卖家精选(6:分页)
	 * @date:2017/4/12 14:20
	 * @author:xudy
	 */
	@RequestMapping("getMJJX.do")
	@ResponseBody
	public List<GoodsBean> getMJJX(HttpServletRequest request, Service service) {
		Map<String, Object> map = WebUtils.getRequestData(request);
        String sortNo = map.get("sortNo").toString();
        BeanDAO dao = new BeanDAO(service);
        BeanSQL query = dao.getQuerySQL();
        query.setEntityClass(GoodsBean.class);
        query.setSQL("select * from GOODS where SORT_NO = ? and ON_SHELVE = 0 and FINE = 1 order by UPDATE_TIME desc limit 6");
        query.addParameter(sortNo);
        List<GoodsBean> result = dao.list();
        return result;
	}
}