package com.itwill.student.arraylist.sort;

import java.util.ArrayList;
import java.util.Arrays;

/*
 * 학생전체에 관련된 성적처리기능을 가진 클래스
 */
public class StudentManager
{	
	private ArrayList stList;
	
	// 생성자 
	public StudentManager()
	{		
		stList = new ArrayList();
	}
	// student list 참조변수 리턴 
	public ArrayList getStudentList() { return this.stList; }
	
	// 0. 학생 데이터 생성(입력)
	public void addStudent(ArrayList stList)
	{
		this.stList = stList;
	}
				
	// 1. 모든 학생 성적 계산
	public void calculateSungjuk()
	{
		for(int i = 0; i < stList.size(); i++)
		{	
			Student stTemp = (Student)stList.get(i);
						
			stTemp.total();			// 총점			
			stTemp.average();		// 평균			
			stTemp.gradeMethod();	// 평점			
		}		
	}
			 
	// 2-0. 모든 학생 출력
	// 전체 studentArray
	public void print()
	{
		StudentManager.headerprint();
		this.print(stList);
		StudentManager.footerprint();
	}	 
	// 2-1. 학생들 출력
	public void print(ArrayList list)
	{
		for(int i = 0; i < list.size(); i++)
		{
			Student stTemp = (Student)list.get(i);			
			if(stTemp != null)
			{
				this.print(stTemp);
			}			
		}		
	}
	// 2-2. 학생1명 출력
	public void print(Student student)
	{
		student.print();
	}
	// 2-3. header print
	public static void headerprint()
	{
		System.out.println("************************************************************");
		System.out.println("번호\t이름\t국어\t영어\t수학\t총점\t평균\t평점");
		System.out.println("************************************************************");
	}
	// 2-4. footer print
	public static void footerprint()
	{
		System.out.println("************************************************************");
	}
	
	
				
	// 3. 전체 총점, 평균, 평점 값 (한번에) 반환해 주세요 (클래스로 반환)
	public StudentTotalResult getStudentTotalResult()
	{
		StudentTotalResult str = new StudentTotalResult(stList);
		str.CalculateResult();
		
		return str;
	}
		
	
	// 4. 평균 80이상인 학생들 반환해 주세요
	public ArrayList findByAvg(float avg)
	{
		ArrayList stTemp = new ArrayList();		
		for(int i = 0; i < stList.size(); i++)
		{
			Student stTemp1 = (Student)stList.get(i);			
			if(stTemp1 != null)
			{
				if(stTemp1.getAvg() >= avg)
				{
					stTemp.add(stTemp1);
				}
			}
		}
		
		return stTemp;
	}
	
	// 5. 3번학생 반환해 주세요.
	public Student findByNo(int no)
	{
		Student student = null;
		
		for(int i = 0; i < stList.size(); i++)
		{
			Student stTemp = (Student)stList.get(i);
			
			if(stTemp != null)
			{
				if(stTemp.getNum() == no)
				{
					student = stTemp;
					break;
				}
			}
		}
		
		return student;
	}
	
	// 6. 김대리 이름을 가진 학생들 반환
	public ArrayList findByName(String name)
	{
		ArrayList stListTemp = new ArrayList();
		
		for(int i = 0; i < stList.size(); i++)
		{
			Student stTemp = (Student)stList.get(i);
			
			if(stTemp != null)
			{
				if(stTemp.getName().equals(name))
				{
				//	student = studentArray[i];
					stListTemp.add(stTemp);					
				}
			}
		}
		
		return stListTemp;
	}
			
	// 7. 평점이 grade인 학생들 반환
	public ArrayList findByGrade(char grade)
	{
		ArrayList stTemp = new ArrayList();		
		for(int i = 0; i < stList.size(); i++)
		{
			Student stGrade = (Student)stList.get(i);			
			if(stGrade != null)
			{
				if(stGrade.getGrade() == grade)
				{
					stTemp.add(stGrade);
				}
			}
		}
		
		return stTemp;
	}
		
	// 8. 모든 학생 국어점수 +5 해주세요.
	public String addKorScore(int score)
	{
		for(int i = 0; i < stList.size(); i++)
		{
			Student stTemp = (Student)stList.get(i);			
			if(stTemp != null)
			{				
				stTemp.setKor(stTemp.getKor() + score);
				// +5점을 해서 100점을 넘는다면 최대값 100을 넣어준다. 
				if(stTemp.getKor() >= 100)
				{
					stTemp.setKor(100);
				}
			}
		}
		
		return "모든 국어점수 +5 입력 완료";
		
	}

		
	// 9. 석차, 랭크 (sort)
	public ArrayList getRank()
	{
		StudentRank sr = new StudentRank(stList);
		ArrayList stTemp = sr.calculator();
		
		return stTemp;
	}
	
	
	// 10. 이름순정렬 (오름차순, 내림차순) true - 오름차순, false - 내림차순  compareTo
	public void Range(boolean range)
	{		
		StudentRange sr = new StudentRange(stList, range);	
		ArrayList stTemp = sr.Calculator();
		for(int i = 0; i < stTemp.size(); i++)
		{
			Student st = (Student)stTemp.get(i);
			if(st != null) st.print();
		}
				
		
	}
	

}









