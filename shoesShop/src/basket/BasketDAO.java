package basket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.RdbmsDAO;

public class BasketDAO extends RdbmsDAO{

	private static BasketDAO  _basketDao;
	private BasketDAO(){
		/*System.out.println("MemberDAO생성자"+this);*/
	} 
	public static BasketDAO getBasketDAO(){
		if(_basketDao==null)
		{
			_basketDao = new BasketDAO();
		}
		return _basketDao;
	}	
	
	//장바구니 추가
	public int insert(BasketDTO basketDto) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		String insertQuery = "insert into basket values(basket_basket_code_seq.NEXTVAL,?,?,?,?,?,?)";
		try{
			con = getConnection();
			pstmt = con.prepareStatement(insertQuery);
			pstmt.setString(1, basketDto.getM_id());
			pstmt.setString(2, basketDto.getP_code());
			pstmt.setString(3, basketDto.getP_engname());
			pstmt.setString(4, basketDto.getP_name());
			pstmt.setInt(5, basketDto.getP_price());
			pstmt.setInt(6, basketDto.getP_quantity());
			int rows = pstmt.executeUpdate();
			
			return rows;
		}finally{
			if(pstmt!=null) pstmt.close();
			if(con!=null) releaseConnection(con);
		}
	}
	
	//장바구니 수정
	public int update(BasketDTO basketDto) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		String updateQuery = "update basket set m_id=?,p_code=?,p_engname=?,p_name=?,p_price=?,p_quantity=? where basket_code=?";
		
		try{
		con = getConnection();
		pstmt = con.prepareStatement(updateQuery);
		pstmt.setString(1, basketDto.getM_id());
		pstmt.setString(2, basketDto.getP_code());
		pstmt.setString(3, basketDto.getP_engname());
		pstmt.setString(4, basketDto.getP_name());
		pstmt.setInt(5, basketDto.getP_price());
		pstmt.setInt(6, basketDto.getP_quantity());
		pstmt.setInt(7, basketDto.getBasket_code());
		int rows = pstmt.executeUpdate();
		return rows;
		}finally{
			if(pstmt!=null) pstmt.close();
			if(con!=null) releaseConnection(con);
		}
	}
	
	
	
	
	
	
	
	//장바구니 삭제 basket_no로
	public int remove(String basket_code) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		String deleteQuery = "delete from basket where basket_code=?";
		
		try{
		con = getConnection();
		pstmt = con.prepareStatement(deleteQuery);
		pstmt.setString(1, basket_code);
		int rows = pstmt.executeUpdate();
		return rows;
		}finally{
			if(pstmt!=null) pstmt.close();
			if(con!=null) releaseConnection(con);
		}
	}
	
	//장바구니 삭제 m_id로
		public int delete(String m_id) throws Exception{
			Connection con = null;
			PreparedStatement pstmt = null;
			String deleteQuery = "delete from basket where m_id=?";
			
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
	
	
	
	
	
	//전체 장바구니목록
	public ArrayList<BasketDTO> findAll() throws Exception{
		ArrayList<BasketDTO> List = new ArrayList<BasketDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "select * from basket";
		
		try{
			con=getConnection();
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			while(rs.next()){
				List.add(new BasketDTO(rs.getInt("basket_code"),rs.getString("m_id"),rs.getString("p_code"),
									   rs.getString("p_engname"),rs.getString("p_name"),
									   rs.getInt("p_price"),rs.getInt("p_quantity")));
			}
			
		}finally{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) releaseConnection(con);
		}
		return List;
	}
	
	//m_id로 리스트 뿌리기
	public ArrayList<BasketDTO> find(String m_id) throws Exception{
		ArrayList<BasketDTO> list = new ArrayList<BasketDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "select basket_code, m_id, p_code, p_engname, p_name, p_price, p_quantity from basket where m_id=?";
		try{
			con = getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				list.add(new BasketDTO(rs.getInt("basket_code"),rs.getString("m_id"),rs.getString("p_code"),
						   rs.getString("p_engname"),rs.getString("p_name"),
						   rs.getInt("p_price"),rs.getInt("p_quantity")));
			}
		}finally{
			if(rs != null)
			{
				rs.close();
			}
			if(pstmt != null)
			{
				pstmt.close();
			}
			if(con != null)
			{
				releaseConnection(con);
			}
		}
		return list;
	}
	
	//basket_no로 장바구니하나찾기
	public BasketDTO findbasket(String basket_code) throws Exception{
		BasketDTO basketDto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = " select * from basket where basket_code=? ";
		
		try{
			con=getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, basket_code);
			rs = pstmt.executeQuery();
			if(rs.next()){
				basketDto = new BasketDTO(rs.getInt("basket_code"),rs.getString("m_id"),rs.getString("p_code"),
						   rs.getString("p_engname"),rs.getString("p_name"),
						   rs.getInt("p_price"),rs.getInt("p_quantity"));
			}
		}finally{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) releaseConnection(con);
		}
		return basketDto;
		
}

	//m_id로 장바구니하나찾기
		public BasketDTO findOne(String m_id) throws Exception{
			BasketDTO basketDto = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String selectQuery = " select * from basket where m_id=? ";
			
			try{
				con=getConnection();
				pstmt = con.prepareStatement(selectQuery);
				pstmt.setString(1, m_id);
				rs = pstmt.executeQuery();
				if(rs.next()){
					basketDto = new BasketDTO(rs.getInt("basket_code"),rs.getString("m_id"),rs.getString("p_code"),
							   rs.getString("p_engname"),rs.getString("p_name"),
							   rs.getInt("p_price"),rs.getInt("p_quantity"));
				}
			}finally{
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) releaseConnection(con);
			}
			return basketDto;
		}
	
	
	
	
	
	
	
	
	
	
	
	
}
