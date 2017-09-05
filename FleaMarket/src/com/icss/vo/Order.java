package com.icss.vo;

import java.sql.Date;

public class Order {
	private int orderId;
	private Date orderDate;

	public int getOrderId() {
		return orderId;
	}

	public Order(int orderId, Date orderDate) {
		super();
		this.orderId = orderId;
		this.orderDate = orderDate;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
}
