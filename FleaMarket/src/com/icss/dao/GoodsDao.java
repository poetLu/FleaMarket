package com.icss.dao;

import static com.icss.dao.DBHandle.connectDB;
import static com.icss.dao.DBHandle.disconnectDB;
import static com.icss.dao.DBHandle.getStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.icss.vo.Goods;

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

	// ��������ID�õ������ҳ��۵�ĳ��������Ʒ������
	public int getAmountOfSpecificGoodsByDealerId(String dealerId, String type) {
		connectDB();
		String sql = "select remain from goods where user_id='" + dealerId + "' and goods_type='" + type + "'";
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

	//��������ID�ж��Ƿ����ĳ�����͵���Ʒ����Ϊ1����Ϊ0(��������������ʾ���������ټ������Ʒ)
	public int getWhetherSell(String dealerId,String type){
		connectDB();
		String sql = "select * from goods where user_id='" + dealerId + "' and goods_type='" + type + "'";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next()) {
				return 1; 
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
	
	// ��Ʒ�ϼ�(id����)
	public boolean upShelf(String account, String password, String type, String dealerId) {
		String sql;
		int remain = getAmountOfSpecificGoodsByDealerId(dealerId, type);
		connectDB();
		if (remain == 0) {
			sql = "insert into goods(goods_account,goods_password,goods_type,user_id,remain) values('" + account + "','"
					+ password + "','" + type + "','" + dealerId + "',1)";
		} else {
			remain++;
			sql = "update goods set remain=" + remain + " where user_id='" + dealerId + "' and goods_type='" + type
					+ "'";
		}
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
	public boolean downShelf(String type, String dealerId) {
		connectDB();
		String sql;
		int remain = getAmountOfSpecificGoodsByDealerId(dealerId, type);
		if (remain > 1) {
			remain--;
			sql = "update goods set remain=" + remain + " where user_id='" + dealerId + "' and goods_type='" + type
					+ "'";
		} else {
			sql = "delete from goods where user_id='" + dealerId + "' and goods_type='" + type + "'";
		}
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
	
	//������ƷID�õ���Ʒ���
	public int getRemain(int goodsId){
		connectDB();
		String sql="select remain from goods where goods_id="+goodsId;
		try {
			ResultSet resultSet=getStatement().executeQuery(sql);
			if(resultSet.next())
				return resultSet.getInt(1);
			return 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}finally {
			disconnectDB();
		}
	}
	
	//��Ʒ������
	public void remainDecrease(int goodsId,int amount){
		int remain=getRemain(goodsId);
		connectDB();
		remain-=amount;
		String sql="update goods set remain="+remain+" where goods_id="+goodsId;
		try {
			getStatement().executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disconnectDB();
		}
	}

	// ������Ʒ���͵õ���Ʒ�˺ŵļ���
	public List<Goods> getGoods(String type) {
		connectDB();
		List<Goods> list = new ArrayList<Goods>();
		String sql = "select * from goods where goods_type='" + type + "'";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			while (resultSet.next()) {
				Goods goods = new Goods(resultSet.getInt("goods_id"), resultSet.getString("goods_account"),
						resultSet.getString("goods_password"), type, resultSet.getString("user_id"),
						resultSet.getInt("remain"));
				list.add(goods);
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
	
	//��������ID����Ϸ���͵õ���Ʒid
	public int getGoodsId(String dealerId,String type){
		connectDB();
		String sql="select goods_id from goods where user_id='"+dealerId+"' and goods_type='"+type+"'";
		try {
			ResultSet resultSet=getStatement().executeQuery(sql);
			if(resultSet.next())
				return resultSet.getInt(1);
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
