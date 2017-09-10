package com.icss.dao;

import static com.icss.dao.DBHandle.*;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

import com.icss.vo.Item;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

//数据访问层
public class OrderDao {
	// 根据ID得到已完成的交易条目
	@SuppressWarnings("finally")
	public List<Item> getTradedItem(int id) {
		connectDB();
		List<Item> list = new ArrayList<Item>();
		String sql = "select * from item where order_id=" + id + " and purchase_or_not=1";
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
	public List<Item> getUntradedItem(int id) {
		connectDB();
		List<Item> list = new ArrayList<Item>();
		String sql = "select * from item where order_id=" + id + " and purchase_or_not=0";
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

	// 得到数据库订单表下一出现的订单id
	public int getExpectedId() {
		connectDB();
		String sql = "select max(order_id) from order_info";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next())
				return resultSet.getInt(1) + 1;
			return 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		} finally {
			disconnectDB();
		}
	}

	// 生成新的订单记录
	public void generateOrder(int orderId, Date date) {
		connectDB();
		String sql = "insert into order_info values(" + orderId + ",'" + date + "',1)";
		try {
			getStatement().executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disconnectDB();
		}
	}

	// 根据订单ID设置其不可见
	public void setInvisible(int orderId) {
		connectDB();
		String sql = "update order_info set visible=0 where order_id=" + orderId;
		try {
			getStatement().executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disconnectDB();
	}

	// 根据交易日期查询订单数
	public int getOrderVolume(Date date) {
		connectDB();
		String sql = "select count(*) from order_info where order_date='" + date + "'";
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

	//得到交易的时间范围
	public List<Date> getDateRange(){
		connectDB();
		LinkedHashSet<Date> set=new LinkedHashSet<Date>();
		String sql="select order_date from order_info order by order_date desc";
		try {
			ResultSet resultSet=getStatement().executeQuery(sql);
			while(resultSet.next()){
				set.add(resultSet.getDate(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disconnectDB();
		}
		return new ArrayList<Date>(set);
	}
}
