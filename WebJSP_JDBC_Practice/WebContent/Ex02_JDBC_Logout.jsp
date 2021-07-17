<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate(); //서버쪽 메모리에서 모든 세션 정보를 한번에 삭제해버리고
	response.sendRedirect("Ex02_JDBC_Login.jsp");//서버쪽페이지 넘기는거임
	//Ex02_JDBC_Login.jsp 페이지(링크)로 이동
	//로그인 페이지를 보여줌
	
	/*
	invalidate() 는 모든 세션 정보를 한번에 삭제하는것
	
	removeAttribute(String id)는 id에 해당하는 세션정보를 삭제 할수 있음
	
	session 유지시간을 정할수도 있다(web.xml에서 가능)
	ex) 30분 이상 서버에 반응을 보이지 않으면 세션 끊어짐
	
	<session-config>
	  <session-timeout>30</session-timeout>
	</session-config>
	
	*/
	
%>    
