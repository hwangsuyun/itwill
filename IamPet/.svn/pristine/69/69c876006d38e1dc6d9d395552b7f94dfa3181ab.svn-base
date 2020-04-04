<%@page import="basket.BasketManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%

	String userId = request.getParameter("userId");
	System.out.println("userId->"+userId);

	BasketManager.getBasketManager().remove(userId);
	
	
 %>

<script type="text/javascript">
	 	var contentPage = "basket";
		location.href="../main.jsp?contentPage="+contentPage; 
</script>