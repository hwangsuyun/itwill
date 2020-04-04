package com.itwill.academy;

public class AcademyManager
{
	private Person[] personArray;
	
	// 생성자 
	public AcademyManager()
	{
		this.personArray = new Person[20];
	}
	
	public Person[] getPersonArray()
	{
		return this.personArray;
	}
	
	// add - 구성원추가 
	public void addPerson(Person inputPerson)
	{
		// 중복번호 체크		
		for(int i = 0; i < personArray.length; i++)
		{	
			// null이 아닌놈이 있다면 검사 
			if(personArray[i] != null)
			{
				// 같은값이 있다면 빠져나온다. 
				if(inputPerson.getNo() == personArray[i].getNo())
				{			
					break;
				}								
			}
			
			// 마지막까지 검사후 값 대입 
			if(i == (personArray.length - 1))
			{
				personArray[inputPerson.getNo()] = inputPerson;
			}
			
		}	// end for i
		
	}
	
	// 번호로 찾기 (1명)
	public Person findByNo(int no)
	{
		Person person = null;
		for(int i = 0; i < personArray.length; i++)
		{
			if(personArray[i] != null)
			{
				if(personArray[i].getNo() == no)
				{
					person = personArray[i];
					break;
				}
			}
		}
		
		return person;
	}
	
	// 이름으로 찾기 (여러명)
	public Person[] findByName(String name)
	{
		Person[] personTemp = new Person[personArray.length];
		for(int i = 0; i < personArray.length; i++)
		{
			if(personArray[i] != null)
			{
				if(personArray[i].getName().equals(name))
				{
					personTemp[i] = personArray[i];				
				}
			}
		}
		
		return personTemp;	
	}
	
	// 부서, 반, 과목으로 찾기  
	public Person[] findByEtc(String data)
	{		
		// instanceof 연산자 사용 
		Person[] personTemp = new Person[personArray.length];
		int count = 0;
		for(int i = 0; i < personArray.length; i++)
		{
			if(personArray[i] != null)
			{	
				if(personArray[i] instanceof Student)
				{
					Student st = (Student)personArray[i];					
					if(st.getBan().equals(data))
					{
						personTemp[count] = personArray[i];
					}
				}
				else if(personArray[i] instanceof Staff)
				{
					Staff sf = (Staff)personArray[i];
					if(sf.getDepart().equals(data))
					{
						personTemp[count] = personArray[i];
					}
				}
				else if(personArray[i] instanceof Gangsa)
				{
					Gangsa gs = (Gangsa)personArray[i];
					if(gs.getSubject().equals(data))
					{
						personTemp[count] = personArray[i];
					}
				}								
					
				count++;	

				
			}
		}
		
		return personTemp;
		
	}
	
	// 객체 수정
	public void updatePerson(Person updatePerson)
	{
		for(int i = 0; i < personArray.length; i++)
		{			
			if(personArray[i] != null)
			{
				if(personArray[i].getNo() == updatePerson.getNo())
				{
					personArray[i] = updatePerson;					
				}
			}
			
			
		}
	}
	
	// 구성원 삭제 
	public void deletePerson(int no)
	{
		for(int i = 0; i < personArray.length; i++)
		{
			if(personArray[i] != null)
			{
				if(personArray[i].getNo() == no)
				{
					personArray[i] = null;
					break;
				}
			}
		}		
	}
	

}















