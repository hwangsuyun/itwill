<%@page import="board.bbs.BBSManager"%>
<%@page import="board.bbs.BBSRec"%>
<%@ page language="Java"
         contentType="text/html; charset=EUC_KR" %>

<%

	String cPage = request.getParameter("cPage");
		if(cPage == null) cPage="";
	
	String bbs_passwd    = request.getParameter("bbs_passwd");
	String bbs_no    = request.getParameter("bbs_no");
	String bbs_group_no = request.getParameter("bbs_group_no");
	String bbs_level = request.getParameter("bbs_level");

//	BBSBean BBS=new BBSBean();
	// BBSBean의 메소드 콜
//	BBSRec RET = BBS.getBBSListView(bbs_no);
	BBSRec RET = BBSManager.getBBSManager().getBBSListView(bbs_no);

	if(RET.bbs_passwd.equals(bbs_passwd))
	{
		// insertBBS()메소드 콜.....
		boolean hasNode = BBSManager.getBBSManager().bbsDelete(bbs_no, bbs_group_no, bbs_level);
		if(hasNode)
		{
%>
			<Script>
				alert("답변글이 존재하므로 삭제할 수 없습니다...");
				history.back();
			</Script>		
<%
		}
		else //정상적으로 삭제된 경우..
		{
			response.sendRedirect("../main.jsp?contentPage=bbs_list");
		}
	}
	else
	{
%>
		<Script>
			alert("삭제 권한이 없습니다...");
			history.back();
		</Script>	
<%
	}
%>
