<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bookshop</title>
<link rel="stylesheet" type="text/css" href="css/style.css" >
<link rel="stylesheet" type="text/css" href="css/layout.css" >
<link rel="stylesheet" type="text/css" href="css/showPic.css" >
<script type="text/javascript" src="javascript/yundong.js"> </script>
</head>
<body >

 <div id="div1">
  </div>

<div id="mask"></div>
    <div class="login-form">
        <div class="close" id="close-login">X</div>
        <h3 style="text-align: center;">登录</h3>
        <form  name="loginform" method="post" action="user.jsp">
        <input type="text" name="name" placeholder="账号" id="username">
        <input type="password" name="password" placeholder="密码" id="password">
        <button class="login-btn" id="login" >登 录</button>
        </form>
    </div>

<h1 class="fl logo">
<a href="#">
<img src="images/mylogo1.png" width="220" height="40">
</a>
</h1>

<div id="search-box">
<form id="search-form"  method="post" action="select.jsp">
<input id="search-text" type="text" name="bookname" placeholder="你想看的书是什么呢">
<button id="search-btn" class="search-btn" type="submit">
<i class="icon icon-search"></i>
<span>搜索</span>
</button>
</form>
</div>

<div id="div5">

 <ul id="ul3">
  <li><a href="login.jsp">管理员入口</a></li>
  <li><a href="shoppingCar.jsp">购物车</a></li>
  <li id="sign-in"><a href="register.jsp">注册</a></li>
  <li id="atten-btn"><a href="javacript:;" id="yonghu">登录</a></li>
</ul>
</div>

<div id="div4">
<ul id="ul2">
<li>
<a href="https://www.baidu.com/s?wd=红楼梦" target="_blank">
<b>红楼梦</b></a></li>
<li>
<a href="https://www.baidu.com/s?wd=战争与和平" target="_blank">
<b>战争与和平</b></a></li>
<li>
<a href="https://www.baidu.com/s?wd=三国演义" target="_blank">
<b>三国演义</b></a></li>
<li>
<a href="https://www.baidu.com/s?wd=时间简史" target="_blank">
<b>时间简史</b></a></li>
<li>
<a href="https://www.baidu.com/s?wd=黄金时代" target="_blank">
<b>黄金时代</b></a></li>
<li>
<a href="https://www.baidu.com/s?wd=JavaScript" target="_blank">
<b>JavaScript</b></a></li>
<li>
<a href="https://www.baidu.com/s?wd=node.js" target="_blank">
<b>node.js</b></a></li>
</ul>
</div>
  
<div id="div2">
<div id="container">
    <div id="list" style="left: -300px;">
        <img src="images/06.jpg" alt="1"/>
        <img src="images/01.jpg" alt="1"/>
        <img src="images/02.jpg" alt="2"/>
        <img src="images/04.jpg" alt="3"/>
        <img src="images/03.jpg" alt="4"/>
        <img src="images/05.jpg" alt="5"/>
        <img src="images/07.jpg" alt="5"/>
    </div>
    <div id="buttons">
        <span index="1" class="on"></span>
        <span index="2"></span>
        <span index="3"></span>
        <span index="4"></span>
        <span index="5"></span>
        <span index="6"></span>
        <span index="7"></span>
    </div>
    <a style="display: none;" href="javascript:;" id="prev" class="arrow">&lt;</a>
    <a style="display: none;" href="javascript:;" id="next" class="arrow">&gt;</a>
</div>

  <ul id="ul1">
     <li><a class="active" href="#">四大名著</a></li>
     <li><a href="#">计算机类</a></li>
     <li><a href="#">编程语言</a></li>
  </ul>
  
  
</div>

<div id="div3"> 
 <div id="book-list">
  <div style="display:bolck;">
  <jsp:include page="books.jsp"></jsp:include>
  </div>
  <div style="display:none;">
  <jsp:include page="hotbooks.jsp"></jsp:include>
  </div>
  <div style="display:none;">
  <jsp:include page="okbooks.jsp"></jsp:include>
  </div>
  </div>
</div>
</body>
</html>
