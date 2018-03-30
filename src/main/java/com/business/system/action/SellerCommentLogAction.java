package com.business.system.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.business.system.bean.SellerCommentLogBean;
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
 * 类说明：商家评论记录管理
 */

@Controller
@RequestMapping("/seller/comment")
public class SellerCommentLogAction {

	/**
	 * 商家评论记录信息列表
	 */
	@ResponseBody
	@RequestMapping("/list.do")
	public List<SellerCommentLogBean> list(HttpServletRequest request, Service service) {
		PageBean page = WebUtils.getPageBean(request);
		Map<String, Object> map = WebUtils.getRequestData(request);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(SellerCommentLogBean.class);
		query.createSql(map);
		query.setPage(page);
		return dao.list();
	}

	/**
	 * 获商家评论记录信息
	 */
	@ResponseBody
	@RequestMapping("/load.do")
	public SellerCommentLogBean load(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(SellerCommentLogBean.class);
		query.createSql(id);
		return dao.load();
	}

	/**
	 * 保存商家评论记录信息
	 */
	@ResponseBody
	@RequestMapping("/save.do")
	public int save(Service service, SellerCommentLogBean bean) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createSaveSql(bean);
		return dao.update();
	}

	/**
	 * 删除商家评论记录信息
	 */
	@ResponseBody
	@RequestMapping("/delete.do")
	public int delete(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createDeleteSql(SellerCommentLogBean.class, id);
		return dao.update();
	}
}
