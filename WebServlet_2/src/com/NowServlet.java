package com;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(
		description = "서블릿은 클래스입니다", 
		urlPatterns = { 
				"/NowServlet", //별명같은거임 집에서 길동아, 동아, 홍아 하고 부르는것 처럼
				"/Now.do", 
				"/Now.action", 
				"/Now.star"
		}, 
		initParams = { 
				@WebInitParam(name = "id", value = "bit", description = "id초기값 설정"), 
				@WebInitParam(name = "jdbcDriver", value = "oracle.jdbc.OracleDriver", description = "오라클 드라이버 제공")
		})
public class NowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public NowServlet() {
        super();
        System.out.println("생성자 객체 생성시 한번 호출");
        
    }
    
	public void init(ServletConfig config) throws ServletException {
		//초기화 함수 (자동 호출되는 함수,누가호출하지않아도)
		//호출 시점 : NowServlet 클래스 파일에 대한 [최초요청시] = 사실 생성자랑 같네
		//근데 굳이 init이라고 만든이유는 파라미터를 써먹으려구
		//재실행 (개발자 코드 수정, 서버의 재시작)
		
		//it.co.kr 서버오픈 > WAS (서블릿 : NowServlet.java)
		//홍길동 -> 첫 접속자 -> it.co.kr/NowServlet 서버에 요청을 보냄
		//요청이 들어와야 컴파일
		//NowServlet 컴파일 > class(실행) > 생성자 호출 >  init 함수가 자동호출 -> doGET or doPOST 자동호출
		
		//김유신 -> 두번째 접속자 -> it.co.kr/NowServlet 서버에 요청을 보냄
		//class(실행) -> doGET or doPOST 자동호출
		
		/////////첫번째 접속자만 init이 호출되고 다음번 접속자부터는 호출되지 않음
		/////////호출되려면 코드가 수정되는 등 의 경우만 해당
		
		//init : 클래스 내에 다른 함수가 사용하는 공통 자원의 load or 초기화
		
		//db연결 .. 여러번 할필요 없어서 한번만 해놓고 재사용.. init 
		
		String drivername = config.getInitParameter("jdbcDriver");
		System.out.println("최초 요청시 한번만 실행 : 드라이버 로딩 : " + drivername);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGET() Call");
		
		//servlet -> UI -> JSP
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPOST() Call");

	}

}
