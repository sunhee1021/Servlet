package kr.or.bit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.memodao;
import kr.or.bit.dto.memo;


@WebServlet("/MemoList")
public class MemoList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MemoList() {
        super();
        
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("목록보기");
		
		//요청받고 서비스 수행도 전부 servlet이 해줄꺼야 (지금은)
		//전체 조회 요청
		
		//어떤서비스 해야하지 ? DB서비스! ->  db작업을 위한 DAO를 만들어 놨지 -> 객체를 만들어서 쓰자
		memodao dao = new memodao();
		
		try {
			List<memo> memolist = dao.getMemoList();
			
			//서블릿은 이제 뭘해야하지?
			//화면에 출력해서 client 에게 전달하려고 할꺼야
			//view단 사용할거야 (별도의 JSP를 사용해서)
			//그러려면 데이터를 저장해야하지
			request.setAttribute("memolist", memolist);
			
			//view 페이지 설정해줘야 하고
			RequestDispatcher dis = request.getRequestDispatcher("/memolist.jsp");
			
			//view 페이지 forward 해줘야 하지
			dis.forward(request, response);
			
			
		}catch(SQLException e) {
			
			e.printStackTrace();
		}
		
		
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
