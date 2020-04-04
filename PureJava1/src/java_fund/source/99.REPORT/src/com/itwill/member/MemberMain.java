package com.itwill.member;

import java.util.*;
import java.io.*;

public class MemberMain
{
	public static void main(String[] args) throws Exception
	{
		MemberDAO memberDAO = new MemberDAO("memberlist.dat");
		
		// Member 추가
		memberDAO.addMember(new Member(1, "김경호", 43, "011-4563-5656", "경기도민"));
				
		// Member 찾기
	//	Member searchMember = memberDAO.findByNo(1);
		// Member 여러명찾기
		ArrayList findMemberList=memberDAO.findByName("김경호");
		// Member 전체리스트
		ArrayList allMemberList=memberDAO.getMemberList();
		
		// member 삭제 
		memberDAO.deleteMember(2);
				
		
		// 스트림 닫기
		memberDAO.close();

	}
}
