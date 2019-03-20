<%@page import="com.foxiang.util.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=Config.title_manage %></title>
</head>
<body> 
${username}您好！
<a href="manageImg.jsp">管理图片</a>    
<a href="<%="../controller/doLogout.jsp" %>">退出</a>
</body>
</html>