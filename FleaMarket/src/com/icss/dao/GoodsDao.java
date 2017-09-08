package com.icss.dao;

import static com.icss.dao.DBHandle.connectDB;
import static com.icss.dao.DBHandle.disconnectDB;
import static com.icss.dao.DBHandle.getStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//数据访问层
public class GoodsDao {
	// 根据ID得到商品类型
	public String getType(int id) {
		connectDB();
		String sql = "select goods_type from goods where goods_id=" + id;
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next()) {
				return resultSet.getString(1);
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

	// 根据ID得到商品账号
	public String getAccount(int id) {
		connectDB();
		String sql = "select goods_account from goods where goods_id=" + id;
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next()) {
				return resultSet.getString(1);
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

	// 根据ID得到商品密码
	public String getPassword(int id) {
		connectDB();
		String sql = "select goods_password from goods where goods_id=" + id;
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next()) {
				return resultSet.getString(1);
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

	// 根据ID得到卖家ID
	public String getDealer(int id) {
		connectDB();
		String sql = "select user_id from goods where goods_id=" + id;
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next()) {
				return resultSet.getString(1);
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

	// 商品上架(id自增)
	public boolean upShelf(String account, String password, String type, String dealerId) {
		connectDB();
		String sql = "insert into goods(goods_account,goods_password,goods_type,user_id) values('" + account + "','" + password + "','" +type+"','"+ dealerId + "')";
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

	// 商品下架
	public boolean downShelf(int id) {
		connectDB();
		String sql = "delete from goods where goods_id=" + id;
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
	
	//根据商品类型得到商品ID
	public List<Integer> getId(String type){
		connectDB();
		List<Integer> list=new ArrayList<Integer>();
		String sql = "select goods_id from goods where goods_type=" + type;
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			while (resultSet.next()) {
				list.add(resultSet.getInt(1));
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {
			disconnectDB();
		}
	}
}
