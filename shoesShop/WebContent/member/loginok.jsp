<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String m_id = request.getParameter("id");
	String m_pass = request.getParameter("pwd");
	
	/* System.out.println("m_id:"+m_id);
	System.out.println("m_pass:"+m_pass); */
	
	try{
		MemberDTO memberDto = MemberManager.getMembermanager().findOne(m_id);
		System.out.println("memberDto:"+memberDto);
		if(memberDto==null || memberDto.equals("")){
			
	%>	
		<script>
		alert("너 회원아니다");
		location.href='../main.jsp?contentPage=login&m_id="+<%=m_id%>+&"m_pass="+<%=m_pass%>';
		</script>

<%
		}else if(!memberDto.getM_pass().equals(m_pass)){
	
	%>	
			<script>
			alert("비번이 틀리다.");
			location.href='../main.jsp?contentPage=login&m_id="+<%=m_id%>+&"m_pass="+<%=m_pass%>';
			</script>

	<%
			
			
		}else{	
			session.setAttribute("m_id", m_id);
			session.setAttribute("m_name", memberDto.getM_name());
			response.sendRedirect("../main.jsp");
		}
	}catch(Exception e){
		e.getMessage();
	}
	
	
	
	
	
%>