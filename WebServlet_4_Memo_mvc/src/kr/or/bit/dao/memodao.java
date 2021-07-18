package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.bit.dto.memo;
import kr.or.bit.utils.SingletonHelper;

/*
1. db 연결
2. CRUD 함수 생성 (1개의 테이블에 대해서 작업하는게 몇개?)  >> memo라는 테이블에 대해서 이 작업을 할거임
2-1. 전체조회   : select id, email, content from memo; (필요하다면 order by정도는 할수 있음)
2-2. 조건조회   : select id, email, content from memo where id=? (이렇게 했을때 데이터가 1건나온다는 확신이 있지, 
	 																       왜? id가 pk니까, 중복이 없지)
2-3. 데이터 삽입 :	insert into memo(id,email,content) values(?,?,?)
2-4. 데이터 수정 : update memo set email=?, content=? where id=?
2-5. 데이터 삭제 : delete from memo where id=?
+알파로 (검색)까지
2-6. Like(검색) + 검색(알파)  : where email like '%naver@%'

 */
public class memodao {
	Connection conn = null;
	
	public memodao() {
		conn = SingletonHelper.getConnection("oracle");  //연결객체가 주소값을 받을수 있도록 (싱글톤으로 만들어서 닫지 않아요 
																			//       닫으면 db연결 끊어지니까 close X)
	}
	
	//전체조회
	public List<memo> getMemoList() throws SQLException{
		//원래는 여기 안에서 예외처리를 해야함
		PreparedStatement pstmt = null;
		String sql ="select id, email, content from memo";
		
		pstmt=conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();   //파라미터가 없으니까 prepareStatement안써도 되잖아요? 맞아요 , 그냥 편하라고 쓴대요
		
		List<memo> memolist = new ArrayList<memo>();	//POINT
		//[][][][] 배열이지, 저안에 뭐가 들어가야해? new memo()가 들어가야하지 [new memo()][new memo()][new memo()]
		
		while(rs.next()) {
			memo m = new memo();
			m.setId(rs.getString("id"));
			m.setEmail(rs.getString("email"));
			m.setContent(rs.getString("content"));
			
			memolist.add(m);
		}
		SingletonHelper.close(rs);
		SingletonHelper.close(pstmt);
		
		return memolist;
	}
	
	//조건조회 (where id=? : 데이터 1건 보장 : id 컬럼 > unique, pk )
	public memo getMemoListById(String id) {
		//여긴 arraylist 필요하지 않지
		//select id, email, content from memo where id=? 데이터 1건이니까
		//memo m = new memo();
		//return m
		
		return null;
	}
	
	//삽입
	//public int insertMemo(String id, String email, String content) parameter 객체가아님
	public int insertMemo(memo m) {	//객체를 parameter로 받음
		int resultrow = 0;
		
		PreparedStatement pstmt = null;
		String sql = "insert into memo(id,email,content) values(?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getContent());
			
			resultrow = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			SingletonHelper.close(pstmt);
		}
		
		return resultrow;
	}
	
	//수정
	public int updateMemo(memo m) { //여기도 파라미터를 dto를 받는거임
		return 0;
	}
	
	//삭제
	public int deleteMemo(String id) {  //여기는 데이터전체가 필요한게 아니기때문에 dto를 파라미터로 받을 필요가 없음
										//key값인 id를 받으니까
		return 0;
		
	}
	
	//검색
	public memo idSearchByEmail(String email) {
		return null;
	}
	
	//ID 사용가능 유무
	public String isCheckById(String id) {
		String ismemoid = null;
		
		PreparedStatement pstmt = null;
		String sql = "select id from memo where id=?";
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//같은 아이디가 존재
				ismemoid = "false";  //boolean 아니고 String임

			}else {
				//사용가능 아이디
				ismemoid = "true";  //boolean 아니고 String임
			}
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}
		
		return ismemoid;
	}
}
