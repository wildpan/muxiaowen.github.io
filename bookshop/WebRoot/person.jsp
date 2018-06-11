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
             String Sql="jdbc:sqlite:"+resource+"user.db";
             Connection conn=DriverManager.getConnection(Sql);
         
            Statement stat=conn.createStatement();
            String str="select * from user";
         %>
<table border="1">

<tr>
     <th>name</th>
     <th>password</th>
     <th>mail</th>
     <th>telphone</th>
</tr>

  <%
            ResultSet rs=stat.executeQuery(str);
            while(rs.next()){
            	String name=rs.getString("name");
            	String password=rs.getString("password");
            	String mail=rs.getString("mail");
            	String tel=rs.getString("tel");
            %>

<tr>
     <th><%=name %></th>
     <th><%=password%></th>
     <th><%=mail%></th>
     <th><%=tel%></th>
</tr>
<%} %>
</table>

</body>
</html>