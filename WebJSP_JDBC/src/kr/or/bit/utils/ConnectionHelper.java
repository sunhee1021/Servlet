package kr.or.bit.utils;

import java.sql.Connection;
import java.sql.DriverManager;
/**
 * 
 * 전체 프로젝트 (회원: 전체조회, 조건조회, 삽입, 삭제, 수정)
 * 각각의 작업을 하기 위한 공통적인 작업요소
 * 
 * 1. 드라이버 로딩
 * 2. 연결 객체 생성, 명령객체 생성, 자원해제
 * 반복적으로 사용
 * ================================================
 * 개선(리팩토링할거야 : 반복적인 코드의 제거)
 * 모든 페이지가 가지는 공통적인 요소를 한곳에 모아둔다
 * 
 * 공통적인 내용을 가지는 클래스 설계
 * -편하게 쓰려면 (객체 지향의 기법중에서)
 * -자주사용하는 함수 -> static
 * -overloading
 * -다형성 
 * 
 * @author 박선희
 *
 */



public class ConnectionHelper {
	public static Connection getConnection(String dsn) {	//oracle, mysql ...
		Connection conn = null;
		try {
			if(dsn.equals("oracle")) {
				Class.forName("oracle.jdbc.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bituser","1004");
				
			}else if(dsn.equals("mysql")) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=true","bituser","1004");
			 }
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally {
			
		}
		return conn;
	}

	public static Connection getConnection(String dsn, String id, String pwd) {	//oracle, mysql ...
		Connection conn = null;
		try {
			if(dsn.equals("oracle")) {
				Class.forName("oracle.jdbc.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",id,pwd);
				
			}else if(dsn.equals("mysql")) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=true",id,pwd);
			 }
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally {
			
		}
		return conn;
	}
}
