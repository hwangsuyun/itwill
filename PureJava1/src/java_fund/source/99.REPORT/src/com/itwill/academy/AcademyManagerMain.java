package com.itwill.academy;

public class AcademyManagerMain
{
	public static void main(String[] args)
	{
		AcademyManager academyManager = new AcademyManager();
		
		Student st1 = new Student(1, "김경호", "자바");		
		Staff sf1 	= new Staff(2, "송중기", "홍보부");
		Gangsa gs1 	= new Gangsa(5, "김경호", "실용음악");
		Student st2 = new Student(4, "구자정", "자바");
		Staff sf2 	= new Staff(3, "홍길동", "인사부");
		
		academyManager.addPerson(st1);
		academyManager.addPerson(st2);
		academyManager.addPerson(sf1);
		academyManager.addPerson(sf2);
		academyManager.addPerson(gs1);	
		
				
		// 번호로 찾기 
		Person searchPerson = academyManager.findByNo(1);
		System.out.println("*** 번호로 찾기 ***");
		searchPerson.print();
		System.out.println();
		
		
		// 이름으로 찾기 
		Person[] searchPersonArray = academyManager.findByName("김경호");				
		System.out.println("*** 이름으로 찾기 ***");
		for(int i = 0; i < searchPersonArray.length; i++)
		{
			if(searchPersonArray[i] != null)
			{
				searchPersonArray[i].print();
			}
		}
		System.out.println();
		
		// 데이터로 찾기 
		Person[] searchPersonArray1 = academyManager.findByEtc("자바");
		System.out.println("*** 데이터로 찾기 ***");
		for(int i = 0; i < searchPersonArray1.length; i++)
		{
			if(searchPersonArray1[i] != null)
			{
				searchPersonArray1[i].print();
			}
		}
		System.out.println();
		
		
		// 객체 수정
		Student updateStudent = new Student(3, "차태현", "마법사반");
		academyManager.updatePerson(updateStudent);
		System.out.println("*** 객체 수정 1 ***");
		
		Staff updateStaff = new Staff(4, "송중기", "오락부");
		academyManager.updatePerson(updateStaff);
		System.out.println("*** 객체 수정 2 ***");
		
		System.out.println();
		
		// 구성원 삭제
		academyManager.deletePerson(2);
		System.out.println("*** 2번 구성원 삭제 ***");
		System.out.println();
		
		// 전체 출력 
		Person[] personArray = academyManager.getPersonArray();
		for(int i = 0; i < personArray.length; i++)
		{			
			if(personArray[i] != null)
			{
				personArray[i].print();
			}
		}
		System.out.println();
		
		
	}

}
