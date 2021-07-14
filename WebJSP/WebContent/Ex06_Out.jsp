<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체(WAS): out</title>
</head>
<body>
	<h2>스파케티 코드(장점 : UI작업_자동완성되니까)</h2>
	<%
		boolean b = true;
		if(10 > 5){
			//출력
			%>
	IF(true)
	<font color="red"><%=b %></font>
	<% 
		}else{
			//출력
		%>
	IF(true)
	<font color="red"><%=b %></font>
	<%
		}
	%>
	
	<h3>out 객체 (서버 코드 작업) : UI작업 힘들엉(문자열로 다 쳐야하니까) : servlet에서 UI하는 방법임</h3>
	<%
		boolean b2 = true;
		if(10 > 5){
			out.print("IF(true)<font color='red'>"+b2+"</font>");
		}else{
			b = false;
			out.print("IF(true)<font color='blue'>"+b2+"</font>");

		}
	%>
</body>
</html>