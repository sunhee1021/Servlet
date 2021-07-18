package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kr.or.bit.dto.registerdto;
import kr.or.bit.utils.ConnectionHelper;

public class Mvcregisterdao {
	
	//CRUD 를 만들거야 (함수)
	
	//글쓰기 함수명: writeOk 라는 이름으로
	
	public int writeOk(registerdto dto) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int resultrow = 0;
		
		String sql = "insert into mvcregister(id,pwd,email)values(?,?,?)";
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			
			resultrow = pstmt.executeUpdate();
								//update니까 Resultset은 필요가 없지
		}catch(SQLException e) {
			e.printStackTrace();
		
		}finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
			
		}
		return resultrow;

	}
}
