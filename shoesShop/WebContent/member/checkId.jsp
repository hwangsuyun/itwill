<%@page import="member.MemberDTO"%>
<%@page import="member.MemberManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	request.setCharacterEncoding("euc-kr");
	String m_id = request.getParameter("id");
	
	
	
	boolean idcheck = true;
	idcheck = MemberManager.getMembermanager().idcheck(m_id);
	
	if(idcheck){
%>
	<script>
	alert("�ߺ����̵�");
	window.close("member/checkId.jsp");
	</script>

<% 
	}else{

%>
<script>
	alert("��밡���Ѿ��̵�");
	window.close("member/checkId.jsp");
	</script>
	
	<%} %>
