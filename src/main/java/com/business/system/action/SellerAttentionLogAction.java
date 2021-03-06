package com.business.system.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.business.system.bean.SellerAttentionLogBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.rose.jdbc.PageBean;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.service.Service;
import net.sf.rose.web.utils.WebUtils;

/** 
 * @author fengjian E-mail: 9110530@qq.com 
 * @version 创建时间：2017年2月17日 下午3:58:56 
 * 类说明：商品管理
 */

@Controller
@RequestMapping("/seller/attention")
public class SellerAttentionLogAction {

	/**
	 * 商家关注记录信息列表
	 */
	@ResponseBody
	@RequestMapping("/list.do")
	public List<SellerAttentionLogBean> list(HttpServletRequest request, Service service) {
		PageBean page = WebUtils.getPageBean(request);
		Map<String, Object> map = WebUtils.getRequestData(request);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(SellerAttentionLogBean.class);
		query.createSql(map);
		query.addOrderby("createTime", "desc");
		query.setPage(page);
		return dao.list();
	}
	
	/**
	 * 获取商家关注记录信息
	 */
	@ResponseBody
	@RequestMapping("/load.do")
	public SellerAttentionLogBean load(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(SellerAttentionLogBean.class);
		query.createSql(id);
		return dao.load();
	}

	/**
	 * 保存商家关注记录信息
	 */
	@ResponseBody
	@RequestMapping("/save.do")
	public int save(Service service, SellerAttentionLogBean bean) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createSaveSql(bean);
		return dao.update();
	}

	/**
	 * 删除商家关注记录信息
	 */
	@ResponseBody
	@RequestMapping("/delete.do")
	public int delete(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createDeleteSql(SellerAttentionLogBean.class, id);
		return dao.update();
	}
}
