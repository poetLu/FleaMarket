package com.icss.dao;

import static com.icss.dao.DBHandle.connectDB;
import static com.icss.dao.DBHandle.disconnectDB;
import static com.icss.dao.DBHandle.getStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	// ��Ʒ�¼�
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
	
	//������Ʒ���͵õ���ƷID
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
