<%@page import="member.MemberDTO"%>
<%@page import="member.MemberManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	String m_name = request.getParameter("name");
	
	String m_sex = request.getParameter("sex");
	
	String m_id = request.getParameter("id");
	
	String m_password = request.getParameter("pwd");
	
	String m_cellphone = request.getParameter("cell");
	
	String m_address = request.getParameter("addr1");
	
	String m_email = request.getParameter("email1")+"@" + request.getParameter("email3");
	
	MemberDTO memberDto = new MemberDTO(m_name,m_sex,m_id,m_password,m_cellphone,m_address,m_email);
	
	int rows=0;
	
	try{
		rows = MemberManager.getMembermanager().insert(memberDto);
		/* response.sendRedirect("../main.jsp?contentPage=login");
		return; */
		%> 
<script type="text/javascript">
	alert("완료~ 로그인페이지로 고고씽");
	location.href="../main.jsp?contentPage=login";
</script>
		<%
	}catch(Exception e){
		e.getMessage();
	}

	
	
	
	
%>