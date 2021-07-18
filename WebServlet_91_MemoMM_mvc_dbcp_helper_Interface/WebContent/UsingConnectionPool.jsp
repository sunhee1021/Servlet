<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tomcat Connection Pool 사용하기</title>
</head>
<body>
<%
	Connection conn= null;
	
	//JNDI
	Context context = new InitialContext(); //현재 프로젝에서 특정 이름을 가진 녀석을 검색(이름 기반 검색)
	 										//= 이름기반으로 검색하겠다
	DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");  
						 //java:comp/env/  +  jdbc/oracle   이름  => 정해진 약속
						 //   위에코드(주석) + 이름
						 // 이름이 어디있는데?
						 //context.xml에 있는 name 값 (맨밑에 있음)
																
	//POOL 안에서  connection 가지고 오기
	conn = ds.getConnection();
	
	out.print("db 연결여부 : " + conn.isClosed() + "<br>");
	//이 값이 false가 나오면 연결이 된거죠
	
	//POINT 반드시 집에 가실때 반환
	conn.close(); //반환 (POOL)
	//여기서 close는 연결을 끊는것이 아니라 pool에 반환하는거야!!!!!!!!!!!!!!!!!!!!!!!!
	
	out.print("db 연결여부 : " + conn.isClosed() + "<br>");
	//여기는 반환을 했으니까 true가 나와야해
%>
</body>
</html>