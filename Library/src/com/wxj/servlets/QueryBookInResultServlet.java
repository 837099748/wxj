package com.wxj.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.wxj.services.BookService;

/**
 * Servlet implementation class QueryBookInResultServlet
 */
@WebServlet("/searchInResult.dhtml")
public class QueryBookInResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryBookInResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchType = request.getParameter("searchType");
		String sn = "";
		if(searchType.equals("name")){
			searchType="bname";
			sn="题名";
		}else if(searchType.equals("author")){
			searchType="bwriter";
			sn="责任者";
		}else if(searchType.equals("isbn")){
			searchType="bisbn";
			sn="ISBN/ISSN";
		}else if(searchType.equals("coden")){
			searchType="btype";
			sn="分类号";
		}else if(searchType.equals("publisher")){
			searchType="bpub";
			sn="出版社";
		}
		String strText = request.getParameter("strText");
		
		List<Map<String,Object>> blist = (List<Map<String,Object>>)request.getSession().getAttribute("blist");
		List<Map<String,Object>> newBlist = new ArrayList<Map<String,Object>>();
		for(int i=0;i<blist.size();i++){
			if(blist.get(i).get(searchType).toString().indexOf(strText)>=0){
				newBlist.add(blist.get(i));
			}
		}
		if(newBlist.size()==0){
			request.getRequestDispatcher("/WEB-INF/view/bookManage/bookNotFound.jsp").forward(request, response);
		}else{
			request.setAttribute("blist", newBlist);
			request.setAttribute("strText", strText);
			request.setAttribute("sn", sn);
			request.getRequestDispatcher("/WEB-INF/view/bookManage/bookInfo.jsp").forward(request, response);
		}
	}

}
