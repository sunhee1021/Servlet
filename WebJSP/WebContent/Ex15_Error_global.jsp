<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	web.xml 설정한 페이지로 처리
 -->
 <%
 	String data = request.getParameter("name"); //여기서 예외가 터지는게 아니라
 
 	String data2 = data.toLowerCase();	//null 함수적용 가능? no! 여기서 예외가 터지는거임
 %>
 전달받은 내용 : <%= data %>
</body>
</html>