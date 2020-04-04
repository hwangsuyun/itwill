package com.itwill.academy;

public class Gangsa extends Person
{	
	private String subject;

	// 생성자 
	public Gangsa() { }
	public Gangsa(int no, String name, String subject)
	{	
		super(no, name);
		this.subject = subject;
	}
	
	// 출력
	public void print()
	{
		super.print();
		System.out.println("과목 : "+this.subject);
	}
			
	// getter & setter
	public String getSubject() { return subject; }
	public void setSubject(String subject) { this.subject = subject; }
	
	

}
