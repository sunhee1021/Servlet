<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/*  
		1. 권한검사
		2. id 값 받기	
		3. DB > delete from koreamember where id=?
		4. 이동처리 >> 삭제 완료시 >> 목록페이지로 이동		
	*/
	
	//요새는 탈퇴해도 그냥 데이터를 삭제하는게 아니라 상태값을 변경하는거임
	//오라클 데이터에서
	// 상태 > 초기 가입상태 일때는> 0
	// 탈퇴 > 상태 > 1
	// 휴면 > 상태 > 2
	// 이런식으로 컬럼을 하나더 만들어서 사용한다고 해요
	
	if (session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin")) {
		//강제로 다른 페이지 이동
		//session에 저장된 "userid"값이 null이거나(or) admin이 아니면!!!

		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
		//id값이 없으니까 로그인 페이지로 이동
		//'Ex02_JDBC_Login.jsp' 페이지(링크)로 이동
	}

	String id = request.getParameter("id");

	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		conn = Singleton_Helper.getConnection("oracle");
		String sql = "delete from koreamember where id=?";
		pstmt = conn.prepareStatement(sql);
		
		//첫번째 ? 에 변수(id)를 세팅
		pstmt.setString(1, id);

		int row = pstmt.executeUpdate();
		//insert,delete,update 레코드 건수!를 반환
		
		if (row > 0) {
			//업데이트 된 레코드 값이 0이 아니면(많으면)
			//delete된 값이 update돼서 값이 변경이 되니까
			out.print("<script>");
			out.print("location.href='Ex03_Memberlist.jsp'");
			//Ex03_Memberlist.jsp 페이지(링크)로 이동
			//회원리스트 화면을 보여줌
			out.print("</script>");

		} else {
			//필요에 따라 추가
		}

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		Singleton_Helper.close(pstmt);
		//자원해제
	}
%>


