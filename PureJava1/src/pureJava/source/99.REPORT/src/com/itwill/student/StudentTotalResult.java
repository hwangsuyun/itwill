package com.itwill.student;

public class StudentTotalResult
{
	private int 		tot;
	private double 		avg;
	private char		grade;
	private Student[] 	studentArray;
	
	// 생성자 
	public StudentTotalResult() { }
	public StudentTotalResult(int tot, double avg, char grade)
	{		
		this.tot = tot;
		this.avg = avg;
		this.grade = grade;
	}
	public StudentTotalResult(Student[] students)
	{		
		this.studentArray = students;
	}
	
	// 연산
	public void CalculateResult()
	{
		// 전체 총점
		for(int i = 0; i < studentArray.length; i++)
		{
			this.tot += studentArray[i].getTot();						
		}
		// 전체 평균
		this.avg = this.tot / (studentArray.length * 3.0);		 
		
		// 전체 평점 
		int temp_grade = (int)avg / 10;
		switch(temp_grade)
		{
			case 10: case 9: this.grade = 'A'; break;
			case 8: this.grade = 'B'; break;
			case 7: this.grade = 'C'; break;
			case 6: this.grade = 'D'; break;
			default: this.grade = 'F'; break;		
		}
		
	}
		
	// getter & setter
	public int getTot() { return tot;}
	public void setTot(int tot) { this.tot = tot; }
	public double getAvg() { return avg; }
	public void setAvg(double avg) { this.avg = avg; }
	public char getGrade() { return grade; }
	public void setGrade(char grade) { this.grade = grade; }
	
}
