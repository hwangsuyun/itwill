	package basket;

public class BasketDTO {
/*

이름         널        유형           
---------- -------- ------------ 
BASKET_NO  NOT NULL NUMBER       
M_ID       NOT NULL VARCHAR2(50) 
P_ENGNAME  NOT NULL VARCHAR2(50) 
P_NAME     NOT NULL VARCHAR2(50) 
P_PRICE    NOT NULL NUMBER       
P_COLOR    NOT NULL VARCHAR2(50) 
P_SIZE     NOT NULL NUMBER       
P_QUANTITY NOT NULL NUMBER       

 */
	
	private int basket_code;
	private String m_id;
	private String p_code;
	private String p_engname;
	private String p_name;
	private int p_price;
	private int p_quantity;
	
	public BasketDTO() {
		// TODO Auto-generated constructor stub
	}

	public BasketDTO(int basket_code, String m_id, String p_code,
			String p_engname, String p_name, int p_price, int p_quantity) {
		super();
		this.basket_code = basket_code;
		this.m_id = m_id;
		this.p_code = p_code;
		this.p_engname = p_engname;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_quantity = p_quantity;
	}

	public int getBasket_code() {
		return basket_code;
	}

	public void setBasket_code(int basket_code) {
		this.basket_code = basket_code;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
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

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int getP_quantity() {
		return p_quantity;
	}

	public void setP_quantity(int p_quantity) {
		this.p_quantity = p_quantity;
	}

	
	
	
}