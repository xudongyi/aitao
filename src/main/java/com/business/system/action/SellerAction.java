package com.business.system.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.business.system.bean.*;
import com.business.system.util.DBTools;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.sf.rose.initial.BootStart;
import net.sf.rose.jdbc.PageBean;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.service.Service;
import net.sf.rose.util.StringUtil;
import net.sf.rose.web.utils.WebUtils;

/** 
 * @author fengjian E-mail: 9110530@qq.com 
 * @version 创建时间：2017年2月17日 下午3:58:56 
 * 类说明：商家管理
 */

@Controller
@RequestMapping("/seller")
public class SellerAction {
	private static String OS = System.getProperty("os.name").toLowerCase();

	/**
	 * 商家信息列表
	 */
	@ResponseBody
	@RequestMapping("/list.do")
	public List<SellerBean> list(HttpServletRequest request, Service service) {
		PageBean page = WebUtils.getPageBean(request);
		Map<String, Object> map = WebUtils.getRequestData(request);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(SellerBean.class);
		query.createSql(map);
		query.setPage(page);
		return dao.list();
	}
	
	/**
	 * 商家信息列表(不分页)
	 */
	@ResponseBody
	@RequestMapping("/totalList.do")
	public List<SellerBean> totalList(HttpServletRequest request, Service service) {
		Map<String, Object> map = WebUtils.getRequestData(request);
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(SellerBean.class);
		query.createSql(map);
		return dao.list();
	}

	/**
	 * 获取商家信息
	 */
	@ResponseBody
	@RequestMapping("/load.do")
	public SellerBean load(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(SellerBean.class);
		query.createSql(id);
		return dao.load();
	}

	/**
	 * 保存商家信息
	 */
	@ResponseBody
	@RequestMapping("/save.do")
	public String save(HttpServletRequest request, Service service, String data,String deleteId,String imgJson) {
		SellerBean bean = StringUtil.parse(data, SellerBean.class);
		//获取客户端文件
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile client_file = multipartRequest.getFile("sellerImg");//上传控件
		MultipartFile qrfile = multipartRequest.getFile("qrImg");//二维码
		MultipartFile topfile = multipartRequest.getFile("topImg");//顶部图片
		if(client_file.getOriginalFilename() != null && !"".equals(client_file.getOriginalFilename()) 
				&& bean.getSellerImg() != null && !"".equals(bean.getSellerImg())){
			bean.setSellerImg(uploadImg(client_file));
		}
		if(qrfile.getOriginalFilename() != null && !"".equals(qrfile.getOriginalFilename()) 
				&& bean.getQrImg() != null && !"".equals(bean.getQrImg())){
			bean.setQrImg(uploadImg(qrfile));
		}
		if(topfile.getOriginalFilename() != null && !"".equals(topfile.getOriginalFilename()) 
				&& bean.getTopImg() != null && !"".equals(bean.getTopImg())){
			bean.setTopImg(uploadImg(topfile));
		}
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createSaveSql(bean,"status,strSeller");
		int res = dao.update();
		// 商品图片删除
		if (deleteId != null && !"".equals(deleteId)) {
			for (int i=0; i<deleteId.split(",").length; i++) {
				String id = deleteId.split(",")[i];
				if (id != null && !"".equals(id)) {
					query.createDeleteSql(SellerFileBean.class, id);
					dao.update();
				}
			}
		}
		
		// 商品图片保存
		if (imgJson != null && !"".equals(imgJson)) {
			List<SellerFileBean> fileList = StringUtil.parseList(imgJson, SellerFileBean.class);
			for (SellerFileBean file : fileList) {
				file.setSellerNo(bean.getSellerNo());
				query.createSaveSql(file);
				dao.update();
			}
		}
		
		
		return String.valueOf(res);
	}
	
	public String uploadImg(MultipartFile client_file) {
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
		return ymd + "/" + uuid + fileName;
	}
	
	/**
	 * 保存商家信息
	 */
	@ResponseBody
	@RequestMapping("/saveBase.do")
	public int saveBase( Service service, SellerBean bean) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createSaveSql(bean,"status,strSeller");
		return dao.update();
	}

	/**
	 * 删除商家信息
	 */
	@ResponseBody
	@RequestMapping("/delete.do")
	public int delete(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createDeleteSql(SellerBean.class, id);
		int res = dao.update();
		// 删除商家用户信息
		if (res >0) {
			query.createDeleteSql(UserBean.class, "sellerNo", id);
			dao.update();
		}
		return res;
	}

    /**
     * 商家商品排行
     * @param service
     * @param request
     * @param sellerNo
     * @return
     */
    @ResponseBody
    @RequestMapping("/sellerGoodsRank.do")
	public Object sellerGoodsRank(Service service,HttpServletRequest request,String sellerNo,int type){
        List<GoodsBean> list  = null;
        if(type==1){
            //热销
           return DBTools.getBeanList(service,GoodsBean.class,"select * from GOODS where SELLER_NO=? order by SALSE_COUNT desc",sellerNo);
        }else{
            //热门
            List<Map<String,Object>> counts = DBTools.getDataList(service,"select t2.counts,t3.* from (select count(1) counts,GOODS_NO from GOODS_ATTENTION_LOG group by GOODS_NO) t2 right join GOODS t3 on t2.GOODS_NO = t3.GOODS_NO where t3.SELLER_NO=? order by t2.counts desc",sellerNo);
            return counts;
        }

    }
}
