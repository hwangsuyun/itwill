<%@page import="basket.BasketManager"%>
<%@page import="basket.BasketDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	response.setCharacterEncoding("euc-kr");
	
	String basket_code = request.getParameter("basket_code");
	/*  System.out.println("basket_code:" + basket_code);  */
	 String m_id = (String)session.getAttribute("m_id");
	 /* System.out.println("m_id:" + m_id); */ 
	
	ArrayList<BasketDTO> basketList = null;


	String p_code = request.getParameter("p_code");
	 /* System.out.println("p_code:" + p_code); */
	

		if(m_id==null){
			m_id=session.getId();
			basketList =  BasketManager.getBasketmanager().find(m_id);
			 /* System.out.println("sessionbasketList:"+basketList); */ 
		}else{
			basketList = BasketManager.getBasketmanager().find(m_id);
			 /* System.out.println("memberbasketList:"+basketList); */ 
		}
	
	
	
	
	
%>
<script>
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
		alert("�̸��� �Է��Ͽ� �ּ���.");
		buyer.name.focus();
	} else if ((buyer.phone.value=="") || (buyer.phone.value==null)) {
		alert("��ȭ��ȣ�� �Է��Ͽ� �ּ���.");
		buyer.phone.focus();
	} else if ((buyer.cell.value=="") || (buyer.cell.value==null)) {
		alert("�޴��� ��ȣ�� �Է��Ͽ� �ּ���.");
		buyer.cell.focus();
	} else if ((buyer.email.value=="") || (buyer.email.value==null)) {
		alert("�̸����� �Է��Ͽ� �ּ���.");
		buyer.email.focus();
	} else if ((buyer.rname.value=="") || (buyer.rname.value==null)) {
		alert("�̸��� �Է��Ͽ� �ּ���.");
		buyer.rname.focus();
	} else if ((buyer.rphone.value=="") || (buyer.rphone.value==null)) {
		alert("��ȭ��ȣ�� �Է��Ͽ� �ּ���.");
		buyer.rphone.focus();
	} else if ((buyer.rcell.value=="") || (buyer.rcell.value==null)) {
		alert("�޴��� ��ȣ�� �Է��Ͽ� �ּ���.");
		buyer.rcell.focus();
	} else if ((buyer.raddr.value=="") || (buyer.raddr.value==null)) {
		alert("�ּҸ� �Է��Ͽ� �ּ���.");
		buyer.raddr.focus();
	} else if (!isNaN(buyer.name.value)) {
		alert("���ڴ� �� �� �����ϴ�.");
		buyer.name.focus();
	} else if (!isNaN(buyer.rname.value)) {
		alert("���ڴ� �� �� �����ϴ�.");
		buyer.rname.focus();
	} else {
		message = "�����Ͻðڽ��ϱ�?";
		if (confirm(message) == true) {
			buyer.action = "order/order_detail2.jsp";
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
	</table> <!-- ���� ����  --> 
	
	
	<img src="./images/order/shop_step2[1].gif"
	alt="�ֹ� ���� 2�ܰ� �ֹ����ۼ�" title="" />
		
			<h3>
				<img src="./images/order/order_detail01[1].gif" border="0" alt="">
			</h3>
			<div id="boxTop">
				<div class="boxTopleft"></div>
				<div class="boxTopright"></div>
			</div>
			<div id="boxMiddle">
				
	
				
					
					
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
			<th class="prdName"><img src="./images/order/title01[1].gif" border="0" alt="��ǰ��" /></th>
			<th><img src="./images/order/title02[1].gif" border="0" alt="��ǰ����" /></th>
			<th><img src="./images/order/title03[1].gif" border="0" alt="����" /></th>
			<th><img src="./images/order/title04[1].gif" border="0" alt="������" /></th>
			<th><img src="./images/order/title05[1].gif" border="0" alt="�հ�" /></th>
		
		</tr>
		</thead>

	
			<%
			
				for(BasketDTO basketDto: basketList){
					
			%>

				<form name="buyer" method="post" action="javascript:confirmOrder(),order_detail.jsp" >
				<input type="hidden" name="p_engname" value="<%=basketDto.getP_engname()%>">
				<input type="hidden" name="p_name" value="<%=basketDto.getP_name()%>">
				<input type="hidden" name="p_code" value="<%=basketDto.getP_code()%>"> 
				<input type="hidden" name="quantity" value="<%=basketDto.getP_quantity()%>"> 
				<input type="hidden" name="p_price" value="<%=basketDto.getP_price()*basketDto.getP_quantity() %>"> 


	<tbody>
		<tr>
			<td style="text-align:left;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<img src="./images/product/<%=basketDto.getP_engname()%>/<%=basketDto.getP_engname()%>1.jpg" width="50" height="50" border="0"> 
			<a href="main.jsp?contentPage=shopping/detail&p_code=<%=basketDto.getP_code()%>"><%=basketDto.getP_engname() %></a> (Colors.:Black.,  Sizes.:265.)</td>
			<td style="text-align:right;"><%=basketDto.getP_price() %></td>
			<td>
			<table cellspacing="0" cellpadding="0">
				<tr>
					<td rowspan="2" style="padding-bottom:5px;"><input type="text" name="quantity" value="<%=basketDto.getP_quantity() %>" class="ea" " /></td>
					<td style="padding-left:5px;" valign="bottom"><a href="order/order_update.jsp?basket_code=<%=basketDto.getBasket_code()%>&count=up&m_id=<%=m_id%>"><img src="./images/basket/ea_up[1].gif" border="0" alt="���� ����" title="" /></a></td>
				</tr>
				<tr>
					<td style="padding-left:5px;" valign="top"><a href="order/order_update.jsp?basket_code=<%=basketDto.getBasket_code()%>&count=down&m_id=<%=m_id%>"><img src="./images/basket/ea_down[1].gif" border="0" alt="���� ����" title="" /></a></td>
				</tr>
			</table>
			</td>
			<td style="text-align:right;">4,500 ��</td>
			<td style="text-align:right;"><%=basketDto.getP_price()*basketDto.getP_quantity() %></td>
			
		</tr>
</tbody>
<%
				}			

%>	
<%
		
			int p_price = 0 ;
			int p_quantity = 0;
			int tot_price = 0 ;
			int oneTotPrice=0;
			
			for(BasketDTO basketDto: basketList){
				int product_price = basketDto.getP_price();
				p_quantity = basketDto.getP_quantity();
				oneTotPrice = product_price * p_quantity;
				p_price = p_price+oneTotPrice;
			}
			tot_price = p_price;
		%>
						<tfoot>
							<tr>
								<td colspan="6" align="right">
									<ul class="fr">
										<li>�ֹ������հ� : <%=tot_price %> ��</li>
										<!--..K..Y������
							<li>�̺�Ʈ ���� : 0 ��</li>
	������S..Y..//-->
										<li>��۷� : ����</li>
										<li>�� �����ݾ� : <%=tot_price %> ��</li>
										<!--..K..Y������
							<li>�� ������ : 8,900 ��</li>
	������S..Y..//-->
										<!--..K..Y������
							<li>�̺�Ʈ �߰� ������ : 0</li>
	������S..Y..//-->
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
								
								
								
								
								
								
								
						<table cellspacing="2" cellpadding="2" id="boxStyle2">
							<colgroup>
								<col width="15%"></col>
								<col width="85%"></col>
							</colgroup>
							<tr>
								<th>&nbsp;�ֹ��Ͻô� ��</th>
								<td><input type="text" name="name" value=""
									class="input" style="width: 150px;" /> 
							</tr>
							<tr>
								<th>��ȭ��ȣ</th>
								<td><input type="text" name="phone"
									id="buyer_phone" value="" class="input" style="width: 150px;"
									maxlength="15" /></td>
							</tr>
							<tr>
								<th>�޴���ȭ</th>
								<td><input type="text" name="cell" id="buyer_cell"
									value="" class="input" style="width: 150px;" maxlength="15" />
							</tr>
							<tr>
								<th>�̸���</th>
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
								<th>���� �����</th>
								<td> <input type="checkbox" name="copy_info"
									onClick="copyInfo();" /> <span class="msg">�ֹ��ڿ�
										����</span></td>
							</tr>	
							<tr>
								<th>�����ô� ��</th>
								<td><input type="text" name="rname" value=""
									class="input" style="width: 150px;" /></td>
							</tr>
							<tr>
								<th>��ȭ��ȣ</th>
								<td><input type="text" name="rphone"
									id="addressee_phone" value="" class="input"
									style="width: 150px;" maxlength="15" /></td>
							</tr>
							<tr>
								<th>�޴���ȭ</th>
								<td><input type="text" name="rcell"
									id="addressee_cell" value="" class="input" style="width: 150px;"
									maxlength="15" /></td>
							</tr>
							<tr>
								<th>�ּ�</th>
								<td><input type="text" name="addressee_zip" value=""
									class="input" style="width: 150px;" readonly
									onClick="zipSearch('ordFrm','addressee_zip','addressee_addr1','addressee_addr2')">
									<a href="javascript:;"
									onClick="zipSearch('ordFrm','addressee_zip','addressee_addr1','addressee_addr2')">
										<img src="./images/order/check_post[1].gif" alt="�����ȣ �˻�"
										title="" />
								</a> <span class="msg">��ư���� ã���� �ϴ� ��(��,��,��)�� �Է��ϼ���</span><br /> <input
									type="text" name="raddr" value="" class="input"
									style="width: 300px;"/><br />
									
							</tr>
						
							<tr>
								<th>��۸޸�</th>
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
								<th>�������</th>
								<td><input type="radio" name="pay_type" id="pay_type1"
									value="1" onClick="use()" checked> �ſ�ī��<br />
									<br> <input type="radio" name="pay_type" id="pay_type4"
									value="4" onClick="use()"> ����ũ�� �������
									(50,000�� �̻� ������ ����)<br /> <span
									style='padding-left: 15px; color: #336699'>- 5���� �̻� ������
										���ž������� ���� �����մϴ�.</span><br /> <input type="radio" name="pay_type"
									id="pay_type2" value="2" onClick="use()">
									�������Ա� <br />* �ֹ��Ϸ���
									10���̳� �Ա��� Ȯ�ε��� ������ �ڵ���ҵ˴ϴ�.</td>
							</tr>
							<tr>
								<th>��ǰ�հ�ݾ�</th>
								<td><%=tot_price %> ��</td>
							</tr>
							<tr>
								<th>��۷�</th>
								<td><font id="delivery_prc">����</font></td>
							</tr>
							<tr>
								<th>�� �����ݾ�</th>
								<td><strong><span id="total_order_price_div"></span><%=tot_price %> ��</strong>
								</td>
							</tr>
						</table>


						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:confirmOrder()"><img
							src="./images/order/order_finish[1].gif" alt="�����ϱ�" title="" /></a> <a
							href="main.jsp"><img
							src="./images/order/order_cancel[1].gif" alt="�ֹ����" title="" /></a>
							
							
							

		<!-- ���� ��  -->

		<table cellspacing=0 cellpadding=0 border=0>
			<tr>
				<td height=20><spacer type=BLOCK height=10 width=100%></td>
			</tr>
		</table>
		</td>