package payment;

import java.util.ArrayList;

public class PaymentManager
{
	private static PaymentManager paymentManager;
	
	private PaymentManager() {}
	
	public static PaymentManager getPaymentManager()
	{
		if(paymentManager == null) paymentManager = new PaymentManager();		
		return paymentManager;
	}
	
	// paymentDAO ��ü ��ȯ
	private PaymentDAO getPaymentDAO()
	{
		return PaymentDAO.getPaymentDAO();
	}
	
	
	/*
	 * 
	 */
	public int create(PaymentDTO dto) throws Exception
	{	
		int rows = getPaymentDAO().create(dto);
		return rows;
	}
		
	/*
	 * �ֹ� ���� order_code
	 */
	public PaymentDTO findOrderCode(int order_code) throws Exception
	{
		System.out.println("�����Ŵ��� ���� :" +order_code);
		PaymentDTO dto = getPaymentDAO().findPayment(order_code);
		if(dto == null)
		{
			// �������� �ʴ� ���̵� 
			System.out.println(order_code+" �� �������� �ʽ��ϴ�.");
		}else{
			System.out.println(order_code+" �� �����Ѵ�.");
		}
		return dto;
	}
	
		
	public int update(PaymentDTO dto) throws Exception
	{
		return getPaymentDAO().update(dto);
	}
	
	public int remove(int no) throws Exception
	{
		return getPaymentDAO().remove(no);
	}
	
	/*
	 * ��ü����
	 */
	public ArrayList<PaymentDTO> findUserList() throws Exception
	{
		return getPaymentDAO().findPaymentList();
	}
	
	
	

}
