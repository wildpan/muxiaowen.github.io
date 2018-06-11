<%@ page language="java" contentType="text/html; charset=utf-8"  import="java.util.*"
    pageEncoding="utf-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
 <%
  String str=request.getParameter("name");
  ArrayList<String> books=(ArrayList)session.getAttribute("books");
   for(int i=0;i<books.size();i++ ){ 
String a=(String)books.get(i);
  if(str.equals(a)){
 books.remove(i);
 session.setAttribute("books",books);
 break;
}
   }
   out.println("<script>window.location.href='shoppingCar.jsp'</script>");
  %>

</body>
</html>