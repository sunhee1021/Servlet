package kr.or.bit.service;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;

public class BoardReWriteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String writer = request.getParameter("writer");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String email = request.getParameter("email");
		String homepage = request.getParameter("homepage");
		String filename = request.getParameter("filename");
		String pwd = request.getParameter("pwd");
		
		Board board = new Board(idx, writer, pwd, subject, content, null, 
									0, filename, 0, homepage, email, 0, 0, 0);
		
		
		 ActionForward forward = new ActionForward();
		 
		try {
			BoardDao dao = new BoardDao();
			int result = dao.reWriteOk(board);
			
			String cpage = request.getParameter("cp"); 
			String pagesize = request.getParameter("ps");
			
			String msg="";
		    String url="";
		    if(result > 0){
		    	msg ="rewrite insert success";
		    	url ="BoardList.board";
		    }else{
		    	msg="rewrite insert fail";
		    	url="BoardContent.board?idx="+board.getIdx();
		    }
		    
		    request.setAttribute("board_msg",msg);
		    request.setAttribute("board_url", url);
			
		   
		    forward.setRedirect(false);
		    forward.setPath("/board/rediect.jsp");
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		return forward;
	}

}
