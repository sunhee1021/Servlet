package kr.or.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.memodao;
import kr.or.bit.service.MemoAddService;

@WebServlet("*.memo")
public class FrontMemoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public FrontMemoController() {
        super();
    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	//1.한글처리
    	request.setCharacterEncoding("UTF-8");
    	
    	String requestURL = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String urlcommand = requestURL.substring(contextPath.length());
	
    	Action action = null;
    	ActionForward forward = null;
    	
    	String viewpage = null;
    	if(urlcommand.equals("/Memoadd.memo")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/Register/memolist.jsp");
    	
    	}else if(urlcommand.equals("/memoOk.do")) {
    		
    		action = new MemoAddService();
    		forward = action.execute(request, response);
    	}
    
    /*
     * request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	
    	String id = request.getParameter("id");
    	memodao dao = new memodao();
    	String ischeck = dao.isCheckById(id);
    	
    	//"false" or "true"
    	//KEY POINT 는 클라이언트한테 바로 보여주는거야, 서버안가고
    	out.print(ischeck);
     * */
    if(forward != null) {
    	if(forward.isRedirect()) {
    		response.sendRedirect(forward.getPath());
    	}else {
    		RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
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
