package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Web.xml 에서 설정하자 (@anotation대신)

public class FrontBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public FrontBoardController() {
        super();
    }
    
    //doGet으로 들어와도 doPost로 들어와도 이걸로 처리하겠다는 의미
    private void doProcess(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
    	//GET, POST 두가지 요청에 대해서 동작하는 함수 -> 뭐로 들어왔는지 확인하려고 method 파라미터를 하나 더 받은거임
    	//method >> 요청 > GET, POST 확인
    	System.out.println("클라이언트 요청 : " + method);
    	
    	//1. 한글처리
    	//2. 데이터 요청받기 (request)
    	//3. 요청판단하기 (판단의 기준 : parameter를 기준으로 해서 쓰는 방식 >> command 방식)
    	//3-1. 192.168.0.19:8090/WebServlet_1/board?cmd=login&id=glim&pwd=1004 요청 서버로 판단
    	//서버는 cmd변수가 가지는 값을 가지고 판단 : login >> 로그인 처리하려고 하는구나
    	//3-2. 192.168.0.19:8090/WebServlet_1/board?cmd=list  게시판 보여달라고
    	
    	//String command = request.getParameter("cmd");
    	//if(command.equals("login")){로그인 서비스 처리...}
    	//else if(command.equals("list")){게시판 목록보기 서비스}  >> command 방식 
    	
    	//command 방식과 반대되는 방식  -> URL 방식
    	//192.168.0.19:8090/WebServlet_1/board/boardlist
    	//192.168.0.19:8090/WebServlet_1/board/boardwrite?title=방가&content=방가방가
    	//마지막 주소값을 추출
    	//     /boardlist  >> 게시판 목록보기
    	//     /boardwrite?title=방가&content=방가방가  >> 게시판 글쓰기 판단 하겠다 
    	
    	// 마지막 주소값을 잘라서 그 주소값을 가지고 비교 하는거 url 방식
    	// 파라미터값으로 비교하는거 cmd 방식
    	
    	
    	//4. 결과 저장 (request, session, application)
    	//   scope에 따라서 골라서 쓰면된다
    	
    	//5. view 지정
    	//view page : *.jsp 
    	//WebContent > board > boardlist.jsp
    	//WebContent > error > error404.jsp
    	
    	//위 방식은 보안상문제가 있다  >> 실개발에서는 >> WebContent >> WEB-INF > views 폴더 생성 
    	//                      > board or member or admin 폴더 만들어서 관리
    	
    	//ex) 보안폴더 : WEB-INF > views > board > boardlist.jsp
    	
    	//6. view 에게 request객체를 forward 해서 사용가능하도록 해준다
    	
    	//7. 끝, 외워야겟당
    	
    	request.setCharacterEncoding("UTF-8");
    	
    	String cmd = request.getParameter("cmd");
    	
    	//요청을 판단하자
    	String viewpage = null;
    	
    	//cmd값이 (들어오는값이) > null 이라면 > error.jsp 를 서비스하자
    	//cmd값이 (들어오는값이) > boardlist 이라면 > list.jsp 를 서비스하자
    	//cmd값이 (들어오는값이) > boardwrite > write.jsp 서비스하자      라고 정의하는거
    	
    	if(cmd==null) {
    		viewpage = "/error/error.jsp";  // error.jsp 를 클라이언트에게 전달하겠다 
    	}
    	else if(cmd.equals("boardlist")){
    		/*여기서 실제 업무처리(서비스)
    		 * 
    		 * 예를들면 DB연결해서 select해서 객체 담고 저장하겠다
    		 * 
    		 * boardDao dao = new boardDao();
    		 * List<board> boardlist = dao.selectBoardList();
    		 * request.setAttribute("list",boardlist);
    		 * forward 해서 > view 단까지 > 전달할꺼야 (request.getAttribute())로 가지고 와서 화면 출력 하겠다
    		 * 
    		 * 출력시에는 EL 과 JSTL로 사용하겠다
    		 * 
    		 * */
    		viewpage = "/board/boardlist.jsp";
    	}else if(cmd.equals("boardwrite")) {  //cmd에 boardwrite라는 문자가 오면
    		viewpage = "/board/boardwrite.jsp";
    	}else if(cmd.equals("login")) { //보안폴더를 이용해서 보여준다(로그인페이지)
    		viewpage = "/WEB-INF/views/login/login.jsp";  
    	}else {
    		viewpage = "/error/error.jsp";
    	}
    	
    	//결과저장
    	//List<Emp> list = new ArrayList<>();
    	//list.add(new Emp(200, 김유신);
    	//request.setAttribute("emplist",list);
    	
    	
    	//view를 지정
    	RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	
    	//데이터 전달을 위해 forward 해준다
    	dis.forward(request, response);
    	
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "GET");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "POST");
	}

}
