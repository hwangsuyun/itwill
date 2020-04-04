package payment;

public class PaymentDTO
{
	/*
	  PAYMENT_SEQ       VARCHAR2(100)     NOT NULL, 
  ORDER_CODE        VARCHAR2(100)     NOT NULL, 
  ORDER_CNT         NUMBER            NOT NULL, 
  DELIVERY_FEE      NUMBER            DEFAULT 3000            NOT NULL, 
  PAYMENT_PRICE     NUMBER            NOT NULL, 
  PAYMENT_OPTION    VARCHAR2(1)       NOT NULL, 
  PAYMENT_DATE      VARCHAR2(40)       NOT NULL, 
  PAYMENT_STATUS    VARCHAR2(1)       NOT NULL
	 */
	
	private int payment_no;
	private int order_code;
	private int order_cnt;
	private int delivery_fee;
	private int payment_price;
	private String payment_option;
	private String payment_date;
	private String payment_status;
	
	
	// »ý¼ºÀÚ 
	public PaymentDTO() { }
	public PaymentDTO(int payment_no, int order_code, int order_cnt,
			int delivery_fee, int payment_price, String payment_option,
			String payment_date, String payment_status) 
	{
		super();
		this.payment_no = payment_no;
		this.order_code = order_code;
		this.order_cnt = order_cnt;
		this.delivery_fee = delivery_fee;
		this.payment_price = payment_price;
		this.payment_option = payment_option;
		this.payment_date = payment_date;
		this.payment_status = payment_status;
	}
	
	// getter & setter
	public int getPayment_no() { return payment_no; }
	public void setPayment_no(int payment_no) { this.payment_no = payment_no; }
	public int getOrder_code() { return order_code; }
	public void setOrder_code(int order_code) { this.order_code = order_code; }
	public int getOrder_cnt() { return order_cnt; }
	public void setOrder_cnt(int order_cnt) { this.order_cnt = order_cnt; }
	public int getDelivery_fee() { return delivery_fee; }
	public void setDelivery_fee(int delivery_fee) { this.delivery_fee = delivery_fee; }
	public int getPayment_price() { return payment_price; }
	public void setPayment_price(int payment_price) { this.payment_price = payment_price; }
	public String getPayment_option() { return payment_option; }
	public void setPayment_option(String payment_option) { this.payment_option = payment_option; }
	public String getPayment_date() { return payment_date; }
	public void setPayment_date(String payment_date) { this.payment_date = payment_date; }
	public String getPayment_status() { return payment_status; }
	public void setPayment_status(String payment_status) { this.payment_status = payment_status; }
	
	
	

}
