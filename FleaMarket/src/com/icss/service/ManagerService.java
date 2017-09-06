package com.icss.service;

import com.icss.dao.ManagerDao;

public class ManagerService {
	ManagerDao managerDao = new ManagerDao();

	// 判断是否可以使用此账号进行登陆
	public String canLogin(String username, String password) {
		if (!managerDao.isValidAccount(username)) {
			return "此账号不存在";
		} else if (!managerDao.isMatch(username, password)) {
			return "密码错误，请重新输入";
		} else {
			return "index.html";
		}
	}
}
