package com.itwill.student.arraylist.sort;

/*
 * 성적 관리 프로그램에서 학생 1명의 데이터를 가지고 있는 객체(Value Object) 
 * 
 */
public class Student implements Comparable
{
	/*
		속성 (멤버변수)
		1. 학번 int	
		2. 이름	String
		3. 국어 int
		4. 영어 int
		5. 수학 int
		6. 총점 int
		7. 평균 double
		8. 평점 char 
	 */
	
	private int	 	num;		// 학번 
	private String 	name;		// 이름
	private int	 	kor;		// 국어
	private int	 	eng;		// 영어
	private int	 	mat;		// 수학
	private int 	tot;		// 총점 
	private double 	avg;		// 평균 
	private char	grade;		// 평점 
	private int 	rank;		// 석차 	
		
	private int 	value;		// 값 
	private int 	sort;		// 차순 
	

	// 생성자 
	public Student() {}
	
	public Student(int num, String name, int kor, int eng, int mat)
	{
		this.num 	= num;
		this.name 	= name;
		this.kor 	= kor;
		this.eng 	= eng;
		this.mat 	= mat;
	}
	
	
	
	/*
	 * 기능(멤버 메소드)
	 * 1. DataSet
	 * 2. 총점 계산 
	 * 3. 평균 계산 
	 * 4. 평점 계산 
	 * 5. 출력
	 */
	
	// 셋팅 
	public void setData(int num, String name, int kor, int eng, int mat)
	{
		this.num 	= num;
		this.name 	= name;
		this.kor 	= kor;
		this.eng 	= eng;
		this.mat 	= mat;				
	}
	
	// 총점 계산 
	public void total()
	{
		this.tot = this.kor + this.eng + this.mat;
	}
	
	// 평균 계산 
	public void average()
	{
		// 소수점 2자리까지 구하기 위해 평균에 100을 곱한 값을 임시변수에 저장 
		double dTemp = (this.tot / 3.0) * 100;
		// 더블값의 소수점을 버리고 정수로 다시한번 저장 
		int 	nTemp = (int)dTemp;		
		// 최종 평균 
		this.avg = nTemp / 100.0;
	}
	
	// 평점 계산 
	public void gradeMethod()
	{
		int grade_temp = (int)this.avg / 10;		// 평점을 구하기 위해 10으로 나눈 값을 저장.  		
		switch(grade_temp)
		{
			case 10: case 9: this.grade = 'A'; break;
			case 8: this.grade = 'B'; break;
			case 7: this.grade = 'C'; break;
			case 6: this.grade = 'D'; break;
			default: this.grade = 'F'; break;		
		}
	}
		
	// 한번에 출력 
	public void print()
	{		
	//	System.out.println("--------------------------------------------------------");
		System.out.println("번호\t이름\t국어\t영어\t수학\t총점\t평균\t평점");
		System.out.println(getInfo());
	//	System.out.println("--------------------------------------------------------");		
	}
	
	public String getInfo()
	{
		return num+"\t"+name+"\t"+kor+"\t"+eng+"\t"+mat+"\t"+tot+"\t"+avg+"\t"+grade;
	}
	
		
//----------------------------------------------------------------	
	// getter && setter 
	public int getNum() { return num; }
	public void setNum(int num) { this.num = num; }
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	public int getKor() { return kor; }
	public void setKor(int kor) { this.kor = kor; }
	public int getEng() { return eng; }
	public void setEng(int eng) { this.eng = eng; }
	public int getMat() { return mat; }
	public void setMat(int mat) { this.mat = mat; }
	public int getTot() { return tot; }
	public void setTot(int tot) { this.tot = tot; }
	public double getAvg() { return avg; }
	public void setAvg(double avg) { this.avg = avg; }
	public char getGrade() { return grade; }
	public void setGrade(char grade) { this.grade = grade; }

	public int getRank() { return rank; } 
	public void setRank(int rank) { this.rank = rank; }
		
	public int getSort() { return sort; }
	public void setSort(int sort) { this.sort = sort; }
	public int getValue() { return value; }
	public void setValue(int value) { this.value = value; }

	// sort 정렬 
	//*
	// 이름 정렬 
	@Override
	public int compareTo(Object o)
	{
		Student s = (Student)o;
		return name.compareTo(s.getName());		
	}	
	//*/
	
	/*
	// 랭크 정렬 
	@Override
	public int compareTo(Object o)
	{
		Student s = (Student)o;
		return s.getTot() - tot;//name.compareTo(s.getName());		
	}
	//*/
	
	
}
