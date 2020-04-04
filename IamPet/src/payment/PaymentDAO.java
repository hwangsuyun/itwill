package payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import db.RdbmsDAO;

public class PaymentDAO extends RdbmsDAO
{
	private static PaymentDAO paymentDAO;
	
	private PaymentDAO() {}
	// singleton
	public static PaymentDAO getPaymentDAO()
	{
		if(paymentDAO == null) paymentDAO = new PaymentDAO();
		
		return paymentDAO;
	}
	
	//--------------------------------------
	/*
	 * 사용자관리테이블에 새로운사용자생성
	 */
	public int create(PaymentDTO dto) throws Exception
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		String insertQuery = "insert into payment values(payment_seq.nextval, ?, ?, ?, ?, ?, sysdate, ?)";
		
		try 
		{
			con = getConnection();
			pstmt = con.prepareStatement(insertQuery);
			pstmt.setInt(1, dto.getOrder_code());
			pstmt.setInt(2, dto.getOrder_cnt());
			pstmt.setInt(3, dto.getDelivery_fee());
			pstmt.setInt(4, dto.getPayment_price());
			pstmt.setString(5, dto.getPayment_option());
			pstmt.setString(6, dto.getPayment_status());
			
			int rows = pstmt.executeUpdate();
			return rows;
		}
		finally
		{
			if(pstmt != null) pstmt.close();
			if(con != null) this.releaseConnection(con);
		}		
	}
	
	/*
	 * 기존의 사용자 정보를 수정 
	 */
	public int update(PaymentDTO dto) throws Exception
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		String updateQuery = "update payment set order_code=?, order_cnt=?, delivery_fee=?, payment_price=?, payment_option=?, payment_date=sysdate, payment_status=? where payment_seq=?";
		
		try 
		{
			con = getConnection();
			pstmt = con.prepareStatement(updateQuery);			
			pstmt.setInt(1, dto.getOrder_code());
			pstmt.setInt(2, dto.getOrder_cnt());
			pstmt.setInt(3, dto.getDelivery_fee());
			pstmt.setInt(4, dto.getPayment_price());
			pstmt.setString(5, dto.getPayment_option());
			pstmt.setString(6, dto.getPayment_status());
			pstmt.setInt(7, dto.getPayment_no());
						
			int rows = pstmt.executeUpdate();
			return rows;
		}
		finally
		{
			if(pstmt != null) pstmt.close();
			if(con != null) this.releaseConnection(con);
		}		
	}
	
	/*
	 * 사용자 아이디에 해당하는 사용자를 삭제 
	 */
	public int remove(int no) throws Exception
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		String removeQuery = "delete from payment where payment_no=?";
		
		try 
		{
			con = getConnection();
			pstmt = con.prepareStatement(removeQuery);			
			pstmt.setInt(1, no);
			int rows = pstmt.executeUpdate();
			return rows;
		}
		finally
		{
			if(pstmt != null) pstmt.close();
			if(con != null) this.releaseConnection(con);
		}		
	}
	
	/*
	 * 사용자 아이디에 해당하는 정보를 데이타베이스에서 찾아서
	 * User 도메인클래스에 저장하여 반환 
	 */
	public PaymentDTO findPayment(int order_code) throws Exception
	{
		System.out.println("결제dto 시작 : "+order_code);
		PaymentDTO dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "select * from payment where order_code=?";
		
		try 
		{
			System.out.println("검색시작");
			con = getConnection();
			pstmt = con.prepareStatement(selectQuery);			
			pstmt.setInt(1, order_code);
			rs = pstmt.executeQuery();
			System.out.println("결제검색 검색 결과여부 : " + rs);
			if(rs.next())
			{							
				dto = new PaymentDTO(rs.getInt("payment_no"),
									rs.getInt("order_code"),
									rs.getInt("order_cnt"),
									rs.getInt("delivery_fee"),
									rs.getInt("payment_price"),
									rs.getString("payment_option"),
									rs.getString("payment_date"),
									rs.getString("payment_status"));
				
				System.out.println(rs.getInt("payment_no")+", "+
									rs.getInt("order_code")+", "+
									rs.getInt("order_cnt")+", "+
									rs.getInt("delivery_fee")+", "+
									rs.getInt("payment_price")+", "+
									rs.getString("payment_option")+", "+
									rs.getString("payment_date")+", "+
									rs.getString("payment_status"));
			}			
		}
		finally
		{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) this.releaseConnection(con);
		}	
		System.out.println("결제dao 처리 종료 : "+dto);
		return dto;
	}
	
	/*
	 * 모든 사용자 정보를 데이타베이스에서 찾아서 
	 * List 콜렉션에 저장하여 반환
	 */	
	public ArrayList<PaymentDTO> findPaymentList() throws Exception
	{
		ArrayList<PaymentDTO> paymentList = new ArrayList<PaymentDTO>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String selectQuery = "select * from payment order by payment_no desc";
		
		try 
		{
			con = getConnection();
			stmt = con.createStatement();					
			rs = stmt.executeQuery(selectQuery);
			while(rs.next())
			{					
				paymentList.add(new PaymentDTO(rs.getInt("payment_no"),
								rs.getInt("order_code"),
								rs.getInt("order_cnt"),
								rs.getInt("delivery_fee"),
								rs.getInt("payment_price"),
								rs.getString("payment_option"),
								rs.getString("payment_date"),
								rs.getString("payment_status")));
			}			
		}
		finally
		{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(con != null) this.releaseConnection(con);
		}	
		
		return paymentList;
	}
	
	/*
	 * 인자로 전달되는 아이디를 가지는 사용자가 존재하는지의 여부를 판별
	 */
	public boolean existedPayment(String order_code) throws Exception
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String existedQuery = "select count(*) cnt from payment where order_code=?";
		
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(existedQuery);
			pstmt.setString(1, order_code);
			rs = pstmt.executeQuery();
			int count = 0;
			if(rs.next())
			{
				count = rs.getInt("cnt");
			}
			
			if(count == 1) return true;			
			else return false;						
		}
		finally
		{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) releaseConnection(con);
		}				
	}
	
	
	

}
