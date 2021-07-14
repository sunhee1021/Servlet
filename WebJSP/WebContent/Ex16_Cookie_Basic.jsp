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
		정보(데이터)  > 저장 > 장소(where)
		
		클라이언트(개인 로컬 PC) : 서버(웹 서버 or DB서버를 의미함)
		
		정보(데이터, 자료) >> 어디에 저장(보관)
		고민(기준점) : 보안 요소 (정보의 중요성), 소멸(일시적, 영속적)
		
		Client (Local PC : 웹브라우져) _ 내가원하는 정보를 client 의 메모리에 , pc에 저장할수 있다
		  
		1. Cookie(메모리쿠키, 파일쿠키 (local 디스크 (txt)파일로 저장 : 내용은 암호화 됨
		   > 소멸시기에 따라 종류가 나뉨 
		   > 단점 : 크기 (제한적, 사용이 조금 붎편함)
		   
		2. Local storage (key, value) 형태로 저장 가능한 구조
		
		Server(웹 서버 : WAS)
		1. server 쪽에 memory : session 객체 (사이트에 접속하는 사용자마다 부여하는 고유한 식별값 : )
		>> 서버 리부팅, 서버를 끄거나 정지 하면 데이터 소멸 됨
		
		2. server 쪽에 memory : Application 객체 (사이트에 접속하는 모든 사용자가 공유하는 객체)
		>> 서버 리부팅, 서버를 끄거나 정지 하면 데이터 소멸 됨
		
		3. server 영속적 (서버 리부팅, 정지) 남아있는 데이터 : 파일.txt >> 관리가 힘들어요
		4. DB server : 보안, 영속관리가 가능 ... (비용은 추가)
		
		
 -->
 <%
 	Cookie mycookie = new Cookie("cname","1004"); //쿠키의 이름, 밸류값
 	//쿠키 객체 생성
 	//내 사이트에 접속한 브라우져(client)에게 전달   >>   response
 
 	response.addCookie(mycookie);
 %>
 <a href="Ex17_Cookie_Read.jsp">Cookie read</a>
</body>
</html>


















