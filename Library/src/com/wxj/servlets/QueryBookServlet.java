package com.wxj.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wxj.services.BookService;

/**
 * Servlet implementation class QueryBookServlet
 */
@WebServlet("/search.dhtml")
public class QueryBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchType = request.getParameter("searchType");
		String sn = "";
		if(searchType.equals("name")){
			sn="题名";
		}else if(searchType.equals("author")){
			sn="责任者";
		}else if(searchType.equals("isbn")){
			sn="ISBN/ISSN";
		}else if(searchType.equals("coden")){
			sn="分类号";
		}else if(searchType.equals("publisher")){
			sn="出版社";
		}
		String matchFun = "";
		if(request.getParameter("matchFun")!=null){
			matchFun = request.getParameter("matchFun");
		}
		
		String strText = request.getParameter("strText");
		BookService bs = new BookService();
		
		if(sn=="题名"){
			int t = bs.insertQueryCount(strText);
			System.out.println(t);
		}
		
		List<Map<String,Object>> blist = bs.queryBooks(searchType,matchFun,strText);
		if(blist.size()==0){
			request.getRequestDispatcher("/WEB-INF/view/bookManage/bookNotFound.jsp").forward(request, response);
		}else{
			request.setAttribute("blist", blist);
			request.setAttribute("strText", strText);
			request.setAttribute("sn", sn);
			request.getRequestDispatcher("/WEB-INF/view/bookManage/bookInfo.jsp").forward(request, response);
		}
	}

}
