package board.bbs;

import board.common.IN_PAGE;

public class BBSManager
{
	private static BBSManager bbsManager;	
	private BBSManager() { }
	
	public static BBSManager getBBSManager()
	{
		if(bbsManager == null) bbsManager = new BBSManager(); 
		return bbsManager;
	}
	
	private BBSBean getBBSBean()
	{
		return BBSBean.getBBSBean();
	}
	
	
	public synchronized OUTS_BBS getBBSList(IN_PAGE inPage, String search_type, String search_content)
	{
		// ruturn init
		OUTS_BBS outObjS = getBBSBean().getBBSList(inPage, search_type, search_content);		
		return outObjS;
	}
	
	
	public synchronized boolean insertBBS(INSERT_BBS inBBS, String insertType, String bbs_no)
	{		// ruturn init
		boolean returnFlag = getBBSBean().insertBBS(inBBS, insertType, bbs_no);		
		return returnFlag;
	}
	
	public synchronized boolean upgradeRefCount(String bbs_no)
	{
		// ruturn init
		boolean isOk = getBBSBean().upgradeRefCount(bbs_no);
		return isOk;
	}
	
	public synchronized BBSRec getBBSListView(String bbs_no)
	{
		// ruturn init
		BBSRec rec = getBBSBean().getBBSListView(bbs_no);
		return rec;
	}
	
	public synchronized boolean bbsUpdate( String bbs_no, String bbs_title, 
			String bbs_content, String bbs_passwd,
			String bbs_email, String bbs_homepage)
	{
		// ruturn init
		boolean returnFlag = getBBSBean().bbsUpdate(bbs_no, bbs_title, bbs_content, bbs_passwd, bbs_email, bbs_homepage);		
		return returnFlag;
	}
	
	public synchronized boolean bbsDelete(String bbs_no, String bbs_group_no, String bbs_level)
	{
		// ruturn init
		boolean hasNode = getBBSBean().bbsDelete(bbs_no, bbs_group_no, bbs_level);
		return hasNode;
	}
	

}
