package com.icss.vo;

import java.sql.Date;

public class Item {
	private int itemId;
	private int orderId;
	private int goodsId;
	private int price;
	private int amount;
	private String buyerId;
	private String dealerId;
	private Date itemDate;
	private byte purchaseOrNot;
	int visible;

	public Item(int itemId, int orderId, int goodsId, int price, int amount, String buyerId, String dealerId,
			Date itemDate, byte purchaseOrNot, int visible) {
		super();
		this.itemId = itemId;
		this.orderId = orderId;
		this.goodsId = goodsId;
		this.price = price;
		this.amount = amount;
		this.buyerId = buyerId;
		this.dealerId = dealerId;
		this.itemDate = itemDate;
		this.purchaseOrNot = purchaseOrNot;
		this.visible = visible;
	}

	public int getVisible() {
		return visible;
	}

	public void setVisible(int visible) {
		this.visible = visible;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public String getDealerId() {
		return dealerId;
	}

	public void setDealerId(String dealerId) {
		this.dealerId = dealerId;
	}

	public Date getItemDate() {
		return itemDate;
	}

	public void setItemDate(Date itemDate) {
		this.itemDate = itemDate;
	}

	public byte getPurchaseOrNot() {
		return purchaseOrNot;
	}

	public void setPurchaseOrNot(byte purchaseOrNot) {
		this.purchaseOrNot = purchaseOrNot;
	}

}
