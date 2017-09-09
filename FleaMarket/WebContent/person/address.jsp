<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>地址管理</title>

<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="../css/personal.css" rel="stylesheet" type="text/css">
<link href="../css/addstyle.css" rel="stylesheet" type="text/css">
<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>

</head>
<%@ include file="common.jsp"%>
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

				<div class="user-address">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;List</small>
						</div>
					</div>
					<hr />
					<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">

						<li class="user-addresslist defaultAddr"><span
							class="new-option-r"><i class="am-icon-check-circle"></i>收货地址</span>
							<p class="new-tit new-p-re">
								<span class="new-txt"><%=userId%></span>
							</p>
							<div>&nbsp;</div>
							<div class="new-mu_l2a new-p-re">
								地址 :
								<%=userDao.getAddress(userId)%>
							</div></li>

					</ul>
					<!--例子-->
					<div class="am-modal am-modal-no-btn" id="doc-modal-1">

						<div class="add-dress">

							<!--标题 -->
							<div class="am-cf am-padding">
								<div class="am-fl am-cf">
									<strong class="am-text-danger am-text-lg">编辑地址</strong> / <small>Add&nbsp;address</small>
								</div>
							</div>
							<hr />

							<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
								<form class="am-form am-form-horizontal">

									<div class="am-form-group">
										<label for="user-name" class="am-form-label">姓名</label>
										<div class="am-form-content">
											<input type="text" id="user-name" placeholder="必填">
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-phone" class="am-form-label">邮件地址</label>
										<div class="am-form-content">
											<input id="user-address" placeholder="必填" type="email">
										</div>
									</div>


									<div class="am-form-group">
										<div class="am-u-sm-9 am-u-sm-push-3">
											<a class="am-btn am-btn-danger" onclick="save()">保存</a> <a
												href="javascript: void(0)"
												class="am-close am-btn am-btn-danger" data-am-modal-close
												onclick="cancel()">取消</a> <span id="results"
												style="margin-left: 15px"></span>
										</div>
									</div>
								</form>
							</div>

						</div>

					</div>

				</div>

				<script type="text/javascript">
					function save() {
						var name = document.getElementById("user-name").value;
						var address = document.getElementById("user-address").value;
						if (!name) {
							alert("请填写姓名");
						} else if (!address) {
							alert("请填写地址");
						} else {
							var xhr = new XMLHttpRequest();
							xhr.onreadystatechange = function() {
								if (xhr.readyState == 4) {
									if ((xhr.status >= 200 && xhr.status < 300)
											|| xhr.status == 304) {
										document.getElementById("results").innerHTML = xhr.responseText;
									} else {
										alert("Request was unsuccessful:"
												+ xhr.status);
									}
								}
							}
							xhr.open("get",
									"http://localhost:8080/FleaMarket/address?name="
											+ name + "&address=" + address,
									false);
							xhr.send(null);
							setTimeout("window.location.reload()", 900);
						}
					}
					function cancel() {
						document.getElementById("user-name").value = null;
						document.getElementById("user-address").value = null;
					}
					$(document).ready(
							function() {
								$(".new-option-r").click(
										function() {
											$(this).parent('.user-addresslist')
													.addClass("defaultAddr")
													.siblings().removeClass(
															"defaultAddr");
										});

								var $ww = $(window).width();
								if ($ww > 640) {
									$("#doc-modal-1").removeClass(
											"am-modal am-modal-no-btn")
								}

							})
				</script>

				<div class="clear"></div>

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