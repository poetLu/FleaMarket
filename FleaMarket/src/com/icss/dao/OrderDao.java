package com.icss.dao;

import static com.icss.dao.DBHandle.*;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.icss.vo.Item;

//数据访问层
public class OrderDao {
	// 根据ID得到已完成的交易条目
	@SuppressWarnings("finally")
	public List<Item> getTradedItem(int id) {
		connectDB();
		List<Item> list = new ArrayList<Item>();
		String sql = "select * from item where order_id=" + id + " amd pruchase_or_not=1";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			while (resultSet.next()) {
				int itemId = resultSet.getInt("item_id");
				int orderId = resultSet.getInt("order_id");
				int goodsId = resultSet.getInt("goods_id");
				int price = resultSet.getInt("price");
				int amount = resultSet.getInt("amount");
				String buyerId = resultSet.getString("buyer_id");
				String dealerId = resultSet.getString("dealer_id");
				Date itemDate = resultSet.getDate("item_date");
				list.add(new Item(itemId, orderId, goodsId, price, amount, buyerId, dealerId, itemDate, (byte) 1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disconnectDB();
			return list;
		}
	}

	// 根据ID得到未完成的交易条目
	@SuppressWarnings("finally")
	public List<Item> getUnradedItem(int id) {
		connectDB();
		List<Item> list = new ArrayList<Item>();
		String sql = "select * from item where order_id=" + id + " amd pruchase_or_not=0";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			while (resultSet.next()) {
				int itemId = resultSet.getInt("item_id");
				int orderId = resultSet.getInt("order_id");
				int goodsId = resultSet.getInt("goods_id");
				int price = resultSet.getInt("price");
				int amount = resultSet.getInt("amount");
				String buyerId = resultSet.getString("buyer_id");
				String dealerId = resultSet.getString("dealer_id");
				Date itemDate = resultSet.getDate("item_date");
				list.add(new Item(itemId, orderId, goodsId, price, amount, buyerId, dealerId, itemDate, (byte) 0));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disconnectDB();
			return list;
		}
	}

	// 根据ID删除订单记录
	public boolean deleteOrder(int id) {
		connectDB();
		String sql = "delete from order_info where order_id=" + id;
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
}
