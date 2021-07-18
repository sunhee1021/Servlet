package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;


public class BoardEditOkService implements Action {
	//1. board_edit.jsp > 입력값 받기 > board dto 객체에 담기
	  
	//방법 1) request.getParameter("subject") > new Board > setter > request > return Board
	//가장 일반적인 방법 		  
			  
	//방법 2) usebean 액션태그 (property )통해서 setter  주입
	  
	//방법 3) request 객체를 통으로 넘기는 방법 (이 방법) >> 실습코드 ...
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String idx = request.getParameter("idx");
		
		if(idx == null || idx.trim().equals("")){
			 // out.print("<script>");
			 // 	out.print("alert('글번호 입력 오류')");
			  //	out.print("location.href='board_list.jsp'");
			//  out.print("</script>");
		  }
		
		ActionForward forward = new ActionForward();
		
		try {
			BoardDao dao = new BoardDao();
			int result = dao.boardEdit(request);
		
			String msg = "";
			String url = "";
			if(result > 0) {
				msg = "edit success";
				url = "BoardList.board";
			}else {
				msg = "edit fail";
				url = "BoardEdit.board?idx="+idx;
			}
			
			request.setAttribute("board_msg",msg);
			request.setAttribute("board_url",url);
			
			
		    forward.setRedirect(false);
		    forward.setPath("/board/redirect.jsp");
		    
		}catch (Exception e) {
			e.printStackTrace();
		}
	    
	    return forward;
		
	}

}
