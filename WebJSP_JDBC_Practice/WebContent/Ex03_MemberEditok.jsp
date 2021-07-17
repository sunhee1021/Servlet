<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//권한처리
	
	//한글처리
	
	//데이터 받기 (id, name, age, gender, email)
	
	//update koreamember set name=? , age=? , email=? , gender=?
    //where id=?
    		
    //처리 : Ex03_Memberlist.jsp 이동  
    
    
    //session에 저장된 "userid"값이 null이거나(or) admin이 아니면!!!
	if(session.getAttribute("userid") == null || 
	!session.getAttribute("userid").equals("admin")  
	){
	  //다른 페이지 이동
	  out.print("<script>");
	  out.print("location.href='Ex02_JDBC_Login.jsp'");
	  //id값이 없으니까 로그인 페이지로 이동
	  //'Ex02_JDBC_Login.jsp' 페이지(링크)로 이동
	  out.print("</script>");
	}
 
	//1.한글처리
	request.setCharacterEncoding("UTF-8");
	
	//2.데이터 받기
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	//out.print(id + " / " + name + " / " + age + " / " + email);
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		//Singleton_Helper 이용해서 DB연동(연결)하고
		conn = Singleton_Helper.getConnection("oracle");
		
		//명령 실행
		String sql = "update koreamember set name=? , age=? , email=? , gender=? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, age);
		pstmt.setString(3, email);
		pstmt.setString(4, gender);
		pstmt.setString(5, id);
		
		//변경된 값을 저장
		int result = pstmt.executeUpdate();
		if(result > 0){ //변경된 값이 0보다 크면
			out.print("<script>");
			out.print("location.href='Ex03_Memberlist.jsp'");
			//Ex03_Memberlist.jsp 페이지(링크)로 이동
			out.print("</script>");
		}
		
	}catch(Exception e){
		e.printStackTrace(); //예외처리
	}finally{
		Singleton_Helper.close(pstmt);
		//자원해제
	
	}
%>
 