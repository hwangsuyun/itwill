<%@page import="member.MemberManager"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("euc-kr");

	int no 				= Integer.parseInt(request.getParameter("no"));
	String id 			= request.getParameter("id");
	String name 		= request.getParameter("name");
	String password 	= request.getParameter("password");
	String jumin1 		= request.getParameter("jumin1");
	String jumin2 		= request.getParameter("jumin2");
	String passquiz 	= request.getParameter("passquiz");
	String passresult 	= request.getParameter("passresult");
	
	String zipcode		= request.getParameter("zipcode");		
	String address 		= request.getParameter("address1");

	String email 		= request.getParameter("email");
	String homephone 	= request.getParameter("homephone");
	String cellphone 	= request.getParameter("cellphone");	
	
	MemberDTO memberDto = new MemberDTO(no, id, name, password, jumin1, jumin2,
									passquiz, passresult,zipcode, address, email, homephone, cellphone);
	 
	// 수정
	MemberManager.getMembermanager().update(memberDto);
		 
	// 이동
	response.sendRedirect("../main.jsp?contentPage=view&m_id="+memberDto.getId());
//	request.setAttribute("m_id", memberDto.getId());	
//	RequestDispatcher rd = request.getRequestDispatcher("../main.jsp?contentPage=view");
//	rd.forward(request, response);
	

%>


    