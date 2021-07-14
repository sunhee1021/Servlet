<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="8kb" autoFlush="true" %>	<!-- 명시적으로 구현하지 않아도 default로 8kb를 쓰게 되어있음 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
			//내장객체 중에서 out객체(was(tomcat)가 갖고 있는) >> java로 따지자면 System.out.println("")과 같은 역할
	
			for(int i = 0; i < 10; i++){
			out.print("<b>"+i+"<b><br>");   //원래는 <%= 으로 했었지?
			}
			//buffer에 담아서 ... 출력
			//jsp는 페이지에 더이상 출력할 내용이 없으면(buffer에 담을 내용이 없다면) 자동으로 flush 함
	%>
</body>
</html>