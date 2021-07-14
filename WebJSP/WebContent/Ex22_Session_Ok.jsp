<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	//데이터 받기
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");
	
	//업무처리(로직 처리)
	//DB 연결 > select > 회원테이블 > id, pwd 존재 >> 판단
	boolean success = false;
	if(uid.equals(pwd)){
		//로그인 성공
		//로그인이 성공하면 ......  session 객체에 변수를 생성 .. id담자
		//POINT : session객체의 scope (WebAPP전체 : 어떤 페이지든 사용가능)
		session.setAttribute("memberid", uid);
		success = true;
	}

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
			if(success == true){
				out.print("<b>로그인 성공</b><br>");
				String user = (String)session.getAttribute("memberid");
				out.print(user + "님 로그인 되었습니다<br>");
				out.print("<a href='Ex22_Session_Member.jsp'>회원전용</a>");
				
			}else{
		%>
			<script type="text/javascript">
				alert("다시 로그인 해주세요");
				//location.href="Ex21_Session_Login.jsp";
				window.history.go(-1); //Ex21_Session_Login.jsp				
			</script>	
		<%		
			}
		 %>
</body>
</html>


