<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>修改密码</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/stepstyle.css" rel="stylesheet" type="text/css">

		<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
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
								<div class="menu-hd"><a id="mc-menu-hd" href="shopcart.html" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
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

					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password</small></div>
					</div>
					<hr/>
					<form class="am-form am-form-horizontal" style="margin-top:50px">
						<div class="am-form-group">
							<label for="user-old-password" class="am-form-label">原密码</label>
							<div class="am-form-content">
								<input type="password" id="user-old-password" placeholder="请输入原登录密码">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-new-password" class="am-form-label">新密码</label>
							<div class="am-form-content">
								<input type="password" id="user-new-password" placeholder="新密码需不同于原始密码">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-confirm-password" class="am-form-label">确认密码</label>
							<div class="am-form-content">
								<input type="password" id="user-confirm-password" placeholder="请再次输入上面的密码">
							</div>
						</div>
						<div class="info-btn">
							<div class="am-btn am-btn-danger" onclick="modify()">保存修改</div>
						</div>
						<div align="center" id="results"></div>
					</form>

				<script type="text/javascript">
					function modify(){
						var oldPwd=document.getElementById("user-old-password").value;
						var newPwd=document.getElementById("user-new-password").value;
						var confirmPwd=document.getElementById("user-confirm-password").value;
						if(!oldPwd){
							alert("请输入原登录密码");
						}else if(!newPwd){
							alert("请输入新密码");
						}else if(!confirmPwd){
							alert("请输入确认密码");
						}else if(oldPwd==newPwd){
							alert("新密码需不同于原始密码");
						}else if(newPwd!=confirmPwd){
							alert("新密码与确认密码不一致")
						}else{
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
							xhr.open("get","http://localhost:8080/FleaMarket/passwordModify?oldPwd="+oldPwd+"&newPwd="+newPwd,true);
							xhr.send(null);
							setTimeout("window.location.reload()",900);
						}
					}
				</script>

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