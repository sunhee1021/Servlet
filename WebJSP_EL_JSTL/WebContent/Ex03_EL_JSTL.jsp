<%@page import="java.util.HashMap"%>
<%@page import="kr.or.bit.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 외부 lib_(JSTL) 사용 조건 -->
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- url=식별값(유일값) / prefix = 주소를 c에 담겠다는 뜻 -->    
    
<%
	Emp e = new Emp();
	e.setEmpno(2000);
	e.setEname("bituser");
	
	HashMap<String,String> hp = new HashMap<>();
	hp.put("data","1004");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>기존방식</h3>
	<%=e %><br>
	<%=e.getEmpno() %><br>
	<%=e.getEname() %><br>
	
	
	<h3>EL 출력방식</h3>
	EL: ${e}<br>  <!-- ${e} 라고 하니까 값이 안나오네? 왜? 자바 객체에 대한 출력을 못해요, 자바객체에 대한 직접적인 접근이 막혀있음 -->
	EL: ${e.getEmpno()}<br> <!-- 이렇게 하면되나? 이렇게도 안되네 -->
	
	<h3>해결방법</h3>
	1. request또는 session 객체에 담아주면 된다 ( 그럼 이중인데? )<br>
	2. JSTL 사용해서 처리 <br>
	
	<h3>JSTL(core) : 변수 생성, 제어문 (그냥은 사용못해, 조건이 있음) , 자바코드없이</h3>
	<c:set var="m" value="<%=e%>"/> 		<!-- 자바없이 스크립트로 변수 생성하는거임, % 어쩔수 없이 e주소를 넣어주는거임 -->
	JSTL을 사용해서 변수 m을 생성 (그 변수를 출력할거임) : ${m}<br>   <!-- 아까는 안됐지만 c:set에 담아놔서 이제는 사용할수 있게 되는거임 -->
	
	getter 함수(권장 방법이 아님) : ${m.getEmpno()}<br>
	
	EL 출력 (m.memberfield명까지만 씀 : 내부적으로 자동으로 getter함수가 호출됨) : ${m.empno}<br> <!-- !!getter setter!!가 class에 구현되어 있어야 사용 가능함 -->
	EL 출력 (m.memberfield명까지만 씀 : 내부적으로 자동으로 getter함수가 호출됨) : ${m.ename}<br>
	<hr>
	
<!-- 
	EL : 출력 목적 >> 제어구조 , 변수 개념이 없어요
	JSTL : EL을 도와서 변수나, 제어구조를 사용할수 있게함
 -->
 	<c:set var="username" value="${m.ename}"/>
 	변수값 출력 : ${username}<br>
 	
 	<hr>
 	<h3>JSTL 변수를 만들고 scope 정의하기</h3>
	<c:set var="job" value="농구선수" scope="request"></c:set>
	<!-- scope이 session 이면 모든 페이지에서 사용 가능-->
	
	당신의 직업은 : ${job}<br>
	만약에 .. include,forward 한 페이지가 있다면 그 페이지에서 EL을 사용해서 job변수가 출력 가능하다<br>
	
	<hr>
	<c:set var="job2" value="야구선수" scope="request"></c:set>
	값 출력 : ${job2}<br>
	
	만든 변수 삭제 기능(잘 쓰지 않아요, 있구나~하세요)<br>
	<c:remove var="job2"/>
	job2 변수 삭제 : ${job2}<br> <!-- 없으면 그냥 안나와요 -->
	
	<hr>
	hp 객체 (직접 접근) : ${hp}<br> <!-- 에러가 아니라 아예 접근이 안됨 -->
	<c:set var="vhp" value="<%=hp %>"/>   <!-- 이때 한번만 스크립트 립으로 hp주소값을 가져와야해 -->
	hp객체 : ${vhp}<br> <!--  {data=1004} hashmap 자체가 toString을 오버라이드(재정의) 해놨나봐 올 -->
	hp객체 : ${vhp.data}<br>
	
	<!-- 
		hp.put("color","red");
		jstl 통해서 가능, 잘쓰지 않아요
	 -->
	<c:set target="${vhp}" property="color" value="red"/> <!-- hp.put("color","red");과 같은 기능
	                                                           잘쓰지 않아요, 그냥 쓰지마세요 라고 하셨음 -->
	hp객체 : ${vhp}<br>
</body>
</html>










