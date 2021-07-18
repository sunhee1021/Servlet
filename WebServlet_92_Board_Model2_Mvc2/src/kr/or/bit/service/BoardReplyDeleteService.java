package kr.or.bit.service;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class BoardReplyDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String idx_fk = request.getParameter("idx");
		String no = request.getParameter("no");
		String pwd = request.getParameter("delPwd");
		
		if(idx_fk == null || no == null || pwd == null || no.trim().equals(""))
		{	
			 //<script type="text/javascript">
				//history.back();
			//</script>
			//return; //더 이상 코드 실행하지 않아요
		}
		
		ActionForward forward = new ActionForward();
		
		try {
			BoardDao dao = new BoardDao();
			int result = dao.replyDelete(no, pwd);
			
			String msg = "";
			String url = "";
			
			if(result > 0) {
				msg ="댓글 삭제 성공";
		    	url ="BoardContent.board?idx="+idx_fk;
		    }else{
		    	msg="댓글 삭제 실패";
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
