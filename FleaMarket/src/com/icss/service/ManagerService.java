package com.icss.service;

import com.icss.dao.ManagerDao;

public class ManagerService {
	ManagerDao managerDao = new ManagerDao();

	// �ж��Ƿ����ʹ�ô��˺Ž��е�½
	public String canLogin(String username, String password) {
		if (!managerDao.isValidAccount(username)) {
			return "���˺Ų�����";
		} else if (!managerDao.isMatch(username, password)) {
			return "�����������������";
		} else {
			return "index.html";
		}
	}
}
