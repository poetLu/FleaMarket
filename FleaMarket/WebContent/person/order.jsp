<%@page import="com.icss.service.OrderService"%>
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

<title>订单管理</title>

<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="../css/personal.css" rel="stylesheet" type="text/css">
<link href="../css/orstyle.css" rel="stylesheet" type="text/css">

<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>

</head>
<%@include file="common.jsp"%>
<%!OrderDao orderDao = new OrderDao();
	ItemService itemService = new ItemService();
	OrderService orderService = new OrderService();%>
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
							<strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small>
						</div>
					</div>
					<hr />

					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

						<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#tab1">已付款</a></li>
							<li><a href="#tab2">待付款</a></li>
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
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<div class="order-status5">


											<%
												for (Order order : userDao.getTradeOrder(userId)) {
													if (order.getVisible() == 0)
														continue;
											%>
											<div class="order-title" id="message<%=order.getOrderId()%>">
												<div class="dd-num">
													订单编号：<a href="javascript:;"><%=order.getOrderId()%></a>
												</div>
												<span>成交时间：<%=order.getOrderDate()%></span>
											</div>
											<div class="order-content"
												id="content<%=order.getOrderId()%>">
												<%
													for (Item item : orderDao.getTradedItem(order.getOrderId())) {
												%>
												<div class="order-left">
													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="../images/<%=itemService.getGoodsAbstractType(item.getItemId())%>.jpg"
																	class="itempic J_ItemImg">
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
												<%
													}
												%>
												<div class="order-right">
													<li class="td td-amount">
														<div class="item-amount">
															合计：<%=orderService.getTotalPrice(order.getOrderId())%>
														</div>
													</li>

													<li class="td td-amount">
														<div class="item-amount">交易成功</div>
													</li>
													<li class="td td-change">
														<div class="am-btn am-btn-danger anniu"
															id="delete<%=order.getOrderId()%>"
															onclick="deleteOrder(this.id)">删除订单</div>
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
							<div class="am-tab-panel am-fade" id="tab2">

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
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<div class="order-status1">
											<%
												for (Order order : userDao.getUntradeOrder(userId)) {
											%>
											<div class="order-title">
												<div class="dd-num">
													订单编号：<a href="javascript:;"><%=order.getOrderId()%></a>
												</div>
												<span>加入时间：<%=order.getOrderDate()%></span>
											</div>
											<div class="order-content">
												<%
													for (Item item : orderDao.getUntradedItem(order.getOrderId())) {
												%>
												<div class="order-left">
													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="../images/<%=itemService.getGoodsAbstractType(item.getItemId())%>.jpg"
																	class="itempic J_ItemImg">
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
												<%
													}
												%>
												<div class="order-right">
													<li class="td td-amount">
														<div class="item-amount">
															合计：<%=orderService.getUnpayTotalPrice(order.getOrderId())%>
														</div>
													</li>

													<div class="move-right">
														<li class="td td-status">
															<div class="item-status">
																<p class="Mystatus">等待卖家付款</p>
															</div>
														</li>
														<li class="td td-change">
															<div class="am-btn am-btn-danger anniu"
																onclick="location='shopcart.jsp'">一键支付</div>
														</li>
													</div>
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

<script type="text/javascript">
	function deleteOrder(deleteId) {
		var orderId = deleteId.substring(6, deleteId.length);
		var messageId = "message" + orderId;
		var contentId = "content" + orderId;
		document.getElementById(messageId).remove();
		document.getElementById(contentId).remove();
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/FleaMarket/hideorder?orderId="
				+ orderId, false);
		xhr.send(null);
		setTimeout("window.location.reload()", 900);
	}
</script>