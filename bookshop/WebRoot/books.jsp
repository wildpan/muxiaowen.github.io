<%@ page language="java" import="java.sql.*" import="java.io.StringWriter" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
#ul6
{
	list-style-type:none;
	margin:3px;
	padding:0;
}
#ul6 li
{
    display:inline-block;
    width: 145px;
    margin-right: 35px;
    margin-bottom: 16px;
    height: 250px;
    overflow: visible;
}
#ul6 li a{
color: #bf7f5f;
font-size: 15px;
background-color: white;
text-decoration:none;
}
#ul6 li button{
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
            String str="select * from famousBooks";
         %>
<ul id="ul6">
         <%
            ResultSet rs=stat.executeQuery(str);
            while(rs.next()){
            	String bookType=rs.getString("bookType");
            	String bookName=rs.getString("bookName");
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
          
    %>
        
</ul>

 <script type="text/javascript">
<%
   ArrayList<String>books=(ArrayList<String>)session.getAttribute("books");
   if(books==null){
	   books=new ArrayList<String>();
	   session.setAttribute("books",books);
   }
  else{
   String book=request.getParameter("name");
   if(book!=null){
	   books.add(book);
	   out.println("alert(\"成功加入购物车\");");
   }
   }
%>

</script>

</body>
</html>