<%@page import="com.foxiang.service.ImgService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	boolean success;
	String result;
	String category = request.getParameter("category");
	String name = request.getParameter("name");
	if(category==null || name==null){
		success = false;
	}else{
		success = new ImgService().deleteImg(category, name);	
	}
	if(success == true){
		result = "删除成功！";
	}else{
		result = "删除失败！";
	}
	category = java.net.URLEncoder.encode(category.toString(),"utf-8");
	result = java.net.URLEncoder.encode(result.toString(),"utf-8");
	response.sendRedirect("../manage/manageImg.jsp?category=" + category + "&result=" + result);
%>
<body>

</body>
</html>