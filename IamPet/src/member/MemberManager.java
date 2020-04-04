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
	//���̵� ����
	public int create(MemberDTO memberDto)throws Exception{
		if(getMemberDao().idcheck(memberDto.getId()))
		{
			System.out.println(memberDto.getId()+"�� �̹� �����ϴ� ���̵�.");
		}
		
		int rows = getMemberDao().create(memberDto);
		return rows;
	} 
	//���̵� �ߺ�üũ
	public boolean idcheck(String id)throws Exception{
	
		boolean returnFlag = false;
		returnFlag=getMemberDao().idcheck(id);
		return returnFlag;
	}
	
	//�󼼺���
	public MemberDTO findMember(String Id)throws Exception
	{
		PrintWriter out =null;
		MemberDTO memberDto = getMemberDao().findUser(Id);
		if(memberDto == null)
		{
			System.out.println(Id+"�� �������� �ʴ� ���̵�.");
		}
		return memberDto;
	}
	//�α���
	public MemberDTO login(String Id, String password)throws Exception{
		MemberDTO memberDto = findMember(Id);
		if(memberDto.isMatchPassword(password)){
			System.out.println("�н����� Ʋ�Ƚ��ϴ�.");
		}
		return memberDto;
	}
	//����
	public int update(MemberDTO memberDto)throws Exception{
		return getMemberDao().update(memberDto);
	}
	//����
	public int remove(String Id)throws Exception{
		return getMemberDao().remove(Id);
	}
	//IDã��
	public ArrayList<MemberDTO> idsearch(String email , String name)throws Exception{
		return getMemberDao().idsearch(email, name);
	}
	
	//1. pass ã��(�⺻�����Է� - > �н����� ����ã��)
	public MemberDTO passsearch1(String id, String name, String email)throws Exception{
		return getMemberDao().passsearch1(id, name, email);
	}
	//2. pass ã��(�����Է� - > ��й�ȣã��)
	public ArrayList<MemberDTO> passsearch2(String passresult)throws Exception{
		return getMemberDao().passsearch2(passresult);
	}
	
	//���
	public ArrayList<MemberDTO> findMemberList()throws Exception{
		return getMemberDao().findUserList();
	}
	//��ü��ȯ
	private MemberDAO getMemberDao(){
		return MemberDAO.getMemberDAO();
	}
}