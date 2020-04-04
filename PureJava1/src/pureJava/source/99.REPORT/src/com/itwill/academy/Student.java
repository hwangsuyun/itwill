package com.itwill.academy;

public class Student extends Person
{	
	private String	ban;		// 반
	
	// 생성자 
	public Student() { super(); }
	public Student(int no, String name, String ban)
	{
		super(no, name);
		this.ban  	= ban;
	}
	
	public void print()
	{
		super.print();
		System.out.println("반 : "+this.ban);
	}
		
			
	// getter & setter	
	public String getBan() { return ban; } 
	public void setBan(String ban) { this.ban = ban; }
	
	
	

}
