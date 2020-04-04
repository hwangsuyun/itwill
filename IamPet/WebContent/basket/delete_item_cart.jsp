<%@page import="basket.BasketManager"%>
<%@page import="pet.shopping.PetDAO"%>
<%@page import="pet.shopping.PetManager"%>
<%-- <%@page import="basket.ShoppingCart"%> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	//삭제할 고양이 파라메타 받기
  	String c_code = request.getParameter("c_code");
	//리무브 호출하기
	BasketManager.getBasketManager().remove(c_code);
	
	response.sendRedirect("../main.jsp?contentPage=basket");
%>

