<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/Register.do?cmd=registerOk"   method="post">
		ID: <input type="text"      name="id"    placeholder="아이디 입력"><br>  <!-- 여기name도 db의 컬럼명하고 똑.같.이 써야함-->
		PWD: <input type="password" name="pwd"   placeholder="비밀번호 입력"><br>  				<!-- 자동완성을 위해 -->	
		EMAIL: <input type="text"   name="email" placeholder="이메일 입력"><br>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>