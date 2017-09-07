package com.icss.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.dao.UserDao;

/**
 * Servlet implementation class InformationModifyServlet
 * 个人信息修改servlet
 */
@WebServlet("/informationModify")
public class InformationModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UserDao userDao=new UserDao();    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InformationModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId=(String)request.getSession().getAttribute("userId");
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		Date birthday=Date.valueOf(request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day"));
		String telephone=request.getParameter("telephone");
		userDao.setName(userId, name);
		userDao.setSex(userId, sex);
		userDao.setBirthday(userId, birthday);
		userDao.setTelphone(userId, telephone);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append("修改成功");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
