package com.icss.dao;

import static com.icss.dao.DBHandle.connectDB;
import static com.icss.dao.DBHandle.disconnectDB;
import static com.icss.dao.DBHandle.getStatement;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

//���ݷ��ʲ�
public class GoodsAbstractDao {
	

	// ������Ʒ���͵õ���Ʒ�˺ŵ���
	public int getPrice(String type) {
		connectDB();
		String sql = "select price from goods_abstract where goods_type='" + type + "'";
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

	// ������Ʒ���͵õ���Ʒ�˺ſ��
	public int getRemain(String type) {
		connectDB();
		String sql = "select remain from goods_abstract where goods_type='" + type + "'";
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
	
	//������Ʒ���͵õ���Ʒ����
	public String getDescription(String type){
		connectDB();
		String sql = "select goods_description from goods_abstract where goods_type='" + type + "'";
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
}
