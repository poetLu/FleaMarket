package com.icss.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.dao.ItemDao;

/**
 * Servlet implementation class HideItemServlet
 */
@WebServlet("/hideitem")
public class HideItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ItemDao itemDao=new ItemDao();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HideItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int itemId=Integer.parseInt(request.getParameter("itemId"));
		itemDao.setInvisible(itemId);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
