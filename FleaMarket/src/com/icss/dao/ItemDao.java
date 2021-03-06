package com.icss.dao;

import static com.icss.dao.DBHandle.connectDB;
import static com.icss.dao.DBHandle.disconnectDB;
import static com.icss.dao.DBHandle.getStatement;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.icss.vo.Item;

//数据访问层
public class ItemDao {
	// 根据条目ID得到价格
	public int getPrice(int id) {
		connectDB();
		String sql = "select price from item where idem_id=" + id;
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

	// 根据条目ID得到订单ID
	public int getOrderId(int id) {
		connectDB();
		String sql = "select order_id from item where idem_id=" + id;
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

	// 根据条目ID得到商品ID
	public int getGoodsId(int id) {
		connectDB();
		String sql = "select goods_id from item where item_id=" + id;
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

	// 根据条目ID得到买家ID
	public String getBuyerId(int id) {
		connectDB();
		String sql = "select buyer_id from item where idem_id=" + id;
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

	// 根据条目ID得到卖家ID
	public String getDealerId(int id) {
		connectDB();
		String sql = "select dealer_id from item where idem_id=" + id;
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

	// 根据条目ID得到所购商品数量
	public int getAmount(int id) {
		connectDB();
		String sql = "select amount from item where item_id=" + id;
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

	// 根据条目ID设置商品数量，主要为 +/- 1
	public boolean setAmount(int id) {
		int amount = getAmount(id);
		connectDB();
		String sql = "update table item set amount=" + (++amount) + "where item_id=id";
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

	// 根据条目ID得到是否已经交易
	public byte getTradeMessage(int id) {
		connectDB();
		String sql = "select purchase_or_not from item where idem_id=" + id;
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next()) {
				return resultSet.getByte(1);
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

	// 根据条目ID设置为已交易
	public boolean setTradeMessage(int id) {
		connectDB();
		String sql = "update item set purchase_or_not=1 where item_id=" + id;
		try {
			int records = getStatement().executeUpdate(sql);
			if (records == 0) {
				return false;
			}
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			disconnectDB();
		}
	}

	// 根据条目ID得到交易日期
	public Date getDate(int id) {
		connectDB();
		String sql = "select item_date from item where idem_id=" + id;
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next()) {
				return resultSet.getDate(1);
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

	// 根据条目ID设置交易日期
	public boolean setDate(int id, int year, int month, int day) {
		connectDB();
		@SuppressWarnings("deprecation")
		String sql = "update item set item_date='" + new Date(year, month, day) + "'where item_id=" + id;
		try {
			int records = getStatement().executeUpdate(sql);
			if (records == 0) {
				return false;
			}
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			disconnectDB();
		}
	}
	
	//商品加入购物车后生成新的条目
	public void newUntradedItem(int orderId,int goodsId,int price,int amount,String buyerId,String dealerId,Date itemDate){
		connectDB();
		String sql="insert into item(order_id,goods_id,price,amount,buyer_id,dealer_id,item_date,purchase_or_not,visible) values("+orderId+","+goodsId+","+price+","+amount+",'"+buyerId+"','"+dealerId+"','"+itemDate+"',0,1)";
		try {
			getStatement().executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disconnectDB();
		}
	}
	
	//用户点击删除按钮后该未交易的订单删除
	public void deleteItem(int itemId){
		connectDB();
		String sql="delete from item where item_id="+itemId;
		try {
			getStatement().executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disconnectDB();
		}
	}
	
	//用户点击结算后将选择的条目的购物字段置为1
	public void payItem(int itemId){
		connectDB();
		String sql="update item set purchase_or_not=1 where item_id="+itemId;
		try {
			getStatement().executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disconnectDB();
		}
	}
	
	//根据日期查询日交易量
	public int getTradingVolume(Date date){
		connectDB();
		int volume=0;
		String sql="select amount from item where item_date='"+date+"'";
		try {
			ResultSet resultSet=getStatement().executeQuery(sql);
			while(resultSet.next())
				volume+=resultSet.getInt(1);
			return volume;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}finally {
			disconnectDB();
		}
	}
	
	//根据日期查询日交易额
	public int getTradingMoney(Date date){
		connectDB();
		int total=0;
		String sql="select * from item where item_date='"+date+"'";
		try {
			ResultSet resultSet=getStatement().executeQuery(sql);
			while(resultSet.next()){
				total+=resultSet.getInt("price")*resultSet.getInt("amount");
			}
			return total;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}	finally {
			disconnectDB();
		}
	}
	
	//根据日期降序查询所有成功出售的商品
	public List<Item> getItemByDateDesc(){
		connectDB();
		List<Item> list=new ArrayList<Item>();
		String sql="select * from item order by item_id desc";
		try {
			ResultSet resultSet=getStatement().executeQuery(sql);
			while(resultSet.next()){
				int itemId=resultSet.getInt("item_id");
				int orderId=resultSet.getInt("order_id");
				int goodsId=resultSet.getInt("goods_id");
				int price=resultSet.getInt("price");
				int amount=resultSet.getInt("amount");
				String buyerId=resultSet.getString("buyer_id");
				String dealerId=resultSet.getString("dealer_id");
				Date itemDate=resultSet.getDate("item_date");
				byte purchaseOrNot=resultSet.getByte("purchase_or_not");
				int visible=resultSet.getInt("visible");
				list.add(new Item(itemId, orderId, goodsId, price, amount, buyerId, dealerId, itemDate, purchaseOrNot,visible));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disconnectDB();
		return list;
	}
	
	//管理员删除记录
	public void deleteRecord(int itemId){
		connectDB();
		String sql="delete from item where item_id="+itemId;
		try {
			getStatement().executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disconnectDB();
	}
	
	//根据条目ID设置对用户不可见
	public void setInvisible(int itemId){
		connectDB();
		String sql="update item set visible=0 where item_id="+itemId;
		try {
			getStatement().executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disconnectDB();
	}
}
