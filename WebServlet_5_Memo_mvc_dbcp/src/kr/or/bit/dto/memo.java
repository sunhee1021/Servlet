package kr.or.bit.dto;

/*
create table memo(
	id varchar2(15) not null,
	email varchar2(20) not null,
	content varchar2(100)
);

select id, email, content from memo where id=?  -> 데이터 1건을 담을수 있는 클래스가 dto
>>예를들어 나온 데이터가 hong, hong@naver.com, 방가방가

DTO는 DB에 있는 table 구조와 동일하게 만들면 된다(컬럼명까지 동일하게) >> 자동화라는 이점을 살릴수 있다
테이블과 1 : 1 로 설계

*/
public class memo {
	private String id;   		// id varchar2(15) not null
	private String email; 		// email varchar2(20) not null
	private String content; 	// content varchar2(100)
	
	public memo() {}

	public memo(String id, String email, String content) {
		super();
		this.id = id;
		this.email = email;
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "memo [id=" + id + ", email=" + email + ", content=" + content + "]";
	}
	//이렇게 만드는 클래스가 DTO
 }
