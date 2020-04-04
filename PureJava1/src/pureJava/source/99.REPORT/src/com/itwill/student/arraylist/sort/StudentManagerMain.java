package com.itwill.student.arraylist.sort;

import java.util.ArrayList;

public class StudentManagerMain
{
	public static void main(String[] args)
	{
		StudentManager studentManager = new StudentManager();		
		// 0. 학생 데이터 생성 입력 
		System.out.println("----- 0. 학생 데이터 생성 입력 -----");
		StudentConstructor sc = new StudentConstructor(20);
		
		ArrayList stList = sc.getStudentArray();
		
		System.out.println("=== 생성후 전체 출력 테스트 ===");
		for(int i = 0; i < stList.size(); i++)
		{
			Student stTemp = (Student)stList.get(i);
			stTemp.print();
		}
				
		// 학생 정보 집어넣기 
		studentManager.addStudent(stList);
		System.out.println("----- 0-1. 데이터 정보 생성 입력 완료!! -----");
		
		
		// 1. 모든 학생 성적 계산
		System.out.println();
		System.out.println("----- 1. 모든 학생 성적 계산 -----");
		studentManager.calculateSungjuk();
		System.out.println("----- 1-2. 성적 계산 완료!! -----");

		// 2. 모든 학생 출력
		System.out.println();
		System.out.println("----- 2. 모든 학생 출력 -----");
		studentManager.print();
		
				
		// 3. 전체 총점, 평균, 평점 값 (한번에) 반환해 주세요 (클래스로 반환) 출력
		System.out.println();
		System.out.println("----- 3. 전체 총점, 평균, 평점 -----");
		StudentTotalResult str = studentManager.getStudentTotalResult();
		System.out.println("전체 총점 : "+str.getTot());
		System.out.println("전체 평균 : "+str.getAvg());
		System.out.println("전체 평점 : "+str.getGrade());
		
				
		// 4. 평균 80이상인 학생들 반환해 주세요 출력
		System.out.println();
		System.out.println("----- 4. 평균 80점 이상인 학생들 반환 -----");
		ArrayList stTemp1 = studentManager.findByAvg(80.0f);
		for(int i = 0; i < stTemp1.size(); i++)
		{
			Student stTempA = (Student)stTemp1.get(i);
			
			if(stTempA != null)
			{
				stTempA.print();
			}			
		}
		
						
		// 5. 3번학생 반환해 주세요. 출력
		System.out.println();
		System.out.println("----- 5. 3번학생 반환 -----");
		Student st1 = studentManager.findByNo(3);
		st1.print();
			
		
		// 6. 김대리 이름을 가진 학생들 반환 출력
		System.out.println();
		System.out.println("----- 6. 이름이 김대리 인 학생들 반환 -----");
		ArrayList stListTemp = studentManager.findByName("김대리");
		for(int i = 0; i < stListTemp.size(); i++)
		{
			Student stName = (Student)stListTemp.get(i);
			stName.print();			
		}
				
		// 7. 평점이 A인 학생들 반환 출력
		System.out.println();
		System.out.println("----- 7. 평점이 B인 학생들 반환 -----");
//		Student[] stTemp2 = studentManager.findByGrade('B');
		ArrayList stAvg = studentManager.findByGrade('B');		
		for(int i = 0; i < stAvg.size(); i++)
		{
			Student stAvgTemp = (Student)stAvg.get(i);
			if(stAvgTemp != null)
			{
				stAvgTemp.print();
			}			
		}
			
		
		// 8. 모든 학생 국어점수 +5 해주세요. 출력 
		System.out.println();
		System.out.println("----- 8. 모든학생 국어점수 +5 -----");
		String msg = studentManager.addKorScore(5);
		System.out.println(msg);
			
		
		// 9. 석차 부여 (등수) (총점으로 비교) 석차대로 출력 (sort)
		System.out.println();
		System.out.println("----- 9. 랭크 -----");
		ArrayList stRank = studentManager.getRank();
		for(int i = 0; i < stRank.size(); i++)
		{
			Student stRankTemp = (Student)stRank.get(i);
			if(stRankTemp != null)
			{
				stRankTemp.print();
			}			
		}
				
		// 10. 이름순정렬 (오름차순, 내림차순) true - 오름차순, false - 내림차순  compareTo
		System.out.println();
		System.out.println("----- 10. 이름순 정렬 -----");
		studentManager.Range(true);		// true - 오름차순, false - 내림차순 
				
		
	}

}
