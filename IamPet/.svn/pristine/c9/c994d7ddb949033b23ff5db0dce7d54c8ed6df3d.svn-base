<%@page import="member.MemberManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	String removeid = request.getParameter("id");

	MemberManager.getMembermanager().remove(removeid);
	session.invalidate(); 
	response.sendRedirect("../main.jsp");
%>

