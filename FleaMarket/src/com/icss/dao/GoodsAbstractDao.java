package com.icss.dao;

import static com.icss.dao.DBHandle.connectDB;
import static com.icss.dao.DBHandle.disconnectDB;
import static com.icss.dao.DBHandle.getStatement;

import java.sql.ResultSet;
import java.sql.SQLException;

//数据访问层
public class GoodsAbstractDao {
	// 商品概述上线
	public boolean generateGoodsType(String type, String descrption, int price, String imgPath, int remain) {
		connectDB();
		String sql = "insert into goods_abstract values('" + type + "','" + descrption + "'," + price + ",'" + imgPath
				+ "'," + remain + ")";
		try {
			int records = getStatement().executeUpdate(sql);
			if (records == 0)
				return false;
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			disconnectDB();
		}
	}

	// 根据商品类型得到商品账号单价
	public int getPrice(String type) {
		connectDB();
		String sql = "select price from goods_abstract where goods_type='" + type + "'";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next()) {
				return resultSet.getInt(1);
			}
			return 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		} finally {
			disconnectDB();
		}
	}

	// 根据商品类型得到商品账号库存
	public int getRemain(String type) {
		connectDB();
		String sql = "select remain from goods_abstract where goods_type='" + type + "'";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next()) {
				return resultSet.getInt(1);
			}
			return 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		} finally {
			disconnectDB();
		}
	}
}
