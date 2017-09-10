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

//���ݷ��ʲ�
public class ItemDao {
	// ������ĿID�õ��۸�
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

	// ������ĿID�õ�����ID
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

	// ������ĿID�õ���ƷID
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

	// ������ĿID�õ����ID
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

	// ������ĿID�õ�����ID
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

	// ������ĿID�õ�������Ʒ����
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

	// ������ĿID������Ʒ��������ҪΪ +/- 1
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

	// ������ĿID�õ��Ƿ��Ѿ�����
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

	// ������ĿID����Ϊ�ѽ���
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

	// ������ĿID�õ���������
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

	// ������ĿID���ý�������
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
	
	//��Ʒ���빺�ﳵ�������µ���Ŀ
	public void newUntradedItem(int orderId,int goodsId,int price,int amount,String buyerId,String dealerId,Date itemDate){
		connectDB();
		String sql="insert into item(order_id,goods_id,price,amount,buyer_id,dealer_id,item_date,purchase_or_not) values("+orderId+","+goodsId+","+price+","+amount+",'"+buyerId+"','"+dealerId+"','"+itemDate+"',0)";
		try {
			getStatement().executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disconnectDB();
		}
	}
	
	//�û����ɾ����ť���δ���׵Ķ���ɾ��
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
	
	//�û���������ѡ�����Ŀ�Ĺ����ֶ���Ϊ1
	public void payItem(int itemId){
		connectDB();
		String sql="update item set purchase_or_not=1";
		try {
			getStatement().executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disconnectDB();
		}
	}
	
	//�������ڲ�ѯ�ս�����
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
	
	//�������ڲ�ѯ�ս��׶�
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
	
	//�������ڽ����ѯ���гɹ����۵���Ʒ
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
				list.add(new Item(itemId, orderId, goodsId, price, amount, buyerId, dealerId, itemDate, purchaseOrNot));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disconnectDB();
		return list;
	}
	
	//����Աɾ����¼
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
	
	
}
