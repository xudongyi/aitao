package com.business.system.service;

import java.util.*;

import com.business.system.bean.GoodsPriceBean;
import net.sf.rose.jdbc.dao.BeanDAO;
import net.sf.rose.jdbc.query.BeanSQL;
import net.sf.rose.jdbc.service.Service;

/** 
 * @author fengjian E-mail: 9110530@qq.com 
 * @version 创建时间：2017年2月17日 下午3:58:56 
 * 类说明：用户管理
 */
@org.springframework.stereotype.Service
public class GoodService {

	/**
	 * 根据商品主健获取商品价格信息列表
	 */
	public Map<String, Map<String, GoodsPriceBean>> getPriceBeanList(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsPriceBean.class);
		query.createSql("goodsNo", id);
		List<GoodsPriceBean> list = dao.list();
		// 第一个Map键名是属性名称，第二个Map键名是属性值
		Map<String, Map<String, GoodsPriceBean>> map = new LinkedHashMap<>();
		for (GoodsPriceBean bean : list) {
			id = bean.getPrppertityName1();
			if (id != null) {
				Map<String, GoodsPriceBean> m = map.get(id);
                if (m == null) {
					m = new LinkedHashMap<>();
					map.put(id, m);
				}
				m.put(bean.getPropertityValue1(), bean);
			}
			id = bean.getPrppertityName2();
			if (id != null) {
				Map<String, GoodsPriceBean> m = map.get(id);
				if (m == null) {
					m = new LinkedHashMap<>();
					map.put(id, m);
				}
				m.put(bean.getPropertityValue2(), bean);
			}
			id = bean.getPrppertityName3();
			if (id != null) {
				Map<String, GoodsPriceBean> m = map.get(id);
				if (m == null) {
					m = new LinkedHashMap<>();
					map.put(id, m);
				}
				m.put(bean.getPropertityValue3(), bean);
			}
			id = bean.getPrppertityName4();
			if (id != null) {
				Map<String, GoodsPriceBean> m = map.get(id);
				if (m == null) {
					m = new LinkedHashMap<>();
					map.put(id, m);
				}
				m.put(bean.getPropertityValue4(), bean);
			}
		}
		return map;
	}

	/**
	 * 根据商品主健获取商品价格清单
	 */
	public Map<String, GoodsPriceBean> getPriceList(Service service, String id) {
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsPriceBean.class);
		query.createSql("goodsNo", id);
		List<GoodsPriceBean> list = dao.list();
		Map<String, GoodsPriceBean> map = new HashMap<>();
		StringBuilder sb = new StringBuilder();
		for (GoodsPriceBean bean : list) {
            sb = new StringBuilder();
			id = bean.getPrppertityName1();
			if (id != null) {
				// 属性名:属性值;
				sb.append(id).append(':').append(bean.getPropertityValue1()).append(';');
			}
			id = bean.getPrppertityName2();
			if (id != null) {
				sb.append(id).append(':').append(bean.getPropertityValue2()).append(';');
			}
			id = bean.getPrppertityName3();
			if (id != null) {
				sb.append(id).append(':').append(bean.getPropertityValue3()).append(';');
			}
			id = bean.getPrppertityName4();
			if (id != null) {
				sb.append(id).append(':').append(bean.getPropertityValue4()).append(';');
			}
			map.put(sb.toString(), bean);
		}
		return map;
	}

	/**
	 * 根据商品主健获取商品价格清单
	 */
	public GoodsPriceBean getPriceBean(Service service, GoodsPriceBean bean) {
		String id = bean.getGoodsNo();
		List<String> keys = new ArrayList<>();
		id = bean.getPrppertityName1();
		if (id != null) {
			// 属性名:属性值;
			keys.add(id + ':' + bean.getPropertityValue1() + ';');
		}
		id = bean.getPrppertityName2();
		if (id != null) {
			keys.add(id + ':' + bean.getPropertityValue2() + ';');
		}
		id = bean.getPrppertityName3();
		if (id != null) {
			keys.add(id + ':' + bean.getPropertityValue3() + ';');
		}
		id = bean.getPrppertityName4();
		if (id != null) {
			keys.add(id + ':' + bean.getPropertityValue4() + ';');
		}
		BeanDAO dao = new BeanDAO(service);
		BeanSQL query = dao.getQuerySQL();
		query.setEntityClass(GoodsPriceBean.class);
		query.createSql("goodsNo", id);
		List<GoodsPriceBean> list = dao.list();
		Map<String, GoodsPriceBean> map = new HashMap<>();
		StringBuilder sb = new StringBuilder();
		for (GoodsPriceBean b : list) {
			sb.delete(0, sb.length() - 1);
			id = bean.getPrppertityName1();
			if (id != null) {
				// 属性名:属性值;
				sb.append(id).append(':').append(bean.getPropertityValue1()).append(';');
			}
			id = bean.getPrppertityName2();
			if (id != null) {
				sb.append(id).append(':').append(bean.getPropertityValue2()).append(';');
			}
			id = bean.getPrppertityName3();
			if (id != null) {
				sb.append(id).append(':').append(bean.getPropertityValue3()).append(';');
			}
			id = bean.getPrppertityName4();
			if (id != null) {
				sb.append(id).append(':').append(bean.getPropertityValue4()).append(';');
			}
			map.put(sb.toString(), b);
		}
		boolean flag = true;
		for (String key : map.keySet()) {
			flag = true;
			for (String str : keys) {
				if (key.indexOf(str) == -1) {
					flag = false;
					break;
				}
			}
			if (flag) {
				return map.get(key);
			}
		}
		return null;
	}


	public GoodsPriceBean getByKeyAndValue(Map<String,String> map,Object goodsNo,Service service){
        Map<String, GoodsPriceBean> priceList = this.getPriceList(service,goodsNo.toString());
        List<String> params = new ArrayList<>();
        for(String key :map.keySet()){
            String value = map.get(key);
            params.add(key+":"+value+";");
        }
        String [] a = new String[params.size()];
        params.toArray(a);
        List<String> result = new ArrayList<>();
        permutation(a,0,result);
        for(String s:result){
            for(String key :priceList.keySet()){
                if(s.equals(key)){
                    return priceList.get(key);
                }
            }
        }
	    return null;
    }

    /**
     * 递归查询出所有的排列组合
     * @param ss 原始数据
     * @param i 从第几个位置开始递归
     * @param result 存放结果集
     */
    public static void permutation(String[]ss,int i, List<String> result){
        if(ss==null||i<0 ||i>ss.length){
            return;
        }
        if(i==ss.length){
            String a1 = "";
            for(String a :ss){
                a1+=a;
            }
            result.add(a1);
        }else{
            for(int j=i;j<ss.length;j++){
                String temp=ss[j];//交换前缀,使之产生下一个前缀
                ss[j]=ss[i];
                ss[i]=temp;
                permutation(ss,i+1,result);
                temp=ss[j]; //将前缀换回来,继续做上一个的前缀排列.
                ss[j]=ss[i];
                ss[i]=temp;
            }
        }
    }
}
