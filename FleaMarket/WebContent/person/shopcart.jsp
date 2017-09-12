<%@page import="com.icss.dao.GoodsAbstractDao"%>
<%@page import="com.icss.dao.GoodsDao"%>
<%@page import="com.icss.dao.ItemDao"%>
<%@page import="com.icss.vo.Item"%>
<%@page import="com.icss.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>购物车页面</title>

	<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css" />
	<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />
	<link href="../css/optstyle.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="../js/jquery.js"></script>

</head>

<%!
UserDao userDao=new UserDao();
ItemDao itemDao=new ItemDao();
GoodsDao goodsDao=new GoodsDao();
GoodsAbstractDao goodsAbstractDao=new GoodsAbstractDao();
%>

<body>

	<!--顶部导航条 -->
	<div class="am-container header">
		<ul class="message-l">
			<div class="topMessage">
				<div class="menu-hd">
					<%
					String userId = (String) session.getAttribute("userId");
					String game = request.getParameter("game");
					String dealerId = request.getParameter("dealerId");
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
			<div class="menu-hd">
				<a href="/FleaMarket/home" target="_top" class="h">商城首页</a>
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
			<div class="logo">
				<img src="../images/logo.png" />
			</div>
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

		<!--购物车 -->
		<div class="concent">
			<div id="cartTable">
				<div class="cart-table-th">
					<div class="wp">
						<div class="th th-chk">
							<div id="J_SelectAll1" class="select-all J_SelectAll"></div>
						</div>
						<div class="th th-item">
							<div class="td-inner">商品信息</div>
						</div>
						<div class="th th-price">
							<div class="td-inner" style="margin-left: -410px">单价</div>
						</div>
						<div class="th th-amount">
							<div class="td-inner" style="margin-left: -410px">数量</div>
						</div>
						<div class="th th-sum">
							<div class="td-inner" style="margin-left: -410px">金额</div>
						</div>
						<div class="th th-op">
							<div class="td-inner" style="margin-left: -410px">操作</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>

				<tr class="item-list">
					<div class="bundle  bundle-last ">
						<div class="clear"></div>
						<div class="bundle-main">
							<% for(Item item:userDao.getUntradedItem(userId)) {
							int itemId=item.getItemId();
							String type=goodsDao.getType(item.getGoodsId());
							String description=goodsAbstractDao.getDescription(type);
							int unitprice=item.getPrice();
							int amount=item.getAmount();
							int totalprice=unitprice*amount;
							%>
							<ul class="item-content clearfix">
								<li class="td td-chk">
									<div class="cart-checkbox ">
										<input class="check" id="check<%=itemId%>"
										name="items[]" value="170037950254" type="checkbox" onclick="checkone(this.id)"> <label
										for="J_CheckBox_170037950254"></label>
									</div>
								</li>
								<li class="td td-item">
									<div class="item-pic">
										<a href="#" target="_blank" data-title="" class="J_MakePoint"
										data-point="tbcart.8.12"> <img src="../images/<%=type %>.jpg"
										class="itempic J_ItemImg"></a>
									</div>
									<div class="item-info">
										<div class="item-basic-info">
											<a href="#" target="_top" title=""
											class="item-title J_MakePoint" data-point="tbcart.8.11"><%=type %><br/><%=description %></a>
										</div>
									</div>
								</li>
								<li class="td td-price">
									<div class="item-price price-promo-promo">
										<div class="price-content">
											<div class="price-line">
												<em class="J_Price price-now" tabindex="0"><%=unitprice %></em>
											</div>
										</div>
									</div>
								</li>
								<li class="td td-amount">
									<div class="amount-wrapper ">
										<div class="item-amount ">
											<div class="sl">
												<em><%=amount %></em>
											</div>
										</div>
									</div>
								</li>
								<li class="td td-sum">
									<div class="td-inner">
										<em tabindex="0" class="J_ItemSum number" id="totalprice<%=itemId%>"><%=totalprice %></em>
									</div>
								</li>
								<li class="td td-op">
									<div class="td-inner">
										<a data-point-url="#" id="delete<%=itemId %>" class="delete" onclick="deleteItem(this.id)"><font
											color="#CC9966">删除</font></a>
										</div>
									</li>
									<li class="td td-op" style="margin-left: -60px">
										<em id="results<%=itemId%>"></em>
									</li>
								</ul>
								<%} %>
							</div>
						</div>
					</tr>
					<div class="float-bar-wrapper">
						<div id="J_SelectAll2" class="select-all J_SelectAll">
							<div class="cart-checkbox">
								<input class="check-all check" id="J_SelectAllCbx2"
								name="select-all" value="true" type="checkbox"
								onclick="checkall()"> <label for="J_SelectAllCbx2"></label>
							</div>
							<span>全选</span>
						</div>
						<div class="operations">
							<a hidefocus="true" class="deleteAll" onclick="deleteall()">删除</a>
						</div>
						<div id="totalResults" style="margin-top: 14px;margin-left: 130px"></div>
						<div class="float-bar-right">
							<div class="amount-sum">
								<span class="txt">已选商品</span> <em id="J_SelectedItemsCount">0</em><span
								class="txt">件</span>
								<div class="arrow-box">
									<span class="selected-items-arrow"></span> <span class="arrow"></span>
								</div>
							</div>
							<div class="price-sum">
								<span class="txt">合计:</span> <strong class="price">¥<em
								id="J_Total">0.00</em></strong>
							</div>
							<div class="btn-area">
								<a onclick="pay()" id="J_Go"
								class="submit-btn submit-btn-disabled"
								aria-label="请注意如果没有选择宝贝，将无法结算"> <span>结&nbsp;算</span></a>
							</div>
						</div>

					</div>

					<div class="footer">
						<div class="footer-hd">
							<p>
								<a href="#">王者解毒科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
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


				<!--引导 -->
				<div class="navCir">
					<li><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
					<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
					<li class="active"><a href="shopcart.html"><i
						class="am-icon-shopping-basket"></i>购物车</a></li>
						<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>
					</div>
				</body>

				</html>

				<script type="text/javascript">
					function checkone(checkid){
						var itemId=checkid.substring(5,checkid.length);
						var totalpriceId="totalprice"+itemId;
						var totalprice=document.getElementById(totalpriceId).innerHTML;
						var goodsAmount=document.getElementById("J_SelectedItemsCount").innerHTML;
						var total=document.getElementById("J_Total").innerHTML;
						if(document.getElementById(checkid).checked){
							document.getElementById("J_SelectedItemsCount").innerHTML=parseInt(goodsAmount)+1;
							document.getElementById("J_Total").innerHTML=parseInt(total)+parseInt(totalprice);
						}else{
							document.getElementById("J_SelectedItemsCount").innerHTML=parseInt(goodsAmount)-1;
							document.getElementById("J_Total").innerHTML=parseInt(total)-parseInt(totalprice);
						}
					}
					function checkall(){
						var objs=document.getElementsByTagName("input");
						for(var i=0;i<objs.length;i++){
							if(objs[i].type=="checkbox"){
								if(i!=objs.length){
									if(!objs[i].checked){
										objs[i].checked=true;
										checkone(objs[i].id);
									}
								}
							}
						}
						var price=parseInt(document.getElementById("J_Total").innerHTML);
						var points=<%=userDao.getPoints(userId) %>;
						if(price>points){
							document.getElementById("totalResults").innerHTML="余额不足";
							document.getElementById("J_Go").onclick="";
						}
					}
					function deleteItem(deleteid){
						var itemId=deleteid.substring(6,deleteid.length);
						var results="results"+itemId;
						var xhr=new XMLHttpRequest();
						xhr.onreadystatechange=function(){
							if (xhr.readyState==4){
								if((xhr.status>=200  && xhr.status < 300)|| xhr.status ==304) {
									document.getElementById(results).innerHTML=xhr.responseText;
								} else {
									alert("Request was unsuccessful:"+xhr.status);
								}
							}
						}
						xhr.open("get","/FleaMarket/deleteItem?itemId="+itemId,false);
						xhr.send(null);
						setTimeout("window.location.reload()",900);
					}
					function deleteall(){
						var objs=document.getElementsByTagName("input");
						var xhr=new XMLHttpRequest();
						for(var i=0;i<objs.length-1;i++){
							if(objs[i].type=="checkbox"){
								if(objs[i].checked){
									var idlength=objs[i].id.length;
									var itemId=objs[i].id.substring(5,idlength);
									xhr.open("get","/FleaMarket/deleteItem?itemId="+itemId,false);
									xhr.send(null);
								}
							}
						}
						document.getElementById("totalResults").innerHTML="删除成功";
						setTimeout("window.location.reload()",900);
					}
					function pay(){
						var objs=document.getElementsByTagName("input");
						var xhr=new XMLHttpRequest();
						for(var i=0;i<objs.length-1;i++){
							if(objs[i].type=="checkbox"){
								if(objs[i].checked){
									var idlength=objs[i].id.length;
									var itemId=objs[i].id.substring(5,idlength);
									xhr.open("get","/FleaMarket/itemPay?itemId="+itemId,false);
									xhr.send(null);
								}
							}
						}
						window.location.href="/FleaMarket/person/pay.jsp";
					}
				</script>