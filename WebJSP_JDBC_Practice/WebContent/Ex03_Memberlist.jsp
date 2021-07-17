<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/*  
	 1.관리자만 접근 가능한 페이지
	 2.로그인한 일반 회원이 주소값을 외워서 ... 접근불가 
	 3.그러면  회원에 관련되 모든 페이지 상단에는 아래 코드를 ..... : sessionCheck.jsp >> include 
	*/
	 if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		//out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
		response.sendRedirect("Ex02_JDBC_Login.jsp");
		
		/*
		자바스크립트의 location.href()가 해당 코드를 만나는 순간 페이지를 이동하는 반면에 
		response.sendRedirect()는 실행될때 페이지를 이동하는 것이 아니라 
		페이지의 Header정보의 HTTP 상태코드(Status code)를 301로 바꾸어서 보내준다. 
		헤더를 바꾼다는 의미는 response.sendRedirect()이하의 모든 코드를 다 실행한다는 얘기다.
		
		*/
	} 
%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.css" rel="stylesheet">

</head>
<body>
	<table style="width: 900px; height: 500px; margin-left: auto; margin-right: auto;">
		<tr>
			<td colspan="2">
				<jsp:include page="/common/Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td style="width: 200px">
				<jsp:include page="/common/Left.jsp"></jsp:include>
			</td>
			<td style="width: 700px">
			<!--  
				회원 목록(리스트) 출력
				목록 (select id, ip from koreamember)
			-->	
				<%
					//DB연동 및 명령 실행
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try{
						conn = Singleton_Helper.getConnection("oracle");
						String sql="select id, ip from koreamember";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery(); 
				%>	
					<table style="width: 400px;height: 100px;margin-left: auto;margin-right: auto">
							<tr><th colspan="4">회원리스트</th></tr>
							<!-- col 4개를 병합해서 th로 만듬 "회원리스트" -->
						<% while(rs.next()){ %>
						 <!-- 데이터가 있을때 while문을 돔 -->
							<tr>
								<td width="100px">
									<a href='Ex03_MemberDetail.jsp?id=<%=rs.getString("id")%>'><%=rs.getString("id")%></a>
									<!-- 
									
									id를 누르면 
									Ex03_MemberDetail.jsp?id=<%=rs.getString("id")%> 페이지(링크)로 이동해서
									=Ex03_MemberDetail.jsp?id=입력받은값
									회원정보를 보여줌 
									id가 key 값
									
									-->
									<!-- 회원정보 -->
								</td>
								<td width="100px"><%=rs.getString("ip")%></td>
								<!-- 화면에 출력O (수정X,서버전송x) IP값 -->
								<td>
									<a href="Ex03_MemberDelete.jsp?id=<%=rs.getString("id")%>">[삭제]</a>
									<!-- 
									ID로 회원을 삭제할수 있다
									삭제를 누르면 Ex03_MemberDelete.jsp?id=입력받은값 이 되어서
									명령실행 되어 회원에서 삭제되고
									다시 memberlist 페이지를 보여준다
									-->
								</td>
								<td>
									<a href="Ex03_MemberEdit.jsp?id=<%=rs.getString("id")%>">[수정]</a>
									<!-- 
									ID로 회원을 수정할수 있다
									삭제를 누르면 Ex03_MemberEdit.jsp?id=입력받은값 이 되어서
									명령실행 되어 회원select -> 회원update 되고
									다시 memberlist 페이지를 보여준다
									-->
								</td>
							</tr> 
						<% } %>
					</table>
					<hr>
						<form action="Ex03_MemberSearch.jsp" method="post">
								<!-- 입력하고나서 이동해야 하는 주소값 = "Ex03_MemberSearch.jsp" -->
							회원명:<input type="text" name="search">
							<input type="submit" value="이름검색하기">
						</form>
					<hr>					
				<%	
					}catch(Exception e){
						
					}finally{
						Singleton_Helper.close(rs);
						Singleton_Helper.close(pstmt);
					}
				%>
			
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include></td>
		</tr>
	</table>
</body>
</html>