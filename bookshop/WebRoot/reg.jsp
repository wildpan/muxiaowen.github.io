<%@ page language="java" contentType="text/html;" import="java.sql.*"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String username =request.getParameter("username");
String passwd =request.getParameter("password");
String mail =request.getParameter("mail");
String tel =request.getParameter("tel");
PreparedStatement ps=null;

try{
    Class.forName("org.sqlite.JDBC");
 }catch(ClassNotFoundException e){
	   out.print("404 error");
 }
try{
 String resource=application.getRealPath("/");
 String Sql="jdbc:sqlite:"+resource+"user.db";
 Connection conn=DriverManager.getConnection(Sql);
 conn.setAutoCommit(false);
 
 Statement stat=conn.createStatement();
 String sql="insert into user values ('"+username+"','"+passwd+"','"+mail+"','"+tel+"')";
 int i=stat.executeUpdate(sql);
 out.print(i);
 out.print(sql);
 conn.commit();
 stat.close();
 conn.close();
 }catch(Exception e){
	 out.print("error");
 }
 
out.println("<script>alert('注册成功');window.location.href='succeed.jsp'</script>"); 
 
 session.setAttribute("user", username);
	%>
</body>
</html>