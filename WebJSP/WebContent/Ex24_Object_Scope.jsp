<%@page import="kr.or.bit.Emp"%>
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
	Tomcat 제공(WAS) : 기본적인 내장 객체
	1. request (요청 : 클라이언트 정보)
	2. response (응답 : 특정 페이지 이동, 정보 출력, 쿠키 쓰기)
	3. application (전역객체 : web.xml 자원 접근)
	4. session (고유객체 (접속한 사용자에게 부여되는) : 고유한 변수)
	5. out 객체 (출력 담당)
	....
	
	session 객체(활용도 최고)
	[내부에 session 변수를 생성할수 있다]
	scope : a.jsp (session.setAttribute ... "member" 변수 생성)
			b.jsp (session.getAttribute ... "member" 사용 가능)
	
	session 변수는 (현재 WebContent 폴더 안에 있는 모든 페이지에서 사용가능)
	Life-cycle : 1. session 변수는 session 객체와 동일
				 2. session 객체 소멸은 언제 ? : 서버의 리부팅, Tomcat 재실행, session.invaildate() 함수 
				 
	application 객체 
	[내부에 application 변수가 생성 : 전역변수 >> 모든 session (접속한 모든 사용자) 공유 ]
	scope : (현재 WebContent 폴더 안에 있는 모든 페이지에서 사용 가능) >> java >> static
	Life-cycle : 소멸 (서버 리부팅) , Tomcat 재실행 
	
	
	*request 객체
	[내부에 변수를 생성 할수 있음] : request.setAttribute("type", "A");
	scope : 요청 페이지(login.jsp >> 요청당 request 1개 생성) >> scope >> page
	예외적으로 *************
	login.jsp >> ok.jsp(include or forward 를 하고 있다면) request 객체는 ok.jsp에서도 공유 된다
	
 -->
 
 <%
 	Emp emp = new Emp();
 	emp.setEmpno(2000);
 	emp.setEname("홍길동");
 	
 	session.setAttribute("empobj", emp);
 	
 	//어느 페이지에서나 사용가능
 	Emp e = (Emp)session.getAttribute("empobj");
 	out.print(e.getEmpno() + "<br>");
 	out.print(e.getEname() + "<br>");
 	
 	
 	//request
 	request.setAttribute("who","king");
 	//기본은 현재 페이지
 	String who = (String)request.getAttribute("who");
 	out.print(who);
 %>
 <!--  
 <jsp:include page="b.jsp"></jsp:include>
 <jsp:forward page="c.jsp"></jsp:forward>
 
 b.jsp 에서는
 application 변수 가능
 session 변수 가능
 request 변수 <jsp:include>
 
 c.jsp 에서는
 application 변수 가능
 session 변수 가능
 request 변수 <jsp:include>
 
 EL & JSTL
 교재 (21.03.29)p.11,12,13장 끝 14장 내일부터->5->10장까지 이번주에 끝낸대
 -->
</body>
</html>



















