<%@page import="basket.BasketManager"%>
<%@page import="basket.BasketDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("euc-kr");	
	int no = Integer.parseInt(request.getParameter("basket_no"));	
	String count = request.getParameter("count");
	if(count == null) count = "";
		
	// 넘버에 해당하는놈을 디비에서 가져온다. 
	BasketDTO basket = BasketManager.getBasketManager().findBasketByNo(no);	
	// 바스켓의 갯수를 변경 
	int cnt = basket.getItem_cnt();
	if(count.equals("up"))
	{
		cnt++;
	}
	else if(count.equals("down"))
	{
		cnt--;
		if(cnt <= 1) cnt = 1;
	}
	else 
	{
		System.out.println("잘못된 접근");
		response.sendRedirect("../main.jsp?contentPage=basket");
		return;
	}
	
	basket.setItem_cnt(cnt);
	// 디비에 바뀐 정보를 업데이트시킨다.  
	BasketManager.getBasketManager().update(basket);
	
	response.sendRedirect("../main.jsp?contentPage=basket");

%>    

    