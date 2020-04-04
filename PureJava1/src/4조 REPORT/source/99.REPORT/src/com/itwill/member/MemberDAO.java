package  com.itwill.member;

import java.io.*;
import java.util.*;
import javax.swing.*;

/**
 * DAO(data Accass Object ) 클래스
 * 파일에 저장,삭제,변경,읽기를 전담하는 클래스
 * RandomAccessFile을 이용한 파일 영속성 처리
 * 
*/
public class MemberDAO
{
	private RandomAccessFile randomAccessFile;
	private int recordCount = 0;
	// 등록레코드(구성원) 수
	public static final int RECORD_LENGTH = 144;
	// 1개레코드 총사이즈를 144바이트로 설정
	public static final int RECORD_COUNT_LENGTH = 4;

	public MemberDAO(String fileName)
	{
		try 
		{
			randomAccessFile = new RandomAccessFile(fileName, "rw");
		}
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// 저장된 친구수 리턴
	public int getRecordCount() throws Exception
	{	
		// 엑서스파일의 길이가 0보다 크다면 일단 멤버가 있는걸로 판단
		// 파일포인터의 위치를 처음위치로 초기화해서 거기 저장된 정보를 뽑아와서 리턴시킨다. 
		if(randomAccessFile.length() > 0)
		{
			randomAccessFile.seek(0);
			recordCount = randomAccessFile.readInt();
		}		
		return recordCount;
	}
		
	// Member 저장
	public void addMember(Member member) throws Exception 
	{
		/*********************************************************************************
		 * <<파일레코드구조>>
		 * recordCount(4byte)
		 * |no(4byte)|name(10byte)|age(4byte)|tel(26 byte)|address(100byte)
		 ********************************************************************************/				
		// 처음이라면  
		if(randomAccessFile.length() == 0)
		{
			// 레코드 카운트를 처음 써준다. 
			randomAccessFile.seek(0);
			recordCount++;
			randomAccessFile.writeInt(recordCount);
		}
				
		// 추가멤버 클래스 객체 생성
		MemberAdd memberAdd = new MemberAdd(member, randomAccessFile);
		if(memberAdd.add() == true) return;		
		
		// 멤버쓰기가 문제없이 잘 되었다면 
		// 멤버추가후 레코드 카운트 파일에 써주기 
		// 레코드 카운트를 처음 써준다. 
		if(randomAccessFile.length() > 0)
		{
			randomAccessFile.seek(0);
			recordCount = randomAccessFile.readInt();			
			// 파일의 길이가 한명의 길이보다 길다면 그때부터 레코드 카운트 증가 
			// 한명일땐 위에서 처리를 해주기 때문에 2명째되는 순간부터 이부분에서 증가 
			if(randomAccessFile.length() > (RECORD_LENGTH + RECORD_COUNT_LENGTH))
			{				
				recordCount++;				
			}			
			randomAccessFile.seek(0);
			randomAccessFile.writeInt(recordCount);
			// 다 쓰고나서 파일포인터의 위치를 초기화 
			randomAccessFile.seek((recordCount * RECORD_LENGTH) + RECORD_COUNT_LENGTH);			
		}
		
	}
	
	// Member 이름으로찾기
	public ArrayList findByName(String searchName) throws Exception
	{
		// 전체멤버 리스트 객체 생성 (생성자의 인자값 2)
		MemberAllList  memberAllList = new MemberAllList(randomAccessFile, searchName);	
		// MemberAllList Class 에서 연산된 ArrayList 를 리턴 시킨다. 
		return memberAllList.getMemberList();		
	}
	// 등록된 전체 Member 리스트 리턴
	public ArrayList getMemberList() throws Exception
	{
		// 전체멤버 리스트 객체 생성 (생성자의 인자값 1)
		MemberAllList  memberAllList = new MemberAllList(randomAccessFile);
		// MemberAllList Class 에서 연산된 ArrayList 를 리턴 시킨다.
		return memberAllList.getMemberList();	
	}	
	// Member 번호로 삭제
	public void deleteMember(int num) throws Exception 
	{
		// 삭제 클래스 객체 생성후 생성자에 값을 넣어준다.
		MemberDelete memberDelete = new MemberDelete(randomAccessFile, num);
		// 해당 번호와 검색해서 조건이 일치한다면 지운다. 
		memberDelete.delete();		
	}	
			
	// 업데이트 1
	// Member 번호로찾기
	public Member findByNo(int no) throws Exception
	{
		// 전체멤버 리스트 객체 생성 (생성자의 인자값 2)
		MemberAllList  memberAllList = new MemberAllList(randomAccessFile, no);	
		ArrayList numMember = memberAllList.getMemberList();	
//		Member member = (Member)numMember.get(0);	
		
		if(numMember.size() > 0) return (Member)numMember.get(0);
		else return null;
			
	//	return (Member)numMember.get(0);
	}
	// Member 수정 
	public void updateMember(Member member) throws Exception 
	{
		MemberUpdate memberUpdate = new MemberUpdate(randomAccessFile, member);
		// 해당 번호와 검색해서 조건이 일치한다면 수정 
		memberUpdate.update();		
	}
	
	
	
	
	// 특정 파일인덱스의 레코드(Member) 리턴
	public Member getRecordAt(int index) throws IOException 
	{
		return null;
	}	
	// 파일 index번호로삭제
	public void deleteRecord(int no)
	{		
	}

	// 스트림 닫기
	public void close() 
	{
		try 
		{
			randomAccessFile.close();
		} 
		catch (IOException ex) 
		{
			ex.printStackTrace();
		}
	}
}
