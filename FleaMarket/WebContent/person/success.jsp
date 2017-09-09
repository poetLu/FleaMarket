<%@page import="com.icss.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>付款成功页面</title>
<link rel="stylesheet"  type="text/css" href="/FleaMarket/AmazeUI-2.4.2/assets/css/amazeui.css"/>
<link href="/FleaMarket/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="/FleaMarket/basic/css/demo.css" rel="stylesheet" type="text/css" />

<link href="/FleaMarket/css/sustyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/FleaMarket/basic/js/jquery-1.7.min.js"></script>

</head>
<%!
	UserDao userDao=new UserDao();
%>
<body>
<!--顶部导航条 -->
<div class="am-container header">
  <ul class="message-l">
    <div class="topMessage">
     <div class="menu-hd">
       <%
          String userId = (String) session.getAttribute("userId");
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
     </div></div>
  </ul>
  <ul class="message-r">
    <div class="topMessage home"><div class="menu-hd"><a href="/FleaMarket/home" target="_blank" class="h">商城首页</a></div></div>
    <div class="topMessage my-shangcheng"><div class="menu-hd MyShangcheng"><a href="index.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div></div>
    <div class="topMessage mini-cart"><div class="menu-hd"><a id="mc-menu-hd" href="shopcart.jsp" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a></div></div>
  </ul>
</div>

<!--悬浮搜索框-->

<div class="nav white">
	<div class="logo"><img src="/FleaMarket/images/logo.png" /></div>
    <div class="logoBig">
      <li><img src="/FleaMarket/images/logobig.png" /></li>
    </div>
    
    <div class="search-bar pr">
        <a name="index_none_header_sysc" href="#"></a>       
        <form action="../home/search.jsp">
        <input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
        <input id="ai-topsearch" class="submit" value="搜索" index="1" type="submit"></form>
    </div>     
</div>

<div class="clear"></div>


<%String total=request.getParameter("total"); %>
<div class="take-delivery">
 <div class="status">
   <h2>您已成功付款</h2>
   <div class="successInfo">
     <ul>
       <li>实付<em><%=total %></em></li>
       <div class="user-info">
         <p>收货人：<%=userId %></p>
           <p>收货地址：<%=userDao.getAddress(userId) %></p>
       </div>
                               
     </ul>
     <div class="option">
       <span class="info">您可以</span>
        <a href="/FleaMarket/person/order.jsp" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
     </div>
    </div>
  </div>
</div>


<div class="footer" >
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


</body>
</html>
