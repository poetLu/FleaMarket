<%@page import="com.icss.vo.Goods"%>
<%@page import="com.icss.dao.GoodsDao"%>
<%@page import="com.icss.dao.GoodsAbstractDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>搜索页面</title>

	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

	<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

	<link href="../css/seastyle.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>
	<script type="text/javascript" src="../js/script.js"></script>
</head>
<%
	GoodsAbstractDao goodsAbstractDao=new GoodsAbstractDao();
	GoodsDao goodsDao=new GoodsDao();
	String type=request.getParameter("game");
%>
<body>

	<!--顶部导航条 -->
	<div class="am-container header">
		<ul class="message-l">
			<div class="topMessage">
				<div class="menu-hd">
					<%
					String userId=(String)session.getAttribute("userId");
					int amount=0;
					if(userId==null){
					%>
					<a href="login.html" target="_top" class="h">亲，请登录</a>&nbsp;&nbsp;&nbsp;
					<a href="register.html" target="_top">免费注册</a>
					<%
				}else{
					amount=goodsDao.getWhetherSell(userId, type);
				%>
				<a href="../person/index.jsp"><font size="4" color="red"><%=userId %></font></a><font size="4">,你好</font>
				<% } %>
			</div>
		</div>
	</ul>
	<ul class="message-r">
		<div class="topMessage home">
			<div class="menu-hd"><a href="/FleaMarket/home" target="_top" class="h">商城首页</a></div>
		</div>
		<div class="topMessage my-shangcheng">
			<div class="menu-hd MyShangcheng"><a href="/FleaMarket/personalCenter" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
		</div>
		<div class="topMessage mini-cart">
			<div class="menu-hd"><a id="mc-menu-hd" href="/FleaMarket/shoppingcartGlance" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a></div>
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
		<form>
			<input id="searchInput" name="game" type="text" placeholder="搜索" autocomplete="off">
			<input id="ai-topsearch" class="submit am-btn"  value="搜索" index="1" type="submit">
		</form>
	</div>
</div>

<div class="clear"></div>
<b class="line"></b>
<div class="search">
	<div class="search-list">
		<div class="nav-table">
			<div class="long-title"><span class="all-goods">游戏如人生</span></div>
		</div>
		
		
		<div class="am-g am-g-fixed">
			<div class="am-u-sm-12 am-u-md-12">
				<div class="theme-popover">														
					<ul class="select">
						<p class="title font-normal">
							<span class="fl"><%=type %></span>&nbsp;
							<span class="total fl">搜索到<strong class="num"><%=goodsDao.getGoods(type).size()-amount %></strong>件相关商品</span>
						</p>
						<div class="clear"></div>
						
					</ul>
					<div class="clear"></div>
				</div>
				<div class="search-content">
					<div class="sort">
						<li class="first"><a title="综合">综合排序</a></li>
					</div>
					<div class="clear"></div>

					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
						<%for(Goods goods:goodsDao.getGoods(type)){ 
							if(goods.getDealerId().equals(userId))
									continue;
						%>
						<li>
							<div class="i-pic limit">
								<a class="title fl" href="introduction.jsp?game=<%=type%>&dealerId=<%=goods.getDealerId() %>" target="_top">
								<img href="introduction.jsp?game=<%=type%>&dealerId=<%=goods.getDealerId() %>" target="_blank" src="../images/<%=type %>.jpg" />											
								<font color="#9D9D9D">【<%=type %>】</font><br><%=goodsAbstractDao.getDescription(type) %>
								&nbsp;&nbsp;&nbsp;<p><font color="#2894FF">卖家：<%=goods.getDealerId() %></font></p>
								<p class="price fl">
									<b>¥</b>
									<strong><%=goodsAbstractDao.getPrice(type) %></strong>
								</p>
								<p class="number fl">
									库存<span><%=goods.getRemain() %></span>
								</p>
								</a>
							</div>
						</li>
						<%} %>
</ul>
</div>
<div class="search-side">

	<div class="side-title">
		经典搭配
	</div>

	<li>
		<div class="i-pic check">
		<a href="introduction.jsp?game=王者荣耀&dealerId=愁容骑士" target="_top">
			<img src="../images/王者荣耀.jpg" />
			<p class="check-title">王者荣耀</p>
			<p class="price fl">
				<b>¥</b>
				<strong><%=goodsAbstractDao.getPrice("王者荣耀") %></strong>
			</p>
			<p class="number fl">
				库存<span><%=goodsAbstractDao.getRemain("王者荣耀") %></span>
			</p>
		</a>
		</div>
	</li>
	<li>
		<div class="i-pic check">
		<a href="introduction.jsp?game=英雄联盟&dealerId=幽默大师" target="_top">
			<img src="../images/英雄联盟.jpg" />
			<p class="check-title">英雄联盟</p>
			<p class="price fl">
				<b>¥</b>
				<strong><%=goodsAbstractDao.getPrice(type) %></strong>
			</p>
			<p class="number fl">
				库存<span><%=goodsAbstractDao.getRemain(type) %></span>
			</p>
		</a>
		</div>
	</li>
	<li>
		<div class="i-pic check">
		<a href="introduction.jsp?game=天涯明月刀&dealerId=愁容骑士" target="_top">
			<img src="../images/天涯明月刀.jpg" />
			<p class="check-title">天涯明月刀</p>
			<p class="price fl">
				<b>¥</b>
				<strong><%=goodsAbstractDao.getPrice("天涯明月刀") %></strong>
			</p>
			<p class="number fl">
				库存<span><%=goodsAbstractDao.getRemain("天涯明月刀") %></span>
			</p>
		</a>
		</div>
	</li>

</div>
<div class="clear"></div>
<!--分页 -->
<ul class="am-pagination am-pagination-right">
	<li class="am-disabled"><a href="#">&laquo;</a></li>
	<li class="am-active"><a href="#">1</a></li>
	<li><a href="#">2</a></li>
	<li><a href="#">3</a></li>
	<li><a href="#">4</a></li>
	<li><a href="#">5</a></li>
	<li><a href="#">&raquo;</a></li>
</ul>

</div>
</div>
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

</div>
<script>
	window.jQuery || document.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
</script>
<script type="text/javascript" src="../basic/js/quick_links.js"></script>

<div class="theme-popover-mask"></div>

</body>

</html>