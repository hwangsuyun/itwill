<%@page import="basket.BasketManager"%>
<%@page import="pet.shopping.PetDAO"%>
<%@page import="pet.shopping.PetManager"%>
<%-- <%@page import="basket.ShoppingCart"%> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	//������ ����� �Ķ��Ÿ �ޱ�
  	String c_code = request.getParameter("c_code");
	//������ ȣ���ϱ�
	BasketManager.getBasketManager().remove(c_code);
	
	response.sendRedirect("../main.jsp?contentPage=basket");
%>

