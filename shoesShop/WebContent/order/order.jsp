<%@page import="member.MemberManager"%>
<%@page import="member.MemberDTO"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	response.setCharacterEncoding("euc-kr");
	
	String m_id = request.getParameter("m_id");

	String quantity = request.getParameter("quantity");
	String p_code = request.getParameter("p_code");
	int quantity2 = Integer.parseInt(quantity);

	 ProductDTO productDto =	ProductManager.getMembermanager().findOne(p_code);
	
	
	
	
%>
<script>
function add_basket(){
	count.quantity.value++;
	location.href="main.jsp?contentPage=order&p_code=<%=p_code%>&quantity="+count.quantity.value;
	}
function minus_basket(){
	count.quantity.value--;
	location.href="main.jsp?contentPage=order&p_code=<%=p_code%>&quantity="+count.quantity.value;
}



function copyInfo(){
	var chckType = document.getElementsByName('copy_info');
	var checkStatus = false;
	
	for(var i = 0; i < chckType.length; i++){
		
		if(chckType[i].checked == true){
			buyer.rname.value = buyer.name.value;
			buyer.rphone.value = buyer.phone.value;
			buyer.rcell.value = buyer.cell.value;
			checkStatus = true;
		}else{
			buyer.rname.value = "";
			buyer.rphone.value = "";
			buyer.rcell.value = "";
			checkStatus = false;
		}
	}
}

function use(){
	
}

function confirmOrder(){
	if ((buyer.name.value=="") || (buyer.name.value==null)) {
		alert("이름을 입력하여 주세요.");
		buyer.name.focus();
	} else if ((buyer.phone.value=="") || (buyer.phone.value==null)) {
		alert("전화번호를 입력하여 주세요.");
		buyer.phone.focus();
	} else if ((buyer.cell.value=="") || (buyer.cell.value==null)) {
		alert("휴대폰 번호를 입력하여 주세요.");
		buyer.cell.focus();
	} else if ((buyer.email.value=="") || (buyer.email.value==null)) {
		alert("이메일을 입력하여 주세요.");
		buyer.email.focus();
	} else if ((buyer.rname.value=="") || (buyer.rname.value==null)) {
		alert("이름을 입력하여 주세요.");
		buyer.rname.focus();
	} else if ((buyer.rphone.value=="") || (buyer.rphone.value==null)) {
		alert("전화번호를 입력하여 주세요.");
		buyer.rphone.focus();
	} else if ((buyer.rcell.value=="") || (buyer.rcell.value==null)) {
		alert("휴대폰 번호를 입력하여 주세요.");
		buyer.rcell.focus();
	} else if ((buyer.raddr.value=="") || (buyer.raddr.value==null)) {
		alert("주소를 입력하여 주세요.");
		buyer.raddr.focus();
	} else if (!isNaN(buyer.name.value)) {
		alert("숫자는 쓸 수 없습니다.");
		buyer.name.focus();
	} else if (!isNaN(buyer.rname.value)) {
		alert("숫자는 쓸 수 없습니다.");
		buyer.rname.focus();
	} else {
		message = "결제하시겠습니까?";
		if (confirm(message) == true) {
			buyer.action = "order/order_detail.jsp";
			buyer.method = "post";
			buyer.submit();
		} else {

		}
	}
}




</script>

<td width="80%" valign="top">
	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=1><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table> <!-- 내용 시작  --> 
	
	
	<img src="./images/order/shop_step2[1].gif"
	alt="주문 스텝 2단계 주문서작성" title="" />
		
			<h3>
				<img src="./images/order/order_detail01[1].gif" border="0" alt="">
			</h3>
			<div id="boxTop">
				<div class="boxTopleft"></div>
				<div class="boxTopright"></div>
			</div>
			<div id="boxMiddle">
				
	
				<form name="count" action="confirmOrder()">
				
			 
					
					
					
					
				<table cellspacing="2" cellpadding="2" id="boxStyle">
		<colgroup>
			<col width="60%"></col>
			<col width=""></col>
			<col width="8%"></col>
			<col width=""></col>
			<col width=""></col>
			<col width="6%"></col>
		</colgroup>
		
	
		
		
		<thead>
		<tr>						
			<th class="prdName"><img src="./images/order/title01[1].gif" border="0" alt="상품명" /></th>
			<th><img src="./images/order/title02[1].gif" border="0" alt="상품가격" /></th>
			<th><img src="./images/order/title03[1].gif" border="0" alt="수량" /></th>
			<th><img src="./images/order/title04[1].gif" border="0" alt="적립금" /></th>
			<th><img src="./images/order/title05[1].gif" border="0" alt="합계" /></th>
		
		</tr>
		</thead>

	
	<tbody>
		<tr>
			<td style="text-align:left;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<img src="./images/product/<%=productDto.getP_engname()%>/<%=productDto.getP_engname()%>1.jpg" width="50" height="50" border="0"> 
			<a href="main.jsp?contentPage=shopping/detail&p_code=<%=productDto.getP_code()%>"><%=productDto.getP_engname() %></a> (Colors.:Black.,  Sizes.:265.)</td>
			<td style="text-align:right;"><%=productDto.getP_price() %></td>
			<td>
			<table cellspacing="0" cellpadding="0">
				<tr>
					<td rowspan="2" style="padding-bottom:5px;"><input type="text" name="quantity" value="<%=quantity %>" class="ea" " /></td>
					<td style="padding-left:5px;" valign="bottom"><a href="javascript:add_basket()"><img src="./images/basket/ea_up[1].gif" border="0" alt="수량 증가" title="" /></a></td>
				</tr>
				<tr>
					<td style="padding-left:5px;" valign="top"><a href="javascript:minus_basket()"><img src="./images/basket/ea_down[1].gif" border="0" alt="수량 감소" title="" /></a></td>
				</tr>
			</table>
			</td>
			<td style="text-align:right;">4,500 원</td>
			<td style="text-align:right;"><%=productDto.getP_price()*quantity2 %></td>
			
		</tr>
</tbody>
</form>
						<tfoot>
							<tr>
								<td colspan="6" align="right">
									<ul class="fr">
										<li>주문수량합계 : <%=productDto.getP_price()*quantity2 %> 원</li>
										<!--..K..Y…‥·
							<li>이벤트 할인 : 0 원</li>
	·‥…S..Y..//-->
										<li>배송료 : 무료</li>
										<li>총 결제금액 : <%=productDto.getP_price()*quantity2 %> 원</li>
										<!--..K..Y…‥·
							<li>총 적립금 : 8,900 원</li>
	·‥…S..Y..//-->
										<!--..K..Y…‥·
							<li>이벤트 추가 적립금 : 0</li>
	·‥…S..Y..//-->
									</ul>
								</td>
							</tr>
						</tfoot>
					</table>
					</div>
					<div id="boxBottom">
						<div class="boxBottomleft"></div>
						<div class="boxBottomright"></div>
					</div>

					<h3>
						<img src="./images/order/order_detail03[1].gif" border="0" alt="">
					</h3>
					<div id="boxTop">
						<div class="boxTopleft"></div>
						<div class="boxTopright"></div>
					</div>
					<div id="boxMiddle">
								<form name="buyer" method="post" action="javascript:confirmOrder(),order_detail.jsp" >
			    <input type="hidden" name="p_engname" value="<%=productDto.getP_engname()%>">
				<input type="hidden" name="p_name" value="<%=productDto.getP_name()%>">
				<input type="hidden" name="p_code" value="<%=p_code%>"> 
				<input type="hidden" name="quantity" value="<%=quantity%>"> 
				<input type="hidden" name="p_price" value="<%=productDto.getP_price()*quantity2 %>"> 
				<input type="hidden" name="m_id" value="<%=m_id %>"> 
						
						<table cellspacing="2" cellpadding="2" id="boxStyle2">
							<colgroup>
								<col width="15%"></col>
								<col width="85%"></col>
							</colgroup>
							
							<tr>
								<th>&nbsp;주문하시는 분</th>
								<td><input type="text" name="name" value=""
									class="input" style="width: 150px;" /> 
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" name="phone"
									id="buyer_phone" value="" class="input" style="width: 150px;"
									maxlength="15" /></td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td><input type="text" name="cell" id="buyer_cell"
									value="" class="input" style="width: 150px;" maxlength="15" />
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="text" name="email" value=""
									class="input" style="width: 300px;" /></td>
							</tr>
						</table>
						
						
						
						
						
						
						
					</div>
					<div id="boxBottom">
						<div class="boxBottomleft"></div>
						<div class="boxBottomright"></div>
					</div>


					<h3>
						<img src="./images/order/order_detail04[1].gif" border="0" alt="">
					</h3>
					<div id="boxTop">
						<div class="boxTopleft"></div>
						<div class="boxTopright"></div>
					</div>
					<div id="boxMiddle">
					
						<table cellspacing="2" cellpadding="2" id="boxStyle2">
		
							<colgroup>
								<col width="15%"></col>
								<col width="85%"></col>
							</colgroup>
							<tr>
								<th>기존 배송지</th>
								<td> <input type="checkbox" name="copy_info"
									onClick="copyInfo();" /> <span class="msg">주문자와
										동일</span></td>
							</tr>	
							<tr>
								<th>받으시는 분</th>
								<td><input type="text" name="rname" value=""
									class="input" style="width: 150px;" /></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" name="rphone"
									id="addressee_phone" value="" class="input"
									style="width: 150px;" maxlength="15" /></td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td><input type="text" name="rcell"
									id="addressee_cell" value="" class="input" style="width: 150px;"
									maxlength="15" /></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" name="addressee_zip" value=""
									class="input" style="width: 150px;" readonly
									onClick="">
									<a href="javascript:;"
									onClick="">
										<img src="./images/order/check_post[1].gif" alt="우편번호 검색"
										title="" />
								</a> <span class="msg">버튼으로 찾고자 하는 동(읍,면,리)를 입력하세요</span><br /> <input
									type="text" name="raddr" value="" class="input"
									style="width: 300px;"/><br />
									
							</tr>
						
							<tr>
								<th>배송메모</th>
								<td><input type="text" name="rmemo" value=""
									class="input" style="width: 98%;" /></td>
							</tr>
							
							
						</table>
					</div>
					<div id="boxBottom">
						<div class="boxBottomleft"></div>
						<div class="boxBottomright"></div>
					</div>


					<h3>
						<img src="./images/order/order_detail02[1].gif" border="0" alt="">
					</h3>
					<div id="boxTop">
						<div class="boxTopleft"></div>
						<div class="boxTopright"></div>
					</div>
					<div id="boxMiddle">
						<table cellspacing="2" cellpadding="2" id="boxStyle2">
							<colgroup>
								<col width="15%"></col>
								<col width="85%"></col>
							</colgroup>
							<tr>
								<th>결제방식</th>
								<td><input type="radio" name="pay_type"
									value="card"  checked> 신용카드<br />
									<br> <input type="radio" name="pay_type" 
									value="pgescrow" > 에스크로 가상계좌
									(50,000원 이상 결제시 가능)<br /> <span
									style='padding-left: 15px; color: #336699'>- 5만원 이상 결제시
										구매안전서비스 적용 가능합니다.</span><br /> <input type="radio" name="pay_type"
									 value="cash" >
									무통장입금 <br />* 주문완료후
									10일이내 입금이 확인되지 않으면 자동취소됩니다.</td>
							</tr>
							<tr>
								<th>상품합계금액</th>
								<td><%=productDto.getP_price()*quantity2  %> 원</td>
							</tr>
							<tr>
								<th>배송료</th>
								<td><font id="delivery_prc">무료</font></td>
							</tr>
							<tr>
								<th>실 결제금액</th>
								<td><strong><span id="total_order_price_div"></span><%=productDto.getP_price()*quantity2 %> 원</strong>
								</td>
							</tr>
						</table>


						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:confirmOrder()"><img
							src="./images/order/order_finish[1].gif" alt="결제하기" title="" /></a> <a
							href="main.jsp"><img
							src="./images/order/order_cancel[1].gif" alt="주문취소" title="" /></a>
				
							
							

		<!-- 내용 끝  -->

		<table cellspacing=0 cellpadding=0 border=0>
			<tr>
				<td height=20><spacer type=BLOCK height=10 width=100%></td>
			</tr>
		</table>
		</td>