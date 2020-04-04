package com.itwill.student;

public class StudentArrayMain
{
	public static void main(String[] args)
	{
		// 전체 학생 설정
		int max_student = 5;
		Student[] students = new Student[max_student];
		
		// 학생 데이터 생성(입력)
		
		// 점수 랜덤으로 받기  최소60 ~ 최대 40
		int temp_kor = 0;
		int temp_eng = 0;
		int temp_mat = 0;

		// 메소드 통해서 
		for(int i = 0; i < students.length; i++)
		{
			temp_kor = (int)(Math.random() * 41) + 60;
			temp_eng = (int)(Math.random() * 41) + 60;
			temp_mat = (int)(Math.random() * 41) + 60;
			students[i] = new Student( (i+1), (String)("홍길동"+(i+1)), temp_kor, temp_eng, temp_mat );
		}
		
		
		System.out.println();
		// 1. 모든 학생 성적 계산
		System.out.println("모든 학생 성적 계산 후  출력");
		for(int i = 0; i < students.length; i++)
		{
			students[i].total();
			students[i].average();
			students[i].gradeMethod();
		}
		
		System.out.println("--------------------------------------------------------------");
		System.out.println();
				
		// 2. 모든 학생 출력
		for(int i = 0; i < students.length; i++)
		{
			students[i].print();
		}
		
		System.out.println("--------------------------------------------------------------");
		System.out.println();
		
		// 3. 전체 총점, 전체평균, 전체평점 출력
		int total_sum = 0;
		double total_avg = 0.0;
		char total_grade = ' ';
		
		for(int i = 0; i < students.length; i++)
		{
			total_sum += students[i].getTot();			// 학생 전체 총점 
		}
		
		System.out.println("전체 학생 총점 "+(max_student*3*100)+"점 기준 : "+total_sum);
		
		// 전체학생 총점을 기준으로 평균 내기 
		total_avg = total_sum / (max_student * 3.0);
		System.out.println("전체 학생 평균 : "+total_avg);
		
		// 전체학생 평균을 기준으로 평점 내기 
		int temp_grade = (int)total_avg / 10;
		switch(temp_grade)
		{
			case 10: case 9: total_grade = 'A'; break;
			case 8: total_grade = 'B'; break;
			case 7: total_grade = 'C'; break;
			case 6: total_grade = 'D'; break;
			default: total_grade = 'F'; break;		
		}
		System.out.println("전체 학생 평점 : "+total_grade);
		
		System.out.println("--------------------------------------------------------------");
		System.out.println();
		
		System.out.println("평균 85점 이상인 학생 출력");
		// 4. 평균 80점 이상인 학생 출력 
		for(int i = 0; i < students.length; i++)
		{
			if(students[i].getAvg() >= 85)
			{
				System.out.print(students[i].getName()+" ");
			}
		}
		System.out.println();
		System.out.println("--------------------------------------------------------------");
		System.out.println();
		
		// 5. 3번학생 정보 출력 
		System.out.println("3번 학생 정보 출력");
		for(int i = 0; i < students.length; i++)
		{
			if(students[i].getNum() == 3)
			{
				students[i].print();
			}
		}
		
		System.out.println("--------------------------------------------------------------");
		System.out.println();
		
		// 6. 이름(홍길동,..) 검색 학생들 정보 출력
		System.out.println("이름 : 홍길동5 학생 정보 출력");
		for(int i = 0; i < students.length; i++)
		{
			if(students[i].getName().equals("홍길동5"))
			{
				students[i].print();
			}
		}
		
		System.out.println("--------------------------------------------------------------");
		System.out.println();
		
		// 7. 평점이 A인 학생들 출력
		System.out.println("평점 : B 인 학생 정보 출력");
		for(int i = 0; i < students.length; i++)
		{
			if(students[i].getGrade() == 'B')
			{
				students[i].print();
			}
		}
		
		System.out.println("--------------------------------------------------------------");
		System.out.println();		
		
		// 8. (국어점수가 80점 미만인 학생들만 찾아서 )모든 학생 국어점수 +5;	
		
		System.out.println("국어점수가 80점 미만인 학생 점수 +5 후 출력");
		for(int i = 0; i < students.length; i++)
		{
			if(students[i].getKor() < 80)
			{
				students[i].setKor(students[i].getKor() + 5);				
			}
		}
		
		System.out.println("--------------------------------------------------------------");
		System.out.println();
		
		System.out.println("전체 학생 출력");
		for(int i = 0; i < students.length; i++)
		{			
			students[i].print();		
		}	
		
		// 9. 학생 석차 계산
		
		// 10. 이름순 정렬 
		
	}

}















