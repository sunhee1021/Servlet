<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		//session에 저장된 "userid"값이 null이거나(or) admin이 아니면!!!

		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
		//id값이 없으니까 로그인 페이지로 이동
		//'Ex02_JDBC_Login.jsp' 페이지(링크)로 이동
	}
    
	//1.한글처리
	request.setCharacterEncoding("UTF-8");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>
<link href="css/bootstrap.css" rel="stylesheet">

</head>
<body>
	<table style="width: 900px; height: 500px ;margin-left: auto; margin-right: auto;">
		<tr>
			<td colspan="2"><jsp:include page="/common/Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td style="width: 200px"><jsp:include page="/common/Left.jsp"></jsp:include>
			</td>
			<td style="width: 700px">
			 <!--  데이터 받아서 UI 구성 -->
			 <%
			 	//search(이름으로 조회)의 값을 요청해서 name에 저장하고
			 	String name=request.getParameter("search");	
			 
			 	Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
			    
				//where ename like '%길동%'
				conn = Singleton_Helper.getConnection("oracle");
				String sql="select count(*) from koreamember where name like ?";
				//String sql2 ="select id, name, email from koreamember where name like '%"+name+"%'";
				//여기는 ? 안썻어요 왜지....... 그냥 보여주시려고 쓰셨대요
				//권장사항은 위에 ? 입니다
						
				//이름에 검색한 글자가 글어가면 조회되게 쿼리문을 적어주고
				//저장 후 실행
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%'+name+'%');
				rs= pstmt.executeQuery();
				int rowcount=0;
				
				//조회된 데이터가 있으면
				if(rs.next()){
					rowcount = rs.getInt(1); //col의 번호임 위에 count(*)로 되어있어서 int가 타입인거야
				}
			 %>
				<table style="width: 400px;height: 100px;margin-left: auto;margin-right: auto">
							<tr><th colspan="4">회원리스트</th></tr>
							<%
								//조회건수가 0보다 크면
								if(rowcount > 0){
									pstmt = conn.prepareStatement(sql); 
									rs = pstmt.executeQuery();
									while(rs.next()){
										String id = rs.getString(1);
										String mname = rs.getString(2);
										String email = rs.getString(3);
							%>
									 <tr>
									 	<td><%=id%></td>
									 	<td><%=mname%></td>
									 	<td><%=email %></td>
									 </tr>
									 
									 <!-- 각 id, name, email 값을 응답받아서 출력 -->
							<%			
									} //end while
									out.print("<tr><td colspan='3'>");
									out.print("<b>[" + name + "] 조회결과" + rowcount + "건 조회</b>");
									out.print("</td></tr>");	
								}else{ //조회된 건수가 없는 경우
									out.print("<tr><td colspan='3'>");
									out.print("<b>[" + name + "] 조회결과가 없습니다</b>");
									out.print("</td></tr>");	
								}
							%>
				</table>
				<a href="Ex03_Memberlist.jsp">회원 목록 페이지</a>
			<%
				Singleton_Helper.close(rs);
				Singleton_Helper.close(pstmt);
				//자원해제
			%>		
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>