package com.business.system.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.business.system.bean.GoodsFileBean;
import com.business.system.bean.SellerFileBean;

import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.service.Service;
import net.sf.rose.web.utils.WebUtils;

/** 
* @Description:商家首页文件管理类
* @author  zpc 
* @date 创建时间：2018年3月31日 上午11:51:33 
* @version 1.0 
*/
@Controller
@RequestMapping("/seller/file")
public class SellerFileAction {

	/**
	 * 商品图片列表
	 */
	@ResponseBody
	@RequestMapping("/list.do")
	public List<Object> list(HttpServletRequest request, Service service, String sellerNo) {
		Map<String, Object> map = WebUtils.getRequestData(request);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(SellerFileBean.class);
		query.createSql(map);
		query.addOrderby("sellerNo");
		query.addOrderby("fileOrder");
		List<Object> list = dao.list();
		return list;
	}
}
