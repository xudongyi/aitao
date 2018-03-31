package com.business.system.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.business.system.bean.GoodsBean;
import com.business.system.bean.GoodsFileBean;
import com.business.system.bean.GoodsPriceBean;
import com.business.system.bean.GoodsSortPropertyBean;
import com.business.system.service.GoodSortService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.rose.initial.BootStart;
import net.sf.rose.jdbc.DBUtils;
import net.sf.rose.jdbc.PageBean;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.dao.MapDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.query.MapSQL;
import net.sf.rose.jdbc.service.Service;
import net.sf.rose.util.StringUtil;
import net.sf.rose.web.utils.WebUtils;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.business.system.service.GoodService;

/** 
 * @author fengjian E-mail: 9110530@qq.com 
 * @version 创建时间：2017年2月17日 下午3:58:56 
 * 类说明：商品管理
 */

@Controller
@RequestMapping("/goods")
public class GoodsAction {
	
	private static String OS = System.getProperty("os.name").toLowerCase();

	/**
	 * 商品信息列表1`
	 */
	@ResponseBody
	@RequestMapping("/list.do")
	public PageBean list(HttpServletRequest request, Service service) {
		PageBean page = WebUtils.getPageBean(request);
		Map<String, Object> map = WebUtils.getRequestData(request);
		if (map.get("goodsName") != null && !"".equals(map.get("goodsName").toString())) {
			map.put("goodsName_link", "like");
		}
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsBean.class);
		query.createSql(map);
		query.setPage(page);
		query.addOrderby("sellerNo");
		query.addOrderby("goodOrder");
        dao.list();
		return page;
	}
	
	/**
	 * 商品信息列表(不分页)
	 */
	@ResponseBody
	@RequestMapping("/totalList.do")
	public List<GoodsBean> totalList(HttpServletRequest request, Service service) {
		Map<String, Object> map = WebUtils.getRequestData(request);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsBean.class);
		query.createSql(map);
		return dao.list();
	}
	/**
	 * 商品信息列表(不分页)
	 */
	@ResponseBody
	@RequestMapping("/totalSortList.do")
	public List<Map<String, Object>> totalSortList(HttpServletRequest request, Service service) {
		Map<String, Object> map = WebUtils.getRequestData(request);
		StringBuilder sql = new StringBuilder();
		List<Object> params = new ArrayList<>();
		sql.append(" SELECT T1.*,T2.PARENT_NO FROM GOODS AS T1 LEFT JOIN SELLER_SORT AS T2 ON T1.SELLER_SORT_NO =T2.SORT_NO WHERE 1=1 ");
		if(map.containsKey("sellerNo")) {
			sql.append(" AND T1.SELLER_NO = ? ");
			params.add(map.get("sellerNo").toString());
		}
		if (map.containsKey("sellerSortNo_link") ){
			sql.append(" AND T1.SELLER_SORT_NO <> '' ");
		}
		MapDAO dao = new MapDAO(service);
		MapSQL query = dao.getQuerySQL();
		query.setSQL(sql.toString());
		query.setParameters(params);
		return dao.list();
	}

	/**
	 * 获取商品信息
	 */
	@ResponseBody
	@RequestMapping("/load.do")
	public GoodsBean load(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsBean.class);
		query.createSql(id);
		return dao.load();
	}

	/**
	 * 根据商品主健获取商品价格信息列表
	 */
	@ResponseBody
	@RequestMapping("/getPriceBeanList.do")
	public Map<String, Map<String, GoodsPriceBean>> getPriceBeanList(Service service, String id) {
		GoodService s = new GoodService();
		return s.getPriceBeanList(service, id);
	}

	/**
	 * 根据商品主健获取商品价格清单
	 */
	@ResponseBody
	@RequestMapping("/getPriceList.do")
	public Map<String, GoodsPriceBean> getPriceList(Service service, String id) {
		GoodService s = new GoodService();
		return s.getPriceList(service, id);
	}

	/**
	 * 根据商品主健获取商品价格清单
	 */
	@ResponseBody
	@RequestMapping("/getPriceBean.do")
	public GoodsPriceBean getPriceBean(Service service, String id, GoodsPriceBean bean) {
		GoodService s = new GoodService();
		return s.getPriceBean(service, bean);
	}

	/**
	 * @Description保存商品信息
	 * @param baseJson 商品基础信息json
	 * @param priceJson 商品价格列表json
	 * @author syf
	 * 
	 */
	@ResponseBody
	@RequestMapping("/saveAll.do")
	public String saveAll(HttpServletRequest request, Service service, String baseJson, String priceJson, 
			String deleteId, String deleteDetailId, String imgJson, String detailImgJson) {
		// 商品基础信息保存
		GoodsBean bean = StringUtil.parse(baseJson, GoodsBean.class);
		
		
		//获取客户端文件
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile client_file = multipartRequest.getFile("img1");//上传控件

		if(client_file.getOriginalFilename() != null && !"".equals(client_file.getOriginalFilename()) 
				&& bean.getImg1() != null && !"".equals(bean.getImg1())){
            String ctxPath = BootStart.getInstance().getWorkSpacePath();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
			String ymd = sdf.format(new Date());
			ctxPath += File.separator + ymd + File.separator;
			
			// 创建文件夹
			File file = new File(ctxPath);
			if (!file.exists()) {
				file.mkdirs();
			}
			String fileName = null;
			UUID uuid = null;
			fileName = client_file.getOriginalFilename();// 获取原文件名
			fileName = fileName.substring(fileName.lastIndexOf("."));
			// System.out.println("filename="+UUID.randomUUID()+"."+fileName);
			uuid = UUID.randomUUID();
			File uploadFile = new File(ctxPath + uuid + fileName);
			try {
				FileCopyUtils.copy(client_file.getBytes(), uploadFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
			bean.setImg1(ymd + "/" + uuid + fileName);
		} else {
			bean.setImg1(null);
		}
				
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createSaveSql(bean,"onShelve,fine,newGoods,hotSales,popularSales,recSales");
		int res = dao.update();
		
		// 获取分类属性
		List<String> sortList = new ArrayList<String>();
		GoodSortService s = new GoodSortService();
		s.getAllParentSort(sortList, bean.getSortNo(), dao);
		
		// 查询所有父节点的品牌分类属性
		List<GoodsSortPropertyBean> list = s.getSortProperty(service, "品牌", "2", sortList, bean.getSortNo());
		
		// 价格信息
		query = dao.getQuerySQL();
		JSONArray  jsonArray = JSONArray.fromObject(priceJson);
		if (jsonArray != null && jsonArray.size() > 0) {
			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject obj = jsonArray.getJSONObject(i);
				// 删除
				if ("removed".equals(obj.getString("_state"))) {
					// 获取主键
					query.createDeleteSql(GoodsPriceBean.class, obj.getString("goodsPriceNo"));
					dao.update();
				}
				// 新增或修改
				else {
					GoodsPriceBean price = new GoodsPriceBean();
					// 主键
					if (obj.containsKey("goodsPriceNo")) price.setGoodsPriceNo(obj.getString("goodsPriceNo"));
					
					// 商品主键
					price.setGoodsNo(bean.getGoodsNo());
					
					// 价格
					price.setPrice(obj.getInt("price"));
					
					// 销量
					if (obj.containsKey("salseCount")) price.setSalseCount(obj.getInt("salseCount"));
					else price.setSalseCount(0);
					
					// 库存
					if (obj.containsKey("totalCount")) price.setTotalCount(obj.getInt("totalCount"));
					else price.setTotalCount(0);
					
					// 排序
					if (obj.containsKey("sortOrder")) price.setSortOrder(obj.getInt("sortOrder"));
					else price.setSortOrder(0);
					
					// 属性一
					if (obj.containsKey("propertityValue1")) {
						String propertityValue1 = obj.getString("propertityValue1");
						if (!propertityValue1.equals("null")) {
							price.setPropertityValue1(propertityValue1);
							price.setPrppertityName1(getPrppertityName(list,propertityValue1).split(":")[0]);
						}
					}
					
					
					// 属性二
					if (obj.containsKey("propertityValue2")) {
						String propertityValue2 = obj.getString("propertityValue2");
						if (!propertityValue2.equals("null")) {
							price.setPropertityValue2(propertityValue2);
							price.setPrppertityName2(getPrppertityName(list,propertityValue2).split(":")[0]);
						}
					}
					
					// 属性三
					if (obj.containsKey("propertityValue3")) {
						String propertityValue3 = obj.getString("propertityValue3");
						if (!propertityValue3.equals("null")) {
							price.setPropertityValue3(propertityValue3);
							price.setPrppertityName3(getPrppertityName(list,propertityValue3).split(":")[0]);
						}
					}
					
					// 属性四
					if (obj.containsKey("propertityValue4")) {
						String propertityValue4 = obj.getString("propertityValue4");
						if (!propertityValue4.equals("null")) {
							price.setPropertityValue4(propertityValue4);
							price.setPrppertityName4(getPrppertityName(list,propertityValue4).split(":")[0]);
						}
					}
					
					query.createSaveSql(price);
					dao.update();
				}
				
			}
			
		}
		
		// 商品图片删除
		if (deleteId != null && !"".equals(deleteId)) {
			for (int i=0; i<deleteId.split(",").length; i++) {
				String id = deleteId.split(",")[i];
				if (id != null && !"".equals(id)) {
					query.createDeleteSql(GoodsFileBean.class, id);
					dao.update();
				}
			}
		}
		
		// 商品详细图片删除
		if (deleteDetailId != null && !"".equals(deleteDetailId)) {
			for (int i=0; i<deleteDetailId.split(",").length; i++) {
				String id = deleteDetailId.split(",")[i];
				if (id != null && !"".equals(id)) {
					query.createDeleteSql(GoodsFileBean.class, id);
					dao.update();
				}
			}
		}
		
		// 商品图片保存
		if (imgJson != null && !"".equals(imgJson)) {
			List<GoodsFileBean> fileList = StringUtil.parseList(imgJson, GoodsFileBean.class);
			for (GoodsFileBean file : fileList) {
				file.setGoodsNo(bean.getGoodsNo());
				query.createSaveSql(file);
				dao.update();
			}
		}
		
		// 商品详细图片保存
		if (detailImgJson != null && !"".equals(detailImgJson)) {
			List<GoodsFileBean> fileList = StringUtil.parseList(detailImgJson, GoodsFileBean.class);
			for (GoodsFileBean file : fileList) {
				file.setGoodsNo(bean.getGoodsNo());
				query.createSaveSql(file);
				dao.update();
			}
		}
		
		return String.valueOf(res);
	}
	
	/**
	 * 保存商品相关所有信息
	 */
	@ResponseBody
	@RequestMapping("/save.do")
	public int save(Service service, GoodsBean bean) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createSaveSql(bean,"onShelve,fine,newGoods,hotSales,popularSales,recSales");
		return dao.update();
	}

	/**
	 * 删除商品信息
	 */
	@ResponseBody
	@RequestMapping("/deleteAll.do")
	public int deleteAll(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createDeleteSql(GoodsBean.class, id);
		int res = dao.update();
		
		if (res > 0) {
			// 删除商品价格信息
			query.createDeleteSql(GoodsPriceBean.class, "goodsNo", id);
			dao.update();
			// 删除商品图片信息
			query.createDeleteSql(GoodsFileBean.class, "goodsNo", id);
			dao.update();
		}
		return res;
	}
	
	/**
	 * 根据属性值，查找属性名
	 */
	public String getPrppertityName(List<GoodsSortPropertyBean> list, String prppertityValue) {
		String prppertityName = "";
		for (GoodsSortPropertyBean bean : list) {
			if (prppertityValue.equals(bean.getSortPropertyValue())) {
				prppertityName = bean.getSortPropertyName();
				break;
			}
		}
		return prppertityName;
	}
}
