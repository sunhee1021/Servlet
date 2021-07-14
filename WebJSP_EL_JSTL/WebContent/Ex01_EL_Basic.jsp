<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("userid");
	
	request.setAttribute("name", "korea");		//request.set으로 담은건 get으로 가져와야지
	session.setAttribute("user","bit");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
EL(출력표현식) : JSP 페이지에서 사용되는 스크립트 언어 (다른언어에서는 사용불가)_(화면에출력)

EL : tomcat 이 내장하고 있는 자원 (별도의 참조없이 사용가능) 
	 쓰려면 아파치톰켓이 있어야함(아파치 톰켓이 el 라이브러리를 갖고있음)
	 
EL이 가지고 있는 객체
1. param
2. paramValues
3. requestScope
4. sessionScope
5. applicationScope

이유 : 스파케티 코드(%라는 영역과 UI(html,css) 혼재되어 있어서 =>  유지보수하기 어려움, 코드의 해석(가독성이 떨어짐)

문제 해결 : html 과도 잘 어울리고 서버쪽 코드도 출력할수 있는 언어가 필요함  script >> EL & JSTL >> 단점(JSP 페이지에서만 사용가능)

 -->


	<h3>JSP</h3>
	<b><%= id %></b><br>
	<b><%= request.getAttribute("name") %></b><br>
	<b><%= session.getAttribute("user") %></b>
	<b><%= request.getParameter("userid") %></b><br>
	<hr>
	<h3>EL 출력표현식</h3>
	기존 <%= 1+5 %><br>
	EL : ${100+50}<br>
	EL : ${"1" + 1}<br><!-- 문자형 숫자 (자동 형변환) 결과 : 2 가 나옴 -->
	EL : ${1==1}<br>
	EL : ${false}<br>
	EL : ${!false}<br>
	EL : ${empty x}<br> <!-- x라는 변수의 값이 비어있니? -->
	
	
</body>
</html>