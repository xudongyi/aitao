package com.business.system.filter;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** 
 * @author fengjian E-mail: 9110530@qq.com 
 * @version 创建时间：2016年6月21日 下午5:17:08 
 * 类说明 
 */
public class SessionFilter implements Filter{
	
	private FilterConfig filterConfig;
    private String noFilterURI;
	@Override
	public void destroy() {
        // TODO Auto-generated method stub
    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) 
    		throws IOException, ServletException {
        HttpServletRequest req=(HttpServletRequest)request;
        HttpServletResponse res=(HttpServletResponse)response;
        String path = req.getServletPath();
        
        // 获取白名单
        init(filterConfig);
        boolean isnocheck = getRegexResult(noFilterURI,path);

        if(path.contains(".do") || path.contains("/images/") || path.contains("/css/") || path.contains("/js/") || isnocheck || req.getSession().getAttribute("webuser")!=null){
            filterChain.doFilter(req, res);
        }else{
            res.sendRedirect("/aitao/page/backold/login.jsp");

        }

    }
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
        noFilterURI = filterConfig.getInitParameter("noFilterURI");
    }
    
    public static boolean getRegexResult(String exp, String str) {
		Pattern pattern = Pattern.compile(exp);
		Matcher matcher = pattern.matcher(str);
		return matcher.find();
	}
}
