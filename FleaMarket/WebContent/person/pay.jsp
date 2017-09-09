<%@page import="com.icss.dao.OrderDao"%>
<%@page import="com.icss.dao.GoodsAbstractDao"%>
<%@page import="com.icss.dao.GoodsDao"%>
<%@page import="com.icss.vo.Item"%>
<%@page import="com.icss.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>结算页面</title>

	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />

	<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />

	<link href="../css/jsstyle.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="../js/address.js"></script>

</head>
<%!
	UserDao userDao=new UserDao();
	GoodsDao goodsDao=new GoodsDao();
	GoodsAbstractDao goodsAbstractDao=new GoodsAbstractDao();
	OrderDao orderDao=new OrderDao();
%>
<body>

	<!--顶部导航条 -->
	<div class="am-container header">
		<ul class="message-l">
			<div class="topMessage">
				<div class="menu-hd">
					<%
					String userId = (String) session.getAttribute("userId");
					if (userId == null) {
					%>
					<a href="../home/login.html" target="_top" class="h">亲，请登录</a>&nbsp;&nbsp;&nbsp;
					<a href="../home/register.html" target="_top">免费注册</a>
					<%
				} else {
				%>
				<a href="../person/index.jsp"><font size="4" color="red"><%=userId%></font></a><font
				size="4">,你好</font>
				<%
			}
			%>
		</div>
	</div>
</ul>
<ul class="message-r">
	<div class="topMessage home">
		<div class="menu-hd"><a href="/FleaMarket/home" target="_top" class="h">商城首页</a></div>
	</div>
	<div class="topMessage my-shangcheng">
		<div class="menu-hd MyShangcheng"><a href="index.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
	</div>
	<div class="topMessage mini-cart">
		<div class="menu-hd"><a id="mc-menu-hd" href="shopcart.jsp" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a></div>
	</div>
</ul>
</div>

<!--悬浮搜索框-->

<div class="nav white">
	<div class="logo"><img src="../images/logo.png" /></div>
	<div class="logoBig">
		<li><img src="../images/logobig.png" /></li>
	</div>

	<div class="search-bar pr">
		<a name="index_none_header_sysc" href="#"></a>
		<form action="../home/search.jsp">
			<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
			<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
		</form>
	</div>
</div>

<div class="clear"></div>
<div class="concent">
	<!--地址 -->
	<div class="paycont">
		<div class="address">
			<div class="clear"></div>
			<ul>
				<div class="per-border"></div>
				<li class="user-addresslist defaultAddr">

					<div class="address-left">
						<div class="user DefaultAddr">

							<span class="buy-address-detail">   
								<span class="buy-user"><%=userId%> </span>
								<br/>
								<span><%=userDao.getAddress(userId) %></span>
							</span>
						</div>

						<ins class="deftip">默认地址</ins>
					</div>
					<div class="address-right">
						<a href="../person/address.html">
							<span class="am-icon-angle-right am-icon-lg"></span></a>
						</div>
						<div class="clear"></div>

						<div class="new-addr-btn">
							<a href="address.jsp" target="_top"><font color="#46A3FF">编辑</font></a>
						</div>

					</li>
					<div class="per-border"></div>
				</ul>
				<div class="clear"></div>
			</div>

			<!--订单 -->
			<div class="concent">
				<div id="payTable">
					<h3>商品确认</h3>
					<div class="cart-table-th">
						<div class="wp">

							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>
					<%
					int total=0;
					int orderId=orderDao.getExpectedId();
					for(Item item:userDao.getPreparedTradedItem(userId, orderId)) {
						int itemId=item.getItemId();
						String type=goodsDao.getType(item.getGoodsId());
						String description=goodsAbstractDao.getDescription(type);
						int unitprice=item.getPrice();
						int amount=item.getAmount();
						int totalprice=unitprice*amount;
						total+=totalprice;
					%>
					<tr class="item-list">
						<div class="bundle  bundle-last">

							<div class="bundle-main">
								<ul class="item-content clearfix">
									<div class="pay-phone">
										<li class="td td-item">
											<div class="item-pic">
												<a href="#" class="J_MakePoint">
													<img src="../images/ly1.jpg" class="itempic J_ItemImg"></a>
												</div>
												<div class="item-info">
													<div class="item-basic-info">
														<%=type %><br /><%=description %>
													</div>
												</div>

											</li>
											<li class="td td-price">
												<div class="item-price price-promo-promo">
													<div class="price-content">
														<em class="J_Price price-now"><%=unitprice %></em>
													</div>
												</div>
											</li>
										</div>
										<li class="td td-sum" style="margin-left: 50px">
											<div class="td-inner">
												<em tabindex="0" class="J_ItemSum number"><%=amount %></em>
											</div>
										</li>
										<li class="td td-sum" style="margin-left: 48px">
											<div class="td-inner">
												<em tabindex="0" class="J_ItemSum number"><%=totalprice %></em>
											</div>
										</li>

									</ul>
									<div class="clear"></div>

								</div>
							</tr>
							<%} %>
							<div class="clear"></div>
						</div>

					</div>
					<div class="clear"></div>
				</div>

				<!--信息 -->
				<div class="order-go clearfix">
					<div class="pay-confirm clearfix">
						<div class="box">
							<div tabindex="0" id="holyshit267" class="realPay"><em class="t">应付：</em>
								<span class="price g_price ">
									<span>¥</span> <em class="style-large-bold-red " id="J_ActualFee"><%=total %></em>
								</span>
							</div>


						</p>
						<p class="buy-footer-address">
							<span class="buy-line-title">收货信息：</span>
							<span class="buy-address-detail">   
								<span class="buy-user"><%=userId %></span><span>|</span>
								<span class="buy-phone"><%=userDao.getAddress(userId) %></span>
							</span>
						</p>
					</div>
				</div>

				<div id="holyshit269" class="submitOrder">
					<div class="go-btn-wrap">
						<a id="J_Go" href="/FleaMarket/orderGenerate?total=<%=total %>" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>

	<div class="clear"></div>
</div>
</div>
<div class="footer">
	<div class="footer-hd">
		<p>
			<a href="#">王者解毒</a>
			<b>|</b>
			<a href="#">商城首页</a>
			<b>|</b>
			<a href="#">支付宝</a>

		</p>
	</div>
	<div class="footer-bd">
		<p>
			<a href="#">关于王者解毒</a>
			<a href="#">合作伙伴</a>
			<a href="#">联系我们</a>
			<a href="#">网站地图</a>
			<em>© 2015-2025 wzjd.com 版权所有. 
			</p>
		</div>
	</div>
</div>
</body>

</html>