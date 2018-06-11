<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
            try{
               Class.forName("org.sqlite.JDBC");
            }catch(ClassNotFoundException e){
        	   out.print("404 error");
            }

             String resource=application.getRealPath("/");
             String Sql="jdbc:sqlite:"+resource+"books.db";
             Connection conn=DriverManager.getConnection(Sql);
         
            Statement stat=conn.createStatement();
            String str="select * from books";
         %>
<table border="1">

<tr>
     <th>书名</th>
     <th>作者</th>
     <th>价格</th>
     <th>库存数量</th>
</tr>

  <%
            ResultSet rs=stat.executeQuery(str);
            while(rs.next()){
            	String bookName=rs.getString("bookname");
            	String bookAuthor=rs.getString("bookAuthor");
            	String bookPrice=rs.getString("bookPrice");
            %>

<tr>
     <th><%=bookName %></th>
     <th><%=bookAuthor%></th>
     <th><%=bookPrice%></th>
     <th>10</th>
</tr>
<%} %>
</table>

</body>
</html>