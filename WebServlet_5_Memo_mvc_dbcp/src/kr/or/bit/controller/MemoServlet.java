package kr.or.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.memodao;
import kr.or.bit.dto.memo;


@WebServlet("/MemoServlet")
public class MemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public MemoServlet() {
        super();
        
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청이 어떻게 들어오지?
    	//예상으로는 localhost:8090/WebServlet_4_Memo_mvc/MemoServlet 이렇게 요청이 들어오면
    	//위에 @WebServlet를 찾아서 doGET or doPOST를 실행시키겠지
    	
    	//Servlet 하나만 가지고 작업 가능하지 (FrontServlet)
    	//현재 실습은 요청당 >> Servlet 하나를 생성
    	
    	/*
    	 1. 한글처리
    	 2. 데이터 받기
    	 3. 비지니스 (데이터처리)
    	 4. 결과
    	 */
    	
    	request.setCharacterEncoding("UTF-8");
    	
    	String id = request.getParameter("id");
    	String email = request.getParameter("email");
    	String content = request.getParameter("content");
    	
    	/*별도의 UI를 가지지않고
    	  성공시 >> 목록보기 페이지
    	  실패시 >> 재입력 페이지
    	  
    	  이런경우 얘가 view단을 설정해야함
    	*/
    	
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	
    	try {
    		memodao dao = new memodao();
    		
    		//memo m = new memo();
    		//dao.insertMemo(m);
    		int row = dao.insertMemo(new memo(id,email,content));
    		
    		// System.out.println("반영된 행의 수 : " + row); 에러시 상태확인용
    		
    		if(row > 0) {
    			out.print("<script>");
    				out.print("alert('등록성공');");
    				out.print("location.href='MemoList';");  //서버에게 다시 요청해서 새로운 내용을 받아내겠다
    			out.print("</script>");
    		}else {
    			//여기가 0이 아닌경우, 예외가 터지는 경우는 밑에 catch 문에 써줘야 한다
    		}
    		
    	}catch(Exception e){
    		out.print("<script>");
				out.print("alert('등록실패');");
				out.print("location.href='memo.html';");  //서버에게 다시 요청해서 새로운 내용을 받아내겠다
			out.print("</script>");
    		System.out.println(e.getMessage());
    	}
    	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
