<%@page import="kr.or.bit.utils.SingletonHelper"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.bit.utils.ConnectionHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	conn = ConnectionHelper.getConnection("oracle");
	System.out.println(conn);
	//conn.close();
	
	conn = ConnectionHelper.getConnection("oracle","hr","1004");
	//conn 객체 정보
	System.out.println(conn);  //conn.close()를 하지않고 또부르면 새로운 객체가 생성되는구나
	
	//5개의 Page >> DB연결 >> ConnectionHelper.getConnection("oracle")
	//하나의 연결객체를 만들어서 사용하면 되지 않을까? => singleton (학습용으론 좋지만 실개발에서는 잘 안쓴대요)
	
	Connection conn2 = null;
	conn2 = SingletonHelper.getConnection("oracle");
			
	Connection conn3 = null;
	conn2 = SingletonHelper.getConnection("oracle");
	
	System.out.println(conn2 == conn3);
	System.out.println(conn2);
	System.out.println(conn3);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	연결여부(false면 성공) : <%= conn.isClosed() %><br>
	재정의 : <%= conn.toString() %><br>
	ProductName : <%= conn.getMetaData().getDatabaseProductName() %><br>
	ProductVersion : <%=conn.getMetaData().getDatabaseProductVersion() %><br>
	
</body>
</html>