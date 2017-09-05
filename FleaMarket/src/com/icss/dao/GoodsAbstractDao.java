package com.icss.dao;

import static com.icss.dao.DBHandle.connectDB;
import static com.icss.dao.DBHandle.disconnectDB;
import static com.icss.dao.DBHandle.getStatement;

import java.sql.ResultSet;
import java.sql.SQLException;

//���ݷ��ʲ�
public class GoodsAbstractDao {
	// ��Ʒ��������
	public boolean generateGoodsType(String type, String descrption, int price, String imgPath, int remain) {
		connectDB();
		String sql = "insert into goods_abstract values('" + type + "','" + descrption + "'," + price + ",'" + imgPath
				+ "'," + remain + ")";
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
}
