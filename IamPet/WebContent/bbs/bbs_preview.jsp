<%@page import="board.bbs.BBSManager"%>
<%
/********************************************************
��    ��   �� : bbs_preview.jsp
��         �� : ��ȸ�� ���� ó�� ������ 
���� ���α׷� : 
��         �� :
*********************************************************/
%>

<%@page contentType="text/html;charset=euc-kr"%>

<%
//	BBSBean BBS=new BBSBean();

	// ����Ʈ ���� ����
	String cPage = request.getParameter("cPage");
		if(cPage == null) cPage = "";

	String bbs_no = request.getParameter("bbs_no");

	// BBSBean�� �޼ҵ� ��
//	boolean isOk = BBS.upgradeRefCount(bbs_no);
	boolean isOk = BBSManager.getBBSManager().upgradeRefCount(bbs_no);
	if(isOk)
	{
		response.sendRedirect("../main.jsp?contentPage=bbs_view&cPage="+cPage+"&bbs_no="+bbs_no);
	}
	else
	{
%>
	<script>
		alert("������ �߻������� �ٽ� �õ����� ��!!!");
		history.back();
	</script>
<%
	}
%>
		

