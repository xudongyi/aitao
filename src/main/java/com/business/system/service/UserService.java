package com.business.system.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.business.system.bean.UserBean;
import net.sf.rose.jdbc.PageBean;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.util.DateFormat;
import net.sf.rose.web.utils.WebUtils;

/** 
 * @author fengjian E-mail: 9110530@qq.com 
 * @version 创建时间：2017年2月17日 下午3:58:56 
 * 类说明：用户管理
 */
public class UserService {

	/**
	 * 用户登录
	 */
	public int login(BeanDAO dao, UserBean bean) {
		if (bean.getLoginName() == null) {
			// 用户登录名不能为空
			return -1;
		}
		if (bean.getPassword() == null) {
			// 用户密码不能为空
			return -2;
		}
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(UserBean.class);
		query.createSql("loginName", bean.getLoginName());
		UserBean user = dao.get();
		if (user.getStatus() != 1) {
			// 用户是非有效用户
			return -3;
		}
		// TODO 检查密码是否一致
		// 登录成功
		// 增加登录次数，记录最新登录时间 
		UserBean u = new UserBean();
		u.setUserID(user.getUserID());
		u.setLoginCount(user.getLoginCount()+1);
		u.setLastLoginTime(DateFormat.getTimestamp());
		query.createUpdateSql(u);
		dao.update();
		return 1;
	}

	/**
	 * 获取用户信息列表
	 */
	public List<UserBean> list(HttpServletRequest request, BeanDAO dao) {
		PageBean page = WebUtils.getPageBean(request);
		Map<String, Object> map = WebUtils.getRequestData(request);
		if (map.get("userName") != null && !"".equals(map.get("userName").toString())) {
			map.put("userName_link", "like");
		}
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(UserBean.class);
		query.createSql(map);
		query.setPage(page);
		return dao.list();
	}

	/**
	 * 获取用户信息
	 */
	public UserBean load(BeanDAO dao, String id) {
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(UserBean.class);
		query.createSql(id);
		return dao.load();
	}
	
	/**
	 * 保存用户信息
	 */
	public int save(BeanDAO dao, UserBean bean) {
		BeanSQL query = dao.getQuerySQL();
		// query.setEntityClass(UserBean.class);
		query.createSaveSql(bean);
		return dao.update();
	}

	/**
	 * 保存用户密码
	 */
	public int savePassword(BeanDAO dao, UserBean bean) {
		BeanSQL query = dao.getQuerySQL();
		// query.setEntityClass(UserBean.class);
		query.createSaveSql(bean);
		return dao.update();
	}

	/**
	 * 删除用户信息
	 */
	public int delete(BeanDAO dao, String id) {
		BeanSQL query = dao.getQuerySQL();
		query.createDeleteSql(UserBean.class, id);
		return dao.update();
	}
}
