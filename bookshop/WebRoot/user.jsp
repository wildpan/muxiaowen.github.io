<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"
    pageEncoding="UTF-8"  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录系统</title>
</head>
<body>
<form>
<%
request.setCharacterEncoding("UTF-8");
String name =request.getParameter("name");
String password =request.getParameter("password");
            try{
               Class.forName("org.sqlite.JDBC");
            }catch(ClassNotFoundException e){
        	   out.print("404 error");
            }

             String resource=application.getRealPath("/");
             String Sql="jdbc:sqlite:"+resource+"user.db";
             Connection conn=DriverManager.getConnection(Sql);
             Statement stat=conn.createStatement();
	String sql="select name,password from user where name='"+name+"'";
	ResultSet rs=stat.executeQuery(sql);
		 if(rs.next())
		 {
			 String user=rs.getString("name");
			 String passwd=rs.getString("password");
			 if(user.equals(name))
			  {		
				 if(password.equals(passwd))
			  {
			    out.println("<script>alert('登录成功');window.location.href='succeed.jsp'</script>"); 
		      }
			 else
		      {
				 out.print("<script>alert('密码错误,请重新输入密码');window.location.href='index.jsp'</script>");				 
			  }
		      }
			 
		 
		 }else{
			 out.print("<script>alert('用户错误,请重新输入密码');window.location.href='index.jsp'</script>");
		 }
		 stat.close();
		 conn.close();
		    session.setAttribute("user", name); 
	%>	
	
</form>
</body>
</html>