package com.icss.service;

import com.icss.dao.UserDao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {
	UserDao userDao=new UserDao();
	//判断是否可以使用此账号进行注册
	public boolean canRegister(String username) throws SQLException{
		return !userDao.isValidAccount(username);
	}
	//判断是否可以使用此账号进行登陆
	public String canLogin(String username,String password) throws SQLException{
		if(!userDao.isValidAccount(username)){
			return "此账号不存在";
		}else if(!userDao.isMatch(username, password)){
			return "密码错误，请重新输入";
		}else{
			return "home.jsp";
		}
	}
	//个人信息修改后的保存
	public boolean storeInformation(String id,String name,String sex,int year,int month,int day,String telephone) throws SQLException{
		return(userDao.setName(id, name)&&userDao.setSex(id, sex)&&userDao.setBirthday(id, year, month, day)&&userDao.setTelphone(id, telephone));
	}
}
