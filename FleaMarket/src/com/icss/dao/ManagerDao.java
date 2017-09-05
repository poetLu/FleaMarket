package com.icss.dao;

import static com.icss.dao.DBHandle.connectDB;
import static com.icss.dao.DBHandle.disconnectDB;
import static com.icss.dao.DBHandle.getStatement;

import java.sql.ResultSet;
import java.sql.SQLException;

//���ݷ��ʲ�
public class ManagerDao {
	// ��ѯ�Ƿ�Ϊ��Ч���˺�
	public boolean isValidAccount(String account) {
		connectDB();
		String sql = "select * from manager where manager_account='" + account + "'";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next())
				return true;
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			disconnectDB();
		}
	}

	// ��ѯ�˺��Ƿ�������ƥ��
	public boolean isMatch(String account, String password) {
		connectDB();
		String sql = "select manager_password from manager where manager_account='" + account + "'";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next() && resultSet.getString(1).equals(password)) {
				return true;
			}
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			disconnectDB();
		}
	}
}
