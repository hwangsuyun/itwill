package member;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import sun.security.util.PropertyExpander.ExpandException;

public class MemberManager {
	
	private static MemberManager _member1Manager;
	private MemberManager(){}
	public static MemberManager getMembermanager(){
		if(_member1Manager==null)
		{
			_member1Manager = new MemberManager();
		}
		return _member1Manager;
}
	//아이디 생성
	public int create(MemberDTO memberDto)throws Exception{
		if(getMemberDao().idcheck(memberDto.getId()))
		{
			System.out.println(memberDto.getId()+"는 이미 존재하는 아이디.");
		}
		
		int rows = getMemberDao().create(memberDto);
		return rows;
	} 
	//아이디 중복체크
	public boolean idcheck(String id)throws Exception{
	
		boolean returnFlag = false;
		returnFlag=getMemberDao().idcheck(id);
		return returnFlag;
	}
	
	//상세보기
	public MemberDTO findMember(String Id)throws Exception
	{
		PrintWriter out =null;
		MemberDTO memberDto = getMemberDao().findUser(Id);
		if(memberDto == null)
		{
			System.out.println(Id+"는 존재하지 않는 아이디.");
		}
		return memberDto;
	}
	//로그인
	public MemberDTO login(String Id, String password)throws Exception{
		MemberDTO memberDto = findMember(Id);
		if(memberDto.isMatchPassword(password)){
			System.out.println("패스워드 틀렸습니다.");
		}
		return memberDto;
	}
	//수정
	public int update(MemberDTO memberDto)throws Exception{
		return getMemberDao().update(memberDto);
	}
	//삭제
	public int remove(String Id)throws Exception{
		return getMemberDao().remove(Id);
	}
	//ID찾기
	public ArrayList<MemberDTO> idsearch(String email , String name)throws Exception{
		return getMemberDao().idsearch(email, name);
	}
	
	//1. pass 찾기(기본정보입력 - > 패스워드 질문찾기)
	public MemberDTO passsearch1(String id, String name, String email)throws Exception{
		return getMemberDao().passsearch1(id, name, email);
	}
	//2. pass 찾기(질답입력 - > 비밀번호찾기)
	public ArrayList<MemberDTO> passsearch2(String passresult)throws Exception{
		return getMemberDao().passsearch2(passresult);
	}
	
	//목록
	public ArrayList<MemberDTO> findMemberList()throws Exception{
		return getMemberDao().findUserList();
	}
	//객체반환
	private MemberDAO getMemberDao(){
		return MemberDAO.getMemberDAO();
	}
}