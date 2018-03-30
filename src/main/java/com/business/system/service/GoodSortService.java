package com.business.system.service;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.business.system.bean.GoodsSortBean;
import com.business.system.bean.GoodsSortPropertyBean;
import com.business.system.model.Cate_FaterBean;
import com.business.system.model.Cate_SonBean;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.service.Service;

/** 
 * @author fengjian E-mail: 9110530@qq.com 
 * @version 创建时间：2017年2月17日 下午3:58:56 
 * 类说明：用户管理
 */
@org.springframework.stereotype.Service
public class GoodSortService {

	/**
	 * 根据商品分类编号获取所有商品分类属性信息列表
	 */
	public Map<String, List<GoodsSortPropertyBean>> getPropertyList(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsSortPropertyBean.class);
		query.createSql("sortNo", id);
		List<GoodsSortPropertyBean> list = dao.list();
		Map<String, List<GoodsSortPropertyBean>> map = new LinkedHashMap<>();
		for (GoodsSortPropertyBean bean : list) {
			List<GoodsSortPropertyBean> l = map.get(bean.getSortPropertyName());
			if (l == null) {
				l = new ArrayList<>();
				map.put(bean.getSortPropertyName(), l);
			}
			l.add(bean);
		}
		return map;
	}
	
	/**
	 * 迭代获取sortNo的所有父分类名
	 */
	public void getAllParentSort(List<String> sortList, String sortNo, BeanDAO dao) {
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsSortBean.class);
		query.createSql(sortNo);
		GoodsSortBean sort = dao.get();
		if (sort != null) {
			sortList.add(sortNo);
			if (sort.getParentNO() != null && !"".equals(sort.getParentNO())) {
				getAllParentSort(sortList, sort.getParentNO(), dao);
			}
		}
	}
	
	/**
	 * 迭代获取sortNo的所有父分类
	 */
	public void getAllParentSortBean(List<GoodsSortBean> sortList, String sortNo, BeanDAO dao) {
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsSortBean.class);
		query.createSql(sortNo);
		GoodsSortBean sort = dao.get();
		if (sort != null) {
			sortList.add(sort);
			if (sort.getParentNO() != null && !"".equals(sort.getParentNO())) {
				getAllParentSortBean(sortList, sort.getParentNO(), dao);
			}
		}
	}
	
	/**
	 * 迭代获取所有子分类
	 */
	public Map<String,Object> getAllChildSort(Map<String,Object> map, GoodsSortBean parent, BeanDAO dao) {
		@SuppressWarnings("unchecked")
		List<GoodsSortBean> list = (List<GoodsSortBean>)map.get("list");
		StringBuilder str = (StringBuilder)map.get("string");
		if (parent != null) {
			list.add(parent);
			str.append(parent.getSortNo()+",");
			String sortNo = parent.getSortNo();
			BeanSQL query = dao.getQuerySQL();
			query.setEntityClass(GoodsSortBean.class);
			query.createSql("parentNO",sortNo);
			List<GoodsSortBean> sorts = dao.list();
			if (sorts.size() > 0) {
				for (GoodsSortBean sort : sorts) {
					getAllChildSort(map, sort, dao);
				}
			}
		}
		if (str.length() > 0) {
			str.deleteCharAt(str.length()-1);
		}
		return  map;
	}
	
	/**
	 * 查询所有父节点的品牌分类属性
	 */
	public List<GoodsSortPropertyBean> getSortProperty( Service service, String sortPropertyName, String type, List<String> sortList, String sortNo) {
		List<GoodsSortPropertyBean> list =  new ArrayList<GoodsSortPropertyBean>();
		if (sortList.size() > 0) {
			StringBuilder sql = new StringBuilder();
			if ("2".equals(type)) {
				sql.append("select SORT_PRO_VALUE,concat(SORT_PRO_NAME,':',SORT_PRO_VALUE) as SORT_PRO_NAME from GOODS_SORT_PROPERTY");
			} else {
				sql.append("select * from GOODS_SORT_PROPERTY");
			}
			sql.append(" where SORT_NO in (");
			for (String no : sortList) {
				sql.append("'").append(no).append("',");
			}
			sql.deleteCharAt(sql.length()-1);
			sql.append(")");
			if (sortPropertyName != null && !"".equals(sortPropertyName)) {
				// 2: 商品价值是属性（不包括品牌）
				if ("2".equals(type)) sql.append(" and SORT_PRO_NAME <> ?");
				else sql.append(" and SORT_PRO_NAME = ?");
				
			}
			BeanDAO dao = new BeanDAO(service);
			BeanSQL query = dao.getQuerySQL();
			query.setEntityClass(GoodsSortPropertyBean.class);
			query.setSQL(sql.toString());
			query.addOrderby("sortPropertyName");
			query.addOrderby("sortOrder");
			if (sortPropertyName != null && !"".equals(sortPropertyName)) {
				try {
					query.addParameter(URLDecoder.decode(URLDecoder.decode(sortPropertyName, "utf8"), "utf8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			list = dao.list();
		}
		return list;
	}

	/**
	 * 获取所有的商品分类
	 * @author zhangqiang
	 */
	public List<Cate_FaterBean> getAllCategory(BeanDAO dao) {
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsSortBean.class);
		query.createSql("parentNO","");
		List<GoodsSortBean> fatherList = dao.list();
		List<Cate_FaterBean> final_List = new ArrayList<>();
		for(GoodsSortBean bean :fatherList){
			Cate_FaterBean final_bean = new Cate_FaterBean();
			final_bean.setFatherBean(bean);

			//递归调用,获取子类
			List<Cate_SonBean> final_sonList = new ArrayList<>();
			List<GoodsSortBean> sec_fatherBeanList = getCategoryByParentId(dao,bean.getSortNo());
			for(GoodsSortBean sec_fatherBean:sec_fatherBeanList){
				Cate_SonBean final_secbean = new Cate_SonBean();
				final_secbean.setFatherBean(sec_fatherBean);
				final_secbean.setSon_list(getCategoryByParentId(dao,sec_fatherBean.getSortNo()));
				final_sonList.add(final_secbean);
			}

			//获取子集
			final_bean.setSon_list(final_sonList);
			//获取图片
			final_bean.setPic_list(getPicCategory(dao,bean.getSortNo()));
			final_List.add(final_bean);
		}
		return final_List;
	}



	/**
	 * 根据父类id查询下一级子类
	 * @param p_id
	 */
	public List<GoodsSortBean> getCategoryByParentId(BeanDAO dao, String p_id) {
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsSortBean.class);
		query.createSql("sortNo",p_id);
		List<GoodsSortBean> list = dao.list();
		return list;
	}

	/**
	 * 根据父类，获取所有有图片的子类，并排序
	 * @param dao
	 * @param p_id
	 * @return
	 */
	public List<GoodsSortPropertyBean> getPicCategory(BeanDAO dao, String p_id) {
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsSortPropertyBean.class);
		query.createSql("sortNo",p_id);
		List<GoodsSortPropertyBean> list = dao.list();

		List<GoodsSortPropertyBean> list2 = dao.list();
		GoodsSortPropertyBean bean  = new GoodsSortPropertyBean();
		bean.setImg("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492519137&di=8ba59df1d02aa81f19a651cb71c2cb0b&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01b2a856f1ef166ac7257d207d8a1a.jpg%40900w_1l_2o_100sh.jpg");
		list2.add(bean);
		bean  = new GoodsSortPropertyBean();
		bean.setImg("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492519137&di=8ba59df1d02aa81f19a651cb71c2cb0b&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01b2a856f1ef166ac7257d207d8a1a.jpg%40900w_1l_2o_100sh.jpg");
		list2.add(bean);
		bean  = new GoodsSortPropertyBean();
		bean.setImg("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492519137&di=8ba59df1d02aa81f19a651cb71c2cb0b&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01b2a856f1ef166ac7257d207d8a1a.jpg%40900w_1l_2o_100sh.jpg");
		list2.add(bean);
		return list2;
	}
}
