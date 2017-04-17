package com.wxj.tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBUtils {
	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private final String username = "root";
	private final String password = "root";
	private final String url = "jdbc:mysql://localhost:3306/library";
	//private final String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static DBUtils db = null;//实例化了一个当前类对象
	public static DBUtils getDB(){
		if(db==null){
			db = new DBUtils();
		}
		return db;
	}
	private DBUtils(){
		
	}
	/**
	 * 静态代码块（类加载的时候加载，一但加载无论实例化多少次类，都只加载一次）
	 * 1.加载驱动
	 */
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("加载驱动失败！");
			e.printStackTrace();
		}
	}
	/**
	 * 2.获取连接
	 */
	public Connection getConn(){
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			System.out.println("获取连接失败！");
			e.printStackTrace();
		}
		return conn;
	}
	
	/**
	 * 3.提供一个更新方法
	 */
	public int update(String sql,Object[] obj){
		//Userinfo ui;
		//insert into a (id,name,sex) values (ui.getid,ui.getusername,ui.getsex);
		//insert into a (id,name,sex) values (1,'张三','男');
		conn = getConn();//调用getConn方法获得连接对象
		try {
			ps = conn.prepareStatement(sql);//通过连接对象获得预处理语句对象
			for(int i=0;i<obj.length;i++){
				ps.setObject(i+1, obj[i]);
			}
			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("执行更新语句失败！");
			e.printStackTrace();
			return -1;
		} finally{
			release();
		}
	}
	/**
	 * 查询方法
	 * @param sql 语句
	 * @param obj 预处理对象需要的参数
	 * @return	ResultSet
	 */
	public ResultSet query(String sql,Object[] obj){
		try {
			ps = getConn().prepareStatement(sql);
			for(int i=0;i<obj.length;i++){
				ps.setObject(i+1, obj[i]);
			}
			rs = ps.executeQuery();
		} catch (SQLException e) {
			System.out.println("获取结果集异常！");
			e.printStackTrace();
		} finally {
			/**
			 * 如果在这里调用release方法，会报错：
			 * Operation not allowed after ResultSet closed
			 * 操作 不被 允许 在 ResultSet 关闭之后
			 */
		}
		return rs;
	}
	/**
	 * 封装ResultSet的查询方法
	 * @param sql	语句
	 * @param obj	预处理对象需要的参数
	 * @return List<Map<String,Object>>
	 */
	public List<Map<String,Object>> queryList(String sql,Object[] obj){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		try {
			ps = getConn().prepareStatement(sql);
			for(int i=0;i<obj.length;i++){
				ps.setObject(i+1, obj[i]);
			}
			//System.out.println(ps.toString());
			rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next()){
				Map<String,Object> map = new HashMap<String,Object>();
				for(int i=0;i<rsmd.getColumnCount();i++){
					String key = rsmd.getColumnName(i+1);
					Object value = rs.getObject(key);
					map.put(key, value);
				}
				list.add(map);
			}
		} catch (SQLException e) {
			System.out.println("获取结果集异常！");
			e.printStackTrace();
		} finally {
			release();
		}
		return list;
	}
	
	/**
	 * 查询一条记录
	 * @param sql
	 * @param obj
	 * @return
	 */
	public Map<String,Object> queryForSingle(String sql,Object[] obj){
		List<Map<String,Object>> list = queryList(sql,obj);
		Map<String,Object> map = null;
		if(!list.isEmpty()){
			map = list.get(0);
		}
		return map;
	}
	
	/**
	 * 封装分页
	 * @param page 第几页
	 * @param perPageLine 每页显示的记录数
	 */
	public List<Map<String,Object>> queryPage(String sql,int page,int perPageLine,Object[] obj){
		int start = page * perPageLine;
		int end = (page-1)*perPageLine+1;
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		try {
			//int first = page * perPageLine;
			String topSql = "select * from ("
				+ "select t.*,rownum as rn from ("
				+ sql
				+ ") t "
				+ "where rownum <= " + start + ") "
				+ "where rn >= " + end + "";
			//System.out.println(topSql);
			ps = getConn().prepareStatement(topSql);
			for(int i=0;i<obj.length;i++){
				ps.setObject(i+1, obj[i]);
			}
			rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next()){
				Map<String,Object> map = new HashMap<String,Object>();
				for(int i=0;i<rsmd.getColumnCount();i++){
					String key = rsmd.getColumnName(i+1);
					Object value = rs.getObject(key);
					map.put(key, value);
				}
				list.add(map);
			}
		} catch (SQLException e) {
			System.out.println("获取结果集异常！");
			e.printStackTrace();
		} finally {
			release();
		}
		return list;
	}
	
	/**
	 * 获取总记录数
	 */
	public int count(String sql,Object[] obj){
		int sumreco = 0;
		try {
			ps = getConn().prepareStatement(sql);
			for(int i=0;i<obj.length;i++){
				ps.setObject(i+1, obj[i]);
			}
			rs = ps.executeQuery();
			if(rs.next())
				sumreco = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("获取结果集异常！");
			e.printStackTrace();
		} finally {
			release();
		}
		return sumreco;
	}
	/**
	 * 批处理操作
	 * @param sqls
	 */
	public void batch(String[] sqls){
		try {
			conn = getConn();
			conn.setAutoCommit(false);//设置数据库事务为手动提交
			stmt = conn.createStatement();
			for(String sql:sqls){
				stmt.addBatch(sql);
			}
			stmt.executeBatch();
		} catch (SQLException e) {
			try {
				conn.rollback();//回滚事务
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally{
			try {
				conn.commit();//提交事务
			} catch (SQLException e) {
				e.printStackTrace();
			}
			release();
		}
	}
	
	/**
	 * 释放资源
	 */
	public void release(){
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println("关闭ResultSet出现异常");
				e.printStackTrace();
			}
		}
		if(ps!=null){
			try {
				ps.close();
			} catch (SQLException e) {
				System.out.println("关闭PreparedStatement出现异常");
				e.printStackTrace();
			}
		}
		if(stmt!=null){
			try {
				stmt.close();
			} catch (SQLException e) {
				System.out.println("关闭Statement出现异常");
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("关闭Connection出现异常");
				e.printStackTrace();
			}
		}
	}
}
