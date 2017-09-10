<%@page import="com.icss.dao.GoodsDao"%>
<%@page import="com.icss.vo.Item"%>
<%@page import="com.icss.dao.ItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<meta name="description" content="" />
	<meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
        <title>历史订单</title>
        <!-- BOOTSTRAP CORE STYLE  -->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONT AWESOME ICONS  -->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLE  -->
        <link href="assets/css/style.css" rel="stylesheet" />
        <!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <%!
    ItemDao itemDao=new ItemDao(); 
    GoodsDao goodsDao=new GoodsDao();	
    %>
    <body>
    	<header>
    		<div class="container">
    			<div class="row">
    				<div class="col-md-12">
    					<strong> 王者解毒科技</strong>后台管理系统
    					&nbsp;&nbsp;
    					<strong></strong>
    				</div>

    			</div>
    		</div>
    	</header>
    	<!-- HEADER END-->
    	<div class="navbar navbar-inverse set-radius-zero">
    		<div class="container">
    			<div class="navbar-header">
    				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
    					<span class="icon-bar"></span>
    					<span class="icon-bar"></span>
    					<span class="icon-bar"></span>
    				</button>
    				<a class="navbar-brand" href="index.html">

    					<img src="assets/img/logo.png" />
    				</a>

    			</div>

    			<div class="left-div">
    				<div class="user-settings-wrapper">
    					<ul class="nav">
    					</ul>
    				</div>
    			</div>
    		</div>
    	</div>
    	<!-- LOGO HEADER END-->
    	<section class="menu-section">
    		<div class="container">
    			<div class="row">
    				<div class="col-md-12">
    					<div class="navbar-collapse collapse ">
    						<ul id="menu-top" class="nav navbar-nav navbar-right">
    							<li><a href="index.html"><strong>首页</strong></a></li>
    							<li><a href="situation.jsp"><strong>网站概况</strong></a></li>
    							<li><a class="menu-top-active"  href="history.jsp"><strong>历史订单</strong></a></li>
    							<li><a href="manage.jsp"><strong>会员信息</strong></a></li>
    							<li><a href="sales.jsp"><strong>在售商品</strong></a></li>
    						</ul>
    					</div>
    				</div>
    			</div>
    		</div>
    	</section>
    	<!-- MENU SECTION END-->
    	<div class="content-wrapper">
    		<div class="container">
    			<div class="row">
    				<div class="col-md-12">
    					<h1 class="page-head-line">历史订单</h1>
    				</div>
    			</div>
    			<div class="row">
    				<div class="col-md-6">
    					<!--   Kitchen Sink -->
    					<div class="panel panel-default">
    						<div class="panel-heading">
    							<strong>历史订单</strong>
    						</div>
    						<div class="panel-body">
    							<div class="table-responsive"><table class="table table-striped table-bordered table-hover">
    								<thead>
    									<tr>
    										<th>#</th>
    										<th>条目编号</th>
    										<th>商品类型</th>
    										<th>买家ID</th>
    										<th>卖家ID</th>
    										<th>交易日期</th>
    										<th>交易状态</th>
    										<th>操作</th>
    									</tr>
    								</thead>
    								<tbody>
    									<%
    									int i=1;
    									for(Item item:itemDao.getItemByDateDesc()){
    									%>
    									<tr id="<%=item.getItemId() %>">
    										<td><%=i++ %></td>
    										<td><%=item.getItemId() %></td>
    										<td><%=goodsDao.getType(item.getGoodsId())%></td>
    										<td><%=item.getBuyerId() %></td>
    										<td><%=item.getDealerId() %></td>
    										<td><%=item.getItemDate() %></td>
    										<td>
    											<%if(item.getPurchaseOrNot()==1) {%>
    											已完成
    											<%}else{ %>
    											未完成
    											<%} %>
    										</td>
    										<td><a style="cursor: pointer" onclick="deleteRecord(this.id)" id="delete<%=item.getItemId()%>">删除</a></td>
    									</tr>
    									<%} %>   
    								</tbody>
    							</table>
    						</div>
    					</div>
    				</div>
    				<!-- End  Kitchen Sink -->
    			</div>
    		</div>

    	</div>

    </div>
</div>
<!-- CONTENT-WRAPPER SECTION END-->
<footer>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				&copy; 2015 YourCompany | By : <a href="http://www.designbootstrap.com/" target="_blank">DesignBootstrap</a>
			</div>

		</div>
	</div>
</footer>
<!-- FOOTER SECTION END-->
<!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
<!-- CORE JQUERY SCRIPTS -->
<script src="assets/js/jquery-1.11.1.js"></script>
<!-- BOOTSTRAP SCRIPTS  -->
<script src="assets/js/bootstrap.js"></script>
</body>
</html>

<script type="text/javascript">
	function deleteRecord(deleteId){
		var itemId=deleteId.substring(6,deleteId.length);
		document.getElementById(itemId).remove();
		var xhr=new XMLHttpRequest();
		xhr.open("get","http://localhost:8080/FleaMarket/recordDelete?itemId="+itemId,true);
		xhr.send(null);
	}
</script>
