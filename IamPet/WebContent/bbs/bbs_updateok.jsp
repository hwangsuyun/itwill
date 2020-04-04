<%@page import="board.bbs.BBSRec"%>
<%@page import="board.bbs.BBSManager"%>
<%@page contentType="text/html;charset=euc-kr"%>

<%
	request.setCharacterEncoding("ksc5601");
	String cPage = request.getParameter("cPage");
		if(cPage == null) cPage="";
	
	String bbs_no    = request.getParameter("bbs_no");
	String bbs_title    = request.getParameter("bbs_title");
	String bbs_content    = request.getParameter("bbs_content");
	String bbs_passwd    = request.getParameter("bbs_passwd");
	String bbs_email    = request.getParameter("bbs_email");
	String bbs_homepage    = request.getParameter("bbs_homepage");

//	BBSBean BBS=new BBSBean();
	// BBSBean의 메소드 콜
//	BBSRec RET = BBS.getBBSListView(bbs_no);
	BBSRec RET = BBSManager.getBBSManager().getBBSListView(bbs_no);

	if(RET.bbs_passwd.equals(bbs_passwd))
	{
		// insertBBS()메소드 콜.....
		boolean flag = BBSManager.getBBSManager().bbsUpdate(bbs_no, bbs_title, bbs_content, bbs_passwd, bbs_email, bbs_homepage);
		if(flag)
		{
			response.sendRedirect("../main.jsp?contentPage=bbs_view&bbs_no="+ bbs_no);
		}
		else
		{
		%>
			<Script>
				alert("입력장애가 발생하였습니다...\n다시 한번 시도하여 주세요...");
				history.back();
			</Script>		
		<%
		}
		
	}
	else
	{
%>
		<Script>
			alert("수정 권한이 없습니다...");
			history.back();
		</Script>	
<%
	}
%>
