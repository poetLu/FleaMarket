package com.icss.vo;

public class Goods {
	private int goodsId;
	private String goodsAccount;
	private String goodsPassword;
	private String goodsType;
	private String dealerId;
	private int remain;
	
	public Goods(int goodsId, String goodsAccount, String goodsPassword, String goodsType, String dealerId,int remain) {
		super();
		this.goodsId = goodsId;
		this.goodsAccount = goodsAccount;
		this.goodsPassword = goodsPassword;
		this.goodsType = goodsType;
		this.dealerId = dealerId;
		this.remain=remain;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsAccount() {
		return goodsAccount;
	}
	public void setGoodsAccount(String goodsAccount) {
		this.goodsAccount = goodsAccount;
	}
	public String getGoodsPassword() {
		return goodsPassword;
	}
	public void setGoodsPassword(String goodsPassword) {
		this.goodsPassword = goodsPassword;
	}
	public String getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(String goodsType) {
		this.goodsType = goodsType;
	}
	public String getDealerId() {
		return dealerId;
	}
	public void setDealerId(String dealerId) {
		this.dealerId = dealerId;
	}
	public int getRemain() {
		return remain;
	}
	public void setRemain(int remain) {
		this.remain = remain;
	}
}
