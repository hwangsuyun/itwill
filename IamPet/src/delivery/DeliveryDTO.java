package delivery;
/*
  CREATE TABLE SCOTT.DELIVERY 
 (
  DELIVERY_NO        NUMBER    		   NOT NULL, 
  ORDER_CODE         VARCHAR2(100)     NOT NULL, 
  MEMBER_ID          VARCHAR2(100)     NOT NULL, 
  DELIVERY_STATUS    CHAR(1)           NOT NULL, 
  SEND_DATE          DATE                  NULL, 
  RECEIVE_DATE       DATE                  NULL
 )
 */
public class DeliveryDTO 
{
	private int no;
	private int order_code;
	private String member_id;
	private String delivery_status;
	private String send_date;
	private String receive_date;
	
	public DeliveryDTO() {	}
	
	public DeliveryDTO
	(
			int no, 
			int order_code,
			String member_id,
			String delivery_status, 
			String send_date, 
			String receive_date	
	 ) 
	{
		this.no = no;
		this.order_code = order_code;
		this.member_id = member_id;
		this.delivery_status = delivery_status;
		this.send_date = send_date;
		this.receive_date = receive_date;
	}
	
	//orderok 배송정보 입력 용
	public DeliveryDTO(int order_code, String member_id,
			String delivery_status, String send_date, String receive_date) {
		super();
		this.order_code = order_code;
		this.member_id = member_id;
		this.delivery_status = delivery_status;
		this.send_date = send_date;
		this.receive_date = receive_date;
	}

	public int getNo() 
	{
		return no;
	}


	public void setNo(int no)
	{
		this.no = no;
	}


	public int getOrder_code()
	{
		return order_code;
	}


	public void setOrder_code(int order_code) 
	{
		this.order_code = order_code;
	}


	public String getMember_id()
	{
		return member_id;
	}


	public void setMember_id(String member_id) 
	{
		this.member_id = member_id;
	}


	public String getDelivery_status() 
	{
		return delivery_status;
	}


	public void setDelivery_status(String delivery_status)
	{
		this.delivery_status = delivery_status;
	}


	public String getSend_date()
	{
		return send_date;
	}


	public void setSend_date(String send_date)
	{
		this.send_date = send_date;
	}


	public String getReceive_date()
	{
		return receive_date;
	}


	public void setReceive_date(String receive_date)
	{
		this.receive_date = receive_date;
	}
	
	
	
	
}
