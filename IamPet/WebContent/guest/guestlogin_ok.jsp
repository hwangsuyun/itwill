<%@page import="guest.GuestManager"%>
<%@page import="guest.GuestDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="member.MemberManager"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("euc-kr");

	String name = request.getParameter("name");
	String email = request.getParameter("email1")+"@"+
			 	   request.getParameter("email2");
	String phone = request.getParameter("mobile1")+"-"+
				   request.getParameter("mobile2")+"-"+
				   request.getParameter("mobile3");
		
	GuestDTO guestDto = GuestManager.getGuestManager().findGuest(name, email, phone);
	
	System.out.println("gmane:"+guestDto.getG_name());
	if(guestDto.getG_name()==null)
	{		
	%>
		<script>
			alert('개인정보가 틀렸습니다.');
			location.href='../main.jsp?contentPage=guestlogin';
		</script>
	<%
	return;
	}
	
	System.out.println("guestDto : "+guestDto);
	session.setAttribute("g_name", name);
	session.setAttribute("g_email", email);
	
	
	response.sendRedirect("../main.jsp?contentPage=order/order_list");
	
%>