package com.business.system.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.business.system.bean.GoodsSortBean;
import com.business.system.bean.GoodsSortPropertyBean;
import com.business.system.service.GoodSortService;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.service.Service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 创建人: xudy
 * 创建日期: 2017/04/12 14:54
 * 类描述:全部分类的信息
 */
@Controller
@RequestMapping("allcategory")
public class MAllCategoryAction {
	
    /**
     * @Description:获取全部分类(一级分类),以及分类下面的全部品牌(5)
     * @date:2017/4/12 0012 14:56
     * @author:xudy
     */
    @RequestMapping("getAllCategory.do")
    @ResponseBody
    public List<Map<String,Object>> getAllCategory(Service service) {
    	//key:sorts(分类信息) brands(品牌信息)
        List<Map<String,Object>> result = new ArrayList<>();
        
    	GoodSortService ser = new GoodSortService();
    	// 查询所有父节点分类
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsSortBean.class);
		query.setSQL("select * from GOODS_SORT where ON_USE = 1 and (PARENT_NO is null or PARENT_NO = '') order by SORT_ORDER");
		List<GoodsSortBean> parentList = dao.list();
		
		for (GoodsSortBean bean : parentList) {
			List<GoodsSortBean> list = new ArrayList<GoodsSortBean>();
			StringBuilder sortNos = new StringBuilder();
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("list", list);
			map.put("string", sortNos);
			// 查询父节点及以下分类
			ser.getAllChildSort(map, bean, dao);
			
			Map<String,Object> resMap = new HashMap<String,Object>();
			
			 //分类下sortPropertyName为品牌的图片
            List<GoodsSortPropertyBean> propertyBeans = new ArrayList<>();
            if (sortNos.length() > 0) { 
            	StringBuilder sql = new StringBuilder();
            	sql.append("select * from GOODS_SORT_PROPERTY where SORT_PRO_NAME = '品牌' and SORT_NO in (");
            	for (int i=0; i< sortNos.toString().split(",").length; i++) {
            		sql.append("'").append(sortNos.toString().split(",")[i]).append("',");
                }
            	sql.deleteCharAt(sql.length()-1);
            	sql.append(") order by SORT_NO, SORT_ORDER limit 5");
            	query = dao.getQuerySQL();
        		query.setEntityClass(GoodsSortPropertyBean.class);
        		query.setSQL(sql.toString());
        		propertyBeans = dao.list();
            }
            resMap.put("sort",list);
            resMap.put("brands",propertyBeans);
            result.add(resMap);
		}
        return result;
    }
}