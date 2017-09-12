package com.icss.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.dao.UserDao;
import com.icss.service.ManagerService;
import com.icss.service.UserService;
import com.oracle.jrockit.jfr.RequestableEvent;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserService userService=new UserService();
    private ManagerService managerService=new ManagerService();
    private UserDao userDao=new UserDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String identify=request.getParameter("identify");
		String userId=null;
		if((userId=userDao.getID(username))!=null){
			request.getSession().setAttribute("userId", userId);
		}
		String result;
		if(identify.equals("用户"))
			result=userLogin(username, password);
		else
			result=managerLogin(username, password);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append(result);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	//用户登录
	private String userLogin(String username,String password){
		try {
			return userService.canLogin(username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	//管理员登录
	private String managerLogin(String username,String password){
		return managerService.canLogin(username, password);
	}
}
