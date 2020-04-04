package pet.shopping;

public class PetDTO 
{
	private int c_code;			//아이템 번호
	private String c_part_code;  //아이템 그룹 번호
	private String c_part;			//아이템 그룹	
	private String c_name_code;//아이템 이름 코드(상품 구분)
	private String c_name;		//아이템 이름
	private String c_sex;			//아이템 성별
	private int c_price;				//아이템 가격
	
	public PetDTO() {	 	}
	
	public PetDTO(int c_code, String c_part_code, String c_part,
			String c_name_code, String c_name, String c_sex, int c_price) 
	{
		super();
		this.c_code = c_code;
		this.c_part_code = c_part_code;
		this.c_part = c_part;
		this.c_name_code = c_name_code;
		this.c_name = c_name;
		this.c_sex = c_sex;
		this.c_price = c_price;
	}
	
	public int getC_code() 
	{
		return c_code;
	}
	public void setC_code(int c_code)
	{
		this.c_code = c_code;
	}
	public String getC_part_code() 
	{
		return c_part_code;
	}
	public void setC_part_code(String c_part_code)
	{
		this.c_part_code = c_part_code;
	}
	public String getC_part()
	{
		return c_part;
	}
	public void setC_part(String c_part) 
	{
		this.c_part = c_part;
	}
	public String getC_name_code()
	{
		return c_name_code;
	}
	public void setC_name_code(String c_name_code)
	{
		this.c_name_code = c_name_code;
	}
	public String getC_name()
	{
		return c_name;
	}
	public void setC_name(String c_name) 
	{
		this.c_name = c_name;
	}
	public String getC_sex() 
	{
		return c_sex;
	}
	public void setC_sex(String c_sex) 
	{
		this.c_sex = c_sex;
	}
	public int getC_price()
	{
		return c_price;
	}
	public void setC_price(int c_price)
	{
		this.c_price = c_price;
	}
	
	
	
}
