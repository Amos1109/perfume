<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'success.jsp' starting page</title>
  	

  </head>
  
  <body>
    <center>
      <img src="img/add_cart_success.jpg"/>
      <hr>
      <% 
         String id = request.getParameter("id");
         String num = request.getParameter("num");
      %>
             您成功购买了<%=num%>件编号为<%=id %>的商品!&nbsp;&nbsp;&nbsp;&nbsp;
      <br>
      <br>
      <br>
      
    </center>
  </body>
</html>
