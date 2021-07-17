<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- 화면 단과 처리페이지 두개로 나뉘어져 있음(보통) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.css" rel="stylesheet">

</head>
<body>
	<table 
		style="width: 900px; height: auto; margin-left: auto; margin-right: auto;">
		<tr>
			<td colspan="2">
				<jsp:include page="/common/Top.jsp"></jsp:include>
				<!-- 테이블의 첫 row에 top.jsp페이지를 include 한다-->
				
			</td>
		</tr>
		<tr>
			<td class="left" style="width: 200px ">
				<jsp:include page="/common/Left.jsp"></jsp:include>
				<!-- 테이블의 두번째 row에 left.jsp페이지를 include 한다-->
				
			</td>
			<td class="main" style="width: 700px; text-align : center; bgcolor : white;">
			
				<!-- MAIN PAGE CONTENT  -->
				<%
					String id = null;
					id = (String)session.getAttribute("userid");
					//session에 저장된 "userid"값을 조회해서 id에 저장
					
					if(id != null){
						//회원
						//조회된 id값이 null이 아니면!!!
						//id가 있는거니까 회원!
						out.print(id + " 회원님 방가방가^^<br>");
						if(id.equals("admin")){
							//id값이 admin인 경우에만
							out.print("<a href='Ex03_Memberlist.jsp'>회원관리</a>");	//admin이면 이 링크를 살려줄거임
							//회원관리(Ex03_Memberlist.jsp)를 링크로 해주고
							//그 페이지(링크)로 이동할수 있음
						}
					}else{
						//로그인 하지 않은 사용자
						//메인 페이지는 회원만 볼수 있어요(회원님 방가방가^^) 
						//(강제 링크 추가)
						out.print("사이트 방문을 환영합니다 ^^ <br>회원가입 좀 하지 ...");
					}
				%>
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include></td>
				<!-- 테이블의 세번째 row에 bottom.jsp페이지를 include 한다-->
		
		</tr>
	</table>
</body>
</html>


