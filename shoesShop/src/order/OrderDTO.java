package order;

public class OrderDTO {
/*
 이름          널        유형            
----------- -------- ------------- 
ORDER_CODE  NOT NULL NUMBER        
M_ID        NOT NULL VARCHAR2(50)  
M_CELLPHONE NOT NULL VARCHAR2(50)  
M_EMAIL     NOT NULL VARCHAR2(50)  
M_ADDRESS   NOT NULL VARCHAR2(100) 
P_CODE      NOT NULL VARCHAR2(50)  
P_ENGNAME   NOT NULL VARCHAR2(50)  
P_NAME      NOT NULL VARCHAR2(50)  
P_QUANTITY  NOT NULL NUMBER        
PAYMENT_WAY NOT NULL VARCHAR2(50)
 */
	private int order_code;
	private String m_id;
	private String m_cellphone;
	private String m_email;
	private String m_address;
	private String p_code;
	private String p_engname;
	private String p_name;
	private int p_quantity;
	private String payment_way;
	private int p_price;
	
	public OrderDTO() {
		// TODO Auto-generated constructor stub
	}

	public OrderDTO(int order_code, String m_id, String m_cellphone,
			String m_email, String m_address, String p_code, String p_engname,
			String p_name, int p_quantity, String payment_way, int p_price) {
		super();
		this.order_code = order_code;
		this.m_id = m_id;
		this.m_cellphone = m_cellphone;
		this.m_email = m_email;
		this.m_address = m_address;
		this.p_code = p_code;
		this.p_engname = p_engname;
		this.p_name = p_name;
		this.p_quantity = p_quantity;
		this.payment_way = payment_way;
		this.p_price = p_price;
	}

	public int getOrder_code() {
		return order_code;
	}

	public void setOrder_code(int order_code) {
		this.order_code = order_code;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_cellphone() {
		return m_cellphone;
	}

	public void setM_cellphone(String m_cellphone) {
		this.m_cellphone = m_cellphone;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
	}

	public String getP_engname() {
		return p_engname;
	}

	public void setP_engname(String p_engname) {
		this.p_engname = p_engname;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_quantity() {
		return p_quantity;
	}

	public void setP_quantity(int p_quantity) {
		this.p_quantity = p_quantity;
	}

	public String getPayment_way() {
		return payment_way;
	}

	public void setPayment_way(String payment_way) {
		this.payment_way = payment_way;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	
	
	
	
	
	
	
}
	