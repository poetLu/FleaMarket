package com.icss.dao;

import static com.icss.dao.DBHandle.connectDB;
import static com.icss.dao.DBHandle.disconnectDB;
import static com.icss.dao.DBHandle.getStatement;

import java.sql.ResultSet;
import java.sql.SQLException;

//���ݷ��ʲ�
public class GoodsDao {
	// ����ID�õ���Ʒ����
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

	// ����ID�õ���Ʒ�˺�
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

	// ����ID�õ���Ʒ����
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

	// ����ID�õ�����ID
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

	// ��Ʒ�ϼ�(id����)
	public boolean upShelf(String account, String password, String type, String dealerId) {
		connectDB();
		String sql = "insert into goods values('" + account + "','" + password + "','" + dealerId + "')";
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

	// ��Ʒ�¼�
	public boolean upShelf(int id) {
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
}
