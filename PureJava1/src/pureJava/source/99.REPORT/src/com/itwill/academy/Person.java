package com.itwill.academy;

public abstract class Person extends Object
{
	private int		no;
	private String 	name;
	
	// 생성자 
	public Person() { super(); }
	public Person(int no, String name) 
	{	
		super();
		this.no = no;
		this.name = name;
	}
	
	// 출력 
	public void print()
	{
	//	System.out.println(getInfo());
		System.out.println("번호 : "+this.no);
		System.out.println("이름 : "+this.name);
	}
	
	public String getInfo()
	{
		return no+"\t"+name+"\t";
	}
	
	
	// getter & setter
	public int getNo() { return no; }
	public void setNo(int no) { this.no = no; }
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	
	
	

}
