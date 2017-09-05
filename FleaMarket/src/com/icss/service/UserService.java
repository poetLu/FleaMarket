package com.icss.service;

import com.icss.dao.UserDao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {
	UserDao userDao=new UserDao();
	public boolean isOldUser(String username){
		return true;
	}
}
