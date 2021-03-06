package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.RdbmsDAO;

public class OrderDAO extends RdbmsDAO {

	private static OrderDAO _orderDAO;

	private OrderDAO() {
	}

	public static OrderDAO getOrderDAO() {

		if (_orderDAO == null) {
			_orderDAO = new OrderDAO();
		}
		return _orderDAO;
	}

	/*
	 * 주문 생성
	 */
	public int create(OrderDTO order) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String insertQuery = "insert into order1 values (order1_seq.nextval,?,sysdate,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(insertQuery);
			pstmt.setInt(1, order.getOrder_code());
			System.out.println(order.getOrder_code());
			pstmt.setString(2, order.getMember_id());
			pstmt.setString(3, order.getFrom_name());
			pstmt.setString(4, order.getFrom_address());
			pstmt.setString(5, order.getFrom_telephone());
			pstmt.setString(6, order.getFrom_phone());
			pstmt.setString(7, order.getFrom_email());
			pstmt.setString(8, order.getTo_name());
			pstmt.setString(9, order.getTo_address());
			pstmt.setString(10, order.getTo_telephone());
			pstmt.setString(11, order.getTo_phone());
			pstmt.setString(12, order.getMessage());
			pstmt.setString(13, order.getItem_code());
			pstmt.setInt(14, order.getItem_price());
			pstmt.setString(15, order.getPayment_option());
			pstmt.setString(16, order.getPayment_status());
		  int rows = pstmt.executeUpdate();
		  System.out.println("주문 성공여부 "+rows);
			return rows;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
	}

	/*
	 * 주문 수정
	 */
	public int update(OrderDTO order) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String updateQuery = "update order1 set order_code=?,order_date=sysdate,member_id=?,from_name=?,"
				+ "from_address=?,from_telephone=?,from_phone=?,from_email=?,to_name=?,"
				+ "to_address=?,to_telephone=?,to_phone=?,message=?,item_code=?,"
				+ "item_price=?,payment_option=?,payment_status=? where order_no=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(updateQuery);
			pstmt.setInt(1, order.getOrder_code());
			pstmt.setString(2, order.getMember_id());
			pstmt.setString(3, order.getFrom_name());
			pstmt.setString(4, order.getFrom_address());
			pstmt.setString(5, order.getFrom_telephone());
			pstmt.setString(6, order.getFrom_phone());
			pstmt.setString(7, order.getFrom_email());
			pstmt.setString(8, order.getTo_name());
			pstmt.setString(9, order.getTo_address());
			pstmt.setString(10, order.getTo_telephone());
			pstmt.setString(11, order.getTo_phone());
			pstmt.setString(12, order.getMessage());
			pstmt.setString(13, order.getItem_code());
			pstmt.setInt(14, order.getItem_price());
			pstmt.setString(15, order.getPayment_option());
			pstmt.setString(16, order.getPayment_status());
			pstmt.setInt(17, order.getOrder_no());
			int rows = pstmt.executeUpdate();
			return rows;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
	}

	/*
	 * 주문 삭제
	 */
	public int remove(int order_no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String removeQuery = "delete from order1 where order_no=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(removeQuery);
			pstmt.setInt(1, order_no);
			int rows = pstmt.executeUpdate();
			return rows;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
	}

	/*
	 * order_no 로 찾기
	 */
	public OrderDTO findOrder(int order_no) throws Exception {
		OrderDTO order = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "select order_no,order_code,order_date,member_id,from_name,"
				+ "from_address,from_telephone,from_phone,from_email,to_name,to_address,"
				+ "to_telephone,to_phone,message,item_code,item_price,payment_option,payment_status"
				+ "from order1 where order_no=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setInt(1, order_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				order = new OrderDTO(rs.getInt("order_no"),
						rs.getInt("order_code"), rs.getString("order_date"),
						rs.getString("member_id"), rs.getString("from_name"),
						rs.getString("from_address"),
						rs.getString("from_telephone"),
						rs.getString("from_phone"), rs.getString("from_email"),
						rs.getString("to_name"), rs.getString("to_address"),
						rs.getString("to_telephone"), rs.getString("to_phone"),
						rs.getString("message"), rs.getString("item_code"),
						rs.getInt("item_price"),
						rs.getString("payment_option"),
						rs.getString("payment_status"));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
		return order;
	}
	
	/*
	 * order_no 로 찾기
	 */
	public ArrayList<OrderDTO> findname(int order_code) throws Exception {
		ArrayList<OrderDTO> order = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = " select order_no, order_code, order_date, member_id, from_name, from_address, from_telephone, from_phone, from_email, to_name, to_address, to_telephone, to_phone, message, item_code,item_price, payment_option, payment_status from order1 where order_code=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setInt(1, order_code);
			rs = pstmt.executeQuery();
			order = new ArrayList<OrderDTO>();
//			System.out.println("주문 dao처리 중간 : " + order_code);
			while (rs.next()) {
				order.add(new OrderDTO(rs.getInt("order_no"),
						rs.getInt("order_code"), rs.getString("order_date"),
						rs.getString("member_id"), rs.getString("from_name"),
						rs.getString("from_address"),
						rs.getString("from_telephone"),
						rs.getString("from_phone"), rs.getString("from_email"),
						rs.getString("to_name"), rs.getString("to_address"),
						rs.getString("to_telephone"), rs.getString("to_phone"),
						rs.getString("message"), rs.getString("item_code"),
						rs.getInt("item_price"),
						rs.getString("payment_option"),
						rs.getString("payment_status")));
				/*System.out.println(rs.getInt("order_no")+", "+
						rs.getInt("order_code")+", "+ 
						rs.getString("order_date")+", "+
						rs.getString("member_id")+", "+ 
						rs.getString("from_name")+", "+
						rs.getString("from_address")+", "+
						rs.getString("from_telephone")+", "+
						rs.getString("from_phone")+", "+ 
						rs.getString("from_email")+", "+
						rs.getString("to_name")+", "+ 
						rs.getString("to_address")+", "+
						rs.getString("to_telephone")+", "+ 
						rs.getString("to_phone")+", "+
						rs.getString("message")+", "+ 
						rs.getString("item_code")+", "+
						rs.getInt("item_price")+", "+
						rs.getString("payment_option")+", "+
						rs.getString("payment_status"));*/
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
//		System.out.println("주문 dao 종료 "+order);
		return order;
	}
	/*
	 * order_code 찾기 회원아이디로(member_id) 검색하기
	 */
	public ArrayList<OrderDTO> findOrderCode(String member_id) throws Exception {
		ArrayList<OrderDTO> orderList = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "select order_code, member_id from order1 where member_id=? group by order_code, member_id order by order_code desc";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			orderList = new ArrayList<OrderDTO>();
			while (rs.next()) {
				OrderDTO order = new OrderDTO(
						rs.getInt("order_code"),
						rs.getString("member_id"));
				//System.out.println("코드 : "+rs.getInt("order_code")+"/ 아이디 :"+rs.getString("member_id"));
				orderList.add(order);
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
		return orderList;
	}
	

	/*
	 * order list(전체)
	 */
	public ArrayList<OrderDTO> findOrderList() throws Exception {
		ArrayList<OrderDTO> orderList = new ArrayList<OrderDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "select order_no,order_code,order_date,member_id,from_name,"
				+ "from_address,from_telephone,from_phone,from_email,to_name,to_address,"
				+ "to_telephone,to_phone,message,item_code,item_price,payment_option,payment_status"
				+ "from order1";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				orderList.add(new OrderDTO(rs.getInt("order_no"), rs
						.getInt("order_code"), rs.getString("order_date"),
						rs.getString("member_id"), rs.getString("from_name"),
						rs.getString("from_address"), rs
								.getString("from_telephone"), rs
								.getString("from_phone"), rs
								.getString("from_email"), rs
								.getString("to_name"), rs
								.getString("to_address"), rs
								.getString("to_telephone"), rs
								.getString("to_phone"),
						rs.getString("message"), rs.getString("item_code"), rs
								.getInt("item_price"), rs
								.getString("payment_option"), rs
								.getString("payment_status")));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
		return orderList;
	}
	
	/*
	 * select oc_seq.nextval from dual;
	 * 주문번호증가
	 */
	public int ocup() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = " select oc_seq.nextval as ocup from dual ";
		
		int ocup=0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ocup = rs.getInt("ocup");
				System.out.println("오더dao증가"+ocup);
			}
			
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
		return ocup;
	}
	/*
	 * select oc_seq.CURRVAL from dual;
	 * 주문번호
	 */
	public int ocinfo() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = " select oc_seq.CURRVAL as ocinfo from dual ";
		int ocinfo=0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ocinfo = rs.getInt("ocinfo");
				System.out.println("오더dao출력"+ocinfo);
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
		return ocinfo;
	}

}
