package com.itwill.calculator;
// 사칙연산 기능을 수행하기 위한 클래스 
public class Calculator
{
	// 속성
	
	// 기능 (더하기, 빼기, 곱하기, 나누기) 
	// 1. 더하기 (외부클래스(객체)에서 2개의 정수를 주면 더한 값을 반환 
	public int sum(int a, int b)
	{
		int result = a + b;
		return result;
	}
	
	// 빼기
	public int sub(int a, int b)
	{
		int result = a - b;
		return result;
	}
	
	// 곱하기 
	public int mul(int a, int b)
	{
		int result = a * b;
		return result;
	}
	
	// 나누기 
	public double div(double a, double b)
	{
		// 소수점 2자리까지 자르기 
		double result = (a / b) * 100;
		int temp = (int)result;
		result = temp / 100.0;
		
		return result;
	}

}
