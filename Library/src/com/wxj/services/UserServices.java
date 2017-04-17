package com.wxj.services;

import java.util.Map;

import com.wxj.tools.DBUtils;

public class UserServices {
	DBUtils db = DBUtils.getDB();
	
	public int loginCheck(String uname,String upwd,String select){
		String sql = "";
		if(select.equals("cert_no")){
			sql="select ucode,upwd from users where ucode=? and upwd=? and flag=0";
		}else if(select.equals("bar_no")){
			sql="select utm,upwd from users where utm=? and upwd=? and flag=0";
		}else if(select.equals("email")){
			sql="select uemail,upwd from users where uemail=? and upwd=? and flag=0";
		}
		
		Map<String,Object> um = db.queryForSingle(sql, new Object[]{uname,upwd});
		if(um!=null){
			return 1;
		}else{
			return 0;
		}
	}
	
	public Map<String,Object> queryUserInfo(String uname,String select){
		String sql = "";
		if(select.equals("cert_no")){
			sql="select * from users where ucode=?";
		}else if(select.equals("bar_no")){
			sql="select * from users where utm=?";
		}else if(select.equals("email")){
			sql="select * from users where uemail=?";
		}
		
		Map<String,Object> um = db.queryForSingle(sql, new Object[]{uname});
		
		return um;
	}
	
}
