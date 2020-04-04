package com.itwill.student.arraylist.sort;

import java.util.ArrayList;
import java.util.Arrays;

public class StudentRank
{
	private ArrayList stList;
	
	public StudentRank() { }
	public StudentRank(ArrayList stList)
	{
		this.stList = stList;
	}
	
	public ArrayList getStudentArray()
	{
		return this.stList;
	}
	
	// 연산 
	public ArrayList calculator()
	{		
		/*
		// sort 사용 
		ArrayList stTemp = new ArrayList();
		Student[] stArray = new Student[stList.size()];
		
		for (int i = 0; i < stList.size(); i++)
		{
			stArray[i] = (Student)stList.get(i);
		}
		Arrays.sort(stArray);
		
		for(int i = 0; i < stArray.length; i++)
		{
			stTemp.add(stArray[i]);
		}
		
		return stTemp;
		*/
		
		//*
		ArrayList stTemp = new ArrayList();
		
		double dAvg = 0.0;
		int number = 0;
		int count = 0;
		boolean[] bCheck = new boolean[stList.size()];
		Student stValue = null;
				
		while(true)
		{
			for(int i = 0; i < stList.size(); i++)
			{
				if(bCheck[i] == false)
				{ 	
					Student stTemp1 = (Student)stList.get(i);
					
					if(stTemp1.getAvg() >= dAvg)
					{
						dAvg 	= stTemp1.getAvg();
						number 	= i;
						stValue = stTemp1;
					}
				}
			}
				
			stTemp.add(stValue);
			bCheck[number] = true;
				
			dAvg 	= 0.0;
			number 	= 0;
			count++;
			
			if(count == stList.size())
			{
				break;
			}			
		}	
				
		
		return stTemp;
		//*/
	}
	

}
