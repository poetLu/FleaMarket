package com.icss.service;

import com.icss.dao.UserDao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {
	UserDao userDao=new UserDao();
	//�ж��Ƿ����ʹ�ô��˺Ž���ע��
	public boolean canRegister(String username) throws SQLException{
		return !userDao.isValidAccount(username);
	}
	//�ж��Ƿ����ʹ�ô��˺Ž��е�½
	public String canLogin(String username,String password) throws SQLException{
		if(!userDao.isValidAccount(username)){
			return "���˺Ų�����";
		}else if(!userDao.isMatch(username, password)){
			return "�����������������";
		}else{
			return "home.jsp";
		}
	}
	//������Ϣ�޸ĺ�ı���
	public boolean storeInformation(String id,String name,String sex,int year,int month,int day,String telephone) throws SQLException{
		return(userDao.setName(id, name)&&userDao.setSex(id, sex)&&userDao.setBirthday(id, year, month, day)&&userDao.setTelphone(id, telephone));
	}
}
