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
	// BBSBean�� �޼ҵ� ��
//	BBSRec RET = BBS.getBBSListView(bbs_no);
	BBSRec RET = BBSManager.getBBSManager().getBBSListView(bbs_no);

	if(RET.bbs_passwd.equals(bbs_passwd))
	{
		// insertBBS()�޼ҵ� ��.....
		boolean hasNode = BBSManager.getBBSManager().bbsDelete(bbs_no, bbs_group_no, bbs_level);
		if(hasNode)
		{
%>
			<Script>
				alert("�亯���� �����ϹǷ� ������ �� �����ϴ�...");
				history.back();
			</Script>		
<%
		}
		else //���������� ������ ���..
		{
			response.sendRedirect("../main.jsp?contentPage=bbs_list");
		}
	}
	else
	{
%>
		<Script>
			alert("���� ������ �����ϴ�...");
			history.back();
		</Script>	
<%
	}
%>
