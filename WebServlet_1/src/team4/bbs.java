package team4;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.rmi.server.Dispatcher;


@WebServlet("/bbs")
public class bbs extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public bbs() {
        super();
        System.out.println("처음 실행되었습니다!");
        
    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response , String method) throws ServletException, IOException {
    	//1. 한글처리
    	request.setCharacterEncoding("UTF-8");
    	
    	//2. 데이터 요청하기
    	String cmd = request.getParameter("cmd");
    	
    	//3. 요청한 데이터 판단하기
    	String page = null;
    	
    	if(cmd == null) {
    		System.out.println("널입니다");
    	}else if(cmd.equals("book")) {
    		System.out.println("책입니다.");
    		page = "/bbs/book.jsp";
    	}else if(cmd.equals("pencil")) {
    		System.out.println("연필입니다");
    		page = "/bbs/pencil.jsp";
    	}else {
    		System.out.println("????");
    	}
    	
	
    	//4. 저장하기
    	request.setAttribute("cmd",cmd);
    
    	//5. view 정의하기
    	RequestDispatcher dis = request.getRequestDispatcher(cmd);
    
    	//6. forward 해주기
    	dis.forward(request,response);
    	
    }	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "GET");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "POST");
	}

}
