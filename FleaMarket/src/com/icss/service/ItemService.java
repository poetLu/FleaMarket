package com.icss.service;

import com.icss.dao.GoodsAbstractDao;
import com.icss.dao.GoodsDao;
import com.icss.dao.ItemDao;

public class ItemService {
	ItemDao itemDao=new ItemDao();
	GoodsDao goodsDao=new GoodsDao();
	GoodsAbstractDao goodsAbstractDao=new GoodsAbstractDao();
	
	//根据条目ID得到抽象商品类型
	public String getGoodsAbstractType(int id){
		int goodsId=itemDao.getGoodsId(id);
		return goodsDao.getType(goodsId);
	}
	//根据条目ID得到抽象商品描述
	public String getGoodsAbstractDescription(int id){
		return goodsAbstractDao.getDescription(getGoodsAbstractType(id));
	}
}
