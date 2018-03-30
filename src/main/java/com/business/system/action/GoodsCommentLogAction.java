package com.business.system.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.business.system.bean.GoodsBean;
import com.business.system.bean.GoodsCommentLogBean;
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
 * 类说明：商品评论记录管理
 */

@Controller
@RequestMapping("/goods/comment")
public class GoodsCommentLogAction {

	/**
	 * 商品评论记录信息列表
	 */
	@ResponseBody
	@RequestMapping("/list.do")
	public List<GoodsCommentLogBean> list(HttpServletRequest request, Service service) {
		PageBean page = WebUtils.getPageBean(request);
		Map<String, Object> map = WebUtils.getRequestData(request);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsCommentLogBean.class);
		query.createSql(map);
		query.setPage(page);
		return dao.list();
	}
	
	/**
	 * 商家商品评论记录信息列表
	 */
	@ResponseBody
	@RequestMapping("/sellerList.do")
	public List<GoodsCommentLogBean> sellerList(HttpServletRequest request, Service service) {
		PageBean page = WebUtils.getPageBean(request);
		Map<String, Object> map = WebUtils.getRequestData(request);
		
		List<Object> params = new ArrayList<Object>();
		
		// 商家NO
		String sellerNo = map.get("sellerNo").toString();
		
		params.add(sellerNo);
		
		StringBuilder sql = new StringBuilder();
		sql.append("select t1.* from GOODS_COMMENT_LOG t1 left join GOODS t2 on t1.GOODS_NO = t2.GOODS_NO")
		.append(" left join SELLER t3 on t2.SELLER_NO = t3.SELLER_NO where t3.SELLER_NO = ?");
		
		if ( map.get("goodsNo") != null && !"".equals(map.get("goodsNo").toString())) {
			sql.append(" and t1.GOODS_NO = ?");
			params.add(map.get("goodsNo").toString());
		}
		
		if ( map.get("userID") != null && !"".equals(map.get("userID").toString())) {
			sql.append(" and t1.USER_ID = ?");
			params.add(map.get("userID").toString());
		}
		
		if ( map.get("grade") != null && !"".equals(map.get("grade").toString())) {
			sql.append(" and t1.COMMENT_GRADE = ?");
			params.add(map.get("grade").toString());
		}
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsCommentLogBean.class);
		query.setSQL(sql.toString());
		query.setParameters(params);
		query.setPage(page);
		return dao.list();
	}

	/**
	 * 获取商品评论记录信息
	 */
	@ResponseBody
	@RequestMapping("/load.do")
	public GoodsBean load(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsCommentLogBean.class);
		query.createSql(id);
		return dao.load();
	}

	/**
	 * 保存商品评论记录信息
	 */
	@ResponseBody
	@RequestMapping("/save.do")
	public int save(Service service, GoodsCommentLogBean bean) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createSaveSql(bean);
		return dao.update();
	}

	/**
	 * 删除商品评论记录信息
	 */
	@ResponseBody
	@RequestMapping("/delete.do")
	public int delete(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createDeleteSql(GoodsCommentLogBean.class, id);;
		return dao.update();
	}
}
