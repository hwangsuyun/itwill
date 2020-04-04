package com.itwill.student;

public class StudentRank
{
	private Student[] studentArray;
	
	public StudentRank() { }
	public StudentRank(Student[] studentArray)
	{
		this.studentArray = studentArray;
	}
	
	public Student[] getStudentArray()
	{
		return this.studentArray;
	}
	
	// 연산 
	public Student[] calculator()
	{
		Student[] stTemp = new Student[studentArray.length];
		double dAvg = 0.0;
		int number = 0;
		int count = 0;
		boolean[] bCheck = new boolean[studentArray.length];
				
		while(true)
		{
			for(int i = 0; i < studentArray.length; i++)
			{
				if(bCheck[i] == false)
				{ 			
					if(studentArray[i].getAvg() >= dAvg)
					{
						dAvg 	= studentArray[i].getAvg();
						number 	= i;
					}
				}
			}
				
			stTemp[count] = studentArray[number];
			bCheck[number] = true;
				
			dAvg 	= 0.0;
			number 	= 0;
			count++;
			
			if(count == studentArray.length)
			{
				break;
			}			
		}		
		
		return stTemp;
	}
	

}
