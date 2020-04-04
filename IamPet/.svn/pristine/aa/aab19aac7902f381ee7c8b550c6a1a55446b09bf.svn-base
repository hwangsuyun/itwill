<%@page import="basket.BasketManager"%>
<%@page import="basket.BasketDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("euc-kr");	
	int no = Integer.parseInt(request.getParameter("basket_no"));	
	int cnt = Integer.parseInt(request.getParameter("basket_cnt"));
	System.out.println("수정 번호 :" + no);
	System.out.println("수정 수량 :" + cnt);
	// 넘버에 해당하는놈을 디비에서 가져온다. 
	BasketDTO basket = BasketManager.getBasketManager().findBasketByNo(no);	
	// 바스켓의 갯수를 변경 
	basket.setItem_cnt(cnt);
	// 디비에 바뀐 정보를 업데이트시킨다.  
	BasketManager.getBasketManager().update(basket);
	
	
	response.sendRedirect("../main.jsp?contentPage=basket");

%>    

    