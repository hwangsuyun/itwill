package com.itwill.student.arraylist.sort;

import java.util.ArrayList;
import java.util.Arrays;

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
		
	}
	

}
