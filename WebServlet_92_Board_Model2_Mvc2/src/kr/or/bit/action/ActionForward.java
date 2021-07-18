package kr.or.bit.action;

public class ActionForward {
	
	private boolean isRedirect = false;
	//화면 아니면 로직제어
	//isRedirect 가 true 라는건
	//클라이언트가 url에 주소를 다시넣고 엔터 딱! 한다는거래
	
	private String path = null;
	//이동경로(view의 주소)
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}


}
