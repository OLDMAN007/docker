<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
</head>
<body>
	<form action="<%=basePath %>/AddUser" method="get">
		username:<input type="text" name="username"><br>
		userage:<input type="text" name="userage"><br>
		<input type="submit" value="submit">${message }
	</form>
	<form action="<%=basePath %>/GetUser" method="get">
		<input type="submit" value="search">
	</form>
</body>
</html>