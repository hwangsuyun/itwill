<%@page import="board.bbs.BBSManager"%>
<%
/********************************************************
파    일   명 : bbs_preview.jsp
기         능 : 조회수 증가 처리 페이지 
관련 프로그램 : 
변         경 :
*********************************************************/
%>

<%@page contentType="text/html;charset=euc-kr"%>

<%
//	BBSBean BBS=new BBSBean();

	// 리스트 관련 변수
	String cPage = request.getParameter("cPage");
		if(cPage == null) cPage = "";

	String bbs_no = request.getParameter("bbs_no");

	// BBSBean의 메소드 콜
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
		alert("에러가 발생했응께 다시 시도해줘 잉!!!");
		history.back();
	</script>
<%
	}
%>
		

