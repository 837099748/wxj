package com.wxj.servlets;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wxj.services.BookService;

/**
 * Servlet implementation class QueryBookDetails
 */
@WebServlet("/bookDetails.dhtml")
public class QueryBookDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryBookDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bid = request.getParameter("tittle");
		BookService bs = new BookService();
		Map<String, Object> bdetails = bs.queryForBookDetails(bid);
		bs.updateCheckCount(bid);
		request.setAttribute("bdetails", bdetails);
		request.getRequestDispatcher("/WEB-INF/view/bookManage/bookDetails.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
