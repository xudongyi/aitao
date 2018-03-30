package com.business.system.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.business.system.bean.UserBean;
import com.business.system.service.UserService;
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
 * 类说明：用户管理
 */

@Controller
@RequestMapping("/user")
public class UserAction {

	/**
	 * 用户登录
	 */
	@ResponseBody
	@RequestMapping("/login.do")
	public int login(Service service, UserBean bean) {
		BeanDAO dao = new BeanDAO(service);
		UserService s = new UserService();
		return s.login(dao, bean);
	}

	/**
	 * 获取用户信息列表
	 */
	@ResponseBody
	@RequestMapping("/list.do")
	public List<UserBean> list(HttpServletRequest request, Service service) {
		BeanDAO dao = new BeanDAO(service);
		UserService s = new UserService();
		return s.list(request, dao);
	}
	
	/**
	 * 获取用户信息列表(不分页)
	 */
	@ResponseBody
	@RequestMapping("/totalList.do")
	public List<UserBean> totalList(HttpServletRequest request, Service service) {
		Map<String, Object> map = WebUtils.getRequestData(request);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(UserBean.class);
		query.createSql(map);
		return dao.list();
	}

	/**
	 * 获取用户信息
	 */
	@ResponseBody
	@RequestMapping("/load.do")
	public UserBean load(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		UserService s = new UserService();
		return s.load(dao, id);
	}

	/**
	 * 保存用户信息
	 */
	@ResponseBody
	@RequestMapping("/save.do")
	public int save(Service service, UserBean bean) {
		BeanDAO dao = new BeanDAO(service);
		UserService s = new UserService();
		return s.save(dao, bean);
	}

	/**
	 * 保存用户密码
	 */
	@ResponseBody
	@RequestMapping("/savePassword.do")
	public int savePassword(Service service, UserBean bean) {
		BeanDAO dao = new BeanDAO(service);
		UserService s = new UserService();
		return s.savePassword(dao, bean);
	}

	/**
	 * 删除用户信息
	 */
	@ResponseBody
	@RequestMapping("/delete.do")
	public int delete(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		UserService s = new UserService();
		return s.delete(dao, id);
	}
}
