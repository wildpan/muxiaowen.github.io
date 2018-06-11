<%@ page language="java" import="java.io.StringWriter" import="java.sql.*" import="java.util.*"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shopping Card</title>
</head>
<style>
body,html{
    margin:0;
    padding:0;
}
.nav{
list-style-type:none;
margin:0 0 0 260px;
padding:0;
}
.nav li{
display:inline-block;
padding:0 77px;
font-size: 16px;
}
.shop
{
	margin:0 0 50px 100px
}
.shop li
{
    margin:2px;
    width: 1000px;
    height: 200px;
    border:1px solid #ccc
}
.shop li div{
    width:200px;
    height:200px;
    float:left;
}
.shop li div a{
text-decoration:none;
position:absolute;
margin-top:90px;
}
.fix{
     position:fixed;
     width:100%;
     height:50px;
     bottom:0;
     background:#fff;
     border:1px solid #f0f0f0
}
.fix input{
margin-left:147px;
}
#btn {
    background-color: #FF0000;
    border: none;
    color: white;
    padding: 14px 30px;
    font-size: 16px;
}
</style>
<script type="text/javascript">
function selectAll(){
	var boxs=document.getElementsByName('box');
	for(var i=0;i<boxs.length;i++){
		var e=boxs[i];
		e.checked=!e.checked;
	}
}
</script>
<body>
<div style="height:60px;margin-left:130px;">
<img alt="" src="images/gouwuche.jpg" height="50" width="50" style="float:left;">
<h1><a href="succeed.jsp">我的</a>购物车</h1><br>
</div>

<ul class="nav">
   <li>商品名称</li>
   <li>单价</li>
   <li>作者</li>
   <li>操作</li>
</ul>

<ul style="list-style-type:none;" class="shop" id="ul1">
   <%
   ArrayList<String> books=(ArrayList)session.getAttribute("books");
   try{
       Class.forName("org.sqlite.JDBC");
    }catch(ClassNotFoundException e){
	   out.print("404 error");
    }

     String resource=application.getRealPath("/");
     String Sql="jdbc:sqlite:"+resource+"books.db";
     Connection conn=DriverManager.getConnection(Sql);
 
   if(true){
	   int price=0;
   if(books==null){
   out.print("你的购物车中还没有内容"+"<br>");
   }
   else
   for(int i=0;i<books.size();i++ ){
	
	   %>
<li>

<%
            Statement stat=conn.createStatement();
            String str="select * from books where bookName='"+books.get(i)+"'";
         %>

 <%
            ResultSet rs=stat.executeQuery(str);
            while(rs.next()){
            	int bookPrice=rs.getInt("bookPrice");
            	String bookAuthor=rs.getString("bookAuthor");
            %>

	   	   <%
   String src="images/"+books.get(i)+".jpg";
   %>
   <div>
<input type="checkbox" name="box">
<img alt="" src="<%=src%>" style="width:100px;height:150px;margin-top:20px;">
</div>
<div>
<a href="#">
   <% 
   out.println(books.get(i));
   %> 
   </a>
</div>
<div><a>￥<%=bookPrice%></a></div>
<div><a><%=bookAuthor%></a></div>
<div><a onclick="deleteBook()" href="remove.jsp?name=<%=books.get(i)%>">删除</a></div>
<%
   price+=bookPrice;
            }
   }
%>
</li>
</ul>
<div class="fix">
   <input type="checkbox" onclick="selectAll()" id="checkid"/>全选
   <a href="#">删除选中的商品</a>
   <span style="font-size:25px;margin:0 123px 0 500px;">总价：￥<%=price%></span>
   <button id="btn" onclick="location.href='dingdan.jsp'">去结算</button>
   </div>
   <%} %>
</body>
</html>