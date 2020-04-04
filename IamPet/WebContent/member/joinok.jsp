<%@page import="member.MemberManager"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	
	String id = request.getParameter("id");

	String name = request.getParameter("name");

	String password = request.getParameter("passwd1");

	String jumin1 = request.getParameter("jumin1");

	String jumin2 = request.getParameter("jumin2");

	
	String zipcode = request.getParameter("zipcode");		
	String address = request.getParameter("address1")+request.getParameter("address2");

	
	String passquiz = request.getParameter("passquiz");

	String passreult = request.getParameter("passresult");

	String email = request.getParameter("email1")+"@"+
	request.getParameter("email2");

	String homephone = request.getParameter("callno1")+"-"+
	   request.getParameter("callno2")+"-"+
	   request.getParameter("callno3");

	String cellphone = request.getParameter("mobile1")+"-"+
	   request.getParameter("mobile2")+"-"+
	   request.getParameter("mobile3");

	//out.println(id+" "+name+" "+password+" "+jumin1+" "+jumin2+" "+address+" "+passquiz+" "+passreult
		//	+" "+email+" "+homephone+" "+cellphone);
/*--------------------------------------------------------------------*/
	MemberDTO memberDto = new MemberDTO();
	
	memberDto.setId(id);
	memberDto.setName(name);	
	memberDto.setPassword(password);
	memberDto.setJumin1(jumin1);
	memberDto.setJumin2(jumin2);
	memberDto.setZipcode(zipcode);
	memberDto.setAddress(address);
	memberDto.setPassquiz(passquiz);
	memberDto.setPassresult(passreult);
	memberDto.setEmail(email);
	memberDto.setHomephone(homephone);
	memberDto.setCellphone(cellphone);
		
	int rows=0;
	try{
		rows = MemberManager.getMembermanager().create(memberDto);
		out.println(rows);
		request.setAttribute("name", memberDto.getName());
		request.getRequestDispatcher("joinsuccess.jsp").forward(request, response);
	//	response.sendRedirect("joinsuccess.jsp");
	}catch(Exception e){
		
		e.printStackTrace();
	}
%>