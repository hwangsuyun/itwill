package member;

public class MemberDTO {
/*
이름          널        유형           
----------- -------- ------------ 
M_NO        NOT NULL NUMBER       
M_NAME      NOT NULL VARCHAR2(20) 
M_SEX       NOT NULL VARCHAR2(20) 
M_ID        NOT NULL VARCHAR2(20) 
M_PASS      NOT NULL VARCHAR2(20) 
M_CELLPHONE NOT NULL VARCHAR2(20) 
M_ADDRESS   NOT NULL VARCHAR2(20) 
M_EMAIL     NOT NULL VARCHAR2(20) 
 */
	private int m_no;
	private String m_name;
	private String m_sex;
	private String m_id;
	private String m_pass;
	private String m_cellphone;
	private String m_address;
	private String m_email;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(int m_no, String m_name, String m_sex, String m_id,
			String m_pass, String m_cellphone, String m_address, String m_email) {
		super();
		this.m_no = m_no;
		this.m_name = m_name;
		this.m_sex = m_sex;
		this.m_id = m_id;
		this.m_pass = m_pass;
		this.m_cellphone = m_cellphone;
		this.m_address = m_address;
		this.m_email = m_email;
	}
	
	public MemberDTO(String m_name, String m_sex, String m_id,
			String m_pass, String m_cellphone, String m_address, String m_email) {
		super();
		this.m_name = m_name;
		this.m_sex = m_sex;
		this.m_id = m_id;
		this.m_pass = m_pass;
		this.m_cellphone = m_cellphone;
		this.m_address = m_address;
		this.m_email = m_email;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_sex() {
		return m_sex;
	}

	public void setM_sex(String m_sex) {
		this.m_sex = m_sex;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pass() {
		return m_pass;
	}

	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}

	public String getM_cellphone() {
		return m_cellphone;
	}

	public void setM_cellphone(String m_cellphone) {
		this.m_cellphone = m_cellphone;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	
	
	
	
	
}
