package com.icss.dao;

import static com.icss.dao.DBHandle.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//数据访问层
public class MessageDao {
	// 根据ID查看收到的消息
	@SuppressWarnings("finally")
	public List<String> getMessage(String id) {
		List<String> list = new ArrayList<String>();
		connectDB();
		String sql = "select message_content from message where user_id='" + id + "'";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			while (resultSet.next()) {
				list.add(resultSet.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disconnectDB();
			return list;
		}
	}

	// 根据ID发送消息
	public boolean setMessage(String id, String content) {
		connectDB();
		String sql = "insert into message values('" + content + "','" + id + "')";
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
