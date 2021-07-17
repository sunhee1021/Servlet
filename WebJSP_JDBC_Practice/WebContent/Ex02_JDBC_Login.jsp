<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.css" rel="stylesheet">

</head>
<body>
	<table
		style="width: 900px; height: 500px; margin-left: auto; margin-right: auto;">
		<tr>
			<td colspan="2">
				<jsp:include page="/common/Top.jsp"></jsp:include>
				<!-- 테이블의 첫 row에 top.jsp페이지를 include 한다-->
				
			</td>
		</tr>
		<tr>
			<td style="width: 200px">
				<jsp:include page="/common/Left.jsp"></jsp:include>
				<!-- 테이블의 두번째 row에 left.jsp페이지를 include 한다-->
			</td>
			<td style="width: 700px">
				<form action="Ex02_JDBC_loginok.jsp" method="post" name="loginForm"
					id="joinForm">
					<!-- 화면단1개/ 처리단1개 -->
					<!-- 폼을 서버로 전송(post 방식으로), 데이터를 Ex02_JDBC_loginok.jsp 페이지로 보낸다 -->


					<h3 style="text-align: center;">Login Page</h3>
					<div>
						<table
							style="width: 400px; height: 100px; margin-left: auto; margin-right: auto;">
							<tr>
								<th>아이디:</th>
								<td><input type="text" name="id" id="id"></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="pwd" id="pwd"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" value="로그인"> <input
									type="reset" value="취소"></td>
							</tr>
						</table>

					</div>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include></td>
			<!-- 테이블의 세번째 row에 Bottom.jsp페이지를 include 한다-->
			
		</tr>
	</table>
</body>
</html>