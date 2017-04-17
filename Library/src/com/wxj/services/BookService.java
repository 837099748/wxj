package com.wxj.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wxj.tools.DBUtils;

public class BookService {
	
	DBUtils db = DBUtils.getDB();

	public List<Map<String,Object>> queryBooks(String searchType,String matchFun,String strText){
		String sql = "select bi.bid,bi.bname,bi.bwriter,bi.bpub,bi.btype,bi.flag,bi.baddr,bdt.bdtid,bdt.bdtname,count(bi.bisbn) as num from bookinf as bi,bookdoctype as bdt where bdt.bdtid=bi.bdtid and flag=0 and ";
		if(searchType.equals("name")){
			sql+=" bi.bname like ?";
		}else if(searchType.equals("author")){
			sql+=" bi.bwriter like ?";
		}else if(searchType.equals("isbn")){
			sql+=" bi.bisbn like ?";
		}else if(searchType.equals("coden")){
			sql+=" bi.btype like ?";
		}else if(searchType.equals("publisher")){
			sql+=" bi.bpub like ?";
		}
		if(matchFun.equals("forward")){
			strText+="%";
		}else if(matchFun.equals("any")||matchFun.equals("")){
			strText="%"+strText+"%";
		}
		sql+="GROUP BY bi.bisbn";
		List<Map<String,Object>> blist = db.queryList(sql,new Object[]{strText});
		//List<Map<String,Object>> blist = db.queryList(sql, new Object[]{strText});
		return blist;
	}
	
	public Map<String,Object> queryForBookDetails(String bid){
		
		String sql = "select bid,bname,bwriter,bprice,bpub,bisbn,btype,babstract,baddr,bsearchcount from bookinf where bid=?";
		Map<String,Object> bdetails = db.queryForSingle(sql, new Object[]{bid});
		return bdetails;
		
	}
	
	public int insertQueryCount(String searchText){
		searchText=searchText.trim();
		int time = querySearchCount(searchText);
		String sql;
		int result;
		if(time==0){
			sql = "insert into searchcount (sstrtext,stime)values(?,?)";
			result = db.update(sql, new Object[]{searchText,(time+1)});
		}else{
			sql = "update searchcount set stime=? where sstrtext=?";
			result = db.update(sql, new Object[]{(time+1),searchText});
		}
		
		return result;
		
	}
	
	public int querySearchCount(String searchText){
		searchText=searchText.trim();
		String sql = "select sstrText,stime from searchcount where sstrText=?";
		Map<String, Object> result = db.queryForSingle(sql, new Object[]{searchText});
		int count;
		if(result==null){
			count = 0;
		}else{
			count = Integer.parseInt(result.get("stime").toString());
		}
		return count;
	}
	
	public String queryHotSearchText(){
		
		String sql = "select sstrText,stime from searchcount order by stime DESC limit 0,15";
		List<Map<String, Object>> re = db.queryList(sql, new Object[]{});
		int fontSize;
		String str = "";
		for(int i = 0;i<re.size();i++){
			fontSize = (int) ((Math.random()*(25-18+1))+18);
			re.get(i).put("fontSize", fontSize);
			str += "<a style='font-size:"+re.get(i).get("fontSize")+"px' href='http://localhost:8888/Library/bookDetails.dhtml?tittle="+re.get(i).get("sstrText")+"'>"+re.get(i).get("sstrText")+"</a>";
		}
		return str;
	}
	
	public void updateCheckCount(String bid){
		String sql = "select bid,bookcheckcount from checkcount where bid = ?";
		Map<String, Object> re = db.queryForSingle(sql, new Object[]{bid});
		if(re==null){
			String insertSql = "insert into checkcount (bid,bookcheckcount)values(?,?)";
			db.update(insertSql, new Object[]{bid,1});
		}else{
			String updateSql = "update checkcount set bookcheckcount=? where bid=?";
			db.update(updateSql, new Object[]{(Integer.parseInt(re.get("bookcheckcount").toString())+1),bid});
		}
	}
	
	public String queryCheckCount(){
		String sql = "select cc.bid,cc.bookcheckcount,bi.bname from checkcount as cc,bookinf as bi where cc.bid=bi.bid order by cc.bookcheckcount DESC limit 0,10";
		List<Map<String, Object>> re = db.queryList(sql, new Object[]{});
		String str = "";
		for(int i = 0;i<re.size();i++){
			str+="<li><a target=\"_blank\" href=\"http://localhost:8888/Library/bookDetails.dhtml?tittle="+re.get(i).get("bid")+"\"><span>"+re.get(i).get("bname")+"</span></a></li>";
		}
		return str;
	}
	
}
