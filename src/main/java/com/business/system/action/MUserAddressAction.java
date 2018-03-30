package com.business.system.action;

import java.util.Date;
import java.util.List;

import com.business.system.bean.ReceiveAddressBean;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.service.Service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 创建人: xudy
 * 创建日期: 2017/04/14 13:32
 * 类描述:收货地址
 */
@Controller
@RequestMapping("user/address")
public class MUserAddressAction {

    /**
     * @Description:用户收货地址
     * @author:zhangqiang
     */
    @ResponseBody
    @RequestMapping("listAddress.do")
    public List<ReceiveAddressBean> listAddress(Service service, String userid) {
        BeanDAO dao = new BeanDAO(service);
        BeanSQL query = dao.getQuerySQL();
        query.setEntityClass(ReceiveAddressBean.class);
        query.createSql("userID", userid);
        return dao.list();
    }

    /**
     * @Description:新增收货地址
     * @author:zhangqiang
     */
    @ResponseBody
    @RequestMapping("addAddress.do")
    public int addAddress(Service service, ReceiveAddressBean addressBean) {
        BeanDAO dao = new BeanDAO(service);
        BeanSQL query = dao.getQuerySQL();
        addressBean.setCreateTime(new Date());
        addressBean.setUpdateTime(new Date());
        query.createSaveSql(addressBean);
        return dao.update();
    }

    /**
     * @Description:编辑收货地址 设置为默认收货地址的操作, 暂时设置该用户的收获地址需要传排序号=0
     * addressBean 需要传id
     * @author:zhangqiang
     */
    @ResponseBody
    @RequestMapping("editAddress.do")
    public int editAddress(Service service, ReceiveAddressBean addressBean) {
    	// 设置所有用户的排序号加1
        BeanDAO dao = new BeanDAO(service);
        BeanSQL query = dao.getQuerySQL();
        query.setSQL("update RECEIVE_ADDRESS set ADDRESS_ORDER = ADDRESS_ORDER+1 where USER_ID = ?");
        query.addParameter(addressBean.getUserID());
        dao.update();
        
        addressBean.setUpdateTime(new Date());
        query.createSaveSql(addressBean,"order");
        return dao.update();
    }
    
    /**
     * @Description:删除地址
     * @param id 主键
     * @author:syf
     */
    @ResponseBody
    @RequestMapping("removeAddress.do")
    public int removeAddress(Service service, String id) {
    	BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createDeleteSql(ReceiveAddressBean.class, id);
        return dao.update();
    }
}