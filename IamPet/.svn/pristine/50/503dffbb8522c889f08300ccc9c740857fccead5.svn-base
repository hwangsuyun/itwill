<%@page import="basket.BasketManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%

	String basket_no = request.getParameter("basket_no");
	//System.out.println("basket_no->"+basket_no);

		BasketManager.getBasketManager().DeleteByNo(basket_no);
	
	
	
 %>

<script type="text/javascript">
	 	var contentPage = "basket";
		location.href="../main.jsp?contentPage="+contentPage; 
</script>