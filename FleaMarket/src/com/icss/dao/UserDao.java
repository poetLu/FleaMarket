package com.icss.dao;

import com.icss.vo.Item;
import com.icss.vo.Order;
import com.icss.vo.User;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;
import com.sun.org.apache.bcel.internal.generic.Select;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils.Collections;

import static com.icss.dao.DBHandle.*;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

//���ݷ��ʲ�
public class UserDao {
	// �����û�
	public void addUser(String id, String account, String password, Date loginDate, String name, String sex,
			Date birthday, int telepohne, StringNameHelper email, int points) {
		connectDB();
		String sql = "insert into user values('" + id + "'," + "'" + account + "'," + "'" + password + "'," + "'"
				+ loginDate + "'," + "'" + name + "'," + "'" + sex + "'," + "'" + birthday + "'," + "'" + telepohne
				+ "'," + "'" + email + "'," + points;
		try {
			getStatement().executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnectDB();
		}
	}

	// ɾ���û�
	public void deleteUserById(String id) {
		connectDB();
		String sql = "delete from user where user_id='" + id + "'";
		try {
			getStatement().executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnectDB();
		}
	}

	// ��ѯ�Ƿ�Ϊ��Ч���˺�
	public boolean isValidAccount(String account) {
		connectDB();
		String sql = "select * from user where user_account='" + account + "'";
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

	// ��ѯ�˺��Ƿ�������ƥ��
	public boolean isMatch(String account, String password) {
		connectDB();
		String sql = "select user_password from user where user_account='" + account + "'";
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

	// �޸�����
	public boolean resetPassword(String account, String password) {
		connectDB();
		String sql = "update user set user_password='" + password + "' where user_account='" + account + "'";
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

	// ��¼�����˺ŵõ�ID
	public String getID(String account) {
		connectDB();
		String sql = "select user_id from user where user_account='" + account + "'";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next())
				return resultSet.getString(1);
			return null;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {
			disconnectDB();
		}
	}

	// ����ID�õ�����
	public int getPoints(String id) {
		connectDB();
		String sql = "select points from user where user_id='" + id + "'";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next())
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

	// ����ID�õ�����
	public String getName(String id) {
		connectDB();
		String sql = "select name from user where user_id='" + id + "'";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next())
				return resultSet.getString(1);
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {
			disconnectDB();
		}
	}

	// ����ID�õ�����
	public Date getDate(String id) {
		connectDB();
		String sql = "select birthday from user where user_id='" + id + "'";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next())
				return resultSet.getDate(1);
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {
			disconnectDB();
		}
	}

	// ����ID�õ��绰
	public int getTelephone(String id) {
		connectDB();
		String sql = "select telephone from user where user_id='" + id + "'";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			if (resultSet.next())
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

	// �����û�ID�õ��û�δ�������Ʒ��Ŀ
	@SuppressWarnings("finally")
	public List<Item> getUntradedItem(String id) {
		List<Item> list = new ArrayList<Item>();
		connectDB();
		String sql = "select * from item where buyer_id='" + id + "' and purchase_or_not=0";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			while (resultSet.next()) {
				int itemId = resultSet.getInt("item_id");
				int orderId = resultSet.getInt("order_id");
				int goodsId = resultSet.getInt("goods_id");
				int price = resultSet.getInt("price");
				int amount = resultSet.getInt("amount");
				String buyerId = resultSet.getString("buyer_id");
				String dealerId = resultSet.getString("dealer_id");
				Date date = resultSet.getDate("item_date");
				list.add(new Item(itemId, orderId, goodsId, price, amount, buyerId, dealerId, date, (byte) 0));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disconnectDB();
			return list;
		}
	}

	// �����û�ID�õ��û��Ѹ������Ʒ��Ŀ
	@SuppressWarnings("finally")
	public List<Item> getTradedItem(String id) {
		List<Item> list = new ArrayList<Item>();
		connectDB();
		String sql = "select * from item where buyer_id='" + id + "' and purchase_or_not=1";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			while (resultSet.next()) {
				int itemId = resultSet.getInt("item_id");
				int orderId = resultSet.getInt("order_id");
				int goodsId = resultSet.getInt("goods_id");
				int price = resultSet.getInt("price");
				int amount = resultSet.getInt("amount");
				String buyerId = resultSet.getString("buyer_id");
				String dealerId = resultSet.getString("dealer_id");
				Date date = resultSet.getDate("item_date");
				list.add(new Item(itemId, orderId, goodsId, price, amount, buyerId, dealerId, date, (byte) 1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disconnectDB();
			return list;
		}
	}

	// ����ID�༭��ַ
	public boolean modifyEmail(String id, String address) {
		connectDB();
		String sql = "update user set email_address='" + address + "' where user_id='" + id + "'";
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

	// ����ID�鿴�Ѹ���Ķ���
	public List<Order> getTradeOrder(String id) {
		List<Item> list = getTradedItem(id);
		connectDB();
		Set<Order> set = new HashSet<Order>();
		for (Item item : list) {
			String sql = "select * from order_info where order_id=(select order_id from item where item_id="
					+ item.getItemId() + ")";
			try {
				ResultSet resultSet = getStatement().executeQuery(sql);
				int order_id = resultSet.getInt(1);
				Date order_date = resultSet.getDate(2);
				set.add(new Order(order_id, order_date));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		disconnectDB();
		return new ArrayList<Order>(set);
	}

	// ����ID�鿴δ����Ķ���
	public List<Order> getUntradeOrder(String id) {
		List<Item> list = getUntradedItem(id);
		connectDB();
		Set<Order> set = new HashSet<Order>();
		for (Item item : list) {
			String sql = "select * from order_info where order_id=(select order_id from item where item_id="
					+ item.getItemId() + ")";
			try {
				ResultSet resultSet = getStatement().executeQuery(sql);
				int order_id = resultSet.getInt(1);
				Date order_date = resultSet.getDate(2);
				set.add(new Order(order_id, order_date));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		disconnectDB();
		return new ArrayList<Order>(set);
	}

	// ����ID�鿴δ���۵���Ʒ
	@SuppressWarnings("finally")
	public List<Item> getUnsoldItem(String id) {
		List<Item> list = new ArrayList<Item>();
		connectDB();
		String sql = "select * from item where dealer_id='" + id + "' and purchase_or_not=0";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			while (resultSet.next()) {
				int itemId = resultSet.getInt("item_id");
				int orderId = resultSet.getInt("order_id");
				int goodsId = resultSet.getInt("goods_id");
				int price = resultSet.getInt("price");
				int amount = resultSet.getInt("amount");
				String buyerId = resultSet.getString("buyer_id");
				String dealerId = resultSet.getString("dealer_id");
				Date date = resultSet.getDate("item_date");
				list.add(new Item(itemId, orderId, goodsId, price, amount, buyerId, dealerId, date, (byte) 0));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disconnectDB();
			return list;
		}
	}

	// ����ID�鿴�ѳ��۵���Ʒ
	@SuppressWarnings("finally")
	public List<Item> getSoldItem(String id) {
		List<Item> list = new ArrayList<Item>();
		connectDB();
		String sql = "select * from item where dealer_id='" + id + "' and purchase_or_not=1";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			while (resultSet.next()) {
				int itemId = resultSet.getInt("item_id");
				int orderId = resultSet.getInt("order_id");
				int goodsId = resultSet.getInt("goods_id");
				int price = resultSet.getInt("price");
				int amount = resultSet.getInt("amount");
				String buyerId = resultSet.getString("buyer_id");
				String dealerId = resultSet.getString("dealer_id");
				Date date = resultSet.getDate("item_date");
				list.add(new Item(itemId, orderId, goodsId, price, amount, buyerId, dealerId, date, (byte) 0));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			disconnectDB();
			return list;
		}
	}
}