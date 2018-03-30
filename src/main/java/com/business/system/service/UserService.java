package com.business.system.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.business.system.bean.SellerBean;
import com.business.system.bean.UserBean;
import net.sf.rose.jdbc.KeyGenerator;
import net.sf.rose.jdbc.PageBean;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.util.DateFormat;
import net.sf.rose.web.utils.WebUtils;
import org.springframework.stereotype.Service;

/**
 * @author fengjian E-mail: 9110530@qq.com
 * @version 创建时间：2017年2月17日 下午3:58:56
 *          类说明：用户管理
 */
@Service
public class UserService {

    /**
     * 用户登录
     *
     * @author zhangqiang
     */
    public Object login(HttpServletRequest request, BeanDAO dao, UserBean bean) {
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
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("loginName", bean.getLoginName());
        map.put("password", bean.getPassword());
        map.put("roler", bean.getRoler());
        query.createSql(map);
        UserBean user = dao.get();
        if (user == null) {
            //用户名或密码错误，找不到
            return -3;
        } else if (user.getStatus() != 1) {
            // 用户是非有效用户
            return -4;
        }
        // 登录成功，添加该用户到session
        HttpSession session = request.getSession();
        session.setAttribute("user", bean);
        System.out.println("session创建成功！");
        // 增加登录次数，记录最新登录时间
        UserBean u = new UserBean();
        u.setUserID(user.getUserID());
        u.setLoginCount(user.getLoginCount() + 1);
        u.setLastLoginTime(DateFormat.getTimestamp());
        query.createUpdateSql(u);
        dao.update();
        return user;
    }

    /**
     * 保存用户信息
     *
     * @author zhangqiang
     */
    public int save(BeanDAO dao, UserBean bean) {
        BeanSQL query = dao.getQuerySQL();
        query.setEntityClass(UserBean.class);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("loginName", bean.getLoginName());
        map.put("roler", bean.getRoler());
        query.createSql(map);
        UserBean user = dao.get();
        if (user != null) {
            //用户名已存在
            return -1;
        } else {
            //普通用户
            if (bean.getRoler() == 0) {
                bean.setStatus(1);
                query.createSaveSql(bean);
                return dao.update();
            }
            //商家
            else {
                //保存商家
                query.setEntityClass(SellerBean.class);
                SellerBean sb = new SellerBean();
                sb.setStatus(1);
                sb.setArea(bean.getArea());
                sb.setTel(bean.getTel());
                sb.setEmail(bean.getEmail());
                query.createSaveSql(sb);
                dao.update();

                //再保存用户
                query.setEntityClass(UserBean.class);
                bean.setStatus(1);
                bean.setSellerNo(sb.getSellerNo());
                query.createSaveSql(bean);
                return dao.update();

            }

        }

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
     *
     * @author zhangqiang
     */
    public UserBean load(BeanDAO dao, String id) {
        BeanSQL query = dao.getQuerySQL();
        query.setEntityClass(UserBean.class);
        query.createSql(id);
        return dao.load();
    }

    /**
     * 保存用户密码
     */
    public int savePassword(BeanDAO dao, UserBean bean) {
        BeanSQL query = dao.getQuerySQL();
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
