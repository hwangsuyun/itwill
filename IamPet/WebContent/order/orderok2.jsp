<%@page import="basket.BasketManager"%>
<%@page import="basket.BasketDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="delivery.DeliveryManager"%>
<%@page import="delivery.DeliveryDTO"%>
<%@page import="guest.GuestManager"%>
<%@page import="guest.GuestDTO"%>
<%@page import="payment.PaymentManager"%>
<%@page import="payment.PaymentDTO"%>
<%@page import="order.OrderManager"%>
<%@page import="order.OrderDAO"%>
<%@page import="order.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
<% 

	 request.setCharacterEncoding("euc-kr");
	
	//String order_no = "order1_seq.nextval";
	//int o_no = Integer.parseInt(order_no);
	int o_no=0;
	//int order_code = 0;
	//String order_date = "sysdate";
	
	String from_name = "IamPet";
	String from_address = "서울시 강남구";
	String from_telephone = "02-999-9999";
	String from_phone = "010-9999-9999";
	String from_email = "hwang@naver.com";
	String member_id = request.getParameter("id");
	System.out.println("장바구니member_id:"+member_id);

	String to_name = request.getParameter("rname");
	String to_zipcode = request.getParameter("rzipcode1");
	String to_address = request.getParameter("raddr1");
	String to_telephone = request.getParameter("rphone1");
	String to_phone = request.getParameter("rphone2");
	String to_email = request.getParameter("email1");
	String message = request.getParameter("omessage");
	String item_code = request.getParameter("item_code");
	String item_price = request.getParameter("item_price");
	
	
	

	
	int i_price = Integer.parseInt(item_price);
	String payment_option = request.getParameter("sPayMethodTmp");
	String payment_status="";
	
	if(payment_option.equals("cash")){
		payment_status = "미결제";		
	}else{
		payment_status= "결제완료";
	}
 
	 int p_no=0;
		String quantity = request.getParameter("quantity");
		int o_quantity = Integer.parseInt(quantity);
		String payment_price = request.getParameter("payment_price");
		int pay_price = Integer.parseInt(payment_price);
		 System.out.println("p_no:"+p_no);
		//System.out.println("order_code:"+order_code);
		System.out.println("o_quantity:"+o_quantity);
		System.out.println("pay_price:"+pay_price);
		System.out.println("payment_option:"+payment_option);
		System.out.println("payment_status:"+payment_status);
			
	String userID = (String)session.getAttribute("m_id");
	
	if(userID ==null){
		   %>
		   <script>
		   	alert("장바구니구매는 로그인후 이용하세요");
		   	location.href='/main.jsp?contentPage=basket';
		   	</script>
		   <%
			}
	
	int g_into = 0;
	GuestDTO gdto = null;
	if(userID==null){
		GuestDTO guestDto = new GuestDTO(to_name, to_zipcode, to_address, to_email, to_phone, "sysdate");
		System.out.println(to_name+" "+guestDto.getG_name());
		System.out.println(to_zipcode+" "+guestDto.getG_zipcd());
		System.out.println(to_address+" "+guestDto.getG_address());
		System.out.println(to_email+" "+guestDto.getG_email());
		System.out.println(to_phone+" "+guestDto.getG_cellphone());
		
		g_into = GuestManager.getGuestManager().create(guestDto);
		System.out.println("비회원정보 입력 여부"+g_into);
		gdto = GuestManager.getGuestManager().findGuest(guestDto.getG_name(), guestDto.getG_email(), guestDto.getG_cellphone());
		if(g_into>0){
			System.out.println("guest완료!");
		}else{
			System.out.println("guest실패!");
		}
	} 

	OrderDTO orderDto = null;
	PaymentDTO paymentDto = null;
	
	//주문코드 번호증가
	int ocup = 0;
	//주문코드 정보불러옴
	int ocinfo = 0;
	//회원정보 입력
	int rows = 0;
	//결제정보 입력
	int rows1 = 0;
	//배송정보 입력
	int rows2 = 0;
	System.out.println("guest 완료");
	DeliveryDTO deliveryDto = null;
		//주문코드 번호증가
		ocup = OrderManager.getOrderManager().ordercodeup();
		System.out.println("ocup : "+ocup);
		//주문코드 정보불러옴
		ocinfo = OrderManager.getOrderManager().ordercodeinfo();
		System.out.println("ocinfo : "+ocinfo);
	try{
		int fee = 0 ;
		
		ArrayList<BasketDTO> List = BasketManager.getBasketManager().findBasket(member_id);
		//회원정보 -> 주문에 저장
		for(BasketDTO bas : List)
		{	
			//fee += bas.getItem_price();
			fee += bas.getItem_price()*bas.getItem_cnt();
			System.out.println("bas.getItem_price()"+bas.getItem_price());
			System.out.println("bas.getItem_code()"+bas.getItem_code());
			if(userID==null)
			{
				System.out.println("order비회원입력1");
				orderDto = new OrderDTO(o_no, ocinfo, "sysdate", gdto.getG_email(), from_name, from_address, from_telephone, from_phone, from_email,
						 gdto.getG_name(), gdto.getG_address(), to_phone, gdto.getG_cellphone(), message, bas.getItem_code(), bas.getItem_price(), payment_option, payment_status);
				System.out.println("order비회원입력2");
				rows = OrderManager.getOrderManager().create(orderDto);
				System.out.println("order비회원입력3");
			}else{
				System.out.println("order회원입력1");
				orderDto = new OrderDTO(o_no, ocinfo, "sysdate", member_id, from_name, from_address, from_telephone, from_phone, from_email,
						 to_name, to_address, to_telephone, to_phone,message, bas.getItem_code(), bas.getItem_price(), payment_option, payment_status);
				System.out.println("order회원입력2");
				rows = OrderManager.getOrderManager().create(orderDto);
				System.out.println("order회원입력3");
			}
		}
		
		System.out.println("quantity:"+quantity);
		System.out.println("fee:"+fee);
		
		//결제정보 입력
		paymentDto = new PaymentDTO(p_no, ocinfo, o_quantity,20000,fee,payment_option,"sysdate",payment_status);
		rows1 = PaymentManager.getPaymentManager().create(paymentDto);
		
		//배송정보 입력
		if(userID==null || userID.equals("")){
			deliveryDto = new DeliveryDTO(ocinfo, to_email,	"배송준비", "", "");
			rows2 = DeliveryManager.getDeliveryManager().insert(deliveryDto);
		}else{
			deliveryDto = new DeliveryDTO(ocinfo, member_id, "배송준비", "", "");
			rows2 = DeliveryManager.getDeliveryManager().insert(deliveryDto);
		}
		
		response.sendRedirect("../main.jsp");
	}catch (Exception e){
		System.out.println(e.getMessage());
		response.sendRedirect("../member/error.jsp");
	} 
	
	
 	
	
		
		
		 	
%>
