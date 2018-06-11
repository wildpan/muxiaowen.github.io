<%@ page language="java" contentType="text/html;" import="java.sql.*"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
</head>
<body>
<div id=div>
        <h1>添加书籍</h1>
        <form method="post" action="add.jsp">
           书名： <input type="text" required="required" placeholder="书名" name="bookname"></input><br>
     作者：       <input type="text" required="required" placeholder="作者" name="bookAuthor"></input><br>
       价格：     <input type="text" required="required" placeholder="价格" name="bookPrice"></input><br>
      描述：      <input type="text" required="required" placeholder="描述" name=Description></input><br>
       类型：      <input type="text" required="required" placeholder="类型" name=category></input><br>
            <button class="but" type="submit">添加</button>
        </form>
    </div>

</body>
</html>