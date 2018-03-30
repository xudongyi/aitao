package com.business.system.action;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.business.system.bean.GoodsFileBean;
import net.sf.rose.initial.BootStart;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.service.Service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.misc.BASE64Encoder;

/**
 * @author fengjian E-mail: 9110530@qq.com 
 * @version 创建时间：2017年2月17日 下午3:58:56 
 * 类说明：商品管理
 */

@Controller
@RequestMapping("/goods/file")
public class GoodsFileAction {
	private static String OS = System.getProperty("os.name").toLowerCase();

	/**
	 * 商品图片列表
	 */
	@ResponseBody
	@RequestMapping("/list.do")
	public List<GoodsFileBean> list(HttpServletRequest request, Service service, String goodsNo) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsFileBean.class);
		query.createSql("goodsNo",goodsNo);
		return dao.list();
	}
	
	@ResponseBody
	@RequestMapping("save.do")
	public Map<String,Object> save(HttpServletRequest request, HttpServletResponse response, Service service,
			String id, String goodsNo, String fileUrl) {
		GoodsFileBean bean = new GoodsFileBean();
		bean.setFileID(id);
		bean.setGoodsNo(goodsNo);
		bean.setFileUrl(fileUrl);
		
		BeanDAO dao = new BeanDAO(service);
    	BeanSQL query = dao.getQuerySQL();
    	query.setEntityClass(GoodsFileBean.class);
    	query.createSaveSql(bean);
    	int result = dao.update();
    	Map<String,Object> map = new HashMap<String,Object>();
    	map.put("res", result);
    	map.put("fileId", bean.getFileID());
    	return map;
	}
	
	@ResponseBody
	@RequestMapping("getImg.do")
    public String getImg(HttpServletRequest request, HttpServletResponse response, String url) {
        String ctxPath = "D://uploadFiles";
        if (OS.indexOf("linux") >= 0) {
            ctxPath = BootStart.getConfigProperty("file.linux.path");
        } else if (OS.indexOf("windows") >= 0) {
            ctxPath = BootStart.getConfigProperty("file.windows.path");
        }

        url = ctxPath+"/"+url;
        String imgStr = "";
        try {
            File file = new File(url);
			byte[] img_data = null;
			
			// 读取图片字节数组
			InputStream in = new FileInputStream(file);
			img_data = new byte[in.available()];
			in.read(img_data);
			in.close();
			// 对字节数组Base64编码
			BASE64Encoder encoder = new BASE64Encoder();
			imgStr = encoder.encode(img_data);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return imgStr;
    }
	
	@ResponseBody
	@RequestMapping("delete.do")
	public int delete(HttpServletRequest request, HttpServletResponse response, Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.createDeleteSql(GoodsFileBean.class, id);
		return dao.update();
	}

}
