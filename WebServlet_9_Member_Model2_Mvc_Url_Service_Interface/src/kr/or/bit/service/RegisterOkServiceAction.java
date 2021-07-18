package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Mvcregisterdao;
import kr.or.bit.dto.registerdto;

public class RegisterOkServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int id = Integer.parseInt(request.getParameter("id"));
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		registerdto	dto = new registerdto();
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setEmail(email);
		
		dto.toString();
		
		Mvcregisterdao dao = new Mvcregisterdao();
		int result = dao.writeOk(dto);
		
		String resultdata="";
		if(result > 0) {
			resultdata = "welcome to bit" + dto.getId() + "님";
		}else {
			resultdata = "Insert Fail retry";
		}
		
		request.setAttribute("data",resultdata );
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/Register/Register_welcome.jsp");
		
		
		return forward;
	}

}
