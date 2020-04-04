<%@page import="basket.BasketManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String m_id = request.getParameter("m_id");
	int rows = 0;
	try{
		rows = BasketManager.getBasketmanager().delete(m_id); 
	}catch(Exception e){
		
	}
	
%>

<script>
	location.href = "../main.jsp?contentPage=basket";
</script>