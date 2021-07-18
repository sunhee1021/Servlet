package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.Mvcregisterdao;
import kr.or.bit.dto.registerdto;

/*
 클라이언트가 /aaa.do를 해도 
 		  /mvc.do를 해도 얘를 타는거야
 */
@WebServlet("*.do")
public class RegisterFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public RegisterFrontController() {
        super();
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	/*
    	  요청 주소
    	  목록보기 : list.do
    	  글쓰기  : write.do
    	  글쓰기 처리 : writeok.do
    	
    	  이렇게 요청이오면 다 doProcess 를 실행해
    	  그럼 문제가 뭐지?
    	  얘가 글쓰기인지 목록보기인지 어떻게 판단하지?
    	
    	  서비스 판단 :  
    	  1. command 방식 :  servlet.do?cmd=login&id=kglim&pwd=1004   > cmd > if(cmd.equals("login"))
          2. url 방식 :      login.do?id=kglim&pwd=1004  :  login.do > url 주소로 요청을 판단
    	
       */
    	
        //1.한글처리
    	request.setCharacterEncoding("UTF-8");
    	
    	//2.데이터 받기
    	String command = request.getParameter("cmd");
    	
    	//3.요청 판단해서 서비스 만들기(글을쓸껀지 등등)
    	String viewpage = null;
    	
    	if(command.equals("register")){
    		//화면전달
    		viewpage = "/WEB-INF/Register/Register.jsp";
    	}else if(command.equals("registerOk")) {
    		viewpage = "/WEB-INF/Register/Register_welcome.jsp"; 
    		
    		//로직처리
    		//추가적인 데이터
    		int id = Integer.parseInt(request.getParameter("id"));
    		String pwd = request.getParameter("pwd");
    		String email = request.getParameter("email");
    		
    		System.out.println("id" + id);
    		
    		//controller 가 -> [service를 요청해야 함]우리는뺐으니까 ->  dao를 요청
    		//Mvcregister dto = new Mvcregister();
    		//dto.setId(id);
    		//dto.setPwd(pwd);
    		//dto.setEmail(email);
    		
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
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doProcess(request, response);
	}

}
