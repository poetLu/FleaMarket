package com.icss.dao;

import static com.icss.dao.DBHandle.*;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

//数据访问层
public class ItemDao {
	// 根据条目ID得到价格
	public int getPrice(int id) {
		connectDB();
		String sql = "select price from item where idem_id=" + id;
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

	// 根据条目ID得到订单ID
	public int getOrderId(int id) {
		connectDB();
		String sql = "select order_id from item where idem_id=" + id;
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

	// 根据条目ID得到商品ID
	public int getGoodsId(int id) {
		connectDB();
		String sql = "select goods_id from item where idem_id=" + id;
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

	// 根据条目ID得到买家ID
	public int getBuyerId(int id) {
		connectDB();
		String sql = "select buyer_id from item where idem_id=" + id;
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

	// 根据条目ID得到卖家ID
	public int getDealerId(int id) {
		connectDB();
		String sql = "select dealer_id from item where idem_id=" + id;
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

	// 根据条目ID得到所购商品数量
	public int getAmount(int id) {
		connectDB();
		String sql = "select amount from item where idem_id=" + id;
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

	// 根据条目ID设置商品数量，主要为 +/- 1
	public boolean setAmount(int id) {
		int amount = getAmount(id);
		connectDB();
		String sql = "update table item set amount=" + (++amount) + "where item_id=id";
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

	// 根据条目ID得到是否已经交易
	public byte getTradeMessage(int id) {
		connectDB();
		String sql = "select purchase_or_not from item where idem_id=" + id;
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next()) {
				return resultSet.getByte(1);
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

	// 根据条目ID设置为已交易
	public boolean setTradeMessage(int id) {
		connectDB();
		String sql = "update item set purchase_or_not=1 where item_id=" + id;
		try {
			int records = getStatement().executeUpdate(sql);
			if (records == 0) {
				return false;
			}
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			disconnectDB();
		}
	}

	// 根据条目ID得到交易日期
	public Date getDate(int id) {
		connectDB();
		String sql = "select item_date from item where idem_id=" + id;
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next()) {
				return resultSet.getDate(1);
			}
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {
			disconnectDB();
		}
	}

	// 根据条目ID设置交易日期
	public boolean setDate(int id, int year, int month, int day) {
		connectDB();
		@SuppressWarnings("deprecation")
		String sql = "update item set item_date='" + new Date(year, month, day) + "'where item_id=" + id;
		try {
			int records = getStatement().executeUpdate(sql);
			if (records == 0) {
				return false;
			}
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
