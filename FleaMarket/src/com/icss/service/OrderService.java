package com.icss.service;

import com.icss.dao.OrderDao;
import com.icss.vo.Item;

public class OrderService {
	OrderDao orderDao=new OrderDao();
	//���ݶ���ID�õ��ѽ��׶������ܼ�
	public int getTotalPrice(int orderId){
		int total=0;
		for(Item item:orderDao.getTradedItem(orderId))
			total+=item.getPrice()*item.getAmount();
		return total;
	}
	//���ݶ���ID�õ�δ���׶����ܼ�
	public int getUnpayTotalPrice(int orderId){
		int total=0;
		for(Item item:orderDao.getUntradedItem(orderId))
			total+=item.getPrice()*item.getAmount();
		return total;
	}
}
