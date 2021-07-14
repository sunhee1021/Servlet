<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = request.getParameter("ID");
	if(id.equals("hong")){
%>

	<%=id %><img src="images/1.jpg" style="width:100px; height:100px;">

<%		
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL과 JSTL 사용하기</h3>
	<!--${param.ID}  >> request.getParameter("ID") -->
	
	<c:if test="${param.ID == 'hong'}">  <!-- EL 안쪽에 써야해 -->
		${param.ID}<img src="images/1.jpg" style="width:100px; height:100px;">
	
	<!-- 위에 코드가 이렇게 되는거임(다른버전) -->
	</c:if>
	
	<h3>JSTL IF문</h3>
	<!-- 
	http://localhost:8090/WebJSP_EL_JSTL/Ex04_EL_JSTL.jsp?ID=hong&!!age=25!! 가정하고
	  -->
	
	<c:if test="${param.age > 20 }" var="result">   <!-- 잘안쓰지만, 조건에대한 true/false값을 result에 담을수 있음 -->
		param.value : ${param.age}
	</c:if>
	if구문에 만들었던 var 변수값 : ${result}<br>
</body>
</html>