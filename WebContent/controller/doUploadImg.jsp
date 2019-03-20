<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.foxiang.util.Config"%>
<%@page import="org.apache.commons.logging.LogFactory"%>
<%@page import="org.apache.commons.logging.Log"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String result;
	Log log = LogFactory.getLog(this.getClass());
	String category = "";
	int count = 0;

	// Create a factory for disk-based file items
	DiskFileItemFactory factory = new DiskFileItemFactory();
	// Configure a repository (to ensure a secure temp location is used)
	ServletContext servletContext = this.getServletConfig().getServletContext();
	File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
	factory.setRepository(repository);
	// Create a new file upload handler
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setHeaderEncoding("UTF-8");
	
	try {
		// Parse the request
		List<FileItem> items = upload.parseRequest(request);
		// Process the uploaded items
		Iterator<FileItem> iter = items.iterator();
		while (iter.hasNext()) {
			FileItem item = iter.next();
			if (item.isFormField()) {
				// Process a regular form field
				category = item.getString("UTF-8");
			} else {
				// Process a file upload
				String filePath = Config.imgUploadPath + File.separatorChar + category;
				String itemName = item.getName();
				if(itemName.equals("")){
					continue;
				}
				String fileType = itemName.substring(itemName.lastIndexOf("."), itemName.length());
				String fileName = new SimpleDateFormat("yyMMddhhmmss").format(new Date()) + count + fileType;
				File uploadedFile = new File(filePath, fileName);
				log.info("上传：" + uploadedFile.getPath());
				item.write(uploadedFile);
				count++;
			}
		}
		result = "成功上传" + count + "个文件！";
	} catch (Exception e) {
		result = "上传失败！";
		log.error("上传失败！");
		e.printStackTrace();
	}
	category = java.net.URLEncoder.encode(category.toString(),"utf-8");
	result = java.net.URLEncoder.encode(result.toString(),"utf-8");
	response.sendRedirect("../manage/manageImg.jsp?category=" + category + "&result=" + result); 
%>
<body>

</body>
</html>