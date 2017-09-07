package com.icss.servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.icss.dao.UserDao;
import com.icss.service.UserService;

/**
 * Servlet implementation class InformationServlet
 * 注册所需的servlet
 */
@WebServlet("/information")
public class InformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao=new UserDao();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 从浏览器接收请求参数
		HttpSession session=request.getSession();
		String id=request.getParameter("id"),name=request.getParameter("name"),sex=request.getParameter("sex"),email=request.getParameter("email");
		String rawBirthday=request.getParameter("birthday"),telephone=request.getParameter("telephone");
		String account=(String)session.getAttribute("username"),password=(String)session.getAttribute("password");
		java.util.Date date=new java.util.Date();
		Date loginDate=new Date(date.getTime());
		Date birth=Date.valueOf(rawBirthday);
		try {
//			System.out.println(id+"\n"+account+"\n"+password+"\n"+loginDate+"\n"+name+"\n"+sex+"\n"+birth+"\n"+telephone+"\n"+email);
			userDao.addUser(id, account, password, loginDate, name, sex, birth, telephone, email, 100);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getSession().setAttribute("userId", id);
		response.sendRedirect("/FleaMarket/home");
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
