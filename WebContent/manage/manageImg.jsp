<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="com.foxiang.service.ImgService"%>
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
	String result = request.getParameter("result");
	if(result!=null){
		request.setAttribute("result", result);
	}
	String[] categorys = Config.categorys;
	String category = request.getParameter("category");
	if(category==null || category.equals("")) {
		category = Config.categorys[0];
	}
	List<File> imgs = new ImgService().getImgsByCategory(category);
	String imgDir = "../upload/img/" + category + "/";
%>
<body>
<h3 align="center">
	<%for(int i=0; i<categorys.length; i++) {%>
		<a href="manageImg.jsp?category=<%=categorys[i] %>"><%=categorys[i] %></a> &nbsp;&nbsp;
	<%} %>
</h3>

<div align="center">
<form action="<%=request.getServletContext().getContextPath()+"/controller/doUploadImg.jsp" %>" method="post" enctype="multipart/form-data">
	<input type="hidden" name="category" value="<%=category %>">
	<input type="file" name="picture" accept="image/*" multiple="multiple"> 
	<input type="submit" value="上传"> 
</form>
</div>

<p align="center"><font color="#FF0000">${result}</font></p>

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
				</a> <br>
				<a href="../controller/doDeleteImg.jsp?category=<%=category %>&name=<%=imgs.get(i*4+j).getName() %>">删除</a>
			</td>
		<%} %>
	<tr>
	<%} %>
	</table>
</div>
<%} %>
</body>
</html>