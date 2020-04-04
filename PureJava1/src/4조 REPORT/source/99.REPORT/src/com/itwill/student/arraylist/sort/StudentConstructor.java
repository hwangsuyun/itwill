package com.itwill.student.arraylist.sort;

import java.util.ArrayList;

// 학생 전체 출력 
public class StudentConstructor
{
//	private Student[] studentArray;
	private int st_max = 20;			// 학생수 최대값
	private ArrayList stList;
	
	// 생성자 
	public StudentConstructor()
	{
	//	studentArray = new Student[st_max];
		stList = new ArrayList();
		st_max = 20;
	}
	// 갯수 받은만큼 할당 생성 
	public StudentConstructor(int no)
	{
	//	if(no <= 0) studentArray = new Student[st_max];
	//	else studentArray = new Student[no];
		stList = new ArrayList();
		st_max = no;
	}
	// 생성해서 리턴 시켜버려라 .
	public ArrayList getStudentArray()
	{		
		String name  = null;
		Student stTemp = null;
		
		// 점수 랜덤으로 받기  최소60 ~ 최대 40
		for(int i = 0; i < st_max; i++)
		{
			int temp_kor = (int)(Math.random() * 41) + 60;
			int temp_eng = (int)(Math.random() * 41) + 60;
			int temp_mat = (int)(Math.random() * 41) + 60;
			
		//	String name  = (String)("싸이"+((int)(Math.random() * 1000) + 1));
			if(i == 0) name = "최홍만";
			else if(i == 1) name = "홍석천";
			else if(i == 2) name = "박기사";
			else if(i == 3) name = "김대리";
			else if(i == 4) name = "이기사";
			else if(i == 5) name = "관리자";
			else if(i == 6) name = "차차장";
			else if(i == 7) name = "김대리";
			else if(i == 8) name = "가기사";
			else if(i == 9) name = "나기사";
			else if(i == 10) name = "다바보";
			else if(i == 11) name = "사랑해";
			else if(i == 12) name = "하기사";
			else if(i == 13) name = "바기사";
			else if(i == 14) name = "아기사";
			else if(i == 15) name = "무기사";
			else if(i == 16) name = "차기사";
			else if(i == 17) name = "야기사";
			else if(i == 18) name = "파기사";
			else if(i == 19) name = "카기사";
			else name = "홍대리";
			
			
			// ----- 6. 이름이 김대리 인 학생 반환 -----   이문제를 위해 하나는 꼭 넣어주자. 
	//		if(i == (st_max -1)) name = "김대리";	
			stTemp = new Student( (i+1), name, temp_kor, temp_eng, temp_mat );
			
			stList.add(stTemp);
		}	
		
		return this.stList;
	}

}
