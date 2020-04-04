<%@page import="order.OrderDTO"%>
<%@page import="order.OrderManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	
	String m_id=request.getParameter("m_id");
	if(m_id.equals("null")){
		m_id=session.getId();
	}
	String cell=request.getParameter("cell");
	String email=request.getParameter("email");
	String raddr=request.getParameter("raddr");
	String p_code=request.getParameter("p_code");
	String p_engname=request.getParameter("p_engname");
	String p_name=request.getParameter("p_name");
	String quantity=request.getParameter("quantity");
	int p_quantity = Integer.parseInt(quantity);
	String pay_type=request.getParameter("pay_type");
	String price=request.getParameter("p_price");
	int p_price = Integer.parseInt(price); 
	
	 OrderDTO orderDto = new OrderDTO(0,m_id,cell,email,raddr,p_code,p_engname,p_name,p_quantity,pay_type,p_price);

	
	int rows=0;
	try{
		 rows = OrderManager.getOrdermanager().insert(orderDto);
%>
	<script>
		alert("결제완료! 주문내역은 마이페이지에서 확인바랍니다.");
		location.href="../main.jsp";
	</script>	 
		 
		 
<%		 
	}catch(Exception e){
		e.printStackTrace();
	}
 


%>