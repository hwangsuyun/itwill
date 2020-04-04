package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.RdbmsDAO;

import member.MemberDTO;

public class ProductDAO extends RdbmsDAO{

	private static ProductDAO  _productDao;
	private ProductDAO(){
		/*System.out.println("MemberDAO생성자"+this);*/
	} 
	public static ProductDAO getProductDAO(){
		if(_productDao==null)
		{
			_productDao = new ProductDAO();
		}
		return _productDao;
	}	
	

		
		//상품 삭제
		public int remove(String p_code) throws Exception{
			Connection con = null;
			PreparedStatement pstmt = null;
			String deleteQuery = "delete from product where p_code=?";
			
			try{
			con = getConnection();
			pstmt = con.prepareStatement(deleteQuery);
			pstmt.setString(1, p_code);
			int rows = pstmt.executeUpdate();
			return rows;
			}finally{
				if(pstmt!=null) pstmt.close();
				if(con!=null) releaseConnection(con);
			}
		}
		
		//전체 상품목록
		public ArrayList<ProductDTO> findAll() throws Exception{
			ArrayList<ProductDTO> List = new ArrayList<ProductDTO>();
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String selectQuery = "select * from product";
			
			try{
				con=getConnection();
				pstmt = con.prepareStatement(selectQuery);
				rs = pstmt.executeQuery();
				while(rs.next()){
					List.add(new ProductDTO(rs.getInt("p_code"),rs.getString("p_engname"),rs.getString("p_name"),rs.getInt("p_price")));
				}
				
			}finally{
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) releaseConnection(con);
			}
			return List;
		}
		
		//p_code로 상품하나찾기
		public ProductDTO findOne(String p_code) throws Exception{
			ProductDTO productDto = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String selectQuery = " select * from product where p_code=? ";
			
			try{
				con=getConnection();
				pstmt = con.prepareStatement(selectQuery);
				pstmt.setString(1, p_code);
				rs = pstmt.executeQuery();
				if(rs.next()){
					productDto = new ProductDTO(rs.getInt("p_code"),rs.getString("p_engname"),rs.getString("p_name"),rs.getInt("p_price"));
				}
			}finally{
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) releaseConnection(con);
			}
			return productDto;
	}
	
	
}
