package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.RdbmsDAO;

public class MemberDAO extends RdbmsDAO{

	private static MemberDAO  _memberDao;
	private MemberDAO(){
		/*System.out.println("MemberDAO생성자"+this);*/
	} 
	public static MemberDAO getMemberDAO(){
		if(_memberDao==null)
		{
			_memberDao = new MemberDAO();
		}
		return _memberDao;
	}	
	
	//멤버 추가
	public int insert(MemberDTO memberDto) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		String insertQuery = "insert into member values(member_m_no_seq.nextval,?,?,?,?,?,?,?)";
		
		try{
		con = getConnection();
		pstmt = con.prepareStatement(insertQuery);
		pstmt.setString(1, memberDto.getM_name());
		pstmt.setString(2, memberDto.getM_sex());
		pstmt.setString(3, memberDto.getM_id());
		pstmt.setString(4, memberDto.getM_pass());
		pstmt.setString(5, memberDto.getM_cellphone());
		pstmt.setString(6, memberDto.getM_address());
		pstmt.setString(7, memberDto.getM_email());
		int rows = pstmt.executeUpdate();
		return rows;
		}finally{
			if(pstmt!=null) pstmt.close();
			if(con!=null) releaseConnection(con);
		}
	}
	
	//멤버 수정
	public int update(MemberDTO memberDto) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		String updateQuery = "update member set m_name=?,m_sex=?,m_id=?,m_pass=?,m_cellphone=?,m_address=?,m_email=? where m_no=?";
		
		try{
		con = getConnection();
		pstmt = con.prepareStatement(updateQuery);
		pstmt.setString(1, memberDto.getM_name());
		pstmt.setString(2, memberDto.getM_sex());
		pstmt.setString(3, memberDto.getM_id());
		pstmt.setString(4, memberDto.getM_pass());
		pstmt.setString(5, memberDto.getM_cellphone());
		pstmt.setString(6, memberDto.getM_address());
		pstmt.setString(7, memberDto.getM_email());
		pstmt.setInt(8, memberDto.getM_no());
		int rows = pstmt.executeUpdate();
		return rows;
		}finally{
			if(pstmt!=null) pstmt.close();
			if(con!=null) releaseConnection(con);
		}
	}
	
	//멤버 삭제
	public int remove(String m_id) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		String deleteQuery = "delete from member where m_id=?";
		
		try{
		con = getConnection();
		pstmt = con.prepareStatement(deleteQuery);
		pstmt.setString(1, m_id);
		int rows = pstmt.executeUpdate();
		return rows;
		}finally{
			if(pstmt!=null) pstmt.close();
			if(con!=null) releaseConnection(con);
		}
	}
	
	//전체 회원목록
	public ArrayList<MemberDTO> findAll() throws Exception{
		ArrayList<MemberDTO> List = new ArrayList<MemberDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "select * from member";
		
		try{
			con=getConnection();
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			while(rs.next()){
				List.add(new MemberDTO(rs.getInt("m_no"),rs.getString("m_name"),rs.getString("m_sex"),rs.getString("m_id"),
									   rs.getString("m_pass"),rs.getString("m_cellphone"),rs.getString("m_address"),rs.getString("m_eamil")));
			}
			
		}finally{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) releaseConnection(con);
		}
		return List;
	}
	
	//m_id로 한명찾기
	public MemberDTO findOne(String m_id) throws Exception{
		MemberDTO memberDto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = " select * from member where m_id=? ";
		
		try{
			con=getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				
				memberDto = new MemberDTO(rs.getInt("m_no"),rs.getString("m_name"),rs.getString("m_sex"),rs.getString("m_id"),
						   rs.getString("m_pass"),rs.getString("m_cellphone"),rs.getString("m_address"),rs.getString("m_email"));
				
			}
		}finally{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) releaseConnection(con);
		}

		return memberDto;
}
	//id check
	public  boolean idcheck(String id)throws Exception
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "select count(*) cnt from member where m_id=?";
		try{
			con = getConnection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			int count  = 0;
			if(rs.next()){
				count = rs.getInt("cnt");
			}
			if(count == 1)
			{
				return true;
			}
			else{
				return false;
			}
		}finally{
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(con!=null)
				releaseConnection(con);
		}
	}
	
	
	
}
