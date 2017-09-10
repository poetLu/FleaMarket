<%@page import="com.icss.vo.User"%>
<%@page import="com.icss.dao.UserDao"%>
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
        <title>会员信息</title>
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
    <%!UserDao userDao=new UserDao(); %>
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
    							<li><a  href="index.html"><strong>首页</strong></a></li>
    							<li><a href="situation.jsp"><strong>网站概况</strong></a></li>
    							<li><a href="history.jsp"><strong>历史订单</strong></a></li>
    							<li><a class="menu-top-active" href="manage.jsp"><strong>会员信息</strong></a></li>
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
    					<h1 class="page-head-line">会员信息</h1>
    				</div>
    			</div>
    			<div class="row">
    				<div class="col-md-6">
    					<!--   Kitchen Sink -->
    					<div class="panel panel-default">
    						<div class="panel-heading">
    							<strong>会员信息</strong>
    						</div>
    						<div class="panel-body">
    							<div class="table-responsive"><table class="table table-striped table-bordered table-hover">
    								<thead>
    									<tr>
    										<th>#</th>
    										<th>会员ID</th>
    										<th>会员账号</th>
    										<th>会员姓名</th>
    										<th>注册时间</th>
    										<th>收件地址</th>
    									</tr>
    								</thead>
    								<tbody>
    								<%
    								int i=1;
    								for(User user:userDao.getAllUser()){ 
    								%>
    									<tr id="<%=user.getUserId() %>">
    										<td><%=i++ %></td>
    										<td><%=user.getUserId() %></td>
    										<td><%=user.getUserAccount() %></td>
    										<td><%=user.getName() %></td>
    										<td><%=user.getLoginDate() %></td>
    										<td><%=user.getEmailAddress() %></td>
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