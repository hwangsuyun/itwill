<%@page import="basket.BasketDTO"%>
<%@page import="basket.BasketManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String basket_code = request.getParameter("basket_code");
	String count = request.getParameter("count");
	String m_id = request.getParameter("m_id");
	
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



%>
<script type="text/javascript">
		location.href='../main.jsp?contentPage=orderAll&basket_code=<%=basket_code%>&m_id=<%=m_id%>';
		</script>
