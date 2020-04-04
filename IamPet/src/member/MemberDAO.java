package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;


import db.RdbmsDAO;

public class MemberDAO extends RdbmsDAO
{
	private static MemberDAO  _memberDao;
	private MemberDAO(){
		System.out.println("MemberDAO생성자"+this);
	} 
	public static MemberDAO getMemberDAO(){
		if(_memberDao==null)
		{
			_memberDao = new MemberDAO();
		}
		return _memberDao;
	}	
	
	//아이디 중복체크
	
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
	
	//회원가입
	public int create(MemberDTO memberdto)throws Exception
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into member values(member_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";

		try{
		con = getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, memberdto.getId());
		pstmt.setString(2, memberdto.getName());
		pstmt.setString(3, memberdto.getPassword());
		pstmt.setString(4, memberdto.getJumin1());
		pstmt.setString(5, memberdto.getJumin2());
		pstmt.setString(6, memberdto.getZipcode());
		pstmt.setString(7, memberdto.getAddress());
		pstmt.setString(8, memberdto.getPassquiz());
		pstmt.setString(9, memberdto.getPassresult());
		pstmt.setString(10, memberdto.getEmail());
		pstmt.setString(11, memberdto.getHomephone());
		pstmt.setString(12, memberdto.getCellphone());
	
		int rows = pstmt.executeUpdate();
		return rows;
		}
		finally{
			if(pstmt!=null) pstmt.close();
			if(con!=null) releaseConnection(con);
		}
		
	}
	//수정
	public int update(MemberDTO memberdto)throws Exception
	{ 
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update member set m_id=?, m_name=?, m_password=?, " +
										 " m_jumin1=?, m_jumin2=?, " +
										 " m_address=?, m_zipcode=? ,m_passquiz=?, "+
										 " m_passresult=?, m_email=?, "+
										 " m_homephone=?, m_cellphone=? where m_no=?";
		try{
			con =getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberdto.getId());
			pstmt.setString(2, memberdto.getName());
			pstmt.setString(3, memberdto.getPassword());
			pstmt.setString(4, memberdto.getJumin1());
			pstmt.setString(5, memberdto.getJumin2());
			pstmt.setString(6, memberdto.getAddress());
			pstmt.setString(7, memberdto.getZipcode());
			pstmt.setString(8, memberdto.getPassquiz());
			pstmt.setString(9, memberdto.getPassresult());
			pstmt.setString(10, memberdto.getEmail());
			pstmt.setString(11, memberdto.getHomephone());
			pstmt.setString(12, memberdto.getCellphone());			
			pstmt.setInt(13, memberdto.getNo());
			int rows = pstmt.executeUpdate();
			return rows;
		}finally{
			if(pstmt!=null) pstmt.close();
			if(con!=null) releaseConnection(con);
		}
		
	}
	//탈퇴(삭제)
	public int remove(String Id)throws Exception
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "delete from member where m_id=?";
		try
		{
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, Id);
			int rows = pstmt.executeUpdate();
			return rows;
		}finally
		{
			if(pstmt!=null) pstmt.close();
			if(con!=null) releaseConnection(con);
		}		
				
	}

	//수정(뿌리기)
	public MemberDTO findUser(String Id)throws Exception
	{
		MemberDTO memberdto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where m_id=?";
		try
		{
			con=getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, Id);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				memberdto = new MemberDTO(rs.getInt("m_no"),
											rs.getString("m_id"),
											rs.getString("m_name"),
											rs.getString("m_password"),
											rs.getString("m_jumin1"),
											rs.getString("m_jumin2"),											
											rs.getString("m_passquiz"),
											rs.getString("m_passresult"),
											rs.getString("m_zipcode"),
											rs.getString("m_address"),
											rs.getString("m_email"),
											rs.getString("m_homephone"),
											rs.getString("m_cellphone"),
											rs.getString("m_date"));
			}
		}finally
		{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null)releaseConnection(con);
		}
		return memberdto;
	}
	
	//회원목록
	public ArrayList<MemberDTO> findUserList()throws Exception
	{
		ArrayList<MemberDTO> memberList = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member order by m_no asc";
		try
		{
			con=getConnection();
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				memberList.add(new MemberDTO(rs.getInt("m_no"),
												rs.getString("m_id"),
												rs.getString("m_name"),
												rs.getString("m_password"),
												rs.getString("m_jumin1"),
												rs.getString("m_jumin2"),
												rs.getString("m_zipcode"),
												rs.getString("m_address"),
												rs.getString("m_passquiz"),
												rs.getString("m_passresult"),
												rs.getString("m_email"),
												rs.getString("m_homephone"),
												rs.getString("m_cellphone"),
												rs.getString("m_date")));
			}
		}finally
		{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null)releaseConnection(con);
		}
		return memberList;
	}
	
	//------------------------------------------------------------------------- 추가
	//ID 찾기
	public ArrayList <MemberDTO> idsearch(String email , String name)throws Exception
	{
		ArrayList<MemberDTO> searchList = new ArrayList<MemberDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "select m_id from member where m_email=? and m_name=? ";
		try
		{
			con=getConnection();
			pstmt=con.prepareStatement(SQL);
			pstmt.setString(1, email);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				searchList.add(new MemberDTO(rs.getString("m_id")));
			}
			
		}finally
		{
			if(pstmt!=null) pstmt.close();
			if(con!=null) releaseConnection(con);
		}	
		return searchList;
				
	}
	//1. pass 찾기(기본정보입력 - > 패스워드 질문찾기)
		public MemberDTO passsearch1(String id, String name, String email) throws Exception
		{
			MemberDTO memberDto = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String SQL = "select m_passquiz from member where m_id=? and m_name=? and m_email=? ";
			try
			{
				con = getConnection();
				pstmt = con.prepareStatement(SQL);
				pstmt.setString(1, id);
				pstmt.setString(2, name);
				pstmt.setString(3, email);
				rs=pstmt.executeQuery();
				if(rs.next()){
					memberDto = new MemberDTO(rs.getString("m_passquiz"));
				}
			}finally
			{
				if(pstmt!=null) pstmt.close();
				if(con!=null) releaseConnection(con);
			}		
			return memberDto;
			
		}
	//2. pass 찾기(질답입력 - > 비밀번호찾기)
		public ArrayList<MemberDTO> passsearch2(String passresult)throws Exception
		{
			ArrayList<MemberDTO> passList = new ArrayList<MemberDTO>();
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String SQL = "select m_password, m_name from member where m_passresult=? ";
			try
			{
				con=getConnection();
				pstmt=con.prepareStatement(SQL);
				pstmt.setString(1, passresult);
				rs = pstmt.executeQuery();
				while(rs.next())
				{
					passList.add(new MemberDTO(rs.getString("m_name"),
												rs.getString("m_password")));
				}
			}finally
			{
				if(pstmt!=null) pstmt.close();
				if(con!=null) releaseConnection(con);
			}		
			return passList;
		}
		
	
		
	}
	

