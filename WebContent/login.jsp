<%@page import="com.foxiang.service.UserService"%>
<%@page import="com.foxiang.util.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=Config.title_manage %></title>
</head>
<%
	if(session.getAttribute("username")!=null){
		response.sendRedirect("/manage/index.jsp");
	}
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	if(username!=null && password!=null) {
		UserService userService = new UserService();
		boolean success = userService.login(username, password);
		if(success){
			session.setAttribute("username", username);
			response.sendRedirect("manage/index.jsp");   
		}else{
			request.setAttribute("result", "登录失败！");
		}
	}
%>
<body>
<div align="center">
<form action="login.jsp" method="post">
	用户：<input type="text" name="username"> <br>
	密码：<input type="text" name="password"> <br>
	<input type="submit" value="登录"> ${result}
</form>
</div>
</body>
</html>