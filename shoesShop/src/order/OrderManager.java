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

	// �ֹ� �߰�
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

	// �ֹ� ���� order_code��
	public int remove(String order_code) throws Exception {
		return getOrderDao().remove(order_code);
	}

	// �ֹ� ���� m_id��
	public int delete(String m_id) throws Exception {
		return getOrderDao().delete(m_id);
	}

	// ��ü �ֹ����
	public ArrayList<OrderDTO> findAll() throws Exception {
		return getOrderDao().findAll();
	}

	// m_id�� �ֹ� ����Ʈ �Ѹ���
	public ArrayList<OrderDTO> find(String m_id) throws Exception {
		return getOrderDao().find(m_id);
	}

	// m_cellphone�� �ֹ� ����Ʈ �Ѹ���
	public ArrayList<OrderDTO> findGuest(String m_cellphone, String m_email) throws Exception {
		return getOrderDao().findGuest(m_cellphone,m_email);
	}

	// order_code�� �ֹ��ϳ�ã��
	public OrderDTO findorder(String order_code) throws Exception {
		return getOrderDao().findorder(order_code);
	}

	// m_id�� �ֹ��ϳ�ã��
	public OrderDTO findOne(String m_id) throws Exception {
		return getOrderDao().findOne(m_id);
	}

	// ��ü��ȯ
	private OrderDAO getOrderDao() {
		return OrderDAO.getOrderDAO();
	}
}
