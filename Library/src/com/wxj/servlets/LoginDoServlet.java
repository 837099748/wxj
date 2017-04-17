package com.wxj.servlets;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wxj.services.UserServices;

/**
 * Servlet implementation class LoginDoServlet
 */
@WebServlet("/myLib.dhtml")
public class LoginDoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginDoServlet() {
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
		if(request.getSession().getAttribute("userInfo")==null){
			String ucode = request.getParameter("number");
			String upwd = request.getParameter("passwd");
			String select = request.getParameter("select");
			UserServices us = new UserServices();
			int t = us.loginCheck(ucode, upwd, select);
			if(t>0){
				Map<String,Object> um = us.queryUserInfo(ucode, select);
				request.getSession().setAttribute("userInfo", um);
				request.getRequestDispatcher("/WEB-INF/view/userManage/myLib.jsp").forward(request, response);
			}else{
				response.getWriter().print("<script language='javascript'>alert('用户名或密码错误');window.location.href='login.dhtml';</script>");
			}			
		}else{
			request.getRequestDispatcher("/WEB-INF/view/userManage/myLib.jsp").forward(request, response);
		}

	}

}
