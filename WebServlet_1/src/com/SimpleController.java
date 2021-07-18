package com;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * web.xml 설정
 * <url-pattern>/simple</url-pattern>
 * 
 * localhost:8090/WebServlet/simple 요청이 오면
 * 
 * public class SimpleController 자바 파일 컴파일 실행
 * 
 * 서블릿의 의미는 (java로 만든 웹서비스 파일)
 * 서블릿 조건 : java 파일이 extends HttpServlet 를 상속해야만 서블릿이라고 할수 있음 
 * >> 웹에서 사용되는 요청(request)객체, 응답(response) 객체를 사용할 수 있음
 * >> 어디서? 자바파일에서!
 * 
 * -servlet 은 url 에서 바로 요청이 안돼요 >> 요청 >> mapping >> 요청 주소 생성
 * -1.web.xml
 * -2.@webServlet
 * 
 * -extends HttpServlet(예외없이 반드시 상속해야 함)
 * -SimpleController 서블릿 파일 _ 웹 전용이 되는거임
 * -servlet 이벤트 기반의 동작을 함 _ 특정사건(이벤트)가 발생하면 자동으로 호출되는 함수가 존재함
 * 
 * -자동 호출되는 함수가 누구일까
 * -protected void doGet
 * -언제 호출 될까?
 * >>localhost:8090/WebServlet/simple 클라이언트가 서버에 요청한 방식이 GET방식이라면 doGet이 자동호출!
 * >><form method="GET" or <a href="/simple?num=1000> 등
 
 * -protected void doPost	클라이언트가 서버에 요청한 방식이 POST방식이라면 doPost이 자동호출!
 * >>localhost:8090/WebServlet/simple 클라이언트가 서버에 요청한 방식이 POST방식이라면 doPost이 자동호출! 
 * 
 * doGet()과 doPost과 둘다 해야 하는일
 * >> 데이터를 받을수 있어야 해 / (request.response)객체를 사용할 수 있어야함
 * 	  doGet(HttpServletRequest request, HttpServletResponse response)
 * >> 함수안에서 request 객체와 response 객체를 사용할 수 있다
 */

public class SimpleController extends HttpServlet { //HttpServlet를 상속받고 있다
	private static final long serialVersionUID = 1L;
       

    public SimpleController() {
        super();
        System.out.println("SimpleController 생성자 함수 호출 ... ");  
        //최초에만 호출되고 그다음엔 호출되면 안된대요
        //최초한번만 실행되는 코드 (같은게 실행되었다는 기준은 주소! localhost:8090/WebServlet/simple)
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트 방식이 get인경우
		// simple 요청을 누르면 콘솔창에 ↓가 나옴
		System.out.println("클라이언트 요청 : GET");
		
		//JSP 페이지 작업 내용 그대로 해주면 됩니다
		
		//1. 한글처리
		request.setCharacterEncoding("UTF-8");
		//2. 데이터 받기(요청 의도 파악)
		String type = request.getParameter("type");
		//3. 로직 처리 ( 이번에는 요청에 따른 업무 수행 >> service 를 해보겠다)
		Object resultobj = null;
		if(type == null || type.equals("greeting")) {
			resultobj = "Hello world";
		}else if(type.equals("date")) {
			resultobj = new Date();
		}else {
			resultobj = "invalid String type";
		}
		
		//4. 요청 완료에 따른 결과를 저장 (*************)
		//   MVC 패턴 방식 (화면 : JSP ) _ 뭐가 필요하냐면 서블릿에서 만든 객체 정보를 JSP까지 전달을 해야함
		// 그래서 그 JSP가 전달받은걸 화면에 보여줘야 하거든요
		// 그래서 그 결과를 저장을 할껀데 (참고 WebJSP폴더에 제일 마지막 파일 확인해)
		// >> session 변수, 특정페이지(include, forward) request 변수 
		request.setAttribute("result", resultobj);
		
		
		//5. 저장한 결과를 JSP에다가 전달을 해서 (화면 UI를 구성)
		//결과를 forward 방식을 통해서 >> JSP에게 넘겨줄꺼야
		//forward -> client가 요청한 주소의 변화는 없고 , 그 버퍼에다가 forward 된 페이지 정보를 담아서 service 하는 방식
		
		RequestDispatcher dis = request.getRequestDispatcher("/simpleview.jsp"); // view페이지를 정의함 = dispatcher
		
		
		/*
		 1. 서블릿에서 값을 넘겨주지 않고 페이지만 이동하는 방법
			response.sendRedirect('jsp경로'); 

			- 해당 jsp 경로로 이동하라는 의미(꼭 jsp경로만 적을수 있는건 아님)
			- 서블릿에서 처리한 데이터를 별도로 넘기지 않고 페이지만 이동함(session 객체와는 별개)

		 2. 서블릿에서 값을 넘겨주고 해당 페이지에서 처리할 수 있도록 하는 방법
			RequestDispatcher view = request.getRequestDispatcher("경로"); 
			request.setAttribute("key",value);
			view.forward(request, response);

			- 서블릿에서 처리한 데이터를 jsp에서 가져다가 사용해야 할 때 쓰는 객체
			- RequestDispatcher는 이동할 경로를 설정하고 생성
			- 생성된 객체를 가지고 forward 메소드를 통해 해당 경로 페이지로 이동할 수 있음
			- 이때, sendRedirect와는 다르게 request와 response 객체를 가지고 이동할 수 있음
			- 호출된 페이지에서는 request.getAttribute() 메소드를 통해 넘겨받은 데이터를 처리할 수 있음
			
			
		Servlet 작동순서
		1)웹브라우저
		2)웹서버
		3)웹어플리케이션 서버 
		3)Servlet 컨테이너 1)스레드 생성 2)Servlet객체 생성

	
			*/
		
		
		//이제 정의한 페이지를 forward 시켜야함
		dis.forward(request, response);
		//servlet 이 가지고 있는 request객체의 주소하고 response 객체의 주소를 넘겨서 사용하게 하겟다
		//누가 ? jsp가
	}
	//우리의 최종목표는 model 2(서블릿) 방식의 mvc(잘하는것만해라) 패턴을 하는게 목적

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트 방식이 post인경우 
		
		System.out.println("클라이언트 요청 : POST");
	}

}













