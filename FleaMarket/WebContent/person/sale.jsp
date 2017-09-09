<%@page import="com.icss.service.ItemService"%>
<%@page import="com.icss.dao.OrderDao"%>
<%@page import="com.icss.vo.Item"%>
<%@page import="com.icss.vo.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>我的出售</title>

<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="../css/personal.css" rel="stylesheet" type="text/css">
<link href="../css/orstyle.css" rel="stylesheet" type="text/css">

<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>

<style>
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 88);
}

.white_content {
	display: none;
	position: absolute;
	top: 30%;
	left: 35%;
	width: 25%;
	height: 15%;
	padding: 20px;
	border: 3px solid gray;
	background-image: url('../images/why.jpg');
	z-index: 1002;
	overflow: auto;
}
</style>

</head>
<%@include file="common.jsp"%>
<%!OrderDao orderDao = new OrderDao();
	ItemService itemService = new ItemService();%>
<body>
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
	<div id="light" class="white_content">
		<table>
			<tr>
				<td><label><font color="white">商品类型</font></label></td>
				<td><select id="games">
						<option value="王者荣耀">王者荣耀</option>
						<option value="qq账号">qq账号</option>
						<option value="英雄联盟">英雄联盟</option>
						<option value="DNF地下城">DNF地下城</option>
						<option value="梦幻西游">梦幻西游</option>
						<option value="诛仙3">诛仙3</option>
						<option value="剑灵">剑灵</option>
						<option value="天龙八部">天龙八部</option>
						<option value="冒险岛2">冒险岛2</option>
						<option value="天涯明月刀">天涯明月刀</option>
				</select></td>
			</tr>
			<tr>
				<td><font color="white">账号</font></td>
				<td><input type="text" id="account"></td>
			</tr>
			<tr>
				<td><font color="white">密码</font></td>
				<td><input type="text" id="password"></td>
			</tr>
			<tr>
				<td><input type="submit" value="确认" onclick="sale()"></td>
				<td><button
						onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">取消</button></td>
			</tr>
			<tr>
				<td id="results"><font color="red"></font></td>
			</tr>
		</table>
	</div>

	<script type="text/javascript">
		function sale() {
			var games = document.getElementById("games");
			var game = games.options[games.selectedIndex].value;

			var account = document.getElementById("account").value;
			var password = document.getElementById("password").value;
			if (!account) {
				alert("请填写账号")
			} else if (!password) {
				alert("请填写密码");
			} else {
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
				xhr.open("get", "http://localhost:8080/FleaMarket/sale?game="
						+ game + "&account=" + account + "&password="
						+ password, false);
				xhr.send(null);
				setTimeout("window.location.reload()", 900);
			}
		}
	</script>

	<div id="fade" class="black_overlay"></div>
	<div class="nav-table">
		<div class="long-title">
			<span class="all-goods">游戏如人生</span>
		</div>
	</div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-order">

					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">我的出售</strong> / <small>Sale</small>
						</div>
						<div style="margin-left: 940px">
							<a href="JavaScript:void(0)"
								onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"><font
								color="red">新增商品</font></a>
						</div>
					</div>
					<hr />
					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

						<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#tab1">已交易</a></li>
							<li><a href="#tab2">未交易</a></li>
						</ul>

						<div class="am-tabs-bd">
							<div class="am-tab-panel am-fade am-in am-active" id="tab1">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">

										<div class="order-status5">

											<div class="order-content">
												<%
													for (Item item : userDao.getSoldItem(userId)) {
												%>
												<div class="order-left">
													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="../images/b1.jpg" class="itempic J_ItemImg">
																</a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p><%=itemService.getGoodsAbstractType(item.getItemId())%></p>
																		<p class="info-little"><%=itemService.getGoodsAbstractDescription(item.getItemId())%></p>
																	</a>
																</div>
															</div>
														</li>
														<li class="td td-price">
															<div class="item-price">
																<%=item.getPrice()%>
															</div>
														</li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span><%=item.getAmount()%>
															</div>
														</li>
														<li class="td td-operation">
															<div class="item-operation"></div>
														</li>
													</ul>

												</div>

												<div class="order-right" style="left: 555px;">
													<li class="td td-amount">
														<div class="item-amount">
															<%=item.getPrice() * item.getAmount()%>
														</div>
													</li>
													<div class="move-right">
														<li class="td td-change">
															<div class="am-btn am-btn-danger anniu">删除</div>
														</li>
													</div>
												</div>
												<%
													}
												%>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="am-tab-panel am-fade" id="tab2">

								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">剩余数量</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<div class="order-status1">
											<div class="order-content">
												<%
													for (Item item : userDao.getUnsoldItem(userId)) {
												%>
												<div class="order-left">
													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="../images/b2.jpg" class="itempic J_ItemImg"
																	height=80%>
																</a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p><%=itemService.getGoodsAbstractType(item.getItemId())%></p>
																		<p class="info-little"><%=itemService.getGoodsAbstractDescription(item.getItemId())%></p>
																	</a>
																</div>
															</div>
														</li>
														<li class="td td-price">
															<div class="item-price">
																<%=item.getPrice()%>
															</div>
														</li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span><%=item.getAmount()%>
															</div>
														</li>
														<li class="td td-operation">
															<div class="item-operation"></div>
														</li>
													</ul>


												</div>
												<div class="order-right" style="left: 555px">
													<div class="move-right">
														<li class="td td-change"><a href="pay.html">
																<div class="am-btn am-btn-danger anniu">删除</div>
														</a></li>
													</div>
												</div>
												<%
													}
												%>
											</div>
										</div>
									</div>
								</div>
							</div>
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
				<li class="person active"><a href="index.html">个人中心</a></li>
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