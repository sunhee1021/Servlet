<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* 
	회원정보 수정하기
	1.DB 쿼리 : 2개 (수정정보 : select , 수정정보반영 : update)
	 1.1 : select * from koreamember where id=?
	 1.2 : update koreamember set ename=? where id=?		 
	2.화면 1개(기존에 입력내용 보여주는 것)-> 처리 1개 (수정처리)
	 2.1  DB select 한 결과 화면 출력 
	   <input type="text" value="rs.getString(id)">
	      수정안하고 .. 화면에출력만 하고 .. 전송(x) : <td>rs.getString("id")</td>
	      수정안하고 .. 화면에출력하고 .. 전송할꺼면   : <input type="text" value="rs.getString(id)" name="id" readonly>
	      수정하고 ..화면에출력하고  ..전송할꺼면   :  <input type="text" value="rs.getString(id)" name="id">
	
	*/
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		//session에 저장된 "userid"값이 null이거나(or) admin이 아니면!!!

		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
		//id값이 없으니까 로그인 페이지로 이동
		//'Ex02_JDBC_Login.jsp' 페이지(링크)로 이동
	}
	
	//1. 한글처리
    request.setCharacterEncoding("UTF-8");
	
	//2. 데이터 받기
	String id = request.getParameter("id");
	
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		conn = Singleton_Helper.getConnection("oracle");
		String sql="select id,pwd,name,age,trim(gender),email from koreamember where id=?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,id);
		
		rs = pstmt.executeQuery(); 
		//데이터 확인 후 select한 값을 rs에 저장
		
		//while(rs.next())
		rs.next(); //1건 데이터가 있다면 전제조건
%>	
	
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
			<td colspan="2"><jsp:include page="/common/Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td style="width: 200px"><jsp:include page="/common/Left.jsp"></jsp:include>
			</td>
			<td style="width: 700px">
				<form action="Ex03_MemberEditok.jsp" method="post">
				<!-- 폼을 서버로 전송(post방식으로) , 데이터를 Ex03_MemberEditok.jsp 페이지(링크)로 보낸다 -->

					<h3 style="text-align: center;">회원가입</h3>
					<div>
						<table
							style="width: 400px; height: 200px; margin-left: auto; margin-right: auto;">
							<tr>
								<td>아이디</td>
								<td>
								  	<input type="text" name="id" value="<%=rs.getString(1)%>" readonly>
								  	<!-- 읽기전용, 화면에출력&서버에전송은 가능 -->
								</td>
							</tr>
							<tr>
								<td>비번</td>
								<td><%= rs.getString(2) %></td>		
								<!-- 화면에출력, 수정X,서버에전송x -->					
							</tr>
							<tr>
								<td>이름</td>
								<td>
									<input type="text" name="name" value="<%=rs.getString(3)%>" style="background-color: yellow">
									<!-- 화면출력,서버전송, 수정 전부 가능 -->
								</td>
							</tr>
							<tr>
								<td>나이</td>
								<td>
									<input type="text" name="age" value="<%=rs.getString(4)%>" style="background-color: yellow">
									<!-- 화면출력,서버전송, 수정 전부 가능 -->
									
								</td>
							</tr>
							<tr>
								<td>성별</td>
								<td>
									[<%=rs.getString(5) %>]
									<!-- 화면에출력, 수정X,서버에전송x -->					
									<input type="radio" name="gender" id="gender" value="여"
									<%if (rs.getString(5).equals("여")){ %>checked<%}%>>여자
									<input type="radio" name="gender" id="gender" value="남"
									<%if (rs.getString(5).equals("남")){ %>checked<%}%>>남자
									<!-- 화면출력,서버전송, 수정 전부 가능, 기존성별에 checked 되어있음 -->
									
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>
									<input type="text" name="email" value="<%=rs.getString(6)%>" style="background-color: yellow">
									<!-- 화면출력,서버전송, 수정 전부 가능 -->
									
								</td>
							</tr>
							<tr>
								<td colspan="2">
								<input type="submit" value="수정하기">
								<!-- 수정하기 버튼누르면 서버로 데이터전송 -->
								<a href='Ex03_Memberlist.jsp'>리스트이동</a></td>
								<!-- 'Ex03_Memberlist.jsp'로 페이지(링크)이동 -->
								
								<!-- 
								수정하기 눌러도 memberlist 페이지로 이동
								리스트이동 눌러도 memberlist 페이지로 이동 된다
								 -->
						</table>

					</div>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>
<%
	}catch(Exception e){
		
	}finally{
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
		//자원해제
	}

%>
