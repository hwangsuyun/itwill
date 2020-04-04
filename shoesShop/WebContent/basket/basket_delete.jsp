<%@page import="basket.BasketManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String basket_code = request.getParameter("basket_code");
	
	int rows = 0;
	try{
		rows = BasketManager.getBasketmanager().remove(basket_code);
	
	}catch(Exception e){
		
	}
	
%>

<script>
	location.href = "../main.jsp?contentPage=basket";
</script>