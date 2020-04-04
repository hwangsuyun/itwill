package com.itwill.student;

public class StudentMain
{
	public static void main(String[] args)
	{
		// 1. 학생 객체 생성
		// 2. 학생 객체 데이터 셋팅 (점수(국,영,수), 이름, 학번, 총점, 평균, 평점)
		// 3. 학생 객체 데이터 출력 
		
		// 객체 생성
		Student st1 = new Student();			 
		// 변수값 셋팅 
		st1.setData(2013, "홍길동", 64, 82, 89);
		// 총점 계산  
		st1.total();
		// 평균 계산 
		st1.average();
		// 평점 계산 
		st1.gradeMethod();		
		// 출력 
		st1.print();		
		
	}

}
