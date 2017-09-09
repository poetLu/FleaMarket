package com.icss.service;

import com.icss.dao.OrderDao;
import com.icss.vo.Item;

public class OrderService {
	OrderDao orderDao=new OrderDao();
	//根据订单ID得到已交易订单的总价
	public int getTotalPrice(int orderId){
		int total=0;
		for(Item item:orderDao.getTradedItem(orderId))
			total+=item.getPrice()*item.getAmount();
		return total;
	}
	//根据订单ID得到未交易订单总价
	public int getUnpayTotalPrice(int orderId){
		int total=0;
		for(Item item:orderDao.getUntradedItem(orderId))
			total+=item.getPrice()*item.getAmount();
		return total;
	}
}
