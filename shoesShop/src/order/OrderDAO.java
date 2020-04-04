package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.RdbmsDAO;

public class OrderDAO extends RdbmsDAO {

	private static OrderDAO _orderDao;

	private OrderDAO() {
		/* System.out.println("MemberDAO생성자"+this); */
	}

	public static OrderDAO getOrderDAO() {
		if (_orderDao == null) {
			_orderDao = new OrderDAO();
		}
		return _orderDao;
	}

	// 주문 추가
	public int insert(OrderDTO orderDto) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String insertQuery = "insert into order1 values(order1_order_code_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?)";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(insertQuery);
			pstmt.setString(1, orderDto.getM_id());
			pstmt.setString(2, orderDto.getM_cellphone());
			pstmt.setString(3, orderDto.getM_email());
			pstmt.setString(4, orderDto.getM_address());
			pstmt.setString(5, orderDto.getP_code());
			pstmt.setString(6, orderDto.getP_engname());
			pstmt.setString(7, orderDto.getP_name());
			pstmt.setInt(8, orderDto.getP_quantity());
			pstmt.setString(9, orderDto.getPayment_way());
			pstmt.setInt(10, orderDto.getP_price());

			int rows = pstmt.executeUpdate();

			return rows;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
	}

	// 주문 삭제 order_code로
	public int remove(String order_code) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String deleteQuery = "delete from order1 where order_code=?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(deleteQuery);
			pstmt.setString(1, order_code);
			int rows = pstmt.executeUpdate();
			return rows;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
	}

	// 주문 삭제 m_id로
	public int delete(String m_id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String deleteQuery = "delete from order1 where m_id=?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(deleteQuery);
			pstmt.setString(1, m_id);
			int rows = pstmt.executeUpdate();
			return rows;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
	}

	// 전체 주문목록
	public ArrayList<OrderDTO> findAll() throws Exception {
		ArrayList<OrderDTO> List = new ArrayList<OrderDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "select * from order1";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				List.add(new OrderDTO(rs.getInt("order_code"), rs
						.getString("m_id"), rs.getString("m_cellphone"), rs
						.getString("m_email"), rs.getString("m_address"), rs
						.getString("p_code"), rs.getString("p_engname"), rs
						.getString("p_name"), rs.getInt("p_quantity"), rs
						.getString("payment_way"), rs.getInt("p_price")));
			}

		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
		return List;
	}

	// m_id로 주문 리스트 뿌리기
	public ArrayList<OrderDTO> find(String m_id) throws Exception {
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "select order_code, m_id, m_cellphone, m_email, m_address, p_code, p_engname, p_name, p_quantity, payment_way, p_price from order1 where m_id=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new OrderDTO(rs.getInt("order_code"),
						rs.getString("m_id"), rs.getString("m_cellphone"),
						rs.getString("m_email"), rs.getString("m_address"),
						rs.getString("p_code"), rs.getString("p_engname"),
						rs.getString("p_name"), rs.getInt("p_quantity"),
						rs.getString("payment_way"),rs.getInt("p_price")));
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				releaseConnection(con);
			}
		}
		return list;
	}
	
	// 핸드폰 번호(m_cellphone), 이메일(m_email)로 주문 리스트 뿌리기(비회원구매)
		public ArrayList<OrderDTO> findGuest(String m_cellphone,String m_email) throws Exception {
			ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String selectQuery = "select order_code, m_id, m_cellphone, m_email, m_address, p_code, p_engname, p_name, p_quantity, payment_way, p_price from order1 where m_cellphone=? and m_email=?";
			try {
				con = getConnection();
				pstmt = con.prepareStatement(selectQuery);
				pstmt.setString(1, m_cellphone);
				pstmt.setString(2, m_email);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					list.add(new OrderDTO(rs.getInt("order_code"),
							rs.getString("m_id"), rs.getString("m_cellphone"),
							rs.getString("m_email"), rs.getString("m_address"),
							rs.getString("p_code"), rs.getString("p_engname"),
							rs.getString("p_name"), rs.getInt("p_quantity"),
							rs.getString("payment_way"),rs.getInt("p_price")));
				}
			} finally {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					releaseConnection(con);
				}
			}
			return list;
		}
	
	
	
	

	// order_code로 주문하나찾기
	public OrderDTO findorder(String order_code) throws Exception {
		OrderDTO orderDto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = " select * from order1 where order_code=? ";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, order_code);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				orderDto = new OrderDTO(rs.getInt("order_code"),
						rs.getString("m_id"), rs.getString("m_cellphone"),
						rs.getString("m_email"), rs.getString("m_address"),
						rs.getString("p_code"), rs.getString("p_engname"),
						rs.getString("p_name"), rs.getInt("p_quantity"),
						rs.getString("payment_way"),rs.getInt("p_price"));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
		return orderDto;

	}

	// m_id로 주문하나찾기
	public OrderDTO findOne(String m_id) throws Exception {
		OrderDTO basketDto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = " select * from order1 where m_id=? ";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				basketDto = new OrderDTO(rs.getInt("order_code"),
						rs.getString("m_id"), rs.getString("m_cellphone"),
						rs.getString("m_email"), rs.getString("m_address"),
						rs.getString("p_code"), rs.getString("p_engname"),
						rs.getString("p_name"), rs.getInt("p_quantity"),
						rs.getString("payment_way"),rs.getInt("p_price"));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
		return basketDto;
	}

}
