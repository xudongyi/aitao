package com.business.system.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import net.sf.rose.jdbc.PageBean;
import net.sf.rose.jdbc.bean.DicBean;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.service.Service;
import net.sf.rose.json.JsonTreeBean;
import net.sf.rose.util.StringUtil;
import net.sf.rose.web.utils.WebUtils;

/**
 * @author fengjian
 * @since 2014/03/06
 */
@Controller
@RequestMapping("system/dic")
public class DicAction {

	private static String ROOT_ID = "DIC000100010001";

	/**
	 * 分页
	 */
	@ResponseBody
	@RequestMapping("/page.do")
	public PageBean page(HttpServletRequest request, HttpServletResponse response, Service service) {
		PageBean page = WebUtils.getPageBean(request);
		Map<String, Object> map = WebUtils.getRequestData(request);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(DicBean.class);
		query.setPage(page);
		query.createSql(map);
		query.addOrderby("seqOrder");
		dao.list();
		return page;
	}

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list.do")
	public List<JsonTreeBean> list(Service service, String id) {
		List<JsonTreeBean> list = new ArrayList<JsonTreeBean>();
		// 如果没有指定父节点，那么查出根节点和第一层子节点
		if (id == null) {
			JsonTreeBean tree = new JsonTreeBean();
			tree.setId(ROOT_ID);
			tree.setText("数据字典");
			tree.setName("数据字典");
			DicBean menu = new DicBean();
			menu.setText("数据字典");
			menu.setDicID(ROOT_ID);
			tree.setObject(menu);
			list.add(tree);
			id = ROOT_ID;
		}
		
		// 查出所有下一层子节点
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(DicBean.class);
		query.createSql("parentID", id);
		query.addOrderby("seqOrder");
		List<DicBean> dics = dao.list();
		for (DicBean bean : dics) {
			JsonTreeBean parent = new JsonTreeBean();
			parent.setPid(bean.getParentID());
			parent.setId(bean.getDicID());
			parent.setText(bean.getText());
			parent.setName(bean.getText());
			parent.setObject(bean);
			list.add(parent);
		}
		return list;
	}

	/**
	 * 
	 */
	@ResponseBody
	@RequestMapping("/save.do")
	public int save(HttpServletRequest request, HttpServletResponse response, Service service, String json) {
		DicBean bean = StringUtil.parse(json, DicBean.class);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(DicBean.class);
		query.createSaveSql(bean);
		return dao.update();
	}

	/**
	 * 保存菜单顺序
	 */
	@ResponseBody
	@RequestMapping("/saveAll.do")
	public int saveAll(Service service, String json) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		JSONObject obj = JSON.parseObject(json);
		String parentID = obj.getString("id");
		JSONArray array = obj.getJSONArray("children");
		for (int i = 0; i < array.size(); i++) {
			DicBean m = array.getJSONObject(i).getObject("object", DicBean.class);
			m.setParentID(parentID);
			m.setSeqOrder(i);
			query.createUpdateSql(m);
			dao.update();
		}
		return 1;
	}

	/**
	 * 
	 */
	@ResponseBody
	@RequestMapping("/delete.do")
	public int delete(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createDeleteSql(DicBean.class, id);
		return dao.update();
	}
	
	@ResponseBody
	@RequestMapping("/consult.do")
	public List<?> consult(HttpServletRequest request, HttpServletResponse response, Service service,String sort) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(DicBean.class);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("sort", sort);
        map.put("status",1);
		query.createSql(map);
		List<?>list=dao.list();
		return list;
	}

}
