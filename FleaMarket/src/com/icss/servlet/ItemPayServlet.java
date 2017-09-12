package com.icss.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.dao.GoodsDao;
import com.icss.dao.ItemDao;
import com.icss.dao.UserDao;

/**
 * Servlet implementation class ItemPayServlet
 * 用户点击结算时调用
 */
@WebServlet("/itemPay")
public class ItemPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ItemDao itemDao=new ItemDao();
    private GoodsDao goodsDao=new GoodsDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int itemId=Integer.parseInt(request.getParameter("itemId"));
		synchronized (this) {
			if(goodsDao.getRemain(itemDao.getGoodsId(itemId))>=itemDao.getAmount(itemId)){
				itemDao.payItem(itemId);
				goodsDao.remainDecrease(itemDao.getGoodsId(itemId), itemDao.getAmount(itemId));
			}else
				return;
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
