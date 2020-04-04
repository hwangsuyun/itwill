package com.itwill.pension;

public class Pension {

	private int p_code;			//��� ��ȣ
	private String p_group;		//���,����,���� ��� ������ �ڵ�
	private String p_name;		//��� �̸�
	private String p_address;	//��� �ּ�
	private String p_tel;		//��� ����ó
	private String p_image; 	//��� �̹���
	private String p_site;		//�ش���� ����Ʈ�ּ�
	
	
	public Pension() {
		// TODO Auto-generated constructor stub
	}

	public Pension(int p_code, String p_group, String p_name, String p_address,
			String p_tel, String p_image, String p_site) {
		super();
		this.p_code = p_code;
		this.p_group = p_group;
		this.p_name = p_name;
		this.p_address = p_address;
		this.p_tel = p_tel;
		this.p_image = p_image;
		this.p_site = p_site;
	}



	public int getP_code() {
		return p_code;
	}

	public void setP_code(int p_code) {
		this.p_code = p_code;
	}

	public String getP_group() {
		return p_group;
	}

	public void setP_group(String p_group) {
		this.p_group = p_group;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_address() {
		return p_address;
	}

	public void setP_address(String p_address) {
		this.p_address = p_address;
	}

	public String getP_tel() {
		return p_tel;
	}

	public void setP_tel(String p_tel) {
		this.p_tel = p_tel;
	}

	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
	}

	public String getP_site() {
		return p_site;
	}

	public void setP_site(String p_site) {
		this.p_site = p_site;
	}
	
	@Override
	public String toString() {
		return "pension:"+p_code+","+p_group+","+p_name+","+p_address+","+p_tel+","+p_image+","+p_site;
	}
	
	
}