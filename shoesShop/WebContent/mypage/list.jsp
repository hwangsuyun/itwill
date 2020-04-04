<%@page import="member.MemberManager"%>
<%@page import="order.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="order.OrderManager"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
	 String m_id = (String)session.getAttribute("m_id");
	 MemberDTO memberDto = null;
	 //System.out.println("m_id:"+m_id);	
	
	if(m_id==null){
		

 %>   
	<script>
	alert("로그인하거나 비회원주문조회 이용바람");
	location.href="./main.jsp?contentPage=login"
	</script>   
    
<%
	}else{
		ArrayList<OrderDTO> List = null;
		OrderDTO orderDto = null;
		try{
			//orderDto = OrderManager.getOrdermanager().findOne(m_id);
			memberDto = MemberManager.getMembermanager().findOne(m_id);
			List = OrderManager.getOrdermanager().find(m_id);	
		}catch(Exception e){
			
		}
%>    
    
<td width="100%" valign="middle">
	<table cellspacing=0 cellpadding=0 border=0>

		<tr>
			<td height=1><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table> 
	<!-- 내용 시작  -->
	
	
	
	
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tbody>
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td valign="top" width="1026" bgcolor="#FFFFFF" align="center">
									<table width="800" height="100%" border="0" cellspacing="0"
										cellpadding="0">

										<!-- MODULE c_1 시작 -->
										<tbody>
											<tr>
												<td>
													<!-- UNIT u1t 시작 --> <img src="./images/order/sub13.gif">
												</td>

											</tr>
											<!-- MODULE c_1 종료 -->

											<tr bgcolor="#FFFFFF">
												<td height="30"></td>
											</tr>
											<tr>
												<td align="right" colspan="8"><font size="2" class="date_fontcssd">* 결제한 상품을 누르면 해당 상품의 상세 페이지로 이동합니다.</font>
											</tr>
											<tr bgcolor="#FFFFFF">
												<td height="5"></td>
											</tr>
											<tr bgcolor="#FFFFFF">
												<td bgcolor="eeeeee">
													<table cellpadding="0" cellspacing="1" width="100%"
														border="0">
														<tbody>
															<tr align="center" height="30" bgcolor="#F1F1F1" >
																<td class="date_fontcssd" height="28" width="20%">주문자이름</td>
																<td class="date_fontcssd" width="25%">주문상품</td>
																<td class="date_fontcssd" width="20%">주문금액</td>
																<td class="date_fontcssd" width="20%">결제현황</td>
																<td class="date_fontcssd" width="20%">주문처리상태</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											
											<%
												if(List!=null){
													for(OrderDTO order : List){
												
											%>
											
											
											<tr bgcolor="#FFFFFF">
												<td bgcolor="eeeeee">
													<table cellpadding="0" cellspacing="1" width="100%"
														border="0">
														<tbody>
															<tr align="center" height="30" bgcolor="#f9f9f9">
																<td class="date_fontcssd" height="28" width="20%"><%=memberDto.getM_name() %></td>
																
																<td class="date_fontcssd" width="20%" align="left" style="padding-left: 10px;padding-top: 5px; padding-top: 5px;">
																	
																				
																					<a href="../main.jsp?contentPage=shopping/detail&p_code=<%=order.getP_code()%>" style="padding-bottom: 5px;">
																							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																					<%=order.getP_engname() %>/<%=order.getP_name() %></a>
																
																					
																</td>
																<td class="date_fontcssd" width="25%">
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<%=order.getP_price()%>(<%=order.getP_quantity()%>)=<%=order.getP_price()*order.getP_quantity()%>
																</td>
																<td class="date_fontcssd" width="20%">
																	<%=order.getPayment_way() %>
																</td>
																<td class="date_fontcssd" width="20%">
																	준비중
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											
											<%
													}
											
								
												}else{
											%>
											
											<tr bgcolor="ffffff">
												<td class="txt_pro" colspan="8" height="10" bgcolor="ffffff" align="center"></td>
											</tr>
											<tr>
												<td colspan="8" align="center" valign="middle" class="date_fontcssd">선택된 상품이 없습니다.</td>
											</tr> 
											
											<%} %>
											
											<tr bgcolor="ffffff">
												<td class="txt_pro" colspan="8" height="10" bgcolor="ffffff"
													align="center">&nbsp;</td>
											</tr>
											<!-- <tr bgcolor="eeeeee">
												<td class="txt_pro" height="1" colspan="8" bgcolor="eeeeee"
													align="center"></td>
											</tr> -->
								
											<!-- Line 3 -->
											<tr>
												<td align="right" colspan="8"><font size="2" class="date_fontcssd">* 결제취소를 원하면 연락바람</font>
											</tr>
											
												<td class="txt_pro" colspan="8" height="10" align="center"></td>
											</tr>
											
											<tr bgcolor="#FFFFFF">
												<td height="10"></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	

	<!-- 내용 끝  -->

	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=20><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table>
</td>
<%
}
%>
	