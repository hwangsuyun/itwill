<%@page import="java.io.PrintWriter"%>
<%@page import="member.MemberManager"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String password = request.getParameter("passwd1");
	
	MemberDTO memberDto = MemberManager.getMembermanager().findMember(id);
	System.out.println("memberDto의 값 : "+memberDto);	
	if(memberDto == null)
	{		
	//	request.setAttribute("m_id", id);
	//	request.setAttribute("m_password",password);
	%>
		<script>
			alert('회원이 아닙니다.');
			location.href='../main.jsp?contentPage=login&m_id="+<%=id%>+"&m_password="+<%=password%>';
		</script>
	<%

	//	System.out.println("회원이 아님");
	//	RequestDispatcher rd = request.getRequestDispatcher("../main.jsp?contentPage=login");
	//	rd.forward(request, response);
	 
	//	response.sendRedirect("../main.jsp?contentPage=login&m_id="+id+"&m_password="+password);		
		return;
	}
	if(!memberDto.isMatchPassword(password))
	{
		
		request.setAttribute("m_id", id);
		request.setAttribute("m_password",password);
	%>	
	<script>
	   	alert('비밀번호가 틀렸습니다.');
	   	location.href='../main.jsp?contentPage=login';
	</script>
	<%
	
		//System.out.println("비밀번호 불일치");
		//response.sendRedirect("../main.jsp?contentPage=login");
		return;
	}
	
	session.setAttribute("m_id", id);
	session.setAttribute("m_name", memberDto.getName());
	
//	response.sendRedirect("joinsuccess.jsp");
	response.sendRedirect("../main.jsp");
	
%>