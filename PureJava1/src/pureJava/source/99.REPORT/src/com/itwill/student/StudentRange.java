package com.itwill.student;

public class StudentRange
{
	private boolean upDown;
	private Student[] studentArray;
		 
	public StudentRange() { }
	public StudentRange(Student[] studentArray, boolean upDown)
	{
		this.studentArray = studentArray;
		this.upDown = upDown;
	}
	
	public Student[] Calculator()
	{		
		Student[] stTemp = new Student[studentArray.length];
		int dAvg = 0;
		int number = 0;
		int count = 0;
		boolean[] bCheck = new boolean[studentArray.length];
		Student stValue = null;
		
		int temp = 0;
		String str = null;
		
		if(upDown) str = "히";
		else str = "ㄱ";
				
		while(true)
		{
			for(int i = 0; i < studentArray.length; i++)
			{
				if(bCheck[i] == false)
				{ 										
					temp = str.compareTo(studentArray[i].getName());
										
					if(upDown)
					{
						if(temp > dAvg)
						{
							dAvg 	= temp;
							number 	= i;
							stValue = studentArray[i];
						}
						
					}
					else
					{
						if(temp < dAvg)
						{
							dAvg 	= temp;
							number 	= i;
							stValue = studentArray[i];
						}
						
					}
					
				}
			}
				
			stTemp[count] = stValue;
			bCheck[number] = true;
				
			dAvg 	= 0;
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
