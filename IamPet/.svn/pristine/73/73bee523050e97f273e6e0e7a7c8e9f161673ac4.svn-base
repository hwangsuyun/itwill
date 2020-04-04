<%@page import="delivery.DeliveryManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="delivery.DeliveryDTO"%>
<%@page import="payment.PaymentManager"%>
<%@page import="payment.PaymentDTO"%>
<%@page import="order.OrderDTO"%>
<%@page import="order.OrderManager"%>
<%@page import="basket.BasketDTO"%>
<%@page import="basket.BasketManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.PostDTO"%>
<%@page import="member.PostDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberManager"%>
<%@page import="pet.shopping.PetManager"%>
<%@page import="pet.shopping.PetDTO"%>
<%@page import="pet.shopping.PetDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 1. 로그인을 한경우 -->
<%@include file="../login_check.jspf"%>
<%@include file="../geustlogin_check.jspf"%>
<%
	request.setCharacterEncoding("euc-kr");
	String member_id = null;
	String guestE = null;
	ArrayList<OrderDTO> orderCodeList = null;
	
	//로그인 x, 비회원로그인 x :: 걍접속시
	if(guestName==null && userId==null){
		//System.out.println(" 오더리스트 로그인x, 비회원로그인x :: 비회원정보 검색창으로 이동 ");
		%>
			<script>
				alert("로그인하십시오. \n\n비회원은 결제시 입력한 이름, 이메일, 핸드폰 번호로 로그인하십시오.");
				location.href='./main.jsp?contentPage=guestlogin';
			</script>
		<%
	}
	//로그인 상태 o,비회원은 정보를 삭제 :: 로그인시
	else if(userId != null){
		//System.out.println(" 오더리스트 로그인 상태 o,비회원은 정보를 삭제 :: 로그인시 ");
		//비회원정보가 있다면 삭제
		if(session.getAttribute("guestName")!=null || session.getAttribute("guestEmail")!=null){
			//System.out.println(" 오더리스트 비회원정보가 있다면 삭제 ");
			session.removeAttribute("guestName");
			session.removeAttribute("guestEmail");
		}
		member_id = request.getParameter("member_id");
		//System.out.println(" 오더리스트 : " + member_id);
		if(member_id==null){
			//멤버 아이디가 널이면 로그인상태로
			member_id = userId;
			//System.out.println("멤버 아이디가 널이면 로그인상태로 : "+member_id);
		}
		//1. 아이디검색 -> 주문코드 찾아오기 :: 로그인상태일때
		orderCodeList = OrderManager.getOrderManager().findorderCode(member_id);
		//System.out.println("9. 아이디검색 -> 주문코드 찾아오기 :: 로그인상태일때 : "+orderCodeList);
	}else if(userId == null && guestName!=null){
		//System.out.println("9-9. 로그인 x, 비회원정보 o :: 비회원결제리스트보기 "+userId+" "+guestName+" "+guestEmail);
		//1. 아이디검색 -> 주문코드 찾아오기 :: 로그인상태일때
		orderCodeList = OrderManager.getOrderManager().findorderCode(guestEmail);
		//System.out.println(orderCodeList);
		/* for(OrderDTO dto : orderCodeList){
			System.out.println(dto.getOrder_code()+" "+dto.getMember_id());
		} */
	}
	//System.out.println("1. 로그인? 판단여부? -? 진행" + member_id + " " + guestEmail);
%>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript"></script>

<td width="60%" valign="top">
	<!-- body start -->
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
												<td align="right" colspan="8"><font size="2" class="date_fontcssd">* 결제하신 냥이의 이름을 누르시면 해당 냥이의 상세정보페이지로 이동합니다.</font>
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
																<td class="date_fontcssd" height="28" width="16%">주문일자</td>
																<td class="date_fontcssd" width="16%">주문번호</td>
																<td class="date_fontcssd" width="20%">주문상품</td>
																<td class="date_fontcssd" width="16%">주문금액</td>
																<td class="date_fontcssd" width="16%">결제현황</td>
																<td class="date_fontcssd" width="16%">주문처리상태</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<%
												if(member_id!=null || guestName!=null){
														for( OrderDTO orderDTO : orderCodeList ){
															//2. 결제테이블 order_code로 검색해서 리스트 뿔리기
																PaymentDTO payDTO = PaymentManager.getPaymentManager().findOrderCode(orderDTO.getOrder_code());
																//System.out.println("결제 오더리스트 : "+payDTO.getOrder_code());
																DeliveryDTO deliveryDTO = DeliveryManager.getDeliveryManager().findItem(orderDTO.getOrder_code());
																//System.out.println("배송 오더리스트 : "+deliveryDTO.getDelivery_status());
																ArrayList<OrderDTO> onameList = OrderManager.getOrderManager().findname(orderDTO.getOrder_code());
																//System.out.println("주문 오더리스트 : "+onameList.size());
															%>
											<tr bgcolor="#FFFFFF">
												<td bgcolor="eeeeee">
													<table cellpadding="0" cellspacing="1" width="100%"
														border="0">
														<tbody>
															<tr align="center" height="30" bgcolor="#f9f9f9">
																<td class="date_fontcssd" height="28" width="16%"><%= payDTO.getPayment_date() %></td>
																<td class="date_fontcssd" width="16%"><%= payDTO.getOrder_code() %></td>
																<td class="date_fontcssd" width="20%" align="left" style="padding-left: 10px;padding-top: 5px; padding-top: 5px;">
																	<%
																		//String title = "";
																		String tit = "";
																		int num = 0;
																		String petnamecode = "";
																		//System.out.println("0.초기 "+title);
																		//System.out.println("0. 포문 시작 ");
																		for(OrderDTO orderDTO3 : onameList ){
																			//이름을 넣기위해서 순서저장
																			num++;
																			//orderDTO3의 주문코드를 저장 - 타이틀 초기화가 없음
																			if(onameList.size()==num){
																				//System.out.println("99. 타이틀초기화 시켜준다. "+title);
																				//title="";
																				tit="";
																			}
																			//System.out.println("1. 선택한 냥이 숫자 : "+num);
																			PetDTO petDTO = PetManager.getPetManager().findPet(orderDTO3.getItem_code());
																			if(onameList.size()==1){
																				//title += petDTO.getC_name()+":"+petDTO.getC_sex();
																				tit="";
																				tit=petDTO.getC_name()+":"+petDTO.getC_sex();
																				%>
																					<a href="main.jsp?contentPage=shopping/pet_detail&c_name_code=<%=petDTO.getC_name_code()%>" style="padding-bottom: 5px;">&nbsp;<%= tit %></a>
																				<%
																				//System.out.println("1.초기 "+title);
																				//petnamecode = petDTO.getC_name_code(); 
																				//System.out.println("1-2 냥이 이름 : "+num+" "+title);
																				//System.out.println("1-2.초기 "+title);
																			}else{
																				//title += petDTO.getC_name()+":"+petDTO.getC_sex()+", <br/>";
																				if(onameList.size()==num){
																					tit="";
																					tit=petDTO.getC_name()+":"+petDTO.getC_sex();
																					%>
																					<a href="main.jsp?contentPage=shopping/pet_detail&c_name_code=<%=petDTO.getC_name_code()%>" >&nbsp;<%= tit %></a>
																				<%
																					//전체 번호와 증가되는번호 같다면 마지막번호이다.
																					//title += petDTO.getC_name()+":"+petDTO.getC_sex();
																					//System.out.println("1-3-1냥이 이름 : "+num+" "+title);
																					//System.out.println("1-3-1.초기 "+title);
																				}else{
																					tit="";
																					tit=petDTO.getC_name()+":"+petDTO.getC_sex()+", <br/> ";
																					%>
																						<a href="main.jsp?contentPage=shopping/pet_detail&c_name_code=<%=petDTO.getC_name_code()%>" >&nbsp;<%= tit %></a>
																					<%
																					//전체 번호와 증가되는 번호가 다르다면
																					//title += petDTO.getC_name()+":"+petDTO.getC_sex()+", <br/> ";
																					//System.out.println("1-3-2 냥이 이름 : "+num+" "+title);
																					//System.out.println("1-3-2.초기 "+title);
																				}
																			}
																			//System.out.println("2  냥이 이름 : "+num+" "+title);
																			//System.out.println("2  초기 "+title);
																			%>
																				<%-- <a href="main.jsp?contentPage=shopping/pet_detail&c_name_code=<%=petDTO.getC_name_code()%>" ><%=petDTO.getC_name_code()%>&nbsp;<%= title %></a> --%>
																			<%
																		}
																	%>
																</td>
																<td class="date_fontcssd" width="16%">
																	<%= payDTO.getPayment_price()+20000 %>
																</td>
																<td class="date_fontcssd" width="16%">
																	<%= payDTO.getPayment_status() %>
																</td>
																<td class="date_fontcssd" width="16%">
																	<%= deliveryDTO.getDelivery_status() %>
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
											<% } %>
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
												<td align="right" colspan="8"><font size="2" class="date_fontcssd">* 결제하신 냥이는 결제취소가 불가능합니다.</font>
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
	</table> <!-- body end -->
</td>