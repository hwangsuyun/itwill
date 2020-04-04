package com.itwill.member;

import java.io.RandomAccessFile;
import java.util.ArrayList;

import javax.swing.JOptionPane;

public class MemberAdd
{
	RandomAccessFile randomAccessFile;
	Member member;
		
	// 생성자 
	public MemberAdd() {}
	public MemberAdd(Member member, RandomAccessFile randomAccessFile)
	{
		this.member = member;
		this.randomAccessFile = randomAccessFile;		
	}
	
	public boolean add() throws Exception
	{		
		//-----------------------------------------------------
		// 번호 중복체크 
		if(checkNum() == true) return true;		
		//---------------------------------------------------
		// 파일포인터의 위치 변경 
		randomAccessFile.seek(randomAccessFile.length());
		
		int no = member.getNo();
		String name = member.getName();	
		if(name.length() > 5) name = name.substring(0, 5);
		int age = member.getAge();
		String tel = member.getTel();
		if(tel.length() > 13) tel = tel.substring(0, 13);
		String address = member.getAddress();
		if(address.length() > 50) address = address.substring(0, 50);
		
		// 번호 4바이트 
		randomAccessFile.writeInt(no);
		
		// 이름 10바이트 
		for(int i = 0; i < 5; i++)
		{
			if(name.length() < 5)
			{
				name += " ";
				if(name.length() >= 5) break;
			}
			else break;
		}		
		for (int i = 0; i < name.length(); i++)
		{
			char c = name.charAt(i);
			randomAccessFile.writeChar(c);
		}
		
		// 나이 4바이트 
		randomAccessFile.writeInt(age);
		
		// 전화번호 26바이트 
		for(int i = 0; i < 13; i++)
		{
			if(tel.length() < 13)
			{
				tel += " ";
				if(tel.length() >= 13) break;
			}
			else break;
		}
		for(int i = 0; i < tel.length(); i++)
		{
			char c = tel.charAt(i);
			randomAccessFile.writeChar(c);
		}
		
		// 주소 100바이트 
		for(int i = 0; i < 50; i++)
		{
			if(address.length() < 50)
			{
				address += " ";
				if(address.length() >= 50) break;
			}
			else break;
		}
		
		for(int i = 0; i < address.length(); i++)
		{
			char c = address.charAt(i);
			randomAccessFile.writeChar(c);
		}
		
		return false;
		
	}	// end add
	
	// 번호 중복체크 
	public boolean checkNum() throws Exception
	{			
		// 엑서스파일의 파일포인터의 위치를 레코드카운트를 제외한 위치로 초기화 
		randomAccessFile.seek(0);	
		// 파일포인터의 이동을 위해 맨앞의 레코드카운트를 읽어준다. 
		int record = randomAccessFile.readInt();
		
		for(int i = MemberDAO.RECORD_COUNT_LENGTH; i < randomAccessFile.length(); i += MemberDAO.RECORD_LENGTH)
		{			
			int no = randomAccessFile.readInt();
			if(no == member.getNo())
			{
				JOptionPane.showMessageDialog(null, "중복된 숫자입니다.");
				return true;
			}			
			randomAccessFile.seek(i + MemberDAO.RECORD_LENGTH);
			
		}
		
		return false;
	}
	
	
}
