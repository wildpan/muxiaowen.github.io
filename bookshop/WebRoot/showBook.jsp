<%@ page language="java" import="java.sql.*,java.util.*"  pageEncoding="UTF-8"%>
<%@ page import ="Dao.BookDao" %>
<%@ page import ="beans.Book" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
     BookDao bookdao= new BookDao();
     ArrayList book=bookdao.queryAllBook();
   %>
   <table border=1>
   <tr>
   <td>作者</td>
   <td>id</td>
   <td>书名</td>
   <td>价格</td>
   </tr>
   
     <%
     for(int i=0;i<book.size();i++){
    	 Book books=(Book)book.get(i);
     %>
     
    	 <tr>
    	 <td><a><%=books.getBookauthor() %> </a></td>
    	 <td><a><%=books.getBookid() %></a></td>
    	 <td><a><%=books.getBookname() %></a></td>
    	 <td><a><%=books.getBookprice() %></a></td>
    	 </tr>
    	 
<% 
     }
%>
</table>
</body>
</html>