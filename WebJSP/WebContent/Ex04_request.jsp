<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 한글처리
	request.setCharacterEncoding("UTF-8");
	
	//2. 필요하다면 데이터 받기(데이터 받을때 request객체 사용)
	String id = request.getParameter("id");
	
		//request라는 객체는 was(tomcat)이 갖고 있는 내장객체(new가 되어있는)
		//1. 요청 페이지당 한개가 자동 생성됨 (request)
		//2. 클라이언트가 서버에 전송을 요청하면 (클라이언트의 수많은 정보가 전달됨 >>  이 정보를 받는 객체가 request임)
		//입력값 , IP, 브라우져정보, 전송방식 ... 받을수 있대 누가? request가
		//request 내장 객체는 클라이언트에서 서버로 요청할때 생성되는 
		//HttpServletRequest 타입을 갖는 객체가 자동 생성되고 그 주소를 request가 참조함
		//HttpServletRequest request = new HttpServletRequest...
		
		
	//3. 필요하다면 로직처리(업무에 따라 DB를 연결하거나 등등등)
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	id : <%=id %><hr>
	접속한 클라이언트 IP : <%=request.getRemoteAddr() %><hr> <!-- 접속한 클라이언트 ip를 알수 있음 (getRemoteAddr()) -->
	서버 (요청한 인코딩) : <%=request.getCharacterEncoding() %><hr>
	전송방식 : <%=request.getMethod() %><hr>
	포트번호 : <%=request.getServerPort() %><hr>
	context root(사이트명, 또는 가상 디렉토리, 또는 홈디렉토리, 또는 dafault 웹경로) : <%=request.getContextPath() %><hr>
</body>
</html>