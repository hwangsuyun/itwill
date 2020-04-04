package com.itwill.academy;

public class Staff extends Person
{
	private String	depart;		// 부서
		
	// 생성자 	
	public Staff() { }	
	public Staff(int no, String name, String depart)
	{
		super(no, name);
		this.depart = depart;
	}

	// 출력
	public void print()
	{
		super.print();
		System.out.println("부서 : "+this.depart);
	}
	
	// getter & setter	
	public String getDepart() { return depart; } 
	public void setDepart(String depart) { this.depart = depart; }
	
	

}
