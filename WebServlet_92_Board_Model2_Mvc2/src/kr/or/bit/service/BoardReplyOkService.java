package kr.or.bit.service;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class BoardReplyOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String writer = request.getParameter("reply_writer");
		String content = request.getParameter("reply_content");
		String pwd = request.getParameter("reply_pwd");
		String idx_fk = request.getParameter("idx");
		String userid = "empty";
		
		
		ActionForward forward = new ActionForward();
		
		try {
			BoardDao dao = new BoardDao();
			int result = dao.replywrite(Integer.parseInt(idx_fk), 
					writer, userid, content, pwd);
		
			String msg = "";
			String url = "";
			
			if(result > 0){
		    	msg ="댓글 입력 성공";
		    	url ="BoardContent.board?idx="+idx_fk;
		    }else{
		    	msg="댓글 입력 실패";
		    	url="BoardContent.board?idx="+idx_fk;
		    }
		    
		    request.setAttribute("board_msg",msg);
		    request.setAttribute("board_url", url);
		    
		    
		    forward.setRedirect(false);
		    forward.setPath("/board/redirect.jsp");
			
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		return forward;
	}

}
