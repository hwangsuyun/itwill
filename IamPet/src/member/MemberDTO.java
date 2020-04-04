package member;

public class MemberDTO
{
	private int no;
	private String id;
	private String name;
	private String password;
	private String jumin1;
	private String jumin2;
	public String passquiz;
	private String passresult;	
	private String zipcode;
	private String address;
	private String email;
	private String homephone;
	private String cellphone;
	private String date;
	
	public MemberDTO(){}
	//id,pass 찾기용 생성자
	public MemberDTO(String id){
		super();
		this.id=id;
	}
	//pass찾기 마지막단계 id와 pass 
	public MemberDTO(int no,String  id,String  name,String  password,String  jumin1,String  jumin2,
			String passquiz, String passresult,String zipcode, String address, String email, String homephone, String cellphone){
		this.no = no;
		this.id = id;
		this.name = name;
		this.password = password;
		this.jumin1 = jumin1;
		this.jumin2 = jumin2;
		this.passquiz = passquiz;
		this.passresult = passresult;
		this.zipcode = zipcode;
		this.address = address;
		this.email = email;
		this.homephone = homephone;
		this.cellphone = cellphone;
		this.date = date;
	}

	public MemberDTO(String id,String password){
		super();
		this.id=id;
		this.password=password;
	}
	//시퀀스
	public MemberDTO(String id, String name, String password,
			String jumin1, String jumin2, String passquiz, String passresult,
			String zipcode, String address, String email, String homephone, String cellphone, String date)
	{		
		this.id = id;
		this.name = name;
		this.password = password;
		this.jumin1 = jumin1;
		this.jumin2 = jumin2;
		this.passquiz = passquiz;
		this.passresult = passresult;
		this.zipcode = zipcode;
		this.address = address;
		this.email = email;
		this.homephone = homephone;
		this.cellphone = cellphone;
		this.date = date;
	}
	
	public MemberDTO(int no, String id, String name, String password, String jumin1, String jumin2,
			String passquiz, String passresult, String address, String email, String homephone, String cellphone)
	{
		this.no = no;
		this.id = id;
		this.name = name;
		this.password = password;
		this.jumin1 = jumin1;
		this.jumin2 = jumin2;
		this.passquiz = passquiz;
		this.passresult = passresult;
		this.address = address;
		this.email = email;
		this.homephone = homephone;
		this.cellphone = cellphone;		
	}
	
	public MemberDTO(int no, String id, String name, String password,
			String jumin1, String jumin2, String passquiz, String passresult,
			String zipcode,
			String address, String email, String homephone, String cellphone, String date)
	{	
		this.no = no;
		this.id = id;
		this.name = name;
		this.password = password;
		this.jumin1 = jumin1;
		this.jumin2 = jumin2;
		this.passquiz = passquiz;
		this.passresult = passresult;
		this.zipcode = zipcode;
		this.address = address;
		this.email = email;
		this.homephone = homephone;
		this.cellphone = cellphone;
		this.date = date;
	}

		
	public String getDate() { return date; }
	public void setDate(String date) { this.date = date; }
	public String getZipcode() { return zipcode; }
	public void setZipcode(String zipcode) { this.zipcode = zipcode; }
	public int getNo() { return no; }
	public void setNo(int no) { this.no = no; }
	public String getId() { return id; }
	public void setId(String id) { this.id = id; }
	public String getName() { return name; }
	public void setName(String name) { this.name = name; } 
	public String getPassword() { return password; }
	public void setPassword(String password) { this.password = password; }
	public String getJumin1() { return jumin1; }
	public void setJumin1(String jumin1) { this.jumin1 = jumin1; }
	public String getJumin2() { return jumin2; }
	public void setJumin2(String jumin2) { this.jumin2 = jumin2; }
	public String getPassquiz() { return passquiz; }
	public void setPassquiz(String passquiz) { this.passquiz = passquiz; }
	public String getPassresult() { return passresult; }
	public void setPassresult(String passresult) { this.passresult = passresult; }
	public String getAddress() { return address; }
	public void setAddress(String address) { this.address = address; }
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	public String getHomephone() { return homephone; }
	public void setHomephone(String homephone) { this.homephone = homephone; }
	public String getCellphone() { return cellphone; } 
	public void setCellphone(String cellphone) { this.cellphone = cellphone; }

	public boolean isMatchPassword(String password)
	{
		boolean isMatch=false;
		
		if(this.password.equals(password))
		{
			isMatch = true;
		}
		return isMatch;
	}
	
}
