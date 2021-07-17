<%@page import="java.util.Scanner"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  
지금 작업은 원래 java 코드에서(servlet)에서 작업하는 거임
 -->
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		//2. 드라이버 로딩
		Class.forName("oracle.jdbc.OracleDriver");
		System.out.println("Oracle 로딩 ... ");
		
		//3. 연결 객체 생성
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bituser","1004");
		//이 코드를 만나면 DB랑 연결을 한대요
		System.out.println("연결 여부 : false(연결)" + conn.isClosed());
		
		//4. 명령 객체 생성
		stmt = conn.createStatement();
		
		//4-1. parameter 설정 (옵션)
		String job = "";
		Scanner sc = new Scanner(System.in);
		System.out.println("직종입력");
		job = sc.nextLine();
		
		
		//4-2. 명령구문 생성 
		String sql = "select empno, ename, job from emp where job = '" + job + "'";
		//where job = 'CLERK'
				
		//5. 명령실행
		//DQL(select) > stmt.executeQuery(sql) > return ResultSet 타입의 객체 주소
		//DML(insert, delete, update) > 결과 집합(x) > return 반영된 행의 개수 > stmt.executeUpdate()
		//delete from emp; 실행 return 14
				
		rs = stmt.executeQuery(sql);
		
		//명령처리
		/*
		DQL(select) : 1. 결과가 없는 경우 (where empno=1111)
					  2. 결과가 1건일 경우(row 1개_pk,unique 컬럼 조회)
					  3. 결과가 여러건일 경우 (row : select empno, ename from emp where deptno=20)
		
		*/
		
		/*
		1. 간단하고 단순한 방법
		1-1. 결과 집합이 없는 경우의 로직처리가 안돼요
		while(rs.next()){	//너 결과 row(결과집합)이 있니?  _결과가 없는경우가 문제
			rs.getInt("empno");  //이런식으로 가져와서 출력하는거
		}
		*/
		
		/*
		2.결과가 있는 경우와 없는 경우 처리
		  while문과 반대 _ 1건이 있는경우 가능(여러건 처리가 안돼요)_ 조건맞니? 출력 -> 다시 if문이 안돌아요
		if(rs.next()){
			//조회된 데이터가 있는경우
		}else{
			//조회된 데이터가 없는경우
		}
		*/
		
		//1,2번을 합하면
		if(rs.next()){
			do{
				System.out.println(rs.getInt("empno") + "," + rs.getString("ename") + "," + rs.getString("job"));
										//컬럼의 순서를 [1][2][3][4]... 0부터 시작하지 않아!!!!!!!!!!!!!!!
			}while(rs.next());
		}else{
			System.out.println("조회된 데이터가 없습니다");
		}
		
	}catch(Exception e){
		System.out.println(e.getMessage());
	}finally{
		//자원에 대한 해제 작업을 해줘야 함
		try{
			stmt.close();
			rs.close();
			conn.close();
			//좀 더 정확하게 표현하면 ....
			
		}catch(Exception e){
			
		}
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