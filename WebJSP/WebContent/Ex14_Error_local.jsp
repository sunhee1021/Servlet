<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/error/commonerror.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	페이지마다 예외상황에 대한 처리 페이지를 설정할수 있음
	
	error : 에러 처리는 최종 배포시 한다, 개발시에는 에러를 봐야하니까 하면 안돼
 -->
 <%
 	String data = request.getParameter("name"); //여기서 예외가 터지는게 아니라
 
 	String data2 = data.toLowerCase();	//null 함수적용 가능? no! 여기서 예외가 터지는거임
 %>
 전달받은 내용 : <%= data %>
</body>
</html>