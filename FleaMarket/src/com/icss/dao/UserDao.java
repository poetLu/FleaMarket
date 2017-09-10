package com.icss.dao;

import static com.icss.dao.DBHandle.connectDB;
import static com.icss.dao.DBHandle.disconnectDB;
import static com.icss.dao.DBHandle.getStatement;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import com.icss.vo.GoodsAbstract;
import com.icss.vo.Item;
import com.icss.vo.Order;
import com.icss.vo.User;

//���ݷ��ʲ�
public class UserDao {
	// �����û�
	public void addUser(String id, String account, String password, Date loginDate, String name, String sex,
			Date birthday, String telepohne, String email, int points) throws SQLException {
		connectDB();
		String sql = "insert into user values('" + id + "','" + account + "','" + password + "','" + loginDate + "','"
				+ name + "','" + sex + "','" + birthday + "','" + telepohne + "','" + email + "'," + points + ")";
		getStatement().executeUpdate(sql);
		disconnectDB();
	}

	// ɾ���û�
	public void deleteUserById(String id) {
		connectDB();
		String sql = "delete from user where user_id='" + id + "'";
		try {
			getStatement().executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disconnectDB();
	}

	// ��ѯ�Ƿ�Ϊ��Ч���˺�
	public boolean isValidAccount(String account) throws SQLException {
		connectDB();
		String sql = "select * from user where user_account='" + account + "'";
		ResultSet resultSet = getStatement().executeQuery(sql);
		if (resultSet.next())
			return true;
		disconnectDB();
		return false;
	}

	// ��ѯ�˺��Ƿ�������ƥ��
	public boolean isMatch(String account, String password) throws SQLException {
		connectDB();
		String sql = "select user_password from user where user_account='" + account + "'";
		ResultSet resultSet = getStatement().executeQuery(sql);
		if (resultSet.next() && resultSet.getString(1).equals(password)) {
			return true;
		}
		disconnectDB();
		return false;
	}

	// ����ID�õ�����
	public String getPassword(String id) {
		connectDB();
		String sql = "select user_password from user where user_id='" + id + "'";
		ResultSet resultSet;
		try {
			resultSet = getStatement().executeQuery(sql);
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

	// �޸�����
	public boolean resetPassword(String id, String password) {
		connectDB();
		String sql = "update user set user_password='" + password + "' where user_id='" + id + "'";
		int records;
		try {
			records = getStatement().executeUpdate(sql);
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
		ResultSet resultSet;
		try {
			resultSet = getStatement().executeQuery(sql);
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
	public int getPoints(String id) throws SQLException {
		connectDB();
		String sql = "select points from user where user_id='" + id + "'";
		ResultSet resultSet = getStatement().executeQuery(sql);
		if (resultSet.next())
			return resultSet.getInt(1);
		disconnectDB();
		return 0;

	}

	// ����ID�õ�����
	public String getName(String id) throws SQLException {
		connectDB();
		String sql = "select name from user where user_id='" + id + "'";
		ResultSet resultSet = getStatement().executeQuery(sql);
		if (resultSet.next())
			return resultSet.getString(1);
		disconnectDB();
		return null;
	}

	// ����ID�༭����
	public boolean setName(String id, String name) {
		connectDB();
		String sql = "update user set name='" + name + "' where user_id='" + id + "'";
		int records;
		try {
			records = getStatement().executeUpdate(sql);
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

	// ����ID�õ�����
	public Date getDate(String id) throws SQLException {
		connectDB();
		String sql = "select birthday from user where user_id='" + id + "'";
		ResultSet resultSet = getStatement().executeQuery(sql);
		if (resultSet.next())
			return resultSet.getDate(1);
		disconnectDB();
		return null;
	}

	// ����ID�õ��Ա�
	public String getSex(String id) throws SQLException {
		connectDB();
		String sql = "select sex from user where user_id='" + id + "'";
		ResultSet resultSet = getStatement().executeQuery(sql);
		if (resultSet.next())
			return resultSet.getString(1);
		disconnectDB();
		return null;
	}

	// ����ID�༭�Ա�
	public boolean setSex(String id, String sex) {
		connectDB();
		String sql = "update user set sex='" + sex + "' where user_id='" + id + "'";
		int records;
		try {
			records = getStatement().executeUpdate(sql);
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

	// ����ID�༭����
	public boolean setBirthday(String id, Date date) {
		connectDB();
		String sql = "update user set birthday='" + date + "' where user_id='" + id + "'";
		int records;
		try {
			records = getStatement().executeUpdate(sql);
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

	// ����ID�༭����
	@SuppressWarnings("deprecation")
	public boolean setBirthday(String id, int year, int month, int day) throws SQLException {
		connectDB();
		Date date = new Date(year, month, day);
		String sql = "update user set birthday='" + date + "' where user_id='" + id + "'";
		int records = getStatement().executeUpdate(sql);
		if (records == 0)
			return false;
		disconnectDB();
		return true;
	}

	// ����ID�õ��绰
	public String getTelephone(String id) throws SQLException {
		connectDB();
		String sql = "select telephone from user where user_id='" + id + "'";
		ResultSet resultSet = getStatement().executeQuery(sql);
		if (resultSet.next())
			return resultSet.getString(1);
		disconnectDB();
		return null;
	}

	// ����ID�༭�绰
	public boolean setTelphone(String id, String telephone) {
		connectDB();
		String sql = "update user set telephone='" + telephone + "' where user_id='" + id + "'";
		int records;
		try {
			records = getStatement().executeUpdate(sql);
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

	// �����û�ID�õ��û�δ�������Ʒ��Ŀ
	public List<Item> getUntradedItem(String id) throws SQLException {
		List<Item> list = new ArrayList<Item>();
		connectDB();
		String sql = "select * from item where buyer_id='" + id + "' and purchase_or_not=0";
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
			int visible = resultSet.getInt("visible");
			list.add(new Item(itemId, orderId, goodsId, price, amount, buyerId, dealerId, date, (byte) 0, visible));
		}
		disconnectDB();
		return list;
	}

	// �����û�ID�õ��û��Ѹ������Ʒ��Ŀ
	public List<Item> getTradedItem(String id) throws SQLException {
		List<Item> list = new ArrayList<Item>();
		connectDB();
		String sql = "select * from item where buyer_id='" + id + "' and purchase_or_not=1";
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
			int visible = resultSet.getInt("visible");
			list.add(new Item(itemId, orderId, goodsId, price, amount, buyerId, dealerId, date, (byte) 1, visible));
		}
		disconnectDB();
		return list;
	}

	// �����û�ID�Ͷ���ID�õ��û��˴���Ҫ�������Ʒ��Ŀ
	public List<Item> getPreparedTradedItem(String userId, int order_id) {
		List<Item> list = new ArrayList<Item>();
		connectDB();
		String sql = "select * from item where buyer_id='" + userId + "' and purchase_or_not=1 and order_id="
				+ order_id;
		ResultSet resultSet;
		try {
			resultSet = getStatement().executeQuery(sql);
			while (resultSet.next()) {
				int itemId = resultSet.getInt("item_id");
				int orderId = resultSet.getInt("order_id");
				int goodsId = resultSet.getInt("goods_id");
				int price = resultSet.getInt("price");
				int amount = resultSet.getInt("amount");
				String buyerId = resultSet.getString("buyer_id");
				String dealerId = resultSet.getString("dealer_id");
				Date date = resultSet.getDate("item_date");
				int visible = resultSet.getInt("visible");
				list.add(new Item(itemId, orderId, goodsId, price, amount, buyerId, dealerId, date, (byte) 1, visible));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disconnectDB();
		return list;
	}

	// ����ID�õ���ַ
	public String getAddress(String id) {
		connectDB();
		String sql = "select email_address from user where user_id='" + id + "'";
		ResultSet resultSet;
		try {
			resultSet = getStatement().executeQuery(sql);
			if (resultSet.next())
				return resultSet.getString(1);
			return "��";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "��";
		} finally {
			disconnectDB();
		}
	}

	// ����ID�༭��ַ
	public boolean modifyEmail(String id, String address) {
		connectDB();
		String sql = "update user set email_address='" + address + "' where user_id='" + id + "'";
		int records;
		try {
			records = getStatement().executeUpdate(sql);
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
	public List<Order> getTradeOrder(String id) throws SQLException {
		List<Item> list = getTradedItem(id);
		connectDB();
		Set<Order> set = new LinkedHashSet<Order>();
		for (Item item : list) {
			String sql = "select * from order_info where order_id=(select order_id from item where item_id="
					+ item.getItemId() + ")";
			ResultSet resultSet = getStatement().executeQuery(sql);
			while (resultSet.next()) {
				int order_id = resultSet.getInt(1);
				Date order_date = resultSet.getDate(2);
				int visible = resultSet.getInt(3);
				set.add(new Order(order_id, order_date, visible));
			}
		}
		disconnectDB();
		return new ArrayList<Order>(set);
	}

	// ����ID�鿴δ����Ķ���
	public List<Order> getUntradeOrder(String id) throws SQLException {
		List<Item> list = getUntradedItem(id);
		connectDB();
		Set<Order> set = new LinkedHashSet<Order>();
		for (Item item : list) {
			int orderId = item.getOrderId();
			Date orderDate = item.getItemDate();
			int visible = 1;
			set.add(new Order(orderId, orderDate, visible));
		}
		disconnectDB();
		return new ArrayList<Order>(set);
	}

	// ����ID�鿴δ���۵���Ʒ
	public List<Item> getUnsoldItem(String id) {
		List<Item> list = new ArrayList<Item>();
		connectDB();
		String sql = "select * from item where dealer_id='" + id + "' and purchase_or_not=0";
		ResultSet resultSet;
		try {
			resultSet = getStatement().executeQuery(sql);
			while (resultSet.next()) {
				int itemId = resultSet.getInt("item_id");
				int orderId = resultSet.getInt("order_id");
				int goodsId = resultSet.getInt("goods_id");
				int price = resultSet.getInt("price");
				int amount = resultSet.getInt("amount");
				String buyerId = resultSet.getString("buyer_id");
				String dealerId = resultSet.getString("dealer_id");
				Date date = resultSet.getDate("item_date");
				int visible = resultSet.getInt("visible");
				list.add(new Item(itemId, orderId, goodsId, price, amount, buyerId, dealerId, date, (byte) 1, visible));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disconnectDB();
		return list;
	}

	// ����ID�鿴�ѳ��۵���Ʒ
	public List<Item> getSoldItem(String id) {
		List<Item> list = new ArrayList<Item>();
		connectDB();
		String sql = "select * from item where dealer_id='" + id + "' and purchase_or_not=1";
		ResultSet resultSet;
		try {
			resultSet = getStatement().executeQuery(sql);
			while (resultSet.next()) {
				int itemId = resultSet.getInt("item_id");
				int orderId = resultSet.getInt("order_id");
				int goodsId = resultSet.getInt("goods_id");
				int price = resultSet.getInt("price");
				int amount = resultSet.getInt("amount");
				String buyerId = resultSet.getString("buyer_id");
				String dealerId = resultSet.getString("dealer_id");
				Date date = resultSet.getDate("item_date");
				int visible = resultSet.getInt("visible");
				list.add(new Item(itemId, orderId, goodsId, price, amount, buyerId, dealerId, date, (byte) 1, visible));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disconnectDB();
		return list;
	}

	// �õ�Ŀǰ��վ���ܻ�Ա��
	public int getMemberAmount() {
		connectDB();
		String sql = "select count(*) from user";
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

	// �õ���ǰ���ڵĻ�Ա
	public List<User> getAllUser() {
		connectDB();
		List<User> list = new ArrayList<User>();
		String sql = "select * from user order by login_date desc";
		try {
			ResultSet resultSet = getStatement().executeQuery(sql);
			while (resultSet.next()) {
				String userId = resultSet.getString(1);
				String userAccount = resultSet.getString(2);
				String userPassword = resultSet.getString(3);
				Date loginDate = resultSet.getDate(4);
				String name = resultSet.getString(5);
				String sex = resultSet.getString(6);
				Date birthday = resultSet.getDate(7);
				String telephone = resultSet.getString(8);
				String address = resultSet.getString(9);
				int points = resultSet.getInt(10);
				list.add(new User(userId, userAccount, userPassword, loginDate, name, sex, birthday, telephone, address,
						points));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disconnectDB();
		return list;
	}
}