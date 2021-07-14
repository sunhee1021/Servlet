<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	/*
		webproject 생성 >> 기본 폴더 구조 제공 >> web.xml (WebApp 환경설정) 제공
		web.xml(환경설정 파일은 서버가(tomcat) 시작되면 가장 먼저 loading됨 (가장먼저 해석되고 실행됨))
		<welcome-file>default.html</welcome-file> -> 웹 사이트 기본 페이지 설정
		ex) http://localhost:8090/WebJSP/   >> 기본페이지 서비스(뒤에 index.html 을 안붙여도 index.html 내용을 서비스함)
		
		/WebJSP >> 웹 프로젝트 이름, 가상 디렉토리, context root (문맥 흐름 전체의 root)
		>> 웹경로(가상경로)   http://localhost:8090/WebJSP/
		>> 실경로          C:\Users\sh089\WEB(Back)\WebLabs\WebJSP


		WebJSP 웹 프로젝트가 서비스 하는 파일의 기본 경로(default)
		>> C:\Users\sh089\WEB(Back)\WebLabs\WebJSP\WebContent (context root)
		>> 192.168.0.14:8090/WebJSP    -> WebContent 안에 자원을 서비스 하겠다는 뜻
		
		>> 자원(서비스 하는 파일) : html, htm, css, js, json, txt, jsp
		>> WebContent >> a.jsp, b.jsp, c.jsp  3개의 페이지가 공유할 수 있는 자원은 어디다 만들어야 하죠?
		
		>> 모든 자원은 페이지가 변수영역(scope)
		>> a.jsp > <% String s="A" .. > s 변수는 a.jsp 가 scope
		>> b.jsp > <% String s="A" .. > s 변수는 b.jsp 가 scope
		>> c.jsp > <% String s="A" .. > s 변수는 c.jsp 가 scope
		변수명이 같아도 !공유되지 않으니까! !영역이 다르니까! 충돌나지 않음(s를 세군데서 써도)
		
		>>우리가 하고 싶은건 a.jsp, b.jsp, c.jsp 에서 같은 자원을 쓰고 싶은거임
		>>web.xml 에 적어두면 그 자원은 공유될수 있음
		>>web.xml 환경설정 >> 서버시작 >> 가장 먼저 해석
		
		>>web.xml 에 이렇게 해놨어
		<context-param>
	  	<description>개발자 마음대로 써도돼요</description>
		<param-name>email</param-name>		<!-- 여기가 변수명 java의 collection의 마지막(property)랑 비슷 -->
	  	<param-value>webmaster@bit.or.kr</param-value>
	  	</context-param>
 
	  	근데 이걸 어떻게 읽지?
	  	Application 객체로 (WAS 제공)
	  	web.xml 설정을 read 할 수 있음(= web.xml 파일을 제어 할 수 있음)
	*/
	
	/*
		WebContent >> WEB-INF >> lib
	  			   >> WEB-INF >> web.xml
	  			   >> a.jsp
	  			   >> b.html
	  	왜 INF라는 폴더가 있는걸까?
	    보안폴더 래요
	    Client 가 주소를 알고 있다 하더라도 접근이 불가한 경로
	    
	    의도적으로 http://localhost:8090/WebJSP/WEB-INF/web.xml 치고 들어가려고 하면
	    서버는 404를 전달함
	    파일이 있는데도 404 에러가 나는 이유? 보안폴더로 못보게 해놔서
	    		
	    개발자 문제점 )
		Ex02_register.html -> 요청 -> 처리하는 페이지 (= Ex02_register.jsp)
		클라이언트가 Ex02_register.jsp 페이지를 직접 접근 못하게...
		WebContent 폴더 안에 자원은 >> Client가 모두 접근 할수 있음
		
		**실제 현업 개발코드는 WebContent 폴더에 없어요
		1. Client가 직접 요청하는 파일 : main.html, login.html, register.html 같은건 >> WebContent에 놔둬요
		2. Client가 직접 요청해서는 안되는 파일 : WEB-INF >> views >> member >> register.jsp 를 놔둬요
								   	또는 	 WEB-INF >> views >> admin >> admin.jsp 를 놔둬요
	*/
%>

<h3>Application</h3>

<%
	String param = application.getInitParameter("email");
	out.print("<h3>" + param + "</h3>");
	out.print("<hr>");
	String param2 = application.getInitParameter("FilePath");
	out.print("<h3>" + param2 + "</h3>");
	out.print("<hr>");
	
%>

</body>
</html>















