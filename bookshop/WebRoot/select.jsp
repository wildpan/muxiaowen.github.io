<%@ page language="java" contentType="text/html;" import="java.sql.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>搜索</title>
</head>
<body>
<form>
<%
request.setCharacterEncoding("UTF-8");
String name =request.getParameter("bookname");
            try{
               Class.forName("org.sqlite.JDBC");
            }catch(ClassNotFoundException e){
        	   out.print("404 error");
            }

             String resource=application.getRealPath("/");
             String Sql="jdbc:sqlite:"+resource+"books.db";
             Connection conn=DriverManager.getConnection(Sql);
             Statement stat=conn.createStatement();
	String sql="select * from books where bookName='"+name+"'";
	ResultSet rs=stat.executeQuery(sql);
		if(rs.next()){
        	String bookName=rs.getString("bookName");
        	String bookAuthor=rs.getString("bookAuthor");
        	String bookPrice=rs.getString("bookPrice");
        	String bookDescription=rs.getString("Description");
        	String src="images/"+bookName+".jpg";
        	 %>
     <div>
     <img alt="" src="<%=src%>" style="width:200px;height:200px;margin-top:20px;"><br>
     </div>
     <span>书名：<%=bookName%></span>&nbsp;&nbsp;&nbsp;&nbsp;
     <span>作者：<%=bookAuthor %></span>&nbsp;&nbsp;&nbsp;&nbsp;
     <span>价格：<%=bookPrice %></span>&nbsp;&nbsp;&nbsp;&nbsp;
     <div>
     <span>描述：<%=bookDescription %></span>
     </div>
        	 <% 
 
		}else{
			out.print("查无此书！！！");
		}
		 stat.close();
		 conn.close();

	%>	
	
</form>
</body>
</html>