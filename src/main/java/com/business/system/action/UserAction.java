package com.business.system.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.business.system.bean.UserBean;
import com.business.system.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.service.Service;
import net.sf.rose.util.ConstantCode;
import net.sf.rose.web.utils.WebUtils;

/** 
 * @author fengjian E-mail: 9110530@qq.com 
 * @version 创建时间：2017年2月17日 下午3:58:56 
 * 类说明：用户管理
 */

@Controller
@RequestMapping("/user")
public class UserAction {
	
	/**
     * 验证用户名和密码的有效性
     * @param loginName登录用户名
     * @param password密码
     */
	@ResponseBody
    @RequestMapping("/webLogin.do")
    public int webLogin(HttpServletRequest request,Service service, UserBean
     bean) {
		BeanDAO dao = new BeanDAO(service); 
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(UserBean.class);
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("loginName", bean.getLoginName());
	    map.put("password", bean.getPassword());
        query.createSql(map);
        UserBean user = dao.get();
        if (user == null) {
        	// 用户名或密码错误
        	return -1;
        } else if (user.getRoler() != 1 && user.getRoler() != 2) {
        	// 用户权限不足
        	return -2;
        }

        // 登录成功，添加该用户到session
        HttpSession session = request.getSession();
        session.setAttribute("webuser", user);
        net.sf.rose.jdbc.UserBean userBean = new net.sf.rose.jdbc.UserBean();
        userBean.setUserName(user.getLoginName());
        userBean.setUserID(user.getUserID());
        session.setAttribute(ConstantCode.USER_BEAN_NAME, userBean);
        return 1;
    }

    /**
     * 注销登录
     */
    @RequestMapping("/webLogout.do")
    public String webLogout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("webuser");
        return "redirect:/page/backold/login.jsp";
    }
    

	/**
	 * 用户登录
	 * @author zhangqiang
	 */
	@ResponseBody
	@RequestMapping("/login.do")
	public Object login(Service service, UserBean bean,HttpServletRequest request) {
		BeanDAO dao = new BeanDAO(service);
		UserService s = new UserService();
		return s.login(request,dao, bean);
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
	 * @author zhangqiang
	 */
	@Transactional
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
