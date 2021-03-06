<%@page import="com.sun.xml.internal.ws.api.Cancelable"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.icss.dao.UserDao,com.icss.vo.Order"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
<title>个人中心</title>
<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">
<link href="../css/personal.css" rel="stylesheet" type="text/css">
<link href="../css/systyle.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%!
		private String getWeekOfDate(Calendar calendar) {
			String[] weekDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", };
			int w = calendar.get(Calendar.DAY_OF_WEEK) - 1;
			if (w < 0)
				w = 0;
			return weekDays[w];
		}
	%>
	<%
		String userId = (String) session.getAttribute("userId");
		UserDao userDao = new UserDao();
		int points = userDao.getPoints(userId);
		List<Order> tradedOrder = userDao.getTradeOrder(userId);
		List<Order> untradedOrder = userDao.getUntradeOrder(userId);
		Date date = new Date();
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(date);
	%>
	<!--头 -->
	<header> <article>
	<div class="mt-logo">
		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-r">
				<div class="topMessage home">
					<div class="menu-hd">
						<a href="/FleaMarket/home" target="_blank" class="h">商城首页</a>
					</div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<a href="index.jsp" target="_top"><i
							class="am-icon-user am-icon-fw"></i>个人中心</a>
					</div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd">
						<a id="mc-menu-hd" href="shopcart.jsp" target="_top"><i
							class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a>
					</div>
				</div>
			</ul>
		</div>
		<!--悬浮搜索框-->
		<div class="nav white">
			<div class="logoBig">
				<li><img src="../images/logobig.png" /></li>
			</div>
			<div class="search-bar pr">
				<a name="index_none_header_sysc" href="#"></a>
				<form action="../home/search.jsp">
					<input id="searchInput" name="game" type="text"
						placeholder="搜索" autocomplete="off"> <input
						id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
						type="submit">
				</form>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	</div>
	</article> </header>
	<div class="nav-table">
		<div class="long-title">
			<span class="all-goods">游戏如人生</span>
		</div>
	</div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">
				<div class="wrap-left">
					<div class="wrap-list">
						<div class="m-user">
							<!--个人信息 -->
							<div class="m-bg"></div>
							<div class="m-userinfo">
								<div class="m-baseinfo">
									<a href="information.html"> <img
										src="../images/getAvatar.do.jpg">
									</a> <em class="s-name"><%=userId%></em>
								</div>
								<div class="m-right">
									<div class="m-new">
										<a href="news.jsp"><i class="am-icon-bell-o"></i>消息</a>
									</div>
									<div class="m-address">
										<a href="address.jsp" class="i-trigger">我的收货地址</a>
									</div>
								</div>
							</div>
							<!--个人资产-->
							<div class="m-userproperty">
								<div class="s-bar">
									<i class="s-icon"></i>个人积分&nbsp;&nbsp;<font color="red"><%=points%></font>
								</div>
							</div>
						</div>
						<div class="box-container-bottom"></div>
						<!--订单 -->
						<div class="m-order">
							<div class="s-bar">
								<i class="s-icon"></i>我的订单 <a class="i-load-more-item-shadow"
									href="order.html">全部订单</a>
							</div>
							<ul>
								<li><a href="order.jsp"><i><img
											src="../images/pay.png" /></i><span>已付款<em class="m-num"><%=tradedOrder.size()%></em></span></a></li>
								<li><a href="order.jsp"><i><img
											src="../images/comment.png" /></i><span>待付款<em
											class="m-num"><%=untradedOrder.size()%></em></span></a></li>
							</ul>
						</div>
						<!--收藏夹 -->
						<div class="you-like">
							<div class="s-bar">
								平台力荐 <a class="am-badge am-badge-danger am-round">HOT</a> <a
									class="i-load-more-item-shadow" href="#"><i
									class="am-icon-refresh am-icon-fw"></i>换一组</a>
							</div>
							<div class="s-content">
								<div class="s-item-wrap">
									<div class="s-item">
										<div class="s-pic">
											<a href="#" class="s-pic-link"> <img
												src="../images/b1.jpg" alt="王者荣耀全英雄全皮肤"
												class="s-pic-img s-guess-item-img" height="100px">
											</a>
										</div>
										<div class="s-price-box">
											<span class="s-price"><em class="s-price-sign">¥</em><em
												class="s-value">42.50</em></span> <span class="s-history-price"><em
												class="s-price-sign">¥</em><em class="s-value">68.00</em></span>
										</div>
										<div class="s-title">
											<a href="#" title="王者荣耀全英雄全皮肤">王者荣耀全英雄全皮肤</a>
										</div>
										<div class="s-extra-box">
											<span class="s-comment">好评: 98.03%</span> <span
												class="s-sales">月销: 219</span>
										</div>
									</div>
								</div>
								<div class="s-item-wrap">
									<div class="s-item">
										<div class="s-pic">
											<a href="#" class="s-pic-link"> <img
												src="../images/b2.jpg" alt="问道土系万年道行高力敏打手"
												title="问道土系万年道行高力敏打手" class="s-pic-img s-guess-item-img"
												height="100px">
											</a>
										</div>
										<div class="s-price-box">
											<span class="s-price"><em class="s-price-sign">¥</em><em
												class="s-value">49.90</em></span> <span class="s-history-price"><em
												class="s-price-sign">¥</em><em class="s-value">88.00</em></span>
										</div>
										<div class="s-title">
											<a href="#" title="问道土系万年道行高力敏打手">问道土系万年道行高力敏打手</a>
										</div>
										<div class="s-extra-box">
											<span class="s-comment">好评: 99.74%</span> <span
												class="s-sales">月销: 69</span>
										</div>
									</div>
								</div>
								<div class="s-item-wrap">
									<div class="s-item">
										<div class="s-pic">
											<a href="#" class="s-pic-link"> <img
												src="../images/b3.jpg" alt="英雄联盟全英雄/全皮肤/龙瞎/电玩系列"
												title="英雄联盟全英雄/全皮肤/龙瞎/电玩系列"
												class="s-pic-img s-guess-item-img" height="100px">
											</a>
										</div>
										<div class="s-price-box">
											<span class="s-price"><em class="s-price-sign">¥</em><em
												class="s-value">378.00</em></span> <span class="s-history-price"><em
												class="s-price-sign">¥</em><em class="s-value">1888.00</em></span>
										</div>
										<div class="s-title">
											<a href="#" title="英雄联盟全英雄/全皮肤/龙瞎/电玩系列">英雄联盟全英雄/全皮肤/龙瞎/电玩系列</a>
										</div>
										<div class="s-extra-box">
											<span class="s-comment">好评: 99.93%</span> <span
												class="s-sales">月销: 278</span>
										</div>
									</div>
								</div>
								<div class="s-item-wrap">
									<div class="s-item">
										<div class="s-pic">
											<a href="#" class="s-pic-link"> <img
												src="../images/b4.jpg" alt="" title="魔兽世界重装无敌血牛"
												class="s-pic-img s-guess-item-img" height="100px">
											</a>
										</div>
										<div class="s-price-box">
											<span class="s-price"><em class="s-price-sign">¥</em><em
												class="s-value">42.50</em></span> <span class="s-history-price"><em
												class="s-price-sign">¥</em><em class="s-value">68.00</em></span>
										</div>
										<div class="s-title">
											<a href="#" title="魔兽世界重装无敌血牛">魔兽世界重装无敌血牛</a>
										</div>
										<div class="s-extra-box">
											<span class="s-comment">好评: 98.03%</span> <span
												class="s-sales">月销: 219</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="wrap-right">
					<!-- 日历-->
					<div class="day-list">
						<div class="s-bar">
							<a class="i-history-trigger s-icon" href="#"></a>我的日历 <a
								class="i-setting-trigger s-icon" href="#"></a>
						</div>
						<div class="s-care s-care-noweather">
							<div class="s-date">
								<em><%=calendar.get(Calendar.DAY_OF_MONTH)%></em> 
								<span><%=getWeekOfDate(calendar)%></span>
								<span><%=calendar.get(Calendar.YEAR)%>.<%=calendar.get(Calendar.MONTH)+1%></span>
							</div>
						</div>
					</div>
					<!--热卖推荐 -->
					<div class="new-goods">
						<div class="s-bar">
							<i class="s-icon"></i>热卖推荐
						</div>
						<div class="new-goods-info">
							<a class="shop-info" href="#" target="_blank">
								<div>
									<img src="../images/b5.jpg" alt="">
								</div> <span class="one-hot-goods">靓号 ￥9.20</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<!--底部-->
			<div class="footer">
				<div class="footer-hd">
					<p>
						<a href="#">解毒科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
							href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
					</p>
				</div>
				<div class="footer-bd">
					<p>
						<a href="#">关于解毒</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a
							href="#">网站地图</a>
					</p>
				</div>
			</div>
		</div>
		<aside class="menu">
		<ul>
			<li class="person active"><a href="index.jsp">个人中心</a></li>
			<li class="person"><font size="3">个人资料</font>
				<ul>
					<li><a href="information.jsp">个人信息</a></li>
					<li><a href="password.jsp">密码修改</a></li>
					<li><a href="address.jsp">收货地址</a></li>
				</ul></li>
			<li class="person"><font size="3">我的交易</font>
				<ul>
					<li><a href="order.jsp">订单管理</a></li>
					<li><a href="sale.jsp">我的出售</a></li>
				</ul></li>

			<li class="person"><font size="3">我的小窝</font>
				<ul>
					<li><a href="news.jsp">消息</a></li>
				</ul></li>
		</ul>
		</aside>
	</div>
</body>
</html>