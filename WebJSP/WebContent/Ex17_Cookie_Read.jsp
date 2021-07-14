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
	접속한 클라이언트 브라우져가 가지고 있는(도메인별로,접속주소별로) Cookie값을 읽어올수 있음(read)
 -->
<%
	Cookie[] cs = request.getCookies();
	if(cs != null || cs.length > 0){
		for(Cookie c : cs){
			out.print(c.getName() + "<br>");
			out.print(c.getValue() + "<br>");
			out.print(c.getMaxAge() + "<br>");	// -1 (소멸시간이 없다 : 메모리 사용)
			out.print(c.getDomain() + "<br>");
		}
	}
%>
</body>
</html>