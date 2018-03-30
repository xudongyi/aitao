package com.business.system.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.business.system.bean.SellerBean;
import net.sf.rose.jdbc.PageBean;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.service.Service;
import net.sf.rose.web.utils.WebUtils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/** 
 * @author fengjian E-mail: 9110530@qq.com 
 * @version 创建时间：2017年2月17日 下午3:58:56 
 * 类说明：商家管理
 */

@Controller
@RequestMapping("/seller")
public class SellerAction {

	/**
	 * 商家信息列表
	 */
	@ResponseBody
	@RequestMapping("/list.do")
	public List<SellerBean> list(HttpServletRequest request, Service service) {
		PageBean page = WebUtils.getPageBean(request);
		Map<String, Object> map = WebUtils.getRequestData(request);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(SellerBean.class);
		query.createSql(map);
		query.setPage(page);
		return dao.list();
	}
	
	/**
	 * 商家信息列表(不分页)
	 */
	@ResponseBody
	@RequestMapping("/totalList.do")
	public List<SellerBean> totalList(HttpServletRequest request, Service service) {
		Map<String, Object> map = WebUtils.getRequestData(request);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(SellerBean.class);
		query.createSql(map);
		return dao.list();
	}

	/**
	 * 获取商家信息
	 */
	@ResponseBody
	@RequestMapping("/load.do")
	public SellerBean load(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(SellerBean.class);
		query.createSql(id);
		return dao.load();
	}

	/**
	 * 保存商家信息
	 */
	@ResponseBody
	@RequestMapping("/save.do")
	public int save(Service service, SellerBean bean) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createSaveSql(bean);
		return dao.update();
	}

	/**
	 * 删除商家信息
	 */
	@ResponseBody
	@RequestMapping("/delete.do")
	public int delete(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createDeleteSql(SellerBean.class, id);
		return dao.update();
	}
}
