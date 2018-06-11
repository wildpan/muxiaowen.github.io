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
        <h1>删除书籍</h1>
        <form method="post" action="delete.jsp">
           书名： <input type="text" required="required" placeholder="书名" name="bookname"></input><br>
            <button class="but" type="submit">删除</button>
        </form>
    </div>

</body>
</html>