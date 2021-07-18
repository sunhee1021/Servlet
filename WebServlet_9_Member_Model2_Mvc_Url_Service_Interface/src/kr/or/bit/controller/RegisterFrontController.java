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
import kr.or.bit.dao.Mvcregisterdao;
import kr.or.bit.dto.registerdto;
import kr.or.bit.service.LoginOkServiceAction;
import kr.or.bit.service.RegisterOkServiceAction;


@WebServlet("*.do")
public class RegisterFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public RegisterFrontController() {
        super();
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	
    	
    	request.setCharacterEncoding("UTF-8");
    	
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String urlcommand = requestURI.substring(contextPath.length());
    	
    	//System.out.println("requestURI : " + requestURI);
    	//System.out.println("contextPath : " + contextPath);
    	//System.out.println("command : " + urlcommand);
    	
    	//kr.or.bit.service : 서비스 클래스를 만들었어 , 쓸꺼야
    	Action action = null;
    	ActionForward forward = null;
    	
    	String viewpage = "";
    	if(urlcommand.equals("/Register.do")){
    		//UI 만 제공하면 됌 (서비스 클래스가 필요없다)
    		forward = new ActionForward();
    		forward.setRedirect(false);  //페이지주소를 전환하겠다, 사실있으나마나 상관없음
    		forward.setPath("/WEB-INF/Register/Register.jsp");
    		
    	}else if(urlcommand.equals("/RegisterOk.do")) {
    		//UI도 제공해야하고 + 로직처리가 필요하다
    		//로직처리를 서비스에게 위임할거야
    		action = new RegisterOkServiceAction();
    		forward = action.execute(request, response);  
    		//POINT
    		//execute 함수에게  request 객체의 주소와 , response 객체 주소를 전달하고 있음
    		
    	}else if(urlcommand.equals("/login.do")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/login/login.jsp");
    	}else if(urlcommand.equals("/loginok.do")) {
    		action = new LoginOkServiceAction();
    		forward = action.execute(request, response);
    	}
    	
    	if(forward != null) {
    		if(forward.isRedirect()) {    //true 페이지를 재요청
    			response.sendRedirect(forward.getPath());   //거의 사용 안해요
    		}else {	//false
    			
    			RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
    			dis.forward(request, response);
    			//1. UI만 전달된 경우
    			//2. UI + 로직처리한 경우도 여길 탈거야
    		}
    	}
    }
    
    	/*
    	String viewpage = "";
    	
    	if(urlcommand.equals("/Register.do")){
    		//화면전달
    		viewpage = "/WEB-INF/Register/Register.jsp";
    	}else if(urlcommand.equals("/RegisterOk.do")) {
    		viewpage = "/WEB-INF/Register/Register_welcome.jsp"; 
    		
    		//로직처리
    		//추가적인 데이터
    		int id = Integer.parseInt(request.getParameter("id"));
    		String pwd = request.getParameter("pwd");
    		String email = request.getParameter("email");
    		
    		System.out.println("id" + id);
    		
    		registerdto dto = new registerdto();
    		dto.setId(id);
    		dto.setPwd(pwd);
    		dto.setEmail(email);
    		
    		dto.toString();
    		
    		Mvcregisterdao dao = new Mvcregisterdao();
    		int result = dao.writeOk(dto);
    		
    		String resultdata = "";
    		if(result > 0) {
    			resultdata = "welcome to bit" + dto.getId() + "님";
    		}else {
    			resultdata = "Insert Fail retry";
    		}
    		
    		//결과 저장하기
    		request.setAttribute("data", resultdata);
    		
    		//viewpage 만들기
    		viewpage = "/WEB-INF/Register/Register_welcome.jsp";
    		
    	}
    	
    		//이 viewpage를 dispatcher해야함
    		RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    		
    		dis.forward(request, response);
    		
	}
    */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doProcess(request, response);
	}

}

