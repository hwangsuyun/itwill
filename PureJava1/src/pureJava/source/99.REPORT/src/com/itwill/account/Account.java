package com.itwill.account;
// 은행의 계좌 객체를 추상화한 클래스
// 은행 계좌의 데이터를 가지고있는 클래스
public class Account
{
	private String 	no;			// 계좌번호 
	private String 	owner;		// 계좌주 
	private int 	balance;	// 잔고
	private float	iyul;		// 이율 
	
	
	// 입금 
	public void ipGum(int money)
	{
		this.balance	+= money;
	}
	
	// 출금 
	public boolean chulGum(int money)
	{
		if(money > this.balance)
		{
			System.out.println("출금 금액보다 잔액이 부족합니다.");
			return false;
		}
		
		this.balance	-= money;
		
		return true;
	}
	
	// 출력 
	public void print()
	{
		System.out.println("계좌번호 : "+this.no);
		System.out.println("계좌이름 : "+this.owner);
		System.out.println("계좌잔고 : "+this.balance);
		System.out.println("계좌이율 : "+this.iyul);
	}


	// setter && getter
	public String getNo() { return no; }
	public void setNo(String no) { this.no = no; }
	public String getOwner() { return owner; }
	public void setOwner(String owner) { this.owner = owner; }
	public int getBalance() { return balance; }
	public void setBalance(int balance) { this.balance = balance; }
	public float getIyul() { return iyul; }
	public void setIyul(float iyul) { this.iyul = iyul; }
	
	
	

}
