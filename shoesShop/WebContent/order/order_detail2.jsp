<%@page import="basket.BasketDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="basket.BasketManager"%>
<%@page import="order.OrderDTO"%>
<%@page import="order.OrderManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	
	String m_id=request.getParameter("m_id");
	if(m_id==null){
		m_id=session.getId();
	}
	String cell=request.getParameter("cell");
	String email=request.getParameter("email");
	String raddr=request.getParameter("raddr");
	/* String p_code=request.getParameter("p_code");
	System.out.println("p_code:"+p_code);
	String p_engname=request.getParameter("p_engname");
	System.out.println("p_engname:"+p_engname);
	String p_name=request.getParameter("p_name");
	System.out.println("p_name:"+p_name);
	String quantity=request.getParameter("quantity");
	int p_quantity = Integer.parseInt(quantity);
	System.out.println("quantity:"+quantity);
	String price=request.getParameter("p_price");
	System.out.println("price:"+price);
	int p_price = Integer.parseInt(price);  */
	String pay_type=request.getParameter("pay_type");
	/* System.out.println("pay_type:"+pay_type); */
	
	 ArrayList<BasketDTO> List = BasketManager.getBasketmanager().find(m_id);
	 
	 for(BasketDTO basketDto : List){ 
		 
		 
		 OrderDTO orderDto = new OrderDTO(0,m_id,cell,email,raddr,
				 						  basketDto.getP_code(),basketDto.getP_engname(),
				 						  basketDto.getP_name(),basketDto.getP_quantity(),
				 						  pay_type,basketDto.getP_price());
	 	int rows = OrderManager.getOrdermanager().insert(orderDto);
	 
	 }	 
%>
	<script>
		alert("결제완료! 주문내역은 마이페이지에서 확인바랍니다.");
		location.href="../main.jsp";
	</script>	 
		 