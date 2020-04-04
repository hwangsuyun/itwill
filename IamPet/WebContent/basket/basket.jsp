<%@page import="java.util.HashMap"%>
<%@page import="pet.shopping.PetDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="basket.BasketManager"%>
<%@page import="basket.BasketDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="pet.shopping.PetDTO"%>
<%@page import="pet.shopping.PetManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	 <!-- 로그인 했는지 안했는지 확인 -->    
<%@include file="../login_check.jspf" %> 
<%
	request.setCharacterEncoding("EUC-KR");
	
	ArrayList basketList = null;
	
	String gubun_id = "";
	
	if(userId==null){
		//System.out.println("아이디가  null이다.");
		String member_id = session.getId();
		basketList =BasketManager.getBasketManager().findBasketJoin(session.getId());
		
		gubun_id = member_id;
		
	}else{
		//System.out.println("아이디가  null이 아니다.");
		
		basketList = BasketManager.getBasketManager().findBasketJoin(userId);
		System.out.println("loginList 샤이즈:"+basketList.size());
		gubun_id = userId;
	}
	
	
%>

<script type="text/javascript">

	function checkbox_delete(){
		
		var chckType = document.getElementsByName('checkbox');
		
		var checkStatus = false;
		
		for(var i = 0; i < chckType.length; i++){
			
			if(chckType[i].checked == true){
				
				var basket_no = chckType[i].value;
				location.href="./basket/basket_deleteAction.jsp?basket_no="+basket_no;
				checkStatus = true;
			}
		}
		if(checkStatus == false){
			alert("삭제할 상품을 선택해주세요"); 
		}
	}
	 function basket_allDelete() 
	 {	
		if(confirm("장바구니를 전체 삭제하시겠습니까?"))
			{
				location.href="./basket/basket_deleteAllAction.jsp?userId=<%=gubun_id%>";
			}
	} 
</script>


<td width="60%" valign="top">
	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=1><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table> 
	
	<!-- Line 1 -->
	<table align="center">
		<td bgcolor="#FFFFFF" align="center"></td>
		<img src="./images/basket/sub04.gif">
	</table>

	<table>
		<tr>
			<td>
			<td width="10"><img src="./images/basket/main_n_bl.gif" border=0
				align="left"></td>
			<td width="90%" class=date_fontcssd>장바구니 | <b>일반 상품 </b></td>
			</td>
		</tr>
	</table>
	
	<!--  form start -->
	<form name="basket">

	<table width="100%" border="0" cellspacing="0" cellpadding="3">
		<tr>
			<td class="txt_pro" height="1" colspan="6" bgcolor="eeeeee"	align="center"></td>
		</tr>
		<tr>
			<td width="20%" bgcolor="#F6F6F6" height="10" align="center" class=date_fontcssd>배송구분</td>
			<td width="35%" bgcolor="#F6F6F6" align="center" style="word-break: break-all" class=date_fontcssd>상품명</td>
			<td width="10%" bgcolor="#F6F6F6" align="center" class=date_fontcssd>판매가</td>
			<td width="10%" bgcolor="#F6F6F6" align="center" class=date_fontcssd>수량</td>			
			<td width="10%" bgcolor="#F6F6F6" align="center" class=date_fontcssd>합계</td>
			<td width="10%" bgcolor="#F6F6F6" align="center" class=date_fontcssd>삭제</td>
		</tr>
		<tr>
			<td class="txt_pro" height="1" colspan="6" bgcolor="eeeeee" align="center"></td>
		</tr>
		<br>

<%
if(basketList.size()==0){
	%>
	
	<tr><td colspan="6" align="center"><img src="./images/basket/cart_empty.gif"></td></tr>
	<%
}
%>
		<!-- Line 2 -->
		
		<%
			HashMap map = null;
			String name_code = ""; 
			for(int i=0; i<basketList.size(); i++){
				
				map =(HashMap)basketList.get(i);
				String basket_no = (String)map.get("basket_no");
				String part_code = (String)map.get("part_code");
						name_code = (String)map.get("name_code");
				String item_name = (String)map.get("item_name");
				String item_sex = (String)map.get("item_sex");
				String item_price = (String)map.get("item_price");
				String item_cnt = (String)map.get("item_cnt");
		%>	
		
		<input type="hidden" name="basket_no" value="">
				
		<tr bgcolor="#FFFFFF">
			<td align="center" class=date_fontcssd rowspan="2">기본배송</td>
			
			<td>
				<img src='./images/<%=part_code %>/<%=name_code %>/<%=name_code %>_0001.jpg' width="50" height="50"> 
				<a href=main.jsp?contentPage=shopping/pet_detail&c_name_code=<%=name_code %>><%= item_name %><font color=#aaaaaa size="3"> &nbsp;성별:<%= item_sex %>
				</a>
			</td>
			
			<td align="center" class=date_fontcss>
				<input type="hidden" name="one_price" value="<%= item_price%>"><%= item_price%>원
			</td>
			
			<td align="center" class=date_fontcssd>
				<input size="2" value="<%= item_cnt %>" name="basket_cnt" class="input01" readonly> 
				<a href="basket/basketUpdateCount.jsp?basket_no=<%=basket_no %>&count=up">▲</a>
				<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="basket/basketUpdateCount.jsp?basket_no=<%=basket_no %>&count=down">▽</a>
			</td>
			
			<td align="center" class=date_fontcss><%=Integer.parseInt(item_price)* Integer.parseInt(item_cnt)%>원<br>
			</td>
			
			<td width=50 height=26 align=center class=t1><a href=basket/delete_item_cart.jsp?c_code= class=m1>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="<%=basket_no%>"></a></td>
		</tr>
		<tr bgcolor="ffffff">
			<td class="txt_pro" colspan="6" height="10" bgcolor="ffffff" align="center"></td>
		</tr>
		<tr bgcolor="eeeeee">
			<td class="txt_pro" height="1" colspan="6" bgcolor="eeeeee" align="center"></td>
		</tr>
		
		<%
		}	
			 %>
		
			<%-- <tr><td class=date_fontcssd colspan="6" height="27" align="right">
			<!--주문하기 버튼-->
			<a href="main.jsp?contentPage=order/order&c_name_code=<%=name_code %>">
		<img src="./images/basket/b_icon_order.gif" name="image" border="0"></a>
			</td></tr>
		</tr> --%>
		<tr>
			<td class="txt_pro" height="1" colspan="6" bgcolor="eeeeee"
				align="center"></td>
		</tr>
	
		
		<%
						//고양이 가격 계산
						int cats_price = 0 ;	//고양이 가격
						int deliveryFee = 20000;//배송가격
						int cats_cnt = 0;
						int tot_price = 0 ;	//토탈
						int oneTotPrice=0;
							
						HashMap map2 = null;
						
						for (int i = 0; i < basketList.size(); i++) {
							
							map2 =(HashMap)basketList.get(i);
							String item_price = (String)map2.get("item_price");
							String item_cnt = (String)map2.get("item_cnt");
							cats_cnt = cats_cnt + Integer.parseInt(item_cnt);
							oneTotPrice = Integer.parseInt(item_price)* Integer.parseInt(item_cnt);
							cats_price = cats_price + oneTotPrice;
						}
							//System.out.println("cats_cnt:"+cats_cnt);

						/* if (cats_cnt>0 && cats_cnt < 3) {
							deliveryFee = 20000;
						} else if (cats_cnt >= 3 || cats_cnt==0) {
							deliveryFee = 0;
						} */

						tot_price = cats_price + deliveryFee;
					%>
		
		<!-- Line 4 -->
			<tr>
			<td valign="middle" colspan="6">
				<table width="100%" border="0" cellspacing="3" cellpadding="0"
					bgcolor="eeeeee">
					<tr>
						<td bgcolor="#FFFFFF">
							<table width="100%" border="0" cellspacing="3" cellpadding="0"
								bgcolor="ffffff">
								<tr>
									<td width="230" bgcolor="ffffff" class=date_fontcssd>&nbsp;<strong>고객님의
											총 주문 합계 금액입니다.</strong></td>
									<td align="right" style="padding: 7 12 7 0" bgcolor="ffffff">
										<table width="100%" border="0" cellspacing="0" cellpadding="0"
											bgcolor="ffffff">
											<tr>
												<td bgcolor="ffffff" align="right" height="20"
													class=date_fontcssd>상품 합계금액&nbsp;&nbsp;:</td>
												<td bgcolor="ffffff" align="right" style="padding-left: 20"
													class=date_fontcssd><%=cats_price %>원</td>
											</tr>
											<tr>
												<td bgcolor="ffffff" align="right" height="20"
													class=date_fontcssd>배송비&nbsp;&nbsp;:</td>
												<td bgcolor="ffffff" align="right" style="padding-left: 20"
													class=date_fontcssd><%=deliveryFee %>원</td>
											</tr>
											<tr>
												<td bgcolor="ffffff" align="right" height="20"
													class=date_fontcssd><strong>총 주문합계 금액</strong>&nbsp;&nbsp;:</td>
												<td bgcolor="ffffff" align="right" style="padding-left: 20"
													class=date_fontcssd><strong><span
														class="font_sum"><%=tot_price %> 원</span></strong></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		</form>
		<!--  form end -->

		<!-- Line 5 -->

		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height=10></td>
			</tr>
			<tr>
				<td height=60 align="right"><a>
				<!-- 전부 삭제  -->
				<img src="./images/basket/order_icon02.gif" name="image" border="0"	hspace="0" onClick="basket_allDelete();"></a> 
				<!-- 체크박스 삭제 -->
				<img src="./images/basket/order_icon03.gif" name="image" border="0" hspace="0" onClick="checkbox_delete();"> 
				<!-- 전체주문 -->
				<span style="display:"><a href="./main.jsp?contentPage=orderAllBuy&name_code=<%=name_code %>&member_id=<%=gubun_id%>">
				<img src="./images/basket/order_icon06.gif" name="image" border="0"></a></span> <!--주문하기 버튼--> 
				<a href="./main.jsp"> <img src="./images/basket/order_icon05.gif" name="image" border="0"></a></td>
			</tr>
			<tr>
				<td height=10></td>
			</tr>
			

			<tr>
				<td width="100%" class="date_fontcssd"><b><img
						src="./images/basket/main_n_bl.gif" border=0 align="absmiddle">장바구니이용안내</b></td>


			</tr>
			<td width="100%" class="date_fontcssd"><img
				src="./images/basket/main_n_bl.gif" border=0 align="absmiddle"><font
				size="2">무이자할부 상품 주문의 경우, 무이자할부 혜택을 받으시려면 "장바구니 - 무이자할부 상품"
					아래의 [주문하기] 버튼을 눌러 주문/결제<br>&nbsp;&nbsp;&nbsp; 하시면 됩니다.
			</font></td>
			</tr>
			<tr>
				<td width="100%" class="date_fontcssd"><img
					src="./images/basket/main_n_bl.gif" border=0 align="absmiddle"><font
					size="2">[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가
						이루어집니다.<br>&nbsp;&nbsp; 단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을
						받으실 수 없습니다.
				</font></td>
			</tr>
			<tr>
				<td width="100%" class="date_fontcssd"><img
					src="./images/basket/main_n_bl.gif" border=0 align="absmiddle"><font
					size="2">선택하신 상품의 수량을 변경하시려면 수량변경 후 [수정] 버튼을 누르시면 됩니다. <br>&nbsp;&nbsp;
						[쇼핑 계속] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.
				</font></td>
			</tr>
			<tr>
				<td width="100%" class="date_fontcssd"><img
					src="./images/basket/main_n_bl.gif" border=0 align="absmiddle"><font
					size="2">장바구니에 담긴 상품은 7일 동안 보관됩니다.<br>&nbsp;&nbsp; 보관된
						상품은 7일 이후에 삭제되오니 장바구니에서 삭제된 경우 다시 장바구니에 담으시기 바랍니다.
				</font></td>
			</tr>
		</table>
</td>
</tr>


<table cellspacing=0 cellpadding=0 border=0>
	<tr>
		<td height=20><spacer type=BLOCK height=10 width=100%></td>
	</tr>
</table>
</td>

