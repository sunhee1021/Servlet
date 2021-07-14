<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//EL이라는 스크립트 언어는 (서버쪽 자원에 대한 접근이 가능) >> <%= (스크립트 립)사용하지 않아도 돼
	//EL을 사용한다고 해서 JAVA 객체 API를 지원하지는 않음
	
	Date today = new Date();
	request.setAttribute("day", today);
	session.setAttribute("day2", today);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL 화면 출력 (객체를 통해서 서버 자원 접근 가능)</h3>
	EL : ${requestScope.day}<br> <!-- request자원에 접근할수 있음(requestScope) // 서버쪽 자원에 접근이 가능하기 때문에-->
	EL : ${day}<br> <!-- 객체명을 생략 가능(어디에 있는 day인지 알수가 없기때문에 좋은 방법이 아님)_앞에 객체를 명시해주어야 함 -->
	EL : ${sessionScope.day2}<br> <!--  session 자원에 접근 할수 있음 (sessionScope) -->
</body>
</html>