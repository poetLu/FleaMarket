package com.icss.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.dao.GoodsAbstractDao;
import com.icss.dao.GoodsDao;
import com.icss.dao.ItemDao;
import com.icss.dao.OrderDao;
import com.icss.vo.GoodsAbstract;

/**
 * Servlet implementation class JoinShoppingcartServlet
 */
@WebServlet("/joinshoppingcart")
public class JoinShoppingcartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	OrderDao orderDao=new OrderDao();
	ItemDao itemDao=new ItemDao();
	GoodsDao goodsDao=new GoodsDao();
	GoodsAbstractDao goodsAbstractDao=new GoodsAbstractDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinShoppingcartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId=(String)request.getSession().getAttribute("userId");
		String game=request.getParameter("game");
		String dealerId=request.getParameter("dealerId");
		int amount=Integer.parseInt(request.getParameter("amount"));
		int orderId=orderDao.getExpectedId();
		int goodsId=goodsDao.getGoodsId(dealerId, game);
		Date itemDate=new Date(new java.util.Date().getTime());
		itemDao.newUntradedItem(orderId, goodsId, goodsAbstractDao.getPrice(game), amount, userId, dealerId, itemDate);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append("成功添加至购物车");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
