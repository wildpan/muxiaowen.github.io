<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
#ul8
{
	list-style-type:none;
	margin:8px;
	padding:0;
}
#ul8 li
{
display:inline-block;
 width: 145px;
    margin-right: 35px;
    margin-bottom: 16px;
    height: 250px;
    overflow: visible;
}
#ul8 li a{
color: #bf7f5f;
font-size: 16px;
background-color: white;
text-decoration:none;
}
#ul8 li button{
font-size: 15px;
border:none;
border-radius: 4px;
background-color:#FF0033;
color:#FFFFFF;
padding: 4px 8px;
text-align: center;
text-decoration: none;
}
</style>
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
<ul id="ul8">
         <%
            ResultSet rs=stat.executeQuery(str);
            while(rs.next()){
            	String bookName=rs.getString("bookname");
            	String bookAuthor=rs.getString("bookAuthor");
            	String bookPrice=rs.getString("bookPrice");
            	String src="images/"+bookName+".jpg";
            %>
<li>
       <img alt="" src="<%=src%>" style="width:150px;height:180px;"><br>
       <span style="color: #FF0033;font-size:14px;"><%=bookAuthor %></span><br>
       <span style="font-size:14px;color: #000;">
       <%=bookName%> &nbsp;&nbsp;&nbsp;&nbsp; ￥<%=bookPrice%>
       </span><br> 
<button type="button" onClick="location.href='succeed.jsp?name=<%=bookName%>'">
<span style="font-size: 14px;">加入购物车</span>
</button> 
</li>
            <%
            }    
          stat.close();
          conn.close();
    %>
</ul>

</body>
</html>