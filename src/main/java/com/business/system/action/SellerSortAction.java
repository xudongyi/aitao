package com.business.system.action;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.business.system.bean.SellerSortBean;

import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.service.Service;
import net.sf.rose.util.StringUtil;
import net.sf.rose.web.utils.WebUtils;

/** 
* @Description:商户分类查询
* @author  zpc 
* @date 创建时间：2018年3月31日 下午2:04:16 
* @version 1.0 
*/
@Controller
@RequestMapping("/seller/sort")
public class SellerSortAction {
	/**
	 * 商户分类信息列表
	 */
	@ResponseBody
	@RequestMapping("/list.do")
	public List<SellerSortBean> list(HttpServletRequest request, Service service) {
		Map<String, Object> map = WebUtils.getRequestData(request);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(SellerSortBean.class);
		query.createSql(map);
		query.addOrderby("sortOrder");
		return dao.list();
	}
	
	/**
	 * 获取商户分类信息
	 */
	@ResponseBody
	@RequestMapping("/totalList.do")
	public List<SellerSortBean> totalList(Service service) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(SellerSortBean.class);
		query.createSql();
		query.addOrderby("sortOrder");
		return dao.list();
	}
	
	/**
	 * 获取商户分类信息
	 */
	@ResponseBody
	@RequestMapping("/treeTotalList.do")
	public List<Map<String, Object>>  treeTotalList(Service service) {
		List<Map<String, Object>> data = new ArrayList<>();
		List<SellerSortBean> SellerSortBeans = totalList(service);
		for (SellerSortBean sellerSortBean : SellerSortBeans) {
			String parentNo = sellerSortBean.getParentNO();
			if(parentNo==null||("".equals(parentNo.trim()))) {
				Map<String, Object> map = new HashMap<>();
				map.put("id", sellerSortBean.getSortNo());
				map.put("name", sellerSortBean.getSortName());
				map.put("childs", new ArrayList<>());
				data.add(map);
			}
		}
		for (SellerSortBean sellerSortBean : SellerSortBeans) {
			String parentNo = sellerSortBean.getParentNO();
			if(parentNo!=null&&(!"".equals(parentNo.trim()))) {
				for (Map<String, Object> map : data) {
					String pId = map.get("id").toString();
					if(parentNo.equals(pId)) {
						Map<String, Object> map2= new HashMap<>();
						map2.put("id", sellerSortBean.getSortNo());
						map2.put("name", sellerSortBean.getSortName());
						List<Map<String, Object>> cList = (ArrayList<Map<String, Object>>)map.get("childs");
						cList.add(map2);
						break;
					}
				}
				
				
			}
		}
		
		return data;
	}

	/**
	 * 获取商户分类信息
	 */
	@ResponseBody
	@RequestMapping("/load.do")
	public SellerSortBean load(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(SellerSortBean.class);
		query.createSql(id);
		return dao.load();
	}

	/**
	 * 保存商户分类信息
	 */
	@ResponseBody
	@RequestMapping("/save.do")
	public String save(Service service, String json, String propertyJson) {
		SellerSortBean bean = StringUtil.parse(json, SellerSortBean.class);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createSaveSql(bean,"onUse,showIndex");
		int num = dao.update();
		String res = String.valueOf(num);
		String str = res;
		
		
		try {
			str = URLEncoder.encode(URLEncoder.encode(res, "utf8"), "utf8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}

	/**
	 * 删除商户分类信息
	 */
	@ResponseBody
	@RequestMapping("/delete.do")
	public int delete(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createDeleteSql(SellerSortBean.class, id);
		int res = dao.update();
		
		return res;
	}
	
}
