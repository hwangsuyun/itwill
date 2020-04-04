package product;

public class ProductDTO {
/*
 이름        널        유형           
--------- -------- ------------ 
P_CODE    NOT NULL NUMBER       
P_ENGNAME NOT NULL VARCHAR2(20) 
P_NAME    NOT NULL VARCHAR2(20) 
P_PRICE   NOT NULL NUMBER   
 */
	
	private int p_code;
	private String p_engname;
	private String p_name;
	private int p_price;
	
	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public ProductDTO(int p_code, String p_engname, String p_name, int p_price) {
		super();
		this.p_code = p_code;
		this.p_engname = p_engname;
		this.p_name = p_name;
		this.p_price = p_price;
	}

	public int getP_code() {
		return p_code;
	}

	public void setP_code(int p_code) {
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
	
	
	
	
	
}
