package kr.or.bit.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;


@WebFilter("/Encoding")
public class Encoding implements Filter {
   
	//변수 만들기
	private String encoding;
	

    public Encoding() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}
	public void init(FilterConfig fConfig) throws ServletException {
		this.encoding = fConfig.getInitParameter("encoding");
		System.out.println("Filter init : " + this.encoding);
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	
	    //request 요청오면 실행 코드
		 if(request.getCharacterEncoding() == null) {
			 
			 request.setCharacterEncoding(this.encoding);
			 //request 요청 처리 실행 코드
		 }
		chain.doFilter(request, response);
	   //response 응답 처리 실행 코드
	}

	
	

}
