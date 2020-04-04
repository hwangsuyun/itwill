<%@page import="basket.BasketDTO"%>
<%@page import="basket.BasketManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String basket_code = request.getParameter("basket_code");
	String count = request.getParameter("count");
	/* System.out.println("count:"+count); */
	BasketDTO basketDto = BasketManager.getBasketmanager().findbasket(basket_code);
	
	int quantity = basketDto.getP_quantity();
	if(count.equals("up")){
		quantity++;
	}else if(count.equals("down")){
		quantity--;
		if(quantity<=1) quantity=1;
	}
	
	basketDto.setP_quantity(quantity);
	
	BasketManager.getBasketmanager().update(basketDto);
	/* System.out.println("수정완료");	 */
	response.sendRedirect("../main.jsp?contentPage=basket");

%>