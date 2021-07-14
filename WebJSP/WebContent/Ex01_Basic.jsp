<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   	//java코드
   	Date day = new Date();
	/*
		JSP 페이지 : UI(html+css+javascript) + (JAVA 코드)
		        >> 단, 자바코드는 <% 스크립트 릿 안에 구현해라
		
		>> 디자인코드 + 서버 로직 코드 : 혼재된 방식 (불편해요... 앞으로 학습)

		servlet(형) + jsp(동생)
		>> java 웹 기반 기술이 아니었음 >> 계산기, 그림판, 윈도우프로그램 >> 웹 (servlet)
		>> java 페이지로 web서비스를 하자 >> login.java >> 단점 >> 배우기 어렵다 , 디자인작업이 어렵다,협업(x)
		
		>> JSP (강점 : UI)_html 기반_(Servlet의 UI 아쉬움때문에 쓰는거니까)
		>> 단점 > java 코드를 <% 스크립트릿에 써야함
		
		>> servlet으로 웹? 아니면 jsp로 웹? 어떤게 맞나요?
		>> 현대의 프로그래밍은 >> 뭘쓸까? >> 둘다씀
		>> servlet (java 코드) + jsp(UI) >> MVC 패턴
		Modle (DAO, DTO)   >> 객체 만드는거 (순수한 JAVA코드)
		View  (UI)    >> JSP
		Controller    >> java 코드 웹 제어 (응답&요청을 처리) >> servlet
		
		>> servlet (java 코드) + jsp(UI) >> MVC 패턴 >> servlet+jsp 활용한 MVC 패턴
		
		>> 중간 프로젝트 : model2 기반의 MVC 패턴
		
		>> JSP 와 html 차이점
		>> Tomcat(WAS) 처리
		>> 1. html : web server (클라이언트 요청 -> 응답) : 192.168.0.000/login.html
		>> 2. jsp : was를 통해서 컴파일 >> class 생성 >> 실행 (가지고 있는 코드 : text, html, script) >> 전달
		>> WAS(jsp) > compile(a.jsp.java) > a.jsp.class > 실행되면 > 정적 + 동적 > 정적파일 (text, html, script) > 전달
		>> ASP (ASPX) , PHP, JSP 이런것들의 장점은 : 코드 노출이 안된다 >> 보안상 좋다
		
		>> 컴파일 > 실행 (a.jsp.class) > 전달 
		>> A 친구 요청 >> new.jsp >> was는 new.jsp에 대한 실행파일 여부를 확인 >> 있다면(컴파일된게) >> 그대로 서비스
																    >> 없다면 >> 컴파일 >> 실행
		>> 개발자 new.jsp 수정 ... 코드 수정을 인지함(was가) >> 재컴파일함 ... 걱정하실 필요없다
		>> 컴파일 코드 확인 
		>> C:\Users\sh089\WEB(Back)\WebLabs\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\WebJSP\org\apache\jsp
		>> 책 4장
		
		JSP 구성요소
		1. 선언부 : page 지시자 >> 사용언어, 인코딩, import 
		<%@ page language="java"
		
		2. 스크립트 요소
		2-1. 스크립트 릿 <% java 코드
		2-2. 표현식(출력방법) : 출력하는 대상(client의 대상(브라우져)) : <%= 전달 내용	/ 여기서 (=) 는을 response로 인식 
		2-3. 선언부(공통자원(scope page)) : 공통함수 정의 >> <%! 공통함수... 
	*/
	
	//이 페이지에서 사용하는 공통함수를 만드세요
	
%>
<%!
	public int add(int i , int j){
			return i+j;
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSP</h3>
	<%=day %>
	<br>
	<%= add(10,20) %>
	<%
		int result = add(100,200);
	%>
	<hr>
	합 결과 : <%=result %>
</body>
</html>