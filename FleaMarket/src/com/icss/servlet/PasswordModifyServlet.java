package com.icss.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.dao.UserDao;

/**
 * Servlet implementation class PasswordModifyServlet
 */
@WebServlet("/passwordModify")
public class PasswordModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UserDao userDao=new UserDao();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId=(String)request.getSession().getAttribute("userId");
		String oldPwd=request.getParameter("oldPwd");
		String newPwd=request.getParameter("newPwd");
		response.setCharacterEncoding("UTF-8");
		if(!userDao.getPassword(userId).equals(oldPwd))
			response.getWriter().append("原密码错误");
		else{
			userDao.resetPassword(userId, newPwd);
			response.getWriter().append("修改成功");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
