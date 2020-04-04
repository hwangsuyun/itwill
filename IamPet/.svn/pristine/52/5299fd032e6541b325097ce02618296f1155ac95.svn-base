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
	
	// paymentDAO 객체 반환
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
	 * 주문 보기 order_code
	 */
	public PaymentDTO findOrderCode(int order_code) throws Exception
	{
		System.out.println("결제매니저 시작 :" +order_code);
		PaymentDTO dto = getPaymentDAO().findPayment(order_code);
		if(dto == null)
		{
			// 존재하지 않는 아이디 
			System.out.println(order_code+" 는 존재하지 않습니다.");
		}else{
			System.out.println(order_code+" 는 존재한다.");
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
	 * 전체보기
	 */
	public ArrayList<PaymentDTO> findUserList() throws Exception
	{
		return getPaymentDAO().findPaymentList();
	}
	
	
	

}
