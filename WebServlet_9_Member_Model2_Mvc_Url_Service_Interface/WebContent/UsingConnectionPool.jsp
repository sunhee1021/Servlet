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
	//DB와 연결된 커넥션(connection)을 미리 생성해서 풀(pool) 속에 저장해 두고 있다가 필요할 때에 가져다 쓰고 반환
	Connection conn= null;
	
	
	/*	JNDI 검색
		톰캣이 참조할 자원 (계정과 비밀번호)을 찾아야만 접속이 가능하다. */
		

	// JNDI서비스를 제공하는 객체 생성
	// JNDI 검색을 위한 상수값 지정 (JAVAX.NAMING으로 IMPORT)
	// CONTEXT.XML의 CONTEXT태그에 접근
	// JAVA:COMP/ENV는 톰캣에서 참조파일 (리소스)을 관리하는 가상의 주소로서, JDBC/ORACLE_TEST는 CONTEXT.XML에 등록한 계정 정보이다.
	// LOOKUP은 JNDI의 메소드로서 NAME과 KEY값을 통해서 DATASOURCE의 객체를 얻는다.
	Context context = new InitialContext(); //현재 프로젝에서 특정 이름을 가진 녀석을 검색(이름 기반 검색)
	DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");  //java:comp/env/  +  jdbc/oracle   이름  => 정해진 약속
	
	//POOL 안에서  connection 가지고 오기
	conn = ds.getConnection();
	
	out.print("db 연결여부 : " + conn.isClosed() + "<br>");
	
	//POINT 반드시 집에 가실때 반환
	conn.close(); //반환 (POOL)
	
	out.print("db 연결여부 : " + conn.isClosed() + "<br>");
%>
</body>
</html>