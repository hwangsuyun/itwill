<%@page import="basket.BasketManager"%>
<%@page import="basket.BasketDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	response.setCharacterEncoding("euc-kr");

	String m_id = (String) session.getAttribute("m_id");
	if (m_id == null) {
		m_id = session.getId();
	}

	int basket_code = 0;
	String p_engname = request.getParameter("p_engname");
	String p_name = request.getParameter("p_name");
	String price = request.getParameter("p_price");
	int p_price = Integer.parseInt(price);
	String p_code = request.getParameter("p_code");
	/* System.out.println("p_code:"+p_code); */
	BasketDTO basketDto = new BasketDTO(basket_code, m_id, p_code, p_engname,
			p_name, p_price, 1);
	int rows = 0;
	try {
		rows = BasketManager.getBasketmanager().insert(basketDto);
	} catch (Exception e) {

	}
	
	
	
%>
<script type="text/javascript">
		var contentPage = "basket";
		location.href="./main.jsp?contentPage="+contentPage+"&p_code="+<%=p_code%>;
		</script>
	
	
	

