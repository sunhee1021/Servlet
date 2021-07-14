<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.bit.Emp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSTL for</h3>
	<!-- 
		java 코드
		int sum = 0;
		for(int i = 0; i <= 100; i++){
			sum+=i;
		}
		
		for(String s : list){}
		
	 -->
	 <c:forEach var="i" begin="1" end="10"> <!-- = for(int i = 0; i <= 10; i++) -->
	 	<c:set var="sum" value="${sum+i}"/>
	 	<b>${i}</b><br>
	 </c:forEach>
	 sum 누적값 :  ${sum}<br>
	 
	 <h3>구구단 5단 출력하기 (forEach)</h3>
	 
	 <ul>
	 <c:forEach var="i" begin="1" end="9">
	 	<li>5*${i}=${5*i}</li>
	 	</c:forEach>
	 </ul>
	 
	 <h3>EL & JSTL 사용해서 구구단 출력하세요 (중첩 forEach)</h3>
	 <ul>
	 <c:forEach var="i" begin="2" end="9">
	 	<c:forEach var="j" begin="1" end="9">
	 		<li>${i} X ${j} = ${i*j}</li>
	 	</c:forEach>
	 </c:forEach>
	 </ul>
	 
	 <h3>강사님 버전</h3>
	 <table border="1">
	  <c:forEach var="i" begin="2" end="9">
	 	<c:forEach var="j" begin="0" end="9">
	 		<c:choose>
	 			<c:when test="${j == 0}">
	 				<tr bgcolor="gold"><th>${i}단</th></tr>
	 			</c:when>
	 			<c:otherwise>
	 				<tr><td>${i} X ${j} = ${i*j}</td></tr>
	 			</c:otherwise>
	 			</c:choose>
	 	</c:forEach>
	 </c:forEach>
	 </table>
	 
	 <h3>JSTL forEach 사용하기</h3>
	 <%
	 	int[] arr = new int[]{10,20,30,40,50};
	 	for(int i : arr){
	 		out.print("출력값 : <b><i>" + i + "</i></b><br>");
	 	}
	 %>
	 
	 <h3>EL java 객체에 직접 접근이 불가능하다</h3>
	 arr 객체 배열에 접근 불가 : ${arr}<br>
	 
	 <c:set var="intarr" value="<%=arr %>"/>
     EL 접근 : ${intarr}<br>
     <hr>
     <h3>forEach도 개선된 for문을 가지고 있네</h3>
     <c:forEach var="i" items="${intarr}">  <!-- begin end가 아니라 items라는게 있어서 개선된 for문처럼 쓸수 있어 -->
     	배열값 : ${i}<br>
     </c:forEach>
     
     <h3>단순하게</h3> <!-- 꼭 c:set에 담아서 출력해야 하나요? 아니요 이렇게 간단하게도 가능합니다 -->
     <c:forEach var="i" items="<%=arr %>">
     	배열값2 : ${i}<br>
     </c:forEach>
     
     <h3>재미삼아서</h3> <!-- 이렇게도 가능하지만 가독성이 떨어지니까 쓰지마세요!!!!!!!!!!!!!!!!!!!!! -->
     <c:forEach var="i" items="<%= new int[]{1,2,3,4,5} %>">
     	배열값3 : ${i}<br>
     </c:forEach>
     
     <h3>forEach 속성활용하기</h3>
     <c:forEach var="i" items="${intarr}" varStatus="status">
     	index: ${status.index}&nbsp;&nbsp;&nbsp;
     	count: ${status.index}&nbsp;&nbsp;&nbsp;
     	value: ${i}<br>
     </c:forEach>
     
     <hr>
     <h3>TODAY POINT (게시판 화면 구성에 가장 중요한 요소)</h3>
     <%
     	//사원 정보를 담는 테이블이 있다고 치자(어디에? DB에)
     	//JAVA 코드 : List<Emp> getEmpList() { 여기안에서 구현되는 코드는 ↓}
     	List<Emp> emplist = new ArrayList<>();
     	emplist.add(new Emp(100,"A"));
     	emplist.add(new Emp(200,"B"));
     	emplist.add(new Emp(300,"C"));
     	
     	//return emplist;
     	
     	//함수의 리턴값을 받아서 처리하는게 자바의 for문
     	for(Emp e : emplist){
     		out.print(e.getEmpno() + "/" + e.getEname() + "<br>");
     	}
     	
     	//JSP 페이지에서 테이블 태그 결합해서 이쁘게 출력
     	request.setAttribute("list", emplist);
     	//include나 forward 된 페이지에서 사용할 수 있다 or request.getAttribute 이렇게 해서 사용도 가능
     	//or EL > requestScope.list 해서 객체를 사용해서도 가능
     %>
     
     <h3>게시판 데이터 출력(EL&JSTL)_버전1</h3>
     <c:set var="list" value="<%=emplist %>"/>
     <table border="1">
     	<tr><td>사번</td><td>이름</td></tr>
     	<c:forEach var="emp" items="${list}">
     	<tr><td>${emp.empno}</td><td>${emp.ename}</td></tr>
     	</c:forEach>
     </table>
     
     <h3>게시판 데이터 출력(EL&JSTL)_버전2</h3>
     <table border="1">
     	<tr><td>사번</td><td>이름</td></tr>
     	<c:forEach var="emp" items="<%=emplist %>">		
     	<tr><td>${emp.empno}</td><td>${emp.ename}</td></tr>
     	</c:forEach>
     </table>
     
     <h3> java Map 객체 EL&JSTL 사용해서 출력</h3>
     <%
     	Map<String,Object> hm = new HashMap<>();  //map같은건 자바로 만들어야 해요
     	hm.put("name","hong");
     	hm.put("pwd","1004");
     	hm.put("date",new Date());
     	
     %>
     <c:set var="hm" value="<%=hm %>"/>
     <c:forEach var="obj" items="${hm}">
     	${obj.key} -> ${obj.value}<br>
     </c:forEach>
     
     key:name : ${hm.name}<br>
     key:pwd : ${hm.pwd}<br>
     key:date : ${hm.date}<br>
     
     <h3>기타 옵션</h3>
     <h3>JSTL 구분자 기준 처리</h3>
     <c:forTokens var="token" items="A.B.C.D" delims=".">		<!-- forTokens -> split 효과 -->
     	${token}<br>
     </c:forTokens>
     
     <h3>JSTL 복합구분자 기준 처리</h3>
     <c:forTokens var="token" items="A.B/C-D" delims="./-">		<!-- forTokens -> split 효과 -->
     	${token}<br>
     </c:forTokens>
     
     <!-- 
     	forEach
      -->
      
      <c:set var="nownum" value="10"/>
      <c:forEach var="i" begin="0" end="${nownum}" step="1">  <!-- step : 증가감 -->
      	${nownum + i}<br>     <!-- forEach 문은 역순으로 못돌아요 -->
      </c:forEach>
      
</body>
</html>























