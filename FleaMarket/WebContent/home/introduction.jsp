<%@page import="com.icss.dao.GoodsDao"%>
<%@page import="com.icss.dao.UserDao"%>
<%@page import="com.icss.dao.GoodsAbstractDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>商品页面</title>

	<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link type="text/css" href="../css/optstyle.css" rel="stylesheet" />
	<link type="text/css" href="../css/style.css" rel="stylesheet" />

	<script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>
	<script type="text/javascript" src="../basic/js/quick_links.js"></script>

	<script type="text/javascript" src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	<script type="text/javascript" src="../js/jquery.imagezoom.min.js"></script>
	<script type="text/javascript" src="../js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="../js/list.js"></script>

</head>

<body>
	<%!
	GoodsAbstractDao goodsAbstractDao=new GoodsAbstractDao();
	GoodsDao goodsDao=new GoodsDao();
	UserDao userDao=new UserDao();
	%>

	<!--顶部导航条 -->
	<div class="am-container header">
		<ul class="message-l">
			<div class="topMessage">
				<div class="menu-hd">
					<%
					String userId=(String)session.getAttribute("userId");
					String game=request.getParameter("game");
					String dealerId=request.getParameter("dealerId");
					if(userId==null){
					%>
					<a href="login.html" target="_top" class="h">亲，请登录</a>&nbsp;&nbsp;&nbsp;
					<a href="register.html" target="_top">免费注册</a>
					<%
				}else{
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
			<div class="menu-hd MyShangcheng"><a href="../person/index.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
		</div>
		<div class="topMessage mini-cart">
			<div class="menu-hd"><a id="mc-menu-hd" href="../person/shopcart.jsp" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a></div>
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
		<form action="search.jsp">
			<input id="searchInput" name="game" type="text" placeholder="搜索" autocomplete="off">
			<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
		</form>
	</div>
</div>

<div class="clear"></div>
<b class="line"></b>
<div class="listMain">

	<!--分类-->
	<div class="nav-table">
		<div class="long-title"><span class="all-goods">游戏如人生</span></div>
	</div>
	<ol class="am-breadcrumb am-breadcrumb-slash">
		<li><a href="#">首页</a></li>
		<li><a href="#">分类</a></li>
		<li class="am-active">内容</li>
	</ol>
	<script type="text/javascript">
		$(function() {});
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation: "slide",
				start: function(slider) {
					$('body').removeClass('loading');
				}
			});
		});
	</script>
	<div class="scoll">
		<section class="slider">
			<div class="flexslider">
				<ul class="slides">
					<li>
						<img src="../images/<%=game %>.jpg" title="pic" />
					</li>
				</ul>
			</div>
		</section>
	</div>

	<!--放大镜-->

	<div class="item-inform">
		<div class="clearfixLeft" id="clearcontent">

			<div class="box">
				<script type="text/javascript">
					$(document).ready(function() {
						$(".jqzoom").imagezoom();
						$("#thumblist li a").click(function() {
							$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
							$(".jqzoom").attr('src', $(this).find("img").attr("mid"));
							$(".jqzoom").attr('rel', $(this).find("img").attr("big"));
						});
					});
				</script>

				<div class="tb-booth tb-pic tb-s310">
					<a href="../images/01.jpg"><img src="../images/<%=game %>.jpg" alt="细节展示放大镜特效" rel="../images/01.jpg" class="jqzoom" /></a>
				</div>
			</div>

			<div class="clear"></div>
		</div>

		<div class="clearfixRight">

			<!--规格属性-->
			<!--名称-->
			<div class="tb-detail-hd">
				<h1>	
					<%=game %>
				</h1>
			</div>
			<div class="tb-detail-list">
				<!--价格-->
				<div class="tb-detail-price">
					<li class="price iteminfo_price">
						<dt>促销价</dt>
						<dd><em>¥</em><b class="sys_item_price"><%=goodsAbstractDao.getPrice(game) %></b>  </dd>                                 
					</li>
					
					<div class="clear"></div>
				</div>

				<!--地址-->
				<dl class="iteminfo_parameter freight">
					<dt>配送至</dt>
					<div class="iteminfo_freprice">
						<div class="am-form-content address">
							<select data-am-selected>
								<option value="a"><%=userDao.getAddress(userId) %></option>
							</select>
						</div>
					</div>
				</dl>
				<div class="clear"></div>

				<div class="clear"></div>

				<!--各种规格-->
				<dl class="iteminfo_parameter sys_item_specpara">
					<dt class="theme-login"><div class="cart-title">可选规格<span class="am-icon-angle-right"></span></div></dt>
					<dd>
						<!--操作页面-->

						<div class="theme-popover-mask"></div>

						<div class="theme-popover">
							<div class="theme-span"></div>
							<div class="theme-poptit">
								<a href="javascript:;" title="关闭" class="close">×</a>
							</div>
							<div class="theme-popbod dform">
								<form class="theme-signin" name="loginform" action="" method="post">

									<div class="theme-signin-left">

										<div class="theme-options">
											<div class="cart-title number">数量</div>
											<dd>
												<input id="min" class="am-btn am-btn-default" name="" type="button" value="-" onclick="decrease()"/>
												<input id="text_box" name="" type="text" value="1" style="width:30px;" disabled="disabled" />
												<input id="add" class="am-btn am-btn-default" name="" type="button" value="+" onclick="increase()" />
												<span id="Stock" class="tb-hidden">库存</span><span class="stock"><%=goodsDao.getAmountOfSpecificGoodsByDealerId(dealerId, game) %></span>件</span>
											</dd>

										</div>
										<div class="clear"></div>

									</div>

								</form>
							</div>
						</div>

					</dd>
				</dl>
				<div class="clear"></div>
				<!--活动	-->
				<div class="shopPromotion gold">
					<div class="hot">
						<dt class="tb-metatit">商品描述</dt>
						<div class="gold-list">
							<p><%=goodsAbstractDao.getDescription(game) %></p>
						</div>
					</div>
				</div>
			</div>

			<div class="pay">
				<li>
					<div class="clearfix tb-btn tb-btn-buy theme-login">
						<a id="LikBuy" title="点此按钮到下一步确认购买信息" onclick="joinShoppingcart()">加入购物车</a>
					</div>
				</li>
				<li>
					<div class="clearfix tb-btn tb-btn-basket theme-login">
						<a id="LikBasket" title="加入购物车" href="../person/shopcart.jsp" target="_top"><i></i>查看购物车</a>
					</div>
				</li>
			</div>
			
			<div id="results" style="margin-top: 65px;margin-left:60px"><font color="red"></font></div>

		</div>

		<div class="clear"></div>

		<div class="clear"></div>

		<div class="footer">
			<div class="footer-hd">
				<p>
					<a href="#">王者解毒科技</a>
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

</div>


</body>

<script type="text/javascript">
	function decrease(){
		var number=document.getElementById("text_box").value;
		if(number>0){
			document.getElementById("text_box").value=number-1;
		}
	}
	function increase(){
		var number=document.getElementById("text_box").value;
		if(number<<%=goodsDao.getAmountOfSpecificGoodsByDealerId(dealerId, game) %>){
			document.getElementById("text_box").value=parseInt(number)+1;
		}
	}
	function joinShoppingcart(){
		var game="<%=game%>";
		var dealerId="<%=dealerId%>";
		var amount=document.getElementById("text_box").value;
		var xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if (xhr.readyState==4){
				if((xhr.status>=200  && xhr.status < 300)|| xhr.status ==304) {
					document.getElementById("results").innerHTML=xhr.responseText;
				} else {
					alert("Request was unsuccessful:"+xhr.status);
				}
			}
		}
		xhr.open("get","http://localhost:8080/FleaMarket/joinshoppingcart?game="+game+"&dealerId="+dealerId+"&amount="+amount,true);
		xhr.send(null);
		setTimeout("document.getElementById('results').innerHTML=''",1000);
	}
</script>

</html>