<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	//클라이언트 요청 데이터 받기
	//받을때 뭐가 필요해? Tomcat(내장된 객체를 가지고 잇음)
	//웹에 사용되는 전용 객체 (request, response) >> 얘네들은 new하지 않음 >> 왜? >> 이미 new가 되어 있음 >> 생성된 객체 바로 사용가능
	//request 요청 객체(클라이언트 정보를 취득할때 사용 : request객체 얻는다 (입력 데이터, 클라이언트의 ip, 클라이언트가 가지고 있는 브라우져 버전 등))
	//response 응답 객체 (서버가 가지고 있는 자원을 >> 클라이언트에게 write할때 쓰임)
	//Request request = new Request(); 가 이미 되어있는거임
	
	
	//GET 방식
	//http://localhost:8090/WebJSP/Ex02_register.jsp?userid=shee&pwd=1004
	//http://localhost:8090/WebJSP/Ex02_register.jsp?userid=shee&pwd=1004&hobby=baseball&hobby=soccer
	String uid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String[] hobby =  request.getParameterValues("hobby");
	
	/*
		한글처리 : ???? or 꽤꽉꽉 문제 처리
		Tomcat9 버전 이하일때 해당
		(GET)방식일때 
		1. 페이지 상단에 인코딩 : request.setCharacterEncoding("UTF-8");
		2. 서버 설정 server.xml 63번째 줄
	    <Connector URIEncoding="UTF-8" connectionTimeout="20000" port="8090" protocol="HTTP/1.1" redirectPort="8443"/>
		
		!!!!!(POST)방식일떄!!!!! 선희언니안녕하세요 ♥ 알럽유 열졍열졍열졍 ~!!><
		항상 페이지 상단에 써줘야함
		1. 페이지 상단에 인코딩 : request.setCharacterEncoding("UTF-8");
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	서버에서 응답<br>
	ID 값 : <%=uid %><br>
	PWD 값 : <%=pwd %><br>	
	당신의 취미는<br>
	<%
		for(String str : hobby){	//서버에서 쓰는 코드는 여기다 쓰고
	%>
		hobby : <%= str %><br> 		<!-- 클라이언트 코드는<% %> 끝난다음 여기 다 쓰고 -->
	<% 		
		}
	%>
</body>
</html>





