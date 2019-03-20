<%@page import="com.foxiang.service.ImgService"%>
<%@page import="com.foxiang.util.Config"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=Config.title %></title>
<meta name="keywords" content="<%=Config.keyWords %>">
<meta name="description" content="<%=Config.desc %>">
</head>
<%
	String[] categorys = Config.categorys;
	String category = request.getParameter("category");
	if(category==null || category.equals("")) {
		category = Config.categorys[0];
	}
	List<File> imgs = new ImgService().getImgsByCategory(category);
	String imgDir = "upload/img/" + category + "/";
%>
<body>
<h1 align="center">寺庙佛像批发</h1>
<p align="center"><font color="#FF0000">专业生产佛像法器，请佛热线：18810761043</font></p>
<h3 align="center">
	<%for(int i=0; i<categorys.length; i++) {%>
		<a href="index.jsp?category=<%=categorys[i] %>"><%=categorys[i] %></a> &nbsp;&nbsp;
	<%} %>
</h3>
<%if(imgs.size()>0){ %>
<div align="center">
	<table>
	<%for(int i=0; i<imgs.size()/4+1; i++){ %>
	<tr>
		<%for(int j=0; j<4; j++){ %>
			<%if(i*4+j>=imgs.size()){break;} %>
			<td align="center">
				<a href="<%=imgDir + imgs.get(i*4+j).getName() %>" target="_blank">
					<img src="<%=imgDir + imgs.get(i*4+j).getName() %>" width="200">
				</a>
			</td>
		<%} %>
	<tr>
	<%} %>
	</table>
</div>
<%} %>
</body>
</html>