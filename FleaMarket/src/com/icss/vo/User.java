package com.icss.vo;

import java.sql.Date;

public class User {
	private String userId;
	private String userAccount;
	private String userPassword;
	private Date loginDate;
	private String name;
	private String sex;
	private Date birthday;
	private String telephone;
	private String emailAddress;
	private int points;

	public User(String userId, String userAccount, String userPassword, Date loginDate, String name, String sex,
			Date birthday, String telephone, String emailAddress, int points) {
		super();
		this.userId = userId;
		this.userAccount = userAccount;
		this.userPassword = userPassword;
		this.loginDate = loginDate;
		this.name = name;
		this.sex = sex;
		this.birthday = birthday;
		this.telephone = telephone;
		this.emailAddress = emailAddress;
		this.points = points;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public int getPoints() {
		return points;
	}

	public void setPoints(int points) {
		this.points = points;
	}
}
