package member;

import java.util.ArrayList;

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
	//��� �߰�
	public int insert(MemberDTO memberDto) throws Exception{
		return getMemberDao().insert(memberDto);
	}
	
	//��� ����
	public int update(MemberDTO memberDto) throws Exception{
		return getMemberDao().update(memberDto);
	}
	
	//��� ����
	public int remove(String m_id) throws Exception{
		return getMemberDao().remove(m_id);
	}
	
	//��� ��ü ����Ʈ
	public ArrayList<MemberDTO> findAll() throws Exception{
		return getMemberDao().findAll();
	}
	
	//��� �Ѹ�ã��
	public MemberDTO findOne(String m_id) throws Exception{
		return getMemberDao().findOne(m_id);
	}
	
	//id check
	public boolean idcheck(String id)throws Exception{
		
		boolean returnFlag = false;
		returnFlag=getMemberDao().idcheck(id);
		return returnFlag;
	}
	
	
	//��ü��ȯ
	private MemberDAO getMemberDao(){
		return MemberDAO.getMemberDAO();
	}
	
}
