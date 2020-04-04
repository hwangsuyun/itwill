package order;

import java.util.ArrayList;

public class OrderManager {

	private static OrderManager _orderManager;

	private OrderManager() {
	}

	public static OrderManager getOrdermanager() {
		if (_orderManager == null) {
			_orderManager = new OrderManager();
		}
		return _orderManager;
	}

	// 주문 추가
	public int insert(OrderDTO orderDto) {
		int rows = 0;
		try {
			rows = getOrderDao().insert(orderDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rows;
	}

	// 주문 삭제 order_code로
	public int remove(String order_code) throws Exception {
		return getOrderDao().remove(order_code);
	}

	// 주문 삭제 m_id로
	public int delete(String m_id) throws Exception {
		return getOrderDao().delete(m_id);
	}

	// 전체 주문목록
	public ArrayList<OrderDTO> findAll() throws Exception {
		return getOrderDao().findAll();
	}

	// m_id로 주문 리스트 뿌리기
	public ArrayList<OrderDTO> find(String m_id) throws Exception {
		return getOrderDao().find(m_id);
	}

	// m_cellphone로 주문 리스트 뿌리기
	public ArrayList<OrderDTO> findGuest(String m_cellphone, String m_email) throws Exception {
		return getOrderDao().findGuest(m_cellphone,m_email);
	}

	// order_code로 주문하나찾기
	public OrderDTO findorder(String order_code) throws Exception {
		return getOrderDao().findorder(order_code);
	}

	// m_id로 주문하나찾기
	public OrderDTO findOne(String m_id) throws Exception {
		return getOrderDao().findOne(m_id);
	}

	// 객체반환
	private OrderDAO getOrderDao() {
		return OrderDAO.getOrderDAO();
	}
}
