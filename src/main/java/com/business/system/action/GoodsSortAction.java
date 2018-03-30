package com.business.system.action;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.business.system.bean.GoodsSortBean;
import com.business.system.bean.GoodsSortPropertyBean;
import com.business.system.service.GoodSortService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.service.Service;
import net.sf.rose.util.StringUtil;
import net.sf.rose.web.utils.WebUtils;

/** 
 * @author fengjian E-mail: 9110530@qq.com 
 * @version 创建时间：2017年2月17日 下午3:58:56 
 * 类说明：商品分类管理
 */

@Controller
@RequestMapping("/goods/sort")
public class GoodsSortAction {

	/**
	 * 商品分类信息列表
	 */
	@ResponseBody
	@RequestMapping("/list.do")
	public List<GoodsSortBean> list(HttpServletRequest request, Service service) {
		Map<String, Object> map = WebUtils.getRequestData(request);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsSortBean.class);
		query.createSql(map);
		query.addOrderby("sortOrder");
		return dao.list();
	}
	
	/**
	 * 获取商品分类信息
	 */
	@ResponseBody
	@RequestMapping("/totalList.do")
	public List<GoodsSortBean> totalList(Service service) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsSortBean.class);
		query.createSql();
		query.addOrderby("sortOrder");
		return dao.list();
	}

	/**
	 * 获取商品分类信息
	 */
	@ResponseBody
	@RequestMapping("/load.do")
	public GoodsSortBean load(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsSortBean.class);
		query.createSql(id);
		return dao.load();
	}

	/**
	 * 保存商品分类信息
	 */
	@ResponseBody
	@RequestMapping("/save.do")
	public String save(Service service, String json, String propertyJson) {
		GoodsSortBean bean = StringUtil.parse(json, GoodsSortBean.class);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createSaveSql(bean,"onUse,showIndex");
		int num = dao.update();
		String res = String.valueOf(num);
		String str = res;
		
		// 保存分类属性
		if (num > 0) {
			// 商品分类
			String sortNo = bean.getSortNo();
			
			JSONArray  jsonArray = JSONArray.fromObject(propertyJson);
			if (jsonArray != null && jsonArray.size() > 0) {
				
				// 数据是否重复
				boolean same = false; 
				
				// 删除数据
				List<String> removeList = new ArrayList<String>();
				
				// 新增数据
				List<GoodsSortPropertyBean> saveList = new ArrayList<GoodsSortPropertyBean>();
				
				// sortPropertyName+sortPropertyValue 用于判断新增或修改的内容是否重复
				Map<String,String> keys = new HashMap<String,String>();
				
				// 删除数据
				Map<String,String> removeKsys = new HashMap<String,String>();
				for (int i = 0; i < jsonArray.size(); i++) {
					JSONObject obj = jsonArray.getJSONObject(i);
					String state = obj.getString("_state");
					String name = obj.getString("sortPropertyName");
					String value = obj.getString("sortPropertyValue");
					String key = name+value;
					// 删除
					if ("removed".equals(state)) {
						removeList.add(obj.getString("sortPropertyNo"));
						removeKsys.put(key, key);
					} else {
						if (keys.containsKey(key)) {
							res = name+"："+value;
							same = true;
							break;
						}
						keys.put(key, key);
						GoodsSortPropertyBean property = new GoodsSortPropertyBean();
						property.setSortPropertyName(name);
						property.setSortPropertyValue(value);
						property.setSortNo(sortNo);
						if (obj.containsKey("img") && !"".equals(obj.getString("img")) && !"null".equals(obj.getString("img"))) property.setImg(obj.getString("img"));
						if (obj.containsKey("sortOrder")) property.setSortOrder(obj.getInt("sortOrder"));
						if ("modified".equals(state)) {
							property.setSortPropertyNo(obj.getString("sortPropertyNo"));
							// 查询修改原数据
							query = dao.getQuerySQL();
							query.setEntityClass(GoodsSortPropertyBean.class);
							query.createSql(property.getSortPropertyNo());
							GoodsSortPropertyBean oldBean = dao.get();
							
							// 与修改的源数据相同，为不重复数据
							if (oldBean != null) {
								removeKsys.put(name+value, key);
							}
						}
						saveList.add(property);
					}
				}
				
				// 修改数据不重复，判断是否与数据库数据重复
				if (!same) {
					// 所有父节点List
					List<String> sortList = new ArrayList<String>();
					
					GoodSortService s = new GoodSortService();
					s.getAllParentSort(sortList, sortNo, dao); 
					// 查询所有父节点的分类属性
					if (sortList.size() > 0) {
						List<GoodsSortPropertyBean> list = s.getSortProperty(service, null, null, sortList, sortNo);
						
						if (list.size() > 0) {
							if (saveList.size() > 0) {
								for (GoodsSortPropertyBean pro : saveList) {
									String name = pro.getSortPropertyName();
									String value = pro.getSortPropertyValue();
									// 与删除数据相同，数据没有问题
									if (removeKsys.containsKey(name+value)) continue;

									// 查看是否重复
									for (GoodsSortPropertyBean proBean : list) {
										if (name.equals(proBean.getSortPropertyName()) &&
												value.equals(proBean.getSortPropertyValue())) {
											res = name+"："+value;
											same = true;
											break; // 数据重复
										}
									}
									if (same) break;
								}
							}
						}
					}
				}
				
				// 分类属性数据保存
				if (!same) {
					// 删除
					query = dao.getQuerySQL();
					if (removeList.size() > 0) {
						for (String id : removeList) {
							query.createDeleteSql(GoodsSortPropertyBean.class, id);
							dao.update();
						}
					}
					
					// 保存
					if (saveList.size() > 0) {
						for (GoodsSortPropertyBean sortPro : saveList) {
							query.createSaveSql(sortPro);
							dao.update();
						}
					}
				}
			}
		}
		
		try {
			str = URLEncoder.encode(URLEncoder.encode(res, "utf8"), "utf8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}

	/**
	 * 删除商品分类信息
	 */
	@ResponseBody
	@RequestMapping("/delete.do")
	public int delete(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createDeleteSql(GoodsSortBean.class, id);
		int res = dao.update();
		
		// 删除商品分类属性
		if (res > 0) {
			query.createDeleteSql(GoodsSortPropertyBean.class, "sortNo", id);
			dao.update();
		}
		
		return res;
	}
	
	
	/**
	 * 获取所有分类属性名
	 */
	@ResponseBody
	@RequestMapping("/propertyList.do")
	public List<GoodsSortPropertyBean> propertyList(Service service) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsSortPropertyBean.class);
		query.setSQL("select distinct(SORT_PRO_NAME) as sortPropertyName from GOODS_SORT_PROPERTY order by SORT_ORDER");
		return dao.list();
	}
	
	/**
	 * 获取所有分类属性列表
	 */
	@ResponseBody
	@RequestMapping("/propertyListAll.do")
	public List<GoodsSortPropertyBean> propertyListAll(HttpServletRequest request,Service service) {
		Map<String, Object> map = WebUtils.getRequestData(request);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsSortPropertyBean.class);
		query.createSql(map);
		query.addOrderby("sortNo");
		query.addOrderby("sortPropertyName");
		query.addOrderby("sortOrder");
		return dao.list();
	}
	
	/**
	 * 根据分类,分类属性名获取所有分类属性
	 */
	@ResponseBody
	@RequestMapping("/propertyListBySort.do")
	public List<GoodsSortPropertyBean> propertyListBySort(Service service, String sortNo, String sortPropertyName, String type) {
		BeanDAO dao = new BeanDAO(service);
		// 所有父节点List
		List<String> sortList = new ArrayList<String>();
		
		GoodSortService s = new GoodSortService();
		s.getAllParentSort(sortList, sortNo, dao);
		
		// 查询所有父节点的品牌分类属性
		List<GoodsSortPropertyBean> list = s.getSortProperty(service, sortPropertyName, type, sortList, sortNo);
		return list;
	}
	
	/**
	 * 分类属性保存
	 */
	@ResponseBody
	@RequestMapping("/propertySave.do")
	public int propertySave(Service service, GoodsSortPropertyBean bean) {
		BeanDAO dao = new BeanDAO(service);
		
		// 商品分类属性值是否为原数据的值
		boolean same = false;
		
		// 返回结果
		int res = 0;
		
		// 数据是修改
		if (bean.getSortPropertyNo() != null && !"".equals(bean.getSortPropertyNo())) {
			// 查询原数据
			BeanSQL query = dao.getQuerySQL();
			query.setEntityClass(GoodsSortPropertyBean.class);
			query.createSql(bean.getSortPropertyNo());
			GoodsSortPropertyBean oldBean = dao.get();
			
			// 修改后数据和原数据的分类属性值相同，数据不重复
			if (bean.getSortPropertyValue().equals(oldBean.getSortPropertyValue())) {
				same = true;
			}
		}
		
		if (!same) {
			// 商品分类
			String sortNo = bean.getSortNo();
			
			// 所有父节点List
			List<String> sortList = new ArrayList<String>();
			
			GoodSortService s = new GoodSortService();
			s.getAllParentSort(sortList, sortNo, dao);
			
			// 查询所有父节点的分类属性
			if (sortList.size() > 0) {
				
				List<GoodsSortPropertyBean> list = s.getSortProperty(service, null, null, sortList, sortNo);
				// 查看是否重复
				if (list.size() > 0) {
					for (GoodsSortPropertyBean proBean : list) {
						if (bean.getSortPropertyName().equals(proBean.getSortPropertyName()) &&
								bean.getSortPropertyValue().equals(proBean.getSortPropertyValue())) {
							res = -2; // 数据重复
						}
					}
				}
				
			}
		}

		if (res != -2) {
			// 查询是否存在
			BeanSQL query = dao.getQuerySQL();
			query.createSaveSql(bean);
			res =  dao.update();
		}
		
		return res;
	}
	
	
	
	/**
	 * 删除商品分类属性信息
	 */
	@ResponseBody
	@RequestMapping("/propertyDelete.do")
	public int propertyDelete(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createDeleteSql(GoodsSortPropertyBean.class, id);
		return dao.update();
	}
	
	/**
	 * 根据商品分类编号获取所有商品分类属性信息列表
	 */
	@ResponseBody
	@RequestMapping("/getPropertyList.do")
	public Map<String, List<GoodsSortPropertyBean>> getPropertyList(Service service, String id) {
		GoodSortService s = new GoodSortService();
		return s.getPropertyList(service, id);
	}
}
