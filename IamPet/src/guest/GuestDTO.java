package guest;

public class GuestDTO {
	private int g_no;
	private String g_name;
	private String g_zipcd;
	private String g_address;
	private String g_email;
	private String g_cellphone;
	private String g_date;
	
	public GuestDTO() {}

	
	//1.비회원 정보를 뿌리기위해 시퀀스를 제외함
	public GuestDTO(String g_name, String g_zipcd, String g_address,
			String g_email, String g_cellphone, String g_date) {
		this.g_name = g_name;
		this.g_zipcd = g_zipcd;
		this.g_address = g_address;
		this.g_email = g_email;
		this.g_cellphone = g_cellphone;
		this.g_date = g_date;
	}
	
	public GuestDTO(int g_no, String g_name, String g_zipcd, String g_address,
			String g_email, String g_cellphone, String g_date) {
		this.g_no = g_no;
		this.g_name = g_name;
		this.g_zipcd = g_zipcd;
		this.g_address = g_address;
		this.g_email = g_email;
		this.g_cellphone = g_cellphone;
		this.g_date = g_date;
	}



	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getG_zipcd() {
		return g_zipcd;
	}

	public void setG_zipcd(String g_zipcd) {
		this.g_zipcd = g_zipcd;
	}

	public String getG_address() {
		return g_address;
	}

	public void setG_address(String g_address) {
		this.g_address = g_address;
	}

	public String getG_email() {
		return g_email;
	}

	public void setG_email(String g_email) {
		this.g_email = g_email;
	}

	public String getG_cellphone() {
		return g_cellphone;
	}

	public void setG_cellphone(String g_cellphone) {
		this.g_cellphone = g_cellphone;
	}

	public String getG_date() {
		return g_date;
	}

	public void setG_date(String g_date) {
		this.g_date = g_date;
	}
	
	
}
