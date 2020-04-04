package com.itwill.student.arraylist;

import java.util.ArrayList;

public class StudentRange
{
	private boolean upDown;
	private ArrayList stList;
		 
	public StudentRange() { }
	public StudentRange(ArrayList stList, boolean upDown)
	{
		this.stList = stList;
		this.upDown = upDown;
	}
	
	public ArrayList Calculator()
	{		
		ArrayList stTemp = new ArrayList();
		int dAvg = 0;
		int number = 0;
		int count = 0;
		boolean[] bCheck = new boolean[stList.size()];
		Student stValue = null;
		
		int temp = 0;
		String str = null;
		
		if(upDown) str = "히";
		else str = "ㄱ";
				
		while(true)
		{
			for(int i = 0; i < stList.size(); i++)
			{
				if(bCheck[i] == false)
				{ 	
					Student st = (Student)stList.get(i);										
					temp = str.compareTo(st.getName());
										
					if(upDown)
					{
						if(temp > dAvg)
						{
							dAvg 	= temp;
							number 	= i;
							stValue = st;
						}
						
					}
					else
					{
						if(temp < dAvg)
						{
							dAvg 	= temp;
							number 	= i;
							stValue = st;
						}
						
					}
					
				}
			}
				
			stTemp.add(stValue);
			bCheck[number] = true;
				
			dAvg 	= 0;
			number 	= 0;
			count++;
			
			if(count == stList.size())
			{
				break;
			}			
		}		
		
		return stTemp;		
		
	}
	

}
