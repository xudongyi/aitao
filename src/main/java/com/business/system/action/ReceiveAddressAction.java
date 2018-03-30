package com.business.system.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.business.system.bean.ReceiveAddressBean;
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
 * 类说明：收货地址管理
 */

@Controller
@RequestMapping("/receiver/address")
public class ReceiveAddressAction {

	/**
	 * 收货地址信息列表
	 */
	@ResponseBody
	@RequestMapping("/list.do")
	public List<ReceiveAddressBean> list(HttpServletRequest request, Service service) {
		PageBean page = WebUtils.getPageBean(request);
		Map<String, Object> map = WebUtils.getRequestData(request);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(ReceiveAddressBean.class);
		query.createSql(map);
		query.setPage(page);
		return dao.list();
	}

	/**
	 * 获取收货地址信息
	 */
	@ResponseBody
	@RequestMapping("/load.do")
	public ReceiveAddressBean load(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(ReceiveAddressBean.class);
		query.createSql(id);
		return dao.load();
	}

	/**
	 * 保存收货地址信息
	 */
	@ResponseBody
	@RequestMapping("/save.do")
	public int save(Service service, ReceiveAddressBean bean) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createSaveSql(bean);
		return dao.update();
	}

	/**
	 * 删除收货地址信息
	 */
	@ResponseBody
	@RequestMapping("/delete.do")
	public int delete(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createDeleteSql(ReceiveAddressBean.class, id);
		return dao.update();
	}
}
