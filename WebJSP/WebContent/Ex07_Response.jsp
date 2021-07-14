<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Response</title>
</head>
<body>
	<!-- 
		웹 환경 
		
		Client 가 -> Server에게 요청을 보내는 거임 (서버는 요청된 정보는 read (request 객체를 갖고있음))
			  (request_요청)
			  
		
		Server 는 -> client 에게 응답을 주는 거임
			  (response_응답)    >>    응답의 결과는    >>    client의 브라우져가 해석함
		(아파치 톰켓 : WAS : 자원들은 패키지명이 javax로 되어있음)
		
		response 
		1. 표현식을 만들수 있음 (출력) %= 으로 쓰던거
		2. 페이지의 이동처리를 담당 ***(중요)  (sendRedirect)
		
		***javascript : location.href="Ex01_Basic.jsp" 랑 같음
		***서버에게 페이지를 재요청 : F5(새로고침)랑 같은 효과
		
		java 코드 (재요청)을 할수 있는 방법?
		response가 갖고 있는
		response.sendRedirect("Ex01_Basic.jsp") 서버에서 변경 (Client 인지하는 코드로)
		>>클라이언트 브라우져에 전달되면 어떻게 보일까? >> location.href="Ex01_Basic.jsp" (페이지에 이렇게 날아감)
	 -->
	 
	 1. 일반적인 출력() :  <%=100 + 200 + 300 %>
	 2. sendRedirect : response 객체의 함수
	 <%
	 	response.sendRedirect("Ex01_Basic.jsp");	//이게 안쓰고 싶다면 </body>밑에
	 												//<script type="text/javascript">location.href="Ex01_Basic.jsp"</script> 해도 똑같음
	 												//페이지의 재요청이라는 결과는 동일
	 %>
</body>
</html>