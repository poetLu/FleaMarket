<%@page import="com.icss.dao.UserDao"%>
<%
	String userId=(String)session.getAttribute("userId");
	UserDao userDao=new UserDao();
%>
