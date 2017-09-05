package com.icss.service;

import com.icss.dao.ManagerDao;

public class ManagerService {
	ManagerDao managerDao=new ManagerDao();
	public boolean isManager(String username,String password){
		return true;
	}
}
