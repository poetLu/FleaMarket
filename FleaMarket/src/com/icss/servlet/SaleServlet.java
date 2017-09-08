package com.icss.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.dao.GoodsDao;

/**
 * Servlet implementation class SaleServlet
 */
@WebServlet("/sale")
public class SaleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    GoodsDao goodsDao=new GoodsDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId=(String)request.getSession().getAttribute("userId");
		String goodsType=request.getParameter("game");
		String goodsAccount=request.getParameter("account");
		String goodsPassword=request.getParameter("password");
		goodsDao.upShelf(goodsAccount, goodsPassword, goodsType, userId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append("…œº‹≥…π¶");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
