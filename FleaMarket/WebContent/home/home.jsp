<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>首页</title>

	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

	<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

	<link href="../css/hmstyle.css" rel="stylesheet" type="text/css"/>
	<link href="../css/skin.css" rel="stylesheet" type="text/css" />
	<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

</head>

<body>
	<div class="hmtop">
		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<%
							String userId=(String)session.getAttribute("userId");
							if(userId==null){
						%>
						<a href="login.html" target="_top" class="h">亲，请登录</a>&nbsp;&nbsp;&nbsp;
						<a href="register.html" target="_top">免费注册</a>
						<%
							}else{
						%>
						<a href="../person/index.jsp"><font size="4" color="red"><%=userId %></font></a><font size="4">,你好</font>&nbsp;&nbsp;&nbsp;
						<a href="login.html">切换用户</a>
						<% } %>
					</div>
				</div>
			</ul>
			<ul class="message-r">
				<div class="topMessage home">
					<div class="menu-hd"><a href="home.jsp" target="_top" class="h">商城首页</a></div>
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
				<form action="search.jsp">
					<input id="searchInput" name="game" type="text" placeholder="搜索" autocomplete="off">
					<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
				</form>
			</div>
		</div>

		<div class="clear"></div>
	</div>
	<div class="banner">
		<!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
			<ul class="am-slides">
				<li class="banner1"><a href="search.jsp?game=诛仙3"><img src="../images/ad1.jpg" /></a></li>
				<li class="banner2"><a href="search.jsp?game=王者荣耀"><img src="../images/ad2.jpg" /></a></li>
				<li class="banner3"><a href="search.jsp?game=英雄联盟"><img src="../images/ad3.jpg" /></a></li>
				<li class="banner4"><a href="search.jsp?game=冒险岛2"><img src="../images/ad4.jpg" /></a></li>

			</ul>
		</div>
		<div class="clear"></div>	
	</div>
	<div class="shopNav">
		<div class="slideall">

			<div class="long-title"><span class="all-goods">全部分类</span></div>
			<div class="nav-cont">
				<ul>
					<li class="qc"><a href="search.jsp?game=qq账号">qq账号</a></li>
					<li class="qc"><a href="search.jsp?game=梦幻西游">梦幻西游</a></li>
					<li class="qc"><a href="search.jsp?game=英雄联盟">lol</a></li>
					<li class="qc last"><a href="search.jsp?game=王者荣耀">毒药</a></li>
				</ul>
			</div>					

			<!--侧边导航 -->
			<div id="nav" class="navfull">
				<div class="area clearfix">
					<div class="category-content" id="guide_2">

						<div class="category">
							<ul class="category-list" id="js_climit_li">
								<li class="appliance js_toggle relative first">
									<div class="category-info">
										<h3 class="category-name b-category-name"><i><img src="../images/cake.png"></i><a class="ml-22" href="search.jsp?game=王者荣耀" target="_top"  title="点心">王者荣耀</a></h3>
										<em>&gt;</em>
									</div>
									<b class="arrow"></b>	
								</li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name"><i><img src="../images/cookies.png"></i><a class="ml-22" href="search.jsp?game=qq账号" target="_top" title="饼干、膨化">qq账号</a>
											<a href="/FleaMarket/search?game=qq账号"></a></h3>
											<em>&gt;</em>
										</div>
										<b class="arrow"></b>
									</li>
									<li class="appliance js_toggle relative">
										<div class="category-info">
											<h3 class="category-name b-category-name"><i><img src="../images/meat.png"></i><a class="ml-22" href="search.jsp?game=英雄联盟" title="熟食、肉类">英雄联盟</a></h3>
											<em>&gt;</em>
										</div>
										<b class="arrow"></b>
									</li>
									<li class="appliance js_toggle relative">
										<div class="category-info">
											<h3 class="category-name b-category-name"><i><img src="../images/bamboo.png"></i><a class="ml-22" href="search.jsp?game=DNF地下城" title="素食、卤味">DNF地下城</a></h3>
											<em>&gt;</em>
										</div>
										<b class="arrow"></b>
									</li>
									<li class="appliance js_toggle relative">
										<div class="category-info">
											<h3 class="category-name b-category-name"><i><img src="../images/nut.png"></i><a class="ml-22" href="search.jsp?game=梦幻西游" title="坚果、炒货">梦幻西游</a></h3>
											<em>&gt;</em>
										</div>
										<b class="arrow"></b>
									</li>
									<li class="appliance js_toggle relative">
										<div class="category-info">
											<h3 class="category-name b-category-name"><i><img src="../images/candy.png"></i><a class="ml-22" href="search.jsp?game=诛仙3" title="糖果、蜜饯">诛仙3</a></h3>
											<em>&gt;</em>
										</div>
										<b class="arrow"></b>
									</li>
									<li class="appliance js_toggle relative">
										<div class="category-info">
											<h3 class="category-name b-category-name"><i><img src="../images/chocolate.png"></i><a class="ml-22" href="search.jsp?game=剑灵" title="巧克力">剑灵</a></h3>
											<em>&gt;</em>
										</div>
										<b class="arrow"></b>
									</li>
									<li class="appliance js_toggle relative">
										<div class="category-info">
											<h3 class="category-name b-category-name"><i><img src="../images/fish.png"></i><a class="ml-22" href="search.jsp?game=天龙八部" title="海味、河鲜">天龙八部</a></h3>
											<em>&gt;</em>
										</div>
										<b class="arrow"></b>
									</li>
									<li class="appliance js_toggle relative">
										<div class="category-info">
											<h3 class="category-name b-category-name"><i><img src="../images/tea.png"></i><a class="ml-22" href="search.jsp?game=冒险岛2" title="花茶、果茶">冒险岛2
											</a></h3>
											<em>&gt;</em>
										</div>
										<b class="arrow"></b>
									</li>
									<li class="appliance js_toggle relative last">
										<div class="category-info">
											<h3 class="category-name b-category-name"><i><img src="../images/package.png"></i><a class="ml-22" href="search.jsp?game=天涯明月刀" title="品牌、礼包">天涯明月刀</a></h3>
											<em>&gt;</em>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>


				<!--轮播-->

				<script type="text/javascript">
					(function() {
						$('.am-slider').flexslider();
					});
					$(document).ready(function() {
						$("li").hover(function() {
							$(".category-content .category-list li.first .menu-in").css("display", "none");
							$(".category-content .category-list li.first").removeClass("hover");
							$(this).addClass("hover");
							$(this).children("div.menu-in").css("display", "block")
						}, function() {
							$(this).removeClass("hover")
							$(this).children("div.menu-in").css("display", "none")
						});
					})
				</script>

				<script type="text/javascript">
					if ($(window).width() < 640) {
						function autoScroll(obj) {
							$(obj).find("ul").animate({
								marginTop: "-39px"
							}, 500, function() {
								$(this).css({
									marginTop: "0px"
								}).find("li:first").appendTo(this);
							})
						}
						$(function() {
							setInterval('autoScroll(".demo")', 3000);
						})
					}
				</script>
			</div>
			<div class="shopMainbg">
				<div class="shopMain" id="shopmain">

					<!--今日推荐 -->

					<div class="am-g am-g-fixed recommendation">
						<div class="clock am-u-sm-3" ">
						<!--
							<img src="../images/2016.png "></img>
						-->
						<p>今日推荐</p>
					</div>
					<div class="am-u-sm-4 am-u-lg-3 ">
						<div class="info ">
							<h3>最美小乔</h3>
							<h4>恋之微风篇</h4>
						</div>
						<div class="recommendationMain one">
							<a href="search.jsp?game=王者荣耀"><img src="../images/tj.png "></img></a>
						</div>
					</div>						
					<div class="am-u-sm-4 am-u-lg-3 ">
						<div class="info ">
							<h3>最美小乔</h3>
							<h4>纯白花嫁篇</h4>
						</div>
						<div class="recommendationMain two">
							<a href="search.jsp?game=王者荣耀">
								<img src="../images/tj1.png "></img>
							</a>
						</div>
					</div>
					<div class="am-u-sm-4 am-u-lg-3 ">
						<div class="info ">
							<h3>最美小乔</h3>
							<h4>缤纷独角兽</h4>
						</div>
						<div class="recommendationMain three">
							<a href="search.jsp?game=王者荣耀">
								<img src="../images/tj2.png "></img>
							</a>
						</div>
					</div>

				</div>
				<div class="clear "></div>
				<!--热门活动 -->

				<div class="am-container activity ">
					<div class="shopTitle ">
						<h4>活动</h4>
						<h3>每期活动 优惠享不停 </h3>
					</div>
					<div class="am-g am-g-fixed ">
						<div class="am-u-sm-3 ">
							<div class="icon-sale one "></div>	
							<h4>秒杀</h4>							
							<div class="activityMain ">
								<a href="search.jsp?game=天涯明月刀"><img src="../images/activity1.jpg "></img></a>
							</div>
							<div class="info ">
								<h3><a href="search.jsp?game=天涯明月刀">体验游戏乐趣</a></h3>
							</div>														
						</div>

						<div class="am-u-sm-3 ">
							<div class="icon-sale two "></div>	
							<h4>特惠</h4>
							<div class="activityMain ">
								<a href="search.jsp?game=英雄联盟"><img src="../images/activity2.jpg "></img></a>
							</div>
							<div class="info ">
								<h3><a href="search.jsp?game=英雄联盟">体验游戏乐趣</a></h3>								
							</div>							
						</div>						

						<div class="am-u-sm-3 ">
							<div class="icon-sale three "></div>
							<h4>准点</h4>
							<div class="activityMain ">
								<a href="search.jsp?game=DNF地下城"><img src="../images/activity3.jpg "></img></a>
							</div>
							<div class="info ">
								<h3><a href="search.jsp?game=DNF地下城">体验游戏乐趣</a></h3>
							</div>							
						</div>						

						<div class="am-u-sm-3 last ">
							<div class="icon-sale "></div>
							<h4>超值</h4>
							<div class="activityMain ">
								<a href="search.jsp?game=冒险岛2"><img src="../images/activity.jpg "></img></a>
							</div>
							<div class="info ">
								<h3><a href="search.jsp?game=冒险岛2">体验游戏乐趣</a></h3>
							</div>													
						</div>

					</div>
				</div>
				<div class="am-container activity ">
					<div class="shopTitle ">
						<h4>热卖</h4>
						<h3>精彩游戏 不容错过</h3>
					</div>
					<div class="am-g am-g-fixed ">
						<div class="am-u-sm-3 ">
							<div class="activityMain ">
								<a href="search.jsp?game=天龙八部"><img src="../images/c1.jpg " height="300px"></img></a>
							</div>
							<div class="info ">
								<h3><a href="search.jsp?game=天龙八部">打造神兵 开启你的远征</a></h3>
							</div>														
						</div>

						<div class="am-u-sm-3 ">
							<div class="activityMain ">
								<a href="search.jsp?game=诛仙3"><img src="../images/c2.jpg " height="300px"></img></a>
							</div>
							<div class="info ">
								<h3><a href="search.jsp?game=诛仙3">混沌乱世 屠魔诛仙</a></h3>								
							</div>							
						</div>						

						<div class="am-u-sm-3 ">
							<div class="activityMain ">
								<a href="search.jsp?game=剑灵"><img src="../images/c3.jpg " height="300px"></img></a>
							</div>
							<div class="info ">
								<h3><a href="search.jsp?game=剑灵">开天辟地 创立新世界</a></h3>
							</div>							
						</div>						

						<div class="am-u-sm-3 last ">
							<div class="activityMain ">
								<a href="search.jsp?game=天涯明月刀"><img src="../images/c4.jpg " height="300px"></img></a>
							</div>
							<div class="info ">
								<h3><a href="search.jsp?game=天涯明月刀">即刻开启你的征途</a></h3>
							</div>													
						</div>

					</div>
				</div>
				<div class="clear "></div>


				<div id="f1">
					<!--甜点-->


					<div class="footer ">
						<div class="footer-hd ">
							<p>
								<a href="# ">王者解毒科技</a>
								<b>|</b>
								<a href="# ">商城首页</a>
								<b>|</b>
								<a href="# ">支付宝</a>
								<b>|</b>
								<a href="# ">物流</a>
							</p>
						</div>
						<div class="footer-bd ">
							<p>
								<a href="# ">关于解毒</a>
								<a href="# ">合作伙伴</a>
								<a href="# ">联系我们</a>
								<a href="# ">网站地图</a>
							</p>
						</div>
					</div>

				</div>
			</div>

			<script>
				window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
			</script>
			<script type="text/javascript " src="../basic/js/quick_links.js "></script>
		</body>

		</html>