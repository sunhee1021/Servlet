package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.service.BoardDeleteOkService;
import kr.or.bit.service.BoardEditOkService;
import kr.or.bit.service.BoardReWriteService;
import kr.or.bit.service.BoardReplyDeleteService;
import kr.or.bit.service.BoardReplyOkService;
import kr.or.bit.service.BoardWriteOkService;


@WebServlet("*.board")
public class FrontBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public FrontBoardController() {
        super();
    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
    	
    	System.out.println("["+url_Command+"]");
    	
    	Action action = null;
    	ActionForward forward = null;
    	
    	if(url_Command.equals("/BoardList.board")) {
			//System.out.println("boradlist");
    		forward = new ActionForward();
    		forward.setPath("/board/board_list.jsp");
		
    		
		}else if(url_Command.equals("/BoardContent.board")) {
			forward = new ActionForward();
			forward.setPath("/board/board_content.jsp");
		
		//게시판 작성	
		}else if(url_Command.equals("/BoardWrite.board")) {
			forward = new ActionForward();
			forward.setPath("/board/board_write.jsp");
		
		// 게시판 작성확인
		}else if(url_Command.equals("/BoardWriteOk.board")) {
			action = new BoardWriteOkService();
			forward = action.execute(request, response);
		
		// 게시판 수정
		}else if(url_Command.equals("/BoardEdit.board")) {
			forward = new ActionForward();
			forward.setPath("/board/board_edit.jsp");
			
		// 게시판 수정 확인	
		}else if(url_Command.equals("/BoardEditOk.board")) {
			action = new BoardEditOkService();
			forward = action.execute(request, response);
		
		// 게시판 댓글	
		}else if(url_Command.equals("/BoardReplyOk.board")) {
			action = new BoardReplyOkService();
			forward = action.execute(request, response);
		
		// 게시판 댓글 삭제
		}else if(url_Command.equals("/BoardReplyDelete.board")) {
			action = new BoardReplyDeleteService();
			forward = action.execute(request, response);
			
		// 게시판 삭제	
		}else if(url_Command.equals("/BoardDelete.board")) {
			forward = new ActionForward();
			forward.setPath("/board/board_delete.jsp");
			
		// 게시판 삭제 확인	
		}else if(url_Command.equals("/BoardDeleteOk.board")) {
			action = new BoardDeleteOkService();
			forward = action.execute(request, response);
		
		// 답글 달기
		}else if(url_Command.equals("/BoardReWrite.board")) {
			forward = new ActionForward();
			forward.setPath("/board/board_rewrite.jsp");
		
		// 답글 달기 확인	
		}else if(url_Command.equals("/BoardReWriteOk.board")) {
			action = new BoardReWriteService();
			forward = action.execute(request, response);
		}
    	
    	if(forward != null) {
    		if(forward.isRedirect()) { //true 
    			response.sendRedirect(forward.getPath());
    		}else { //false (모든 자원 ) 사용
    			//UI
    			//UI + 로직
    			//forward url 주소 변환 없어 View 내용을 받을 수 있다
    			System.out.println("이프문 벗어난 다음 " + forward.getPath());
    			RequestDispatcher dis  = request.getRequestDispatcher(forward.getPath());
    			dis.forward(request, response);
    		}
    	}
    	
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
