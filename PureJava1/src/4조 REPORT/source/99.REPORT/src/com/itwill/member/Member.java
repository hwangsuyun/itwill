package com.itwill.member;

public class Member
{	
	// |no(4byte)|name(10byte)|age(4byte)|tel(26byte)|address(100byte)
	private int no;
	private String name;
	private int age;
	private String tel;
	private String address;
	
	public Member() { }
	public Member(int no, String name, int age, String tel, String address)
	{
		super();
		this.no = no;
		this.name = name;
		this.age = age;
		this.tel = tel;
		this.address = address;
	}
	
	
	public int getNo() { return no; }
	public void setNo(int no) { this.no = no; }
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	public int getAge() { return age; }
	public void setAge(int age) { this.age = age; }
	public String getTel() { return tel; }
	public void setTel(String tel) { this.tel = tel; }
	public String getAddress() { return address; }
	public void setAddress(String address) { this.address = address; }
	
	@Override
	public String toString()
	{
		
		return getNo()+":"+"member data";
	}
	
	
}
