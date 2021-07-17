<%@page import="java.util.Scanner"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
	DML (insert, update, delete)
	JDBC API 통해서 작업
	1. 결과 집합이 없다
	2. 반영결과(반영된 행의 수 return)
	
	update emp set sal=0 을 실행
	>> return 14 (정상일때)
			
	update emp set sal=100 where empno=1111 (사원번호가 1111인 경우가 없지)
	>> return 0
			
	java 코드 조건처리 통해서 (성공과 실패 판단)
	
	KEY POINT
	1. Oracle DML (developer, cmd, Tool을 사용해서) DML을하면 기본 옵션이 commit or rollback 이 강제
	2. JDBC API 사용해서 작업하면 >> DML >> default >> autocommit(auto가 기본값)
	3. java 코드에서 delete from emp >> 실행 >> 자동 commit >> 실반영
	4. 필요에 따라서 commit, rollback 을 java 코드에서 제어 가능
	
	시작
	 A계좌에서 인출(update)
	 ....
	 B계좌에  입금(update)
	종료
	하나의 논리적인 단위(transaction) : 성공 아니면 실패
	근데 인출은 성공했는데 입금에 실패하면 autocommit인 경우 어떡하지?
	
	autocommit 옵션 >> false 전환을 해주면 된당
	java code 명시적으로 >> commit(), rollback() 구현해야 합니다
	
	*/
	
	Connection conn = null;
	Statement stmt = null;
	//ResultSet 이 필요없어요 >> DML작업에서는 왜? >> 담지 않는데뭘
	
	try{
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bituser","1004");
		System.out.println("연결 여부 : false(연결)" + conn.isClosed());
		stmt = conn.createStatement();
		/*
		//insert
		int empno = 0;
		String ename = "";
		int deptno=0;
		
		Scanner sc = new Scanner(System.in);
		System.out.println("사번 입력");
		empno = Integer.parseInt(sc.nextLine());
		
		System.out.println("이름 입력");
		ename = sc.nextLine();
		
		System.out.println("부서번호 입력");
		deptno = Integer.parseInt(sc.nextLine());
		
		//insert into emp(empno, ename,deptno) values(2000,'홍길동',30)
		//예전에나 .. 현재는 (parameter 값 설정 ..) >> values(?,?,?);
		String sql = "insert into dmlemp(empno, ename, deptno)";
		sql += "values(" + empno + ",'" + ename + "'," + deptno + ")";
		
		int resultrow = stmt.executeUpdate(sql);	//pk제약 예외가 여기서 터진거임(if문에서 else문 걸린게 아니야)
		
		*/
		
		//UPDATE
		/*
		int deptno = 20;
		String sql = "update dmlemp set sal=0 where deptno=" + deptno;
		*/
		
		//DELETE
		int deptno = 20;
		String sql = "delete from dmlemp where deptno=" + deptno;
		
		int resultrow = stmt.executeUpdate(sql);
		
		if(resultrow > 0 ){
			System.out.println("반영된 행의 수 : " + resultrow);
		}else{
			//POINT
			//문제가 생긴것이 아니고 (예외가 발생된게 아니라)
			
			//반영된 행이 없는거임
			System.out.println("반영된 행이 없는거지 예외인게 아니야");
		}
		
	}catch(Exception e){
		System.out.println(e.getMessage());
		
		//사실은 여기서 코드처리해야함
		//예외발생에 대한 코드 처리
		//******************************
		
	}finally{ //예외가 발생하던 발생하지 않던 실행하겠다
		if(stmt != null) try{stmt.close();} catch (Exception e){}
		if(conn != null) try{conn.close();} catch (Exception e){}
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>


