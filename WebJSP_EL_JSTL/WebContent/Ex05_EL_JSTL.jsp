<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
/*
JSTL 구문
1. *<c:set 변수 생성, 값을 저장
2. <c:remove 변수 // 삭제할때 쓰임
3. *<c:if test="조건문"
4. *<c:choose (자바의 switch문 비슷) 여러가지 조건이 있을때 처리 가능 (if보다 활용도가 높음) 
5. *<c:forEach 반복문 (자바의 개선된for문)
6. <c:forTokens  for문과 split과 결합
7. <c:out    이 출력문 보다는 EL ${}을 사용하는게 좋습니당
8. <c:catch  예외처리도 가능
*/
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSTL & EL</h3>
	
	EL parameter : ${param.id} - ${param.pwd}<br>  <!-- 실행시킨뒤에 주소창에 ?id=hong&pwd=1004 해주면 달라져요 -->
	
	<h3>EL parameter 값을 변수로 저장</h3>
	<c:set var="userid" value="${param.id}"></c:set>   <!-- value에 EL이 올수 있다구요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<c:set var="userpwd" value="${param.pwd}"></c:set>   <!-- value에 EL이 올수 있다구요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	<hr>
	<h3>JSTL 변수값 출력</h3>
	id: ${userid}<br>
	pwd: ${userpwd}<br>
	<hr>
	<c:if test="${!empty userpwd}">   <!-- pwd가 빈값이 아니면 = pwd가 있다면 -->
		<h3>NOT EMPTY USERPWD</h3>
		<c:if test="${userpwd == 1004 }">
			<h3>WELCOME Admin PAGE</h3>
		</c:if>	
	</c:if>
	
</body>
</html>