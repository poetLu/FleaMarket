<%@page import="com.icss.dao.GoodsDao"%>
<%@page import="com.icss.service.ItemService"%>
<%@page import="com.icss.vo.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="common.jsp" %>
<%!
	ItemService itemService=new ItemService();
	GoodsDao goodsDao=new GoodsDao();
%>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>我的消息</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/newstyle.css" rel="stylesheet" type="text/css">

		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>

	</head>

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

					<div class="user-news">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的消息</strong> / <small>News</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2" data-am-tabs>
							<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
								<li><a href="#tab">交易信息</a></li>
							</ul>

							<div class="am-tabs-bd">								
								<div class="am-tab-panel am-fade" id="tab">
									<!--消息 -->
										<%for(Item item:userDao.getTradedItem(userId)){ %>
										<div class="s-msg-item s-msg-temp i-msg-downup">
											<h6 class="s-msg-bar"><span class="s-name">尊贵的<%=userId %></span></h6>
											<div class="s-msg-content i-msg-downup-wrap">
												<div class="i-msg-downup-con">
													<a class="i-markRead" target="_blank" >
													<div class="m-item">	
														<div class="item-pic">															
																	<img src="../images/<%=goodsDao.getType(item.getGoodsId()) %>.jpg" >
														</div>
														<div class="item-info">
															<p class="item-comment">您购买的<%=goodsDao.getType(item.getGoodsId()) %>已发至您的邮箱</p>
															<p class="item-time"><%=item.getItemDate() %></p>
														</div>
                                                    </div>	
													</a>
												</div>
											</div>
											<a class="i-btn-forkout" href="#"><i class="am-icon-close am-icon-fw"></i></a>
										</div>
										<%} %>
										<br>
										<%for(Item item:userDao.getSoldItem(userId)){ %>
										<div class="s-msg-item s-msg-temp i-msg-downup">
											<h6 class="s-msg-bar"><span class="s-name">尊贵的<%=userId %></span></h6>
											<div class="s-msg-content i-msg-downup-wrap">
												<div class="i-msg-downup-con">
													<a class="i-markRead" target="_blank" >
													<div class="m-item">	
														<div class="item-pic">															
																	<img src="../images/<%=goodsDao.getType(item.getGoodsId()) %>.jpg"  >
														</div>
														<div class="item-info">
															<p class="item-comment">您的<%=goodsDao.getType(item.getGoodsId())%>已成功出售</p>
															<p class="item-time"><%=item.getItemDate() %></p>
														</div>
                                                    </div>	
													</a>
												</div>
											</div>
											<a class="i-btn-forkout" href="#"><i class="am-icon-close am-icon-fw"></i></a>
										</div>
										<%} %>
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
						<a href="index.jsp">个人中心</a>
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