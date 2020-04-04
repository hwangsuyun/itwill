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
	//¸â¹ö Ãß°¡
	public int insert(MemberDTO memberDto) throws Exception{
		return getMemberDao().insert(memberDto);
	}
	
	//¸â¹ö ¼öÁ¤
	public int update(MemberDTO memberDto) throws Exception{
		return getMemberDao().update(memberDto);
	}
	
	//¸â¹ö »èÁ¦
	public int remove(String m_id) throws Exception{
		return getMemberDao().remove(m_id);
	}
	
	//¸â¹ö ÀüÃ¼ ¸®½ºÆ®
	public ArrayList<MemberDTO> findAll() throws Exception{
		return getMemberDao().findAll();
	}
	
	//¸â¹ö ÇÑ¸íÃ£±â
	public MemberDTO findOne(String m_id) throws Exception{
		return getMemberDao().findOne(m_id);
	}
	
	//id check
	public boolean idcheck(String id)throws Exception{
		
		boolean returnFlag = false;
		returnFlag=getMemberDao().idcheck(id);
		return returnFlag;
	}
	
	
	//°´Ã¼¹ÝÈ¯
	private MemberDAO getMemberDao(){
		return MemberDAO.getMemberDAO();
	}
	
}
