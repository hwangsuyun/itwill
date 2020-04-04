<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    

<%
		
	request.setCharacterEncoding("EUC-KR");
	

	
	String id =(String)session.getAttribute("id");
	if(id == null){
		out.println("<script>");
		out.println("alert('로그아웃되었습니다.');");
		out.println("location.href='main.jsp';");
		out.println("</script>");
	
	}else{
		out.println("<script>");
		out.println("alert('로그아웃되었습니다.');");
		out.println("location.href='main.jsp';");
		out.println("</script>");
		session.invalidate();
	response.sendRedirect("main.jsp");
	}
	
 %>
 
 