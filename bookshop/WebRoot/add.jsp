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
request.setCharacterEncoding("UTF-8");
String bookname =request.getParameter("bookname");
String bookauthor =request.getParameter("bookAuthor");
String bookprice =request.getParameter("bookPrice");
String Description =request.getParameter("Description");
String category =request.getParameter("category");
PreparedStatement ps=null;

try{
    Class.forName("org.sqlite.JDBC");
 }catch(ClassNotFoundException e){
	   out.print("404 error");
 }
try{
 String resource=application.getRealPath("/");
 String Sql="jdbc:sqlite:"+resource+"books.db";
 Connection conn=DriverManager.getConnection(Sql);
 conn.setAutoCommit(false);
 
 Statement stat2=conn.createStatement();
 String sql="insert into books values ('"+bookname+"','"+bookauthor+"','"+bookprice+"','"+Description+"','"+category+"')";
 int i=stat2.executeUpdate(sql);
 out.print(i);
 out.print(sql);
 conn.commit();
 stat2.close();
 conn.close();
 }catch(Exception e){
	 out.print("error");
 }
  
out.println("<script>alert('添加成功');window.location.href='manage.jsp'</script>"); 

	%>
</body>
</html>