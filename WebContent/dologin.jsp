<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

 <jsp:useBean id="loginUser" class="com.po.Users" scope="session"/>
 <jsp:useBean id="userDAO" class="com.dao.UsersDAO" scope="session"/>
 <jsp:setProperty property="*" name="loginUser"/>

<%

request.setCharacterEncoding("utf-8");

 //如果用户名和密码都等于admin，则登录成功
 if(userDAO.userLogin(loginUser)){
	 session.setAttribute("loginuser", loginUser.getUsername());
	 request.getRequestDispatcher("index.jsp").forward(request, response);
 }
 else{
	 response.sendRedirect("login.jsp");
 }
%>