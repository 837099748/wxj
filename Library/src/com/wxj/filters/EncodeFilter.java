package com.wxj.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class EncodeFilter
 */
@WebFilter("/*")
public class EncodeFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncodeFilter() {
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpReq=(HttpServletRequest)request;
		HttpServletResponse httpResp=(HttpServletResponse)response;
		
		httpReq.setCharacterEncoding("utf-8");		//解决post方式 乱码
		httpResp.setContentType("text/html; charset=UTF-8");
		httpReq.setAttribute("basePath", httpReq.getContextPath());
		MyRequest myReq=new MyRequest(httpReq);	//解决get方式乱码
		
		// pass the request along the filter chain
		chain.doFilter(myReq, httpResp);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
