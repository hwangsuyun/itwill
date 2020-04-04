package order;

import java.util.ArrayList;

public class OrderManager {

	private static OrderManager _orderManager;
	private OrderManager(){}
	public static OrderManager getOrderManager(){
		if(_orderManager==null){
			_orderManager=new OrderManager();
		}
		return _orderManager;
	}

	/*
	 * �ֹ� ����(DAO�� �ֹ����� method�� ȣ��)
	 */
	public int create(OrderDTO order) throws Exception{
		int rows = getOrderDAO().create(order);
		return rows;
	}
	/*
	 *  �ֹ� ����(DAO�� �ֹ����� method�� ȣ��)
	 */
	public int update(OrderDTO order) throws Exception{
		int	rows = getOrderDAO().update(order);
		return rows;
	}
	
	/*
	 *  �ֹ� ����(DAO�� �ֹ����� method�� ȣ��)
	 */
	public int remove(int order_no) throws Exception{
		int rows = getOrderDAO().remove(order_no);
		return rows;
	}
	
	/*
	 * 	order ����(DAO�� orderã�� method�� ȣ��)
	 */
	public OrderDTO findOrder(int order_no) throws Exception{
		OrderDTO order = getOrderDAO().findOrder(order_no);
		return order;
	}
	
	/*
	 * 	��ǰ�� �ҷ�����, order_codeã�Ƽ�.
	 */
	public ArrayList<OrderDTO> findname(int order_code) throws Exception{
//		System.out.println("�����Ŵ��� : "+order_code);
		ArrayList<OrderDTO> order = getOrderDAO().findname(order_code);
//		System.out.println("�����Ŵ��� : "+order);
		return order;
	}
	
	/*
	 *  �̸��˻� order list ����(DAO�� name�˻� order list method�� ȣ��)
	 */
	public ArrayList<OrderDTO> findnameList(String c_name) throws Exception{
		ArrayList<OrderDTO> list = getOrderDAO().findOrderList();
		return list;
	}
	
	/*
	 *  member_id �˻� order list ����(DAO�� id�˻� order list method�� ȣ��)
	 */
	public ArrayList<OrderDTO> findorderCode(String member_id) throws Exception{
		ArrayList<OrderDTO> list = getOrderDAO().findOrderCode(member_id);
/*		for(OrderDTO dto : list){
		System.out.println("�˻��� ������ �ڵ� ã�ƶ�"+list+" "+dto.getOrder_code()+" "+dto.getMember_id());
	}*/
		return list;
	}
	
	/*
	 *  ��ü order list ����(DAO�� ��ü order list method�� ȣ��)
	 */
	public ArrayList<OrderDTO> findOrderList() throws Exception{
		ArrayList<OrderDTO> list = getOrderDAO().findOrderList();
		return list;
	}
	/*
	 *  select oc_seq.nextval as ocup from dual
	 *  �ֹ���ȣ ����
	 */
	public int ordercodeup() throws Exception{
		int ocup = getOrderDAO().ocup();
		return ocup;
	}
	/*
	 *  select oc_seq.CURRVAL as ocinfo from dual
	 *  �ֹ���ȣ ����
	 */
	public int ordercodeinfo() throws Exception{
		int ocinfo = getOrderDAO().ocinfo();
		return ocinfo;
	}
	
	
	/*
	 * OrderDAO ��ü ��ȯ
	 */
	private OrderDAO getOrderDAO(){
		return OrderDAO.getOrderDAO();
	}




}