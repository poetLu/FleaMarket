package com.icss.service;

import com.icss.dao.GoodsAbstractDao;
import com.icss.dao.GoodsDao;
import com.icss.dao.ItemDao;

public class ItemService {
	ItemDao itemDao=new ItemDao();
	GoodsDao goodsDao=new GoodsDao();
	GoodsAbstractDao goodsAbstractDao=new GoodsAbstractDao();
	
	//������ĿID�õ�������Ʒ����
	public String getGoodsAbstractType(int id){
		int goodsId=itemDao.getGoodsId(id);
		return goodsDao.getType(goodsId);
	}
	//������ĿID�õ�������Ʒ����
	public String getGoodsAbstractDescription(int id){
		return goodsAbstractDao.getDescription(getGoodsAbstractType(id));
	}
}
