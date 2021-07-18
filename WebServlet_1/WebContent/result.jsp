<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/bbs?cmd=book">책주세요.</a>
	<br>
	<a href="<%= request.getContextPath() %>/bbs?cmd=pencil">연필주세요</a>
	<br>
	<a href="<%= request.getContextPath() %>/bbs">연필주세요.</a>
</body>
</html>