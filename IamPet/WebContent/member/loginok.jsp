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
	System.out.println("memberDto�� �� : "+memberDto);	
	if(memberDto == null)
	{		
	//	request.setAttribute("m_id", id);
	//	request.setAttribute("m_password",password);
	%>
		<script>
			alert('ȸ���� �ƴմϴ�.');
			location.href='../main.jsp?contentPage=login&m_id="+<%=id%>+"&m_password="+<%=password%>';
		</script>
	<%

	//	System.out.println("ȸ���� �ƴ�");
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
	   	alert('��й�ȣ�� Ʋ�Ƚ��ϴ�.');
	   	location.href='../main.jsp?contentPage=login';
	</script>
	<%
	
		//System.out.println("��й�ȣ ����ġ");
		//response.sendRedirect("../main.jsp?contentPage=login");
		return;
	}
	
	session.setAttribute("m_id", id);
	session.setAttribute("m_name", memberDto.getName());
	
//	response.sendRedirect("joinsuccess.jsp");
	response.sendRedirect("../main.jsp");
	
%>