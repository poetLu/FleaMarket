<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
<title>个人资料</title>
<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">
<link href="../css/personal.css" rel="stylesheet" type="text/css">
<link href="../css/infstyle.css" rel="stylesheet" type="text/css">
<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"
	type="text/javascript"></script>
</head>
<body>
	<%@ include file="common.jsp"%>
	<!--头 -->
	<header>
		<article>
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
								<a id="mc-menu-hd" href="shopcart.html" target="_top"><i
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
							<input id="searchInput" name="game" type="text" placeholder="搜索"
								autocomplete="off"> <input id="ai-topsearch"
								class="submit am-btn" value="搜索" index="1" type="submit">
						</form>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			</div>
		</article>
	</header>
	<div class="nav-table">
		<div class="long-title">
			<span class="all-goods">游戏如人生</span>
		</div>
	</div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">
				<div class="user-info">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;Information</small>
						</div>
					</div>
					<hr />
					<!--头像 -->
					<div class="user-infoPic">
						<div class="filePic">
							<input type="file" class="inputPic"
								allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"> <img
								class="am-circle am-img-thumbnail"
								src="../images/getAvatar.do.jpg" alt="" />
						</div>
						<p class="am-form-help">头像</p>
						<div class="info-m">
							<div>
								<b>用户名：<i><%=userId%></i></b>
							</div>
						</div>
					</div>
					<!--个人信息 -->
					<div class="info-main">
						<form class="am-form am-form-horizontal">
							<div class="am-form-group">
								<label for="user-name" class="am-form-label">姓名</label>
								<div class="am-form-content">
									<input type="text" id="user-name2"
										placeholder="<%=userDao.getName(userId)%>">
								</div>
							</div>
							<div class="am-form-group">
								<label class="am-form-label">性别</label>
								<%
									String sex = userDao.getSex(userId);
								%>
								<div class="am-form-content sex">
									<label class="am-radio-inline"> <input type="radio"
										name="radio10" value="男" data-am-ucheck
										<%if (sex.equals("男")) {
				out.write("checked=true");
			}%>>
										男
									</label> <label class="am-radio-inline"> <input type="radio"
										name="radio10" value="女" data-am-ucheck
										<%if (sex.equals("女")) {
				out.write("checked=true");
			}%>>
										女
									</label>
								</div>
							</div>
							<%
								Calendar calendar = Calendar.getInstance();
								calendar.setTime(userDao.getDate(userId));
							%>
							<div class="am-form-group">
								<label for="user-birth" class="am-form-label">生日</label>
								<div class="am-form-content birth">
									<div class="birth-select">
										<input type="" name="" id="year" size="10"
											placeholder="<%=calendar.get(Calendar.YEAR)%>"> <label>年</label>
									</div>
									<div class="birth-select2" style="margin-left: -15px">
										<input type="" name="" id="month" size="10"
											placeholder="<%=calendar.get(Calendar.MONTH) + 1%>"> <label>月</label>
									</div>
									<div class="birth-select2">
										<input type="" name="" id="day" size="10"
											placeholder="<%=calendar.get(Calendar.DAY_OF_MONTH)%>">
										<label>日</label>
									</div>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-phone" class="am-form-label">电话</label>
								<div class="am-form-content">
									<input id="user-phone" type="tel"
										placeholder="<%=userDao.getTelephone(userId)%>">
								</div>
							</div>
							<div class="info-btn">
								<div class="am-btn am-btn-danger" onclick="modify()">保存修改</div>
								<div id="results"></div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<script type="text/javascript">
				function modify() {
					var name = document.getElementById("user-name2").value;
					var sexs = document.getElementsByName("radio10");
					var sex;
					for (var i = 0; i < sexs.length; i++) {
						if (sexs[i].checked) {
							sex = sexs[i].value;
							break;
						}
					}
					var year = document.getElementById("year").value;
					var month = document.getElementById("month").value;
					var day = document.getElementById("day").value;
					var telephone = document.getElementById("user-phone").value;
					if (!name) {
						name = document.getElementById("user-name2").placeholder;
					}
					if (!year) {
						year = document.getElementById("year").placeholder;
					}
					if (!month) {
						month = document.getElementById("month").placeholder;
					}
					if (!day) {
						day = document.getElementById("day").placeholder;
					}
					if (!telephone) {
						telephone = document.getElementById("user-phone").placeholder;
					}
					var xhr = new XMLHttpRequest();
					xhr.onreadystatechange = function() {
						if (xhr.readyState == 4) {
							if ((xhr.status >= 200 && xhr.status < 300)
									|| xhr.status == 304) {
								document.getElementById("results").innerHTML = xhr.responseText;
							} else {
								alert("Request was unsuccessful:" + xhr.status);
							}
						}
					}
					xhr.open("get",
							"/FleaMarket/informationModify?name="
									+ name + "&sex=" + sex + "&year=" + year
									+ "&month=" + month + "&day=" + day
									+ "&telephone=" + telephone, false);
					xhr.send(null);
					setTimeout("window.location.reload()", 900);
				}
			</script>

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