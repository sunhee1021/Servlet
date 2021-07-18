package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.memodao;
import kr.or.bit.dto.memo;

public class MemoAddService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
    	
    	String id = request.getParameter("id");
    	String email = request.getParameter("email");
    	String content = request.getParameter("content");
		
    	memo m = new memo();
    	m.setId(id);
    	m.setEmail(email);
    	m.setContent(content);
    	
    	m.toString();
    	
    	memodao dao = new memodao();
    	int result = dao.insertMemo(m);
    	
    	ActionForward forward = new ActionForward();
    	forward.setRedirect(false);
    	forward.setPath("/WEB-INF/views/memolist.jsp");
		
		return forward;
	}

}
