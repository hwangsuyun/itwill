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
<!-- 1. �α����� �Ѱ�� -->
<%@include file="../login_check.jspf"%>
<%@include file="../geustlogin_check.jspf"%>
<%
	request.setCharacterEncoding("euc-kr");
	String member_id = null;
	String guestE = null;
	ArrayList<OrderDTO> orderCodeList = null;
	
	//�α��� x, ��ȸ���α��� x :: �����ӽ�
	if(guestName==null && userId==null){
		//System.out.println(" ��������Ʈ �α���x, ��ȸ���α���x :: ��ȸ������ �˻�â���� �̵� ");
		%>
			<script>
				alert("�α����Ͻʽÿ�. \n\n��ȸ���� ������ �Է��� �̸�, �̸���, �ڵ��� ��ȣ�� �α����Ͻʽÿ�.");
				location.href='./main.jsp?contentPage=guestlogin';
			</script>
		<%
	}
	//�α��� ���� o,��ȸ���� ������ ���� :: �α��ν�
	else if(userId != null){
		//System.out.println(" ��������Ʈ �α��� ���� o,��ȸ���� ������ ���� :: �α��ν� ");
		//��ȸ�������� �ִٸ� ����
		if(session.getAttribute("guestName")!=null || session.getAttribute("guestEmail")!=null){
			//System.out.println(" ��������Ʈ ��ȸ�������� �ִٸ� ���� ");
			session.removeAttribute("guestName");
			session.removeAttribute("guestEmail");
		}
		member_id = request.getParameter("member_id");
		//System.out.println(" ��������Ʈ : " + member_id);
		if(member_id==null){
			//��� ���̵� ���̸� �α��λ��·�
			member_id = userId;
			//System.out.println("��� ���̵� ���̸� �α��λ��·� : "+member_id);
		}
		//1. ���̵�˻� -> �ֹ��ڵ� ã�ƿ��� :: �α��λ����϶�
		orderCodeList = OrderManager.getOrderManager().findorderCode(member_id);
		//System.out.println("9. ���̵�˻� -> �ֹ��ڵ� ã�ƿ��� :: �α��λ����϶� : "+orderCodeList);
	}else if(userId == null && guestName!=null){
		//System.out.println("9-9. �α��� x, ��ȸ������ o :: ��ȸ����������Ʈ���� "+userId+" "+guestName+" "+guestEmail);
		//1. ���̵�˻� -> �ֹ��ڵ� ã�ƿ��� :: �α��λ����϶�
		orderCodeList = OrderManager.getOrderManager().findorderCode(guestEmail);
		//System.out.println(orderCodeList);
		/* for(OrderDTO dto : orderCodeList){
			System.out.println(dto.getOrder_code()+" "+dto.getMember_id());
		} */
	}
	//System.out.println("1. �α���? �Ǵܿ���? -? ����" + member_id + " " + guestEmail);
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

										<!-- MODULE c_1 ���� -->
										<tbody>
											<tr>
												<td>
													<!-- UNIT u1t ���� --> <img src="./images/order/sub13.gif">
												</td>

											</tr>
											<!-- MODULE c_1 ���� -->

											<tr bgcolor="#FFFFFF">
												<td height="30"></td>
											</tr>
											<tr>
												<td align="right" colspan="8"><font size="2" class="date_fontcssd">* �����Ͻ� ������ �̸��� �����ø� �ش� ������ �������������� �̵��մϴ�.</font>
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
																<td class="date_fontcssd" height="28" width="16%">�ֹ�����</td>
																<td class="date_fontcssd" width="16%">�ֹ���ȣ</td>
																<td class="date_fontcssd" width="20%">�ֹ���ǰ</td>
																<td class="date_fontcssd" width="16%">�ֹ��ݾ�</td>
																<td class="date_fontcssd" width="16%">������Ȳ</td>
																<td class="date_fontcssd" width="16%">�ֹ�ó������</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<%
												if(member_id!=null || guestName!=null){
														for( OrderDTO orderDTO : orderCodeList ){
															//2. �������̺� order_code�� �˻��ؼ� ����Ʈ �Ը���
																PaymentDTO payDTO = PaymentManager.getPaymentManager().findOrderCode(orderDTO.getOrder_code());
																//System.out.println("���� ��������Ʈ : "+payDTO.getOrder_code());
																DeliveryDTO deliveryDTO = DeliveryManager.getDeliveryManager().findItem(orderDTO.getOrder_code());
																//System.out.println("��� ��������Ʈ : "+deliveryDTO.getDelivery_status());
																ArrayList<OrderDTO> onameList = OrderManager.getOrderManager().findname(orderDTO.getOrder_code());
																//System.out.println("�ֹ� ��������Ʈ : "+onameList.size());
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
																		//System.out.println("0.�ʱ� "+title);
																		//System.out.println("0. ���� ���� ");
																		for(OrderDTO orderDTO3 : onameList ){
																			//�̸��� �ֱ����ؼ� ��������
																			num++;
																			//orderDTO3�� �ֹ��ڵ带 ���� - Ÿ��Ʋ �ʱ�ȭ�� ����
																			if(onameList.size()==num){
																				//System.out.println("99. Ÿ��Ʋ�ʱ�ȭ �����ش�. "+title);
																				//title="";
																				tit="";
																			}
																			//System.out.println("1. ������ ���� ���� : "+num);
																			PetDTO petDTO = PetManager.getPetManager().findPet(orderDTO3.getItem_code());
																			if(onameList.size()==1){
																				//title += petDTO.getC_name()+":"+petDTO.getC_sex();
																				tit="";
																				tit=petDTO.getC_name()+":"+petDTO.getC_sex();
																				%>
																					<a href="main.jsp?contentPage=shopping/pet_detail&c_name_code=<%=petDTO.getC_name_code()%>" style="padding-bottom: 5px;">&nbsp;<%= tit %></a>
																				<%
																				//System.out.println("1.�ʱ� "+title);
																				//petnamecode = petDTO.getC_name_code(); 
																				//System.out.println("1-2 ���� �̸� : "+num+" "+title);
																				//System.out.println("1-2.�ʱ� "+title);
																			}else{
																				//title += petDTO.getC_name()+":"+petDTO.getC_sex()+", <br/>";
																				if(onameList.size()==num){
																					tit="";
																					tit=petDTO.getC_name()+":"+petDTO.getC_sex();
																					%>
																					<a href="main.jsp?contentPage=shopping/pet_detail&c_name_code=<%=petDTO.getC_name_code()%>" >&nbsp;<%= tit %></a>
																				<%
																					//��ü ��ȣ�� �����Ǵ¹�ȣ ���ٸ� ��������ȣ�̴�.
																					//title += petDTO.getC_name()+":"+petDTO.getC_sex();
																					//System.out.println("1-3-1���� �̸� : "+num+" "+title);
																					//System.out.println("1-3-1.�ʱ� "+title);
																				}else{
																					tit="";
																					tit=petDTO.getC_name()+":"+petDTO.getC_sex()+", <br/> ";
																					%>
																						<a href="main.jsp?contentPage=shopping/pet_detail&c_name_code=<%=petDTO.getC_name_code()%>" >&nbsp;<%= tit %></a>
																					<%
																					//��ü ��ȣ�� �����Ǵ� ��ȣ�� �ٸ��ٸ�
																					//title += petDTO.getC_name()+":"+petDTO.getC_sex()+", <br/> ";
																					//System.out.println("1-3-2 ���� �̸� : "+num+" "+title);
																					//System.out.println("1-3-2.�ʱ� "+title);
																				}
																			}
																			//System.out.println("2  ���� �̸� : "+num+" "+title);
																			//System.out.println("2  �ʱ� "+title);
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
												<td colspan="8" align="center" valign="middle" class="date_fontcssd">���õ� ��ǰ�� �����ϴ�.</td>
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
												<td align="right" colspan="8"><font size="2" class="date_fontcssd">* �����Ͻ� ���̴� ������Ұ� �Ұ����մϴ�.</font>
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