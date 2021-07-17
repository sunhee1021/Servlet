<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	/*  
	회원가입 처리 페이지 (디자인 필요 없다)
	1.한글처리
	2.데이터 받기(request)
	3.데이터 확인하기
	4.로직처리 (비지니스 로직)
	  회원가입 -> 데이터 받아서 -> DB 연결 -> Insert -> 유무 -> Client 
	 
	 Insert 성공 > 회원가입 > 페이지 이동 > 로그인 화면(로그인 요구) 
	  이동 : java: response.sendRedirect("") , javaScript: location.href="" 
	 >> 클라이언트가 서버에게 페이지를 재요청 
	 >> 
	  
	 Insert 실패 > 경고창 > 회원가입 이동
	 >> <script>alert()</script>
	 
	 DB:
     id, pwd, name, age, gender, email, ip
     ip .....request.getRemoteAddr()
	*/
	
	//1.한글처리	
	request.setCharacterEncoding("UTF-8");
	
	//2.데이터 받기 
	String id = request.getParameter("id"); 
	String pwd = request.getParameter("pwd"); 
	String name = request.getParameter("mname"); 
	int age = Integer.parseInt(request.getParameter("age")); 
	String gender = request.getParameter("gender"); 
	String email = request.getParameter("email"); 
	
	//out.print(id + "/"+pwd + "/"+name + "/"+age + "/"+gender + "/"+email);
	//out.print(request.getRemoteAddr());
	
	//드라이버 로딩
	Class.forName("oracle.jdbc.OracleDriver");
	
	//Connection, PreparedStatement 객체로 DB 연결
	Connection conn = null;
	PreparedStatement pstmt=null;
	
	
	//3.받은 데이터 판단(확인) 및 로직처리
	try{
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bituser","1004");
		String sql="insert into koreamember(id,pwd,name,age,gender,email,ip) values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, gender);
		pstmt.setString(6, email);
		pstmt.setString(7, request.getRemoteAddr());
		
		int result = pstmt.executeUpdate();
		//pstmt.ExecuteUpdate
		//결과를 int타입으로 반환
		//insert,delete,update 관련 레코드 건수!를 반환한다
		//create,drop 관련구문에서는 -1를 반환
		
		//executeUpdate()는 수행결과로  -> insert,update,delete -> int 반환
		//executeQuery() 는 수행결과로  -> select               -> ResultSet 반환
		
		if(result !=0){
			//업데이트된 결과값이 0이 아니면 회원가입으로 결과값이 변경된거니까
			out.print("<script>");
				out.print("location.href='Ex02_JDBC_Login.jsp'");
				//Ex02_JDBC_Login.jsp 페이지(링크)로 이동
				//회원가입이 되었으니 로그인을 진행하게
			out.print("</script>");
		}else{ //실행될 확률 거의없다 ...
			out.print("<script>");
				out.print("alert('가입실패');");	
			out.print("</script>");		
		}
		
	}catch(Exception e){
		// pstmt.executeUpdate(); 실행시  PK 위반 예외 발생    if 타지 않고 ....
		out.print("<script>");
			out.print("alert('가입실패');");	
			out.print("location.href='Ex02_JDBC_JoinForm.jsp'");
			//다시 회원가입페이지를 보여준다
			//'Ex02_JDBC_JoinForm.jsp' 페이지(링크)로 이동
		out.print("</script>");
	}finally{
		//자원해제(pstmt,conn)
		if(pstmt != null){ try{pstmt.close();}catch(Exception e){} }
		if(conn != null){ try{conn.close();}catch(Exception e){} }
	}
	
%>










