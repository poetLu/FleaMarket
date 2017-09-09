package com.icss.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.dao.OrderDao;

/**
 * Servlet implementation class HideOrderServlet
 */
@WebServlet("/hideorder")
public class HideOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private OrderDao orderDao=new OrderDao();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HideOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int orderId=Integer.parseInt(request.getParameter("orderId"));
		orderDao.setInvisible(orderId);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
