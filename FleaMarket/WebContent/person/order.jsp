<%@page import="com.icss.vo.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

	<title>订单管理</title>

	<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

	<link href="../css/personal.css" rel="stylesheet" type="text/css">
	<link href="../css/orstyle.css" rel="stylesheet" type="text/css">

	<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>

</head>
<%@include file="common.jsp" %>
<body>
	<!--头 -->
	<header>
		<article>
			<div class="mt-logo">
				<!--顶部导航条 -->
				<div class="am-container header">
					<ul class="message-r">
						<div class="topMessage home">
							<div class="menu-hd"><a href="/FleaMarket/home" target="_blank" class="h">商城首页</a></div>
						</div>
						<div class="topMessage my-shangcheng">
							<div class="menu-hd MyShangcheng"><a href="index.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
						</div>
						<div class="topMessage mini-cart">
							<div class="menu-hd"><a id="mc-menu-hd" href="shopcart.jsp" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
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
						<form>
							<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
							<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
						</form>
					</div>
				</div>

				<div class="clear"></div>
			</div>
		</div>
	</article>
</header>
<div class="nav-table">
	<div class="long-title"><span class="all-goods">游戏如人生</span></div>
</div>
<b class="line"></b>
<div class="center">
	<div class="col-main">
		<div class="main-wrap">

			<div class="user-order">

				<!--标题 -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
				</div>
				<hr/>

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
									<!--交易成功-->
									<div class="order-status5">
										
										<div class="order-title">
											<div class="dd-num">订单编号：<a href="javascript:;">1601430</a></div>
											<span>成交时间：2017-8-31</span>
										</div>
										<div class="order-content">
											<div class="order-left">
												<ul class="item-list">
													<li class="td td-item">
														<div class="item-pic">
															<a href="#" class="J_MakePoint">
																<img src="../images/b1.jpg" class="itempic J_ItemImg">
															</a>
														</div>
														<div class="item-info">
															<div class="item-basic-info">
																<a href="#">
																	<p>王者荣耀全英雄全皮肤</p>
																	<p class="info-little">平台：微信</p>
																</a>
															</div>
														</div>
													</li>
													<li class="td td-price">
														<div class="item-price">
															333.00
														</div>
													</li>
													<li class="td td-number">
														<div class="item-number">
															<span>×</span>2
														</div>
													</li>
													<li class="td td-operation">
														<div class="item-operation">
															
														</div>
													</li>
												</ul>

											</div>
											<div class="order-right">
												<li class="td td-amount">
													<div class="item-amount">
														合计：666.00
													</div>
												</li>
												<div class="move-right">
													<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus">交易成功</p>
														</div>
													</li>
													<li class="td td-change">
														<div class="am-btn am-btn-danger anniu">
															删除订单</div>
														</li>
													</div>
												</div>	
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
											<div class="order-title">
												<div class="dd-num">订单编号：<a href="javascript:;">1601430</a></div>
												<span>成交时间：2017-8-31</span>
												<!--    <em>店铺：小桔灯</em>-->
											</div>
											<div class="order-content">
												<div class="order-left">
													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint">
																	<img src="../images/b2.jpg" class="itempic J_ItemImg"  height=80%>
																</a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>问道土系万年道行高力敏打手</p>
																		<p class="info-little">平台：PC</p>
																	</a>
																</div>
															</div>
														</li>
														<li class="td td-price">
															<div class="item-price">
																333.00
															</div>
														</li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div>
														</li>
														<li class="td td-operation">
															<div class="item-operation">

															</div>
														</li>
													</ul>

													
												</div>
												<div class="order-right">
													<li class="td td-amount">
														<div class="item-amount">
															合计：666.00</p>
														</div>
													</li>
													<div class="move-right">
														<li class="td td-status">
															<div class="item-status">
																<p class="Mystatus">等待买家付款</p>
																<p class="order-info"><a href="#">取消订单</a></p>

															</div>
														</li>
														<li class="td td-change">
															<a href="pay.html">
																<div class="am-btn am-btn-danger anniu">
																	一键支付</div></a>
																</li>
															</div>
														</div>

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
								<a href="#">解毒科技</a>
								<b>|</b>
								<a href="#">商城首页</a>
								<b>|</b>
								<a href="#">支付宝</a>
								<b>|</b>
								<a href="#">物流</a>
							</p>
						</div>
						<div class="footer-bd">
							<p>
								<a href="#">关于解毒</a>
								<a href="#">合作伙伴</a>
								<a href="#">联系我们</a>
								<a href="#">网站地图</a>
							</p>
						</div>

					</div>
				</div>
				<aside class="menu">
					<ul>
						<li class="person active">
							<a href="index.html">个人中心</a>
						</li>
						<li class="person">
							<font size="3">个人资料</font>
							<ul>
								<li> <a href="information.jsp">个人信息</a></li>
								<li> <a href="password.jsp">密码修改</a></li>
								<li> <a href="address.jsp">收货地址</a></li>
							</ul>
						</li>
						<li class="person">
							<font size="3">我的交易</font>
							<ul>
								<li><a href="order.jsp">订单管理</a></li>
								<li><a href="sale.jsp">我的出售</a></li>
							</ul>
						</li>

						<li class="person">
							<font size="3">我的小窝</font>
							<ul>
								<li> <a href="news.jsp">消息</a></li>
							</ul>
						</li>

					</ul>

				</aside>
			</div>

		</body>

		</html>