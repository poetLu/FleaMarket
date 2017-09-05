package com.icss.dao;

import static com.icss.dao.DBHandle.connectDB;
import static com.icss.dao.DBHandle.disconnectDB;
import static com.icss.dao.DBHandle.getStatement;

import java.sql.ResultSet;
import java.sql.SQLException;

//数据访问层
public class ManagerDao {
	// 查询是否为有效的账号
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

	// 查询账号是否与密码匹配
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
