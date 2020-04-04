package com.itwill.car;

public class Car
{
	private String 	no;			// 차넘버 
	private int 	inTime;		// 들어온 시간 
	private int 	outTime;	// 나간 시간 	
	private int 	fee;		// 요금 
	
	// 생성자 
	public Car() { }	
	public Car(String no, int inTime)
	{
		this.no 	= no;
		this.inTime	= inTime;
	}
	
	/**
	 * 차량의 데이터를 set하는 메소드 
	 * @param no 차량의번호 
	 * @param inTime 입차시간
	 * @param outTime 출차시간
	 * @param fee 요금
	 */
	public void setData(String no, int inTime)
	{
		setNo(no);
		setInTime(inTime);				
	}

	/*
	 * 기능(메소드)
	 * 1. 요금계산하다. 
	 * 2. 출력하다. 
	 * 
	 */
	
	// 요금 계산
	/**
	 * 요금 계산하는 메소드 
	 */
	public void calculateFee()
	{
		this.fee = (this.outTime - this.inTime) * 1000;
	}
	
	// 출력
	public void print()
	{
		System.out.println("**************************");
		System.out.println("차량번호 : "+this.no);
		System.out.println("입차시간 : "+this.inTime);
		System.out.println("출차시간 : "+this.outTime);
		System.out.println("주차요금 : "+this.fee);
		System.out.println("**************************");
	}
	
	/*
	 * 멤버필드 데이터 메소드 (set, get)
	 * 1. setter method 
	 * 2. getter method  
	 */
	// setter
	public void setNo(String no) { this.no = no; }
	/**
	 * 차량의 번호를 준다
	 * @return 차량번호 
	 */
	public String getNo() { return this.no; }
	public int getInTime() { return inTime; }
	public void setInTime(int inTime) { this.inTime = inTime; }
	public int getOutTime() { return outTime; }
	public void setOutTime(int outTime) { this.outTime = outTime; }
	public int getFee() { return fee; }
	public void setFee(int fee) { this.fee = fee; }
	
}





















