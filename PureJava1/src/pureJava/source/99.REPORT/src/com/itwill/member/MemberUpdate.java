package com.itwill.member;

import java.io.RandomAccessFile;
import java.util.ArrayList;

public class MemberUpdate
{
	RandomAccessFile randomAccessFile;
	Member member;
	
	public MemberUpdate() {}
	public MemberUpdate(RandomAccessFile randomAccessFile, Member member)
	{
		this.randomAccessFile = randomAccessFile;
		this.member = member;
	}
	
	public void update() throws Exception
	{
		// 1. 전체 멤버를 리스트에 담아준다. 
		ArrayList list = new ArrayList();
		
		// 엑서스파일의 파일포인터의 위치를 0으로 초기화 
		randomAccessFile.seek(0);
		
		int recordCount = randomAccessFile.readInt();	
		
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
			list.add(member);
			
		}
		
		
		// 2. 리스트에 있는 정보를 Member타입으로 풀어서 넘버를 비교해서 같다면 
		// 같은놈의 리스트를 지워버린다. 엑서스파일의 초기화 
		for(int i = 0; i < list.size(); i++)
		{
			Member mem1 = (Member)list.get(i);			
			// 비교
			if(mem1.getNo() == member.getNo())
			{
				// 번호 검색후 같은놈의 위치로 파일포인터의 위치를 변경해준다. 
				randomAccessFile.seek((i * MemberDAO.RECORD_LENGTH) + MemberDAO.RECORD_COUNT_LENGTH);
				break;
			}			
		}
		
		// 3. 멤버의 정보를 다시 써준다. 			
		// 번호4, 이름10, 나이4, 전화번호26, 주소100
		// 번호 
		randomAccessFile.writeInt(member.getNo());
		// 이름
		String name = member.getName();
		for(int j = 0; j < 5; j++)
		{
			if(name.length() < 5)
			{
				name += " ";
				if(name.length() >= 5) break;
			}
			else break;
		}
		for(int j = 0; j < name.length(); j++)
		{
			char c = name.charAt(j);
			randomAccessFile.writeChar(c);
		}
		// 나이 
		randomAccessFile.writeInt(member.getAge());
		// 전화번호 
		String tel = member.getTel();
		for(int j = 0; j < 13; j++)
		{
			if(tel.length() < 13)
			{
				tel += " ";
				if(tel.length() >= 13) break;
			}
			else break;
		}
		for(int j = 0; j < tel.length(); j++)
		{
			char c = tel.charAt(j);
			randomAccessFile.writeChar(c);
		}
		// 주소
		String address = member.getAddress();
		for(int j = 0; j < 50; j++)
		{
			if(address.length() < 50)
			{
				address += " ";
				if(address.length() >= 50) break;
			}
			else break;
		}
		for(int j = 0; j < address.length(); j++)
		{
			char c = address.charAt(j);
			randomAccessFile.writeChar(c);
		}
			
		
		
	}

}
