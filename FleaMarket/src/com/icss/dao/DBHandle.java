package com.icss.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBHandle {
	private static Connection connection;
	private static Statement statement;
	private static String dbUrl = "jdbc:mysql://localhost:3306/market?useUnicode=true&characterEncoding=UTF-8";
	private static String dbUser = "root";
	private static String dbPwd = "Lu0.00a.aa95";

	public static void connectDB() {
		try {
			// 加载MySQL驱动器
			Class.forName("com.mysql.jdbc.Driver");
			// 注册MySQL驱动器
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			// 用适当的驱动器连接到数据库
			connection = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
			// 创建一个SQL声明
			statement = connection.createStatement();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Statement getStatement() {
		return statement;
	}

	public static void disconnectDB() {
		try {
			if(statement!=null)
				statement.close();
			if(connection!=null)
				connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace	();
		}
	}
}
