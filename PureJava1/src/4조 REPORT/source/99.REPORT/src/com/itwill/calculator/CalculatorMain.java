package com.itwill.calculator;

public class CalculatorMain
{
	public static void main(String[] args)
	{
		// 변수 선언 및 초기화 
		int sum1 = 100, sum2 = 20, sum_tot = 0;
		int sub1 = 40, sub2 = 5, sub_tot = 0;
		int mul1 = 5, mul2 = 10, mul_tot = 0;
		double div1 = 49.63, div2 = 3.48, div_tot = 0.0;		
		
		// 객체 생성 
		Calculator cal = new Calculator();
		
		// 연산 
		sum_tot = cal.sum(sum1, sum2);
		sub_tot = cal.sub(sub1, sub2);
		mul_tot = cal.mul(mul1, mul2);
		div_tot = cal.div(div1, div2);
		
		// 출력 
		System.out.println(sum1+" + "+sum2+" = "+sum_tot);
		System.out.println(sub1+" + "+sub2+" = "+sub_tot);
		System.out.println(mul1+" + "+mul2+" = "+mul_tot);
		System.out.println(div1+" + "+div2+" = "+div_tot);		
		
		
	}

}
