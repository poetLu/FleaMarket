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
			// ����MySQL������
			Class.forName("com.mysql.jdbc.Driver");
			// ע��MySQL������
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			// ���ʵ������������ӵ����ݿ�
			connection = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
			// ����һ��SQL����
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
