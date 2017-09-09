package com.icss.vo;

import java.sql.Date;

import org.eclipse.jdt.internal.compiler.codegen.ObjectCache;

public class Order {
	private int orderId;
	private Date orderDate;
	private int visible;
	
	public Order(int orderId, Date orderDate,int visible) {
		super();
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.visible=visible;
	}

	public int getVisible() {
		return visible;
	}

	public void setVisible(int visible) {
		this.visible = visible;
	}

	public int getOrderId() {
		return orderId;
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
	public boolean equals(Object obj){
		if(obj instanceof Order&&((Order) obj).getOrderId()==orderId)
			return true;
		return false;
	}
	public int hashCode(){
		return orderId;
	}
}
