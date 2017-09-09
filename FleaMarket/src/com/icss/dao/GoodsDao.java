package com.icss.dao;

import static com.icss.dao.DBHandle.connectDB;
import static com.icss.dao.DBHandle.disconnectDB;
import static com.icss.dao.DBHandle.getStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.icss.vo.Goods;

//数据访问层
public class GoodsDao {
	// 根据ID得到商品类型
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

	// 根据ID得到商品账号
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

	// 根据ID得到商品密码
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

	// 根据ID得到卖家ID
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

	// 根据卖家ID得到此卖家出售的某种类型商品的数量
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

	//根据卖家ID判断是否出售某种类型的商品，是为1，否为0(用于搜索界面显示搜索到多少件相关商品)
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
	
	// 商品上架(id自增)
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

	// 商品下架
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
	
	//根据商品ID得到商品库存
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
	
	//商品库存减少
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

	// 根据商品类型得到商品账号的集合
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
	
	//根据卖家ID和游戏类型得到商品id
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
