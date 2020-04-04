package com.itwill.member;

import java.io.RandomAccessFile;
import java.util.ArrayList;

import com.itwill.member.MemberDAO;

public class MemberAllList
{
	RandomAccessFile randomAccessFile;
	String searchName = "";
	int number = 0;
	
	// 생성자 
	public MemberAllList() {}
	// 전체 리트스 리턴 
	public MemberAllList(RandomAccessFile randomAccessFile)
	{
		this.randomAccessFile = randomAccessFile;		
	}	
	// 이름 검색 리스트 리턴 
	public MemberAllList(RandomAccessFile randomAccessFile, String searchName)
	{
		this.randomAccessFile = randomAccessFile;	
		this.searchName = searchName;		
	}
	// 번호 검색 리스트 리턴 
	public MemberAllList(RandomAccessFile randomAccessFile, int number)
	{
		this.randomAccessFile = randomAccessFile;	
		this.number = number;	
	}

	public ArrayList getMemberList() throws Exception
	{		
		ArrayList list = new ArrayList();		
		
	//	randomAccessFile.seek(0);
		
		// 엑서스파일의 파일포인터의 위치를 레코드카운트를 제외한 위치로 초기화 
		if(randomAccessFile.length() > 0)
		{
			randomAccessFile.seek(MemberDAO.RECORD_COUNT_LENGTH);
		}
		else return list;
				
		for(int i = MemberDAO.RECORD_COUNT_LENGTH; i < randomAccessFile.length(); i += MemberDAO.RECORD_LENGTH)
		{			
			Member member = new Member();
			//---------------------------------------
			// 번호4, 이름10, 나이4, 전화번호26, 주소100  = 144바이트
			// 번호 
			int no = randomAccessFile.readInt();	
			member.setNo(no);
			// 이름 
			String name = "";
			for(int j = 0; j < 5; j++)
			{
				name += randomAccessFile.readChar();				
			}		
			member.setName(name);
			// 나이
			int age = randomAccessFile.readInt();
			member.setAge(age);
			// 전화번호
			String tel = "";
			for(int j = 0; j < 13; j++)
			{
				tel += randomAccessFile.readChar();				
			}
			member.setTel(tel);
			// 전화번호
			String address = "";
			for(int j = 0; j < 50; j++)
			{
				address += randomAccessFile.readChar();				
			}			
			member.setAddress(address);
			
			//---------------------------------------			
			// 이름 검색 
			if(searchName.length() > 0)
			{
				if(name.trim().equals(searchName))
				{
					list.add(member);
				}
			}
			// 번호 검색 
			else if(number > 0)
			{
				if(number == no)
				{
					list.add(member);
				}
			}
			// 전체 리턴 
			else
			{
				list.add(member);
			}
			
		}
				
		return list;
		
	}

}
