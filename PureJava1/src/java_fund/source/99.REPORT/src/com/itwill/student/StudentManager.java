package com.itwill.student;

/*
 * 학생전체에 관련된 성적처리기능을 가진 클래스
 */
public class StudentManager
{
	private Student[] studentArray; 	
	
	// 생성자 
	public StudentManager()
	{
		studentArray = new Student[20];
	}
	// student배열 참조변수 리턴 
	public Student[] getStudentArray() { return this.studentArray; }
	
	// 0. 학생 데이터 생성(입력)
	public void addStudent(Student[] students)
	{
		this.studentArray = students;
	}
				
	// 1. 모든 학생 성적 계산
	public void calculateSungjuk()
	{
		for(int i = 0; i < studentArray.length; i++)
		{						 
			studentArray[i].total();		// 총점			
			studentArray[i].average();		// 평균			
			studentArray[i].gradeMethod();	// 평점
		}		
	}
						
	// 2-0. 모든 학생 출력
	// 전체 studentArray
	public void print()
	{
		StudentManager.headerprint();
		this.print(studentArray);
		StudentManager.footerprint();
	}	 
	// 2-1. 학생들 출력
	public void print(Student[] students)
	{
		for(int i = 0; i < students.length; i++)
		{
			if(students[i] != null)
			{
				this.print(students[i]);
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
		StudentTotalResult str = new StudentTotalResult(studentArray);
		str.CalculateResult();
		
		return str;
	}
		
	// 4. 평균 80이상인 학생들 반환해 주세요
	public Student[] findByAvg(float avg)
	{
		Student[] stTemp = new Student[studentArray.length];		
		for(int i = 0; i < studentArray.length; i++)
		{
			if(studentArray[i] != null)
			{
				if(studentArray[i].getAvg() >= avg)
				{
					stTemp[i] = studentArray[i];
				}
			}
		}
		
		return stTemp;
	}
			
	// 5. 3번학생 반환해 주세요.
	public Student findByNo(int no)
	{
		Student student = null;
		
		for(int i = 0; i < studentArray.length; i++)
		{
			if(studentArray[i] != null)
			{
				if(studentArray[i].getNum() == no)
				{
					student = studentArray[i];
					break;
				}
			}
		}
		
		return student;
	}
			
	// 6. 싸이5 이름을 가진 학생들 반환
	public Student findByName(String name)
	{
		Student student = null;
		
		for(int i = 0; i < studentArray.length; i++)
		{
			if(studentArray[i] != null)
			{
				if(studentArray[i].getName().equals(name))
				{
					student = studentArray[i];
					break;
				}
			}
		}
		
		return student;
	}
			
	// 7. 평점이 A인 학생들 반환
	public Student[] findByGrade(char grade)
	{
		Student[] stTemp = new Student[studentArray.length];
		
		for(int i = 0; i < studentArray.length; i++)
		{
			if(studentArray[i] != null)
			{
				if(studentArray[i].getGrade() == grade)
				{
					stTemp[i] = studentArray[i];					
				}
			}
		}
		
		return stTemp;
	}
			
	// 8. 모든 학생 국어점수 +5 해주세요.
	public String addKorScore(int score)
	{
		for(int i = 0; i < studentArray.length; i++)
		{
			if(studentArray[i] != null)
			{				
				studentArray[i].setKor(studentArray[i].getKor() + score);
				// +5점을 해서 100점을 넘는다면 최대값 100을 넣어준다. 
				if(studentArray[i].getKor() >= 100)
				{
					studentArray[i].setKor(100);
				}
			}
		}
		
		return "모든 국어점수 +5 입력 완료";
		
	}

	// 9. 석차, 랭크
	public Student[] getRank()
	{
		Student[] stTemp = null;
		StudentRank sr = new StudentRank(studentArray);
		stTemp = sr.calculator();
		
		return stTemp;
	}
	
	
	// 10. 이름순정렬 (오름차순, 내림차순) true - 오름차순, false - 내림차순  compareTo
	public void Range(boolean range)
	{
		Student[] stTemp = null;
		StudentRange sr = new StudentRange(studentArray, range);
		stTemp = sr.Calculator();
		
		for(int i = 0; i < stTemp.length; i++)
		{
			if(stTemp[i] != null)
			{
				stTemp[i].print();
			}
		}
		
	}
	
	
	

}









