package com.wxj.filters;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public  class MyRequest extends HttpServletRequestWrapper{
	HttpServletRequest request=null;
	
	public MyRequest(HttpServletRequest request) {
		
		super(request);
		this.request=request;
		
	}
	
	@Override
	public String getParameter(String name) {
		String value=request.getParameter(name);
		if(value!=null){
			String method=request.getMethod();
			if(method.equals("GET")){	//如果是get方法，我们才处理
				try {
					value=new String(value.getBytes("ISO-8859-1"),"UTF-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return value;
	}

}
