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
<!-- �ʿ���°�  -->
<%@include file="../login_check.jspf"%>

<% 
	request.setCharacterEncoding("euc-kr");

	String c_code = request.getParameter("c_name_code");//������ �Ǵ��ؼ� ����Ʈ�� �������� ���� �Ǵܿ���
	String c_count_str = request.getParameter("c_count");//������ 1�� ����
	String member_id = request.getParameter("member_id");
	if(member_id==null){
		member_id = userId;
	}
		
	
	System.out.println(c_code+" "+c_count_str+" "+member_id);
	
	//�� ���� �ҷ�����
	PetDTO petDto = null;

	//������
	ArrayList<BasketDTO> basList = new ArrayList<BasketDTO>();
	MemberDTO memberDto = new MemberDTO();
	
	// �α��� ������� 
	if(userId != null)
	{
		System.out.println("1");
		System.out.println("member_id"+member_id);
		// ���̵�� ã�� ��ٱ��� ����
		basList = BasketManager.getBasketManager().findBasket(member_id);
		System.out.println("2");
		// ���̵�� ã�� ȸ������ 
		memberDto = MemberManager.getMembermanager().findMember(member_id);
		System.out.println("3");
	}
	else
	{
	// ��ȸ���̶�� ���� �־��ش�. 		
	//	BasketDTO basketDto = new BasketDTO();
	//	basList.add(basketDto);
	//	memberDto.setName("");
	//	memberDto.setZipcode("");
	//	memberDto.setAddress("");
	//	memberDto.setHomephone("");
	//	memberDto.setCellphone("");
	//	memberDto.setEmail("");
		memberDto = new MemberDTO("","","","","","","","","","","","","");
	}
	
	System.out.println("������Ͽ��� �Ѿ�� ���̵�"+member_id);
	
	//���� �޾Ƽ� ����
		if(c_count_str==null || c_count_str.equals("")){
			c_count_str = "1";
		}
		int c_count = Integer.parseInt(c_count_str);
		
		//������ ���� m/f -> ���� ���� ǥ��
		String c_sex = null;
		if(c_code==null || c_count_str.equals("")){
			petDto = new PetDTO(0," "," "," "," "," ",0);
		}else{
			petDto = PetManager.getPetManager().findPet(c_code);
			if(petDto.getC_sex().equals("M")){
				c_sex="����";
			}else{
				c_sex="����";
			}
		}

	
%>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
 	function add_basket(){
		 if(count.quantity.value>=1 && count.quantity.value<=10){
			location.href="main.jsp?contentPage=order/order&c_name_code=<%=c_code%>&member_id=<%=member_id%>&c_count="+count.quantity.value;
		}else {
			alert("��ȿ���� ���� ���Դϴ�.");
		}

	}
	function set_receiverT() {
		if (count.sameaddr.value = "T") {
			count.rname.value = count.oname.value;
			count.rzipcode1.value = count.ozipcode1.value;
			count.raddr1.value = count.oaddr1.value;
			count.rphone1.value = count.ophone1.value;
			count.rphone2.value = count.ophone2.value;
		}
	}

	function set_receiverF() {
		if (count.sameaddr.value = "F") {
			count.rname.value = "";
			count.rzipcode1.value = "";
			count.raddr1.value = "";
			count.rphone1.value = "";
			count.rphone2.value = "";
		}

	}

	function pay() {
		if (is_null(count.oname.value) || is_space(count.oname.value)) {
			alert("�̸��� �Է��Ͽ� �ּ���.");
			count.oname.focus();
		} else if (is_null(count.oaddr1.value) || is_space(count.oaddr1.value)) {
			alert("�ּҸ� �Է��Ͽ� �ּ���.");
			count.oaddr1.focus();
		} else if (is_null(count.rname.value) || is_space(count.rname.value)) {
			alert("�̸��� �Է��Ͽ� �ּ���.");
			count.rname.focus();
		} else if (is_null(count.raddr1.value) || is_space(count.raddr1.value)) {
			alert("�ּҸ� �Է��Ͽ� �ּ���.");
			count.raddr1.focus();
		} else if (is_null(count.rphone2.value)
				|| is_space(count.rphone2.value)) {
			alert("�޴��� ��ȣ�� �Է��Ͽ� �ּ���.");
			count.rphone2.focus();
		} else if (!isNaN(count.oname.value)) {
			alert("���ڴ� �� �� �����ϴ�.");
			count.oname.focus();
		} else if (!isNaN(count.rname.value)) {
			alert("���ڴ� �� �� �����ϴ�.");
			count.rname.focus();
		} else {
			message = "�����Ͻðڽ��ϱ�?";
			if (confirm(message) == true) {
				alert("������ �Ϸ�Ǿ����ϴ�.")
				count.action = "order/orderok.jsp";
				count.method = "post";
				count.submit();
			} else {

			}
		}
		/*  }else if(count.oaddr1.value==""){
		alert("�ּҸ� �Է����ּ���.");
		}else if(count.rname.value==""){
		alert("�̸��� �Է����ּ���.");
		}else if(count.raddr1.value==""){
		alert("�ּҸ� �Է����ּ���.");
		}else if(count.rphone2.value==""){
		alert("�޴��� ��ȣ�� �Է����ּ���.");
		}else{
		message="�����Ͻðڽ��ϱ�?";
		if(confirm(message)==true){
			alert("������ �Ϸ�Ǿ����ϴ�.")
		count.action ="order/orderok.jsp";
		count.method="post";
		count.submit();	
		}else{
		
		}
		}  */

	}
	function openConfirmAddress(userinput) {
		// ���̵� �Է��ߴ��� �˻�
		//    if(userinput.zipcode.value == "")
		//    {
		//         alert("���� �Է��ϼ���");
		//        return;
		//     }
		// url�� ����� �Է� id�� �����մϴ�.
		url = "./order/zipcode.jsp?zipcode=" + userinput.rzipcode1.value;
		//  url = "./member/zipcode.jsp";    

		// ���ο� �����츦 ���ϴ�.
		open(
				url,
				"confirm",
				"toolbar=no, location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=650, height=500");
	}
	function openConfirmAddressUp(userinput) {
		// ���̵� �Է��ߴ��� �˻�
		//    if(userinput.zipcode.value == "")
		//    {
		//         alert("���� �Է��ϼ���");
		//        return;
		//     }
		// url�� ����� �Է� id�� �����մϴ�.
		url = "./order/zipcodeUp.jsp?zipcode=" + userinput.ozipcode1.value;
		//  url = "./member/zipcode.jsp";    

		// ���ο� �����츦 ���ϴ�.
		open(
				url,
				"confirm",
				"toolbar=no, location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=800, height=500");
	}
</script>

<td width="60%" valign="top">
	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=0><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table> 
	<!-- �̾ȿ� �ۼ� html body  ���� -->

	<form name="count" action="javascript:add_basket()" >
		
		<input type="hidden" name="id" value="<%= memberDto.getId() %>">
		<input type="hidden" name="item_code"
			value="<%=petDto.getC_name_code() %>"> <input type="hidden"
			name="item_price" value="<%=petDto.getC_price() %>"> <input
			type="hidden" name="payment_price"
			value="<%=c_count*petDto.getC_price() %>">
			<!-- ((c_count*petDto.getC_price())+20000) -->
		<table width="100%" border="0" cellspacing="0" cellpadding="3">
			<tr>
				<td bgcolor="#FFFFFF" align="center" colspan="8">
					<img src="./images/order/sub06.gif">
				</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td height="30" colspan="8"></td>
			</tr>
			<tr>
				<td class="txt_pro" height="1" colspan="8" bgcolor="eeeeee"
					align="center"></td>
			</tr>
			<tr>
				<td width="15%" bgcolor="#F6F6F6" height="10" align="center"
					class=date_fontcssd><font size="2">��۱���</font></td>
				<td width="35%" bgcolor="#F6F6F6" align="center"
					style="word-break: break-all" class=date_fontcssd><font
					size="2">��ǰ��</font></td>
				<td width="12%" bgcolor="#F6F6F6" align="center" class=date_fontcssd><font
					size="2">�ǸŰ�</font></td>
				<td width="12%" bgcolor="#F6F6F6" align="center" class=date_fontcssd
					colspan="2"><font size="2">����</font></td>
				<!-- <td width="7%" bgcolor="#F6F6F6" align="center" class=date_fontcssd><font size ="2">������</font></td> -->
				<td width="12%" bgcolor="#F6F6F6" align="center" class=date_fontcssd><font
					size="2">��ۺ�</font></td>
				<td width="13%" bgcolor="#F6F6F6" align="center" class=date_fontcssd><font
					size="2">�հ�</font></td>
			</tr>
			<tr>
				<td class="txt_pro" height="1" colspan="8" bgcolor="eeeeee"
					align="center"></td>
			</tr>

			<!-- Line 2 --------------------------------start------------------------------------------------------------------>
			<% if(c_code!=null){ %>
			<tr bgcolor="#FFFFFF">
				<td align="center" class=date_fontcssd rowspan="2"><font
					size="2">�⺻���</font></td>
				<td><img width="70px"
					src='images/<%= petDto.getC_part_code() %>/<%= petDto.getC_name_code() %>/<%= petDto.getC_name_code() %>_0001.jpg' />
					<a href="main.jsp?contentPage=shopping/pet_detail&c_name_code=<%=petDto.getC_name_code()%>"><font
						size="2"><%=petDto.getC_name() %></font> </a><font color=#aaaaaa
					size="2">-��������:<%=c_sex %>
				</font></td>

				<td align="center" class=date_fontcss><font size="2"><%=petDto.getC_price()%>
						��</font></td>
				<td align="center" valign="middle" class=date_fontcssd colspan="2">
					<input type='text'
					style="BORDER-RIGHT: #eeeeee 1px solid; BORDER-TOP: #eeeeee 1px solid; FONT-SIZE: 9pt; BORDER-LEFT: #eeeeee 1px solid; BORDER-BOTTOM: #eeeeee 1px solid; HEIGHT: 15px; BACKGROUND-COLOR: #ffffff"
					size="3" name='quantity' size=3 value='<%= c_count %>'> <input
					type="image" src="./images/basket/edit_sjdjia01.gif" >
				</td>
				<!-- <td></td> -->
				<td align="center" class=date_fontcssd><font size="2">20000
						��</font></td>
				<td align="center" class=date_fontcss><font size="2"><%= c_count*petDto.getC_price()%>
						��</font><br>
			</tr>
			<% }else{ %>
			<tr bgcolor="ffffff">
				<td class="txt_pro" colspan="8" height="10" bgcolor="ffffff"
					align="center"></td>
			</tr>
			<tr>
				<td colspan="8" align="center" valign="middle">���õ� ��ǰ�� �����ϴ�.</td>
			</tr>
			<% } %>
				
			<tr bgcolor="ffffff">
				<td class="txt_pro" colspan="8" height="10" bgcolor="ffffff"
					align="center"></td>
			</tr>
			<tr bgcolor="eeeeee">
				<td class="txt_pro" height="1" colspan="8" bgcolor="eeeeee"
					align="center"></td>
			</tr>

			<!-- Line 3 -->
			<tr>
				<td align="right" colspan="8"><font size="2">* ������ �ִ�
						10�������� ���ð����մϴ�.</font>
			</tr>
			<tr>
				<td class="txt_pro" colspan="8" height="10" align="center"></td>
			</tr>
			<% if(c_code!=null){ %>
			<tr bgcolor="ffffff">
				<td class=date_fontcssd colspan="8" height="27" align="right">
					<font size="2">[��ǰ���űݾ�] : <b><%= c_count*petDto.getC_price()%>
					</b> + [��ۺ�] : <b>20000 </b>= [�ѱ��ž�] : <b><%= ((c_count*petDto.getC_price())+20000)%></b>
				</font>
				</td>
			</tr>
			<tr>
				<td class="txt_pro" height="1" colspan="8" bgcolor="eeeeee"
					align="center"></td>
			</tr>


			<!-- Line 4 -->
			<tr>
				<td valign="middle" colspan="8">
					<table width="100%" border="0" cellspacing="3" cellpadding="0"
						bgcolor="eeeeee">
						<tr>
							<td bgcolor="#FFFFFF">
								<table width="100%" border="0" cellspacing="3" cellpadding="0"
									bgcolor="ffffff">
									<tr>
										<td width="240" bgcolor="ffffff" class=date_fontcssd>&nbsp;<strong><font
												size="2">�������� �� �ֹ� �հ� �ݾ��Դϴ�.</font></strong></td>
										<td align="right" style="padding: 7 12 7 0" bgcolor="ffffff">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0" bgcolor="ffffff">
												<tr>
													<td bgcolor="ffffff" align="right" height="20"
														class=date_fontcssd><font size="2">��ǰ �հ�ݾ�</font>&nbsp;&nbsp;:</td>
													<td bgcolor="ffffff" align="right" style="padding-left: 20"
														class=date_fontcssd><font size="2"><%= c_count*petDto.getC_price()+" won"%></font></td>
												</tr>
												<tr>
													<td bgcolor="ffffff" align="right" height="20"
														class=date_fontcssd><font size="2">��ۺ�</font>&nbsp;&nbsp;:</td>
													<td bgcolor="ffffff" align="right" style="padding-left: 20"
														class=date_fontcssd><font size="2">20000 won</font></td>
												</tr>
												<tr>
													<td bgcolor="ffffff" align="right" height="20"
														class=date_fontcssd><strong><font size="2">��
																�ֹ��հ� �ݾ�</font></strong>&nbsp;&nbsp;:</td>
													<td bgcolor="ffffff" align="right" style="padding-left: 20"
														class=date_fontcssd><strong><font size="2"><span
																class="font_sum"><%= ((c_count*petDto.getC_price())+20000)+" won"%></span></font></strong></td>
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
			<!-- -----------------------------------------------end--------------------------------------------------------------- -->
			<!-- Line 5 -->
			<tr>
				<td valign="middle" colspan="8">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="650"><img src="./images/basket/main_n_bl.gif">
								<span class="date_fontcssd"><font size="2">�ֹ�������</font></span></td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td bgcolor="eeeeee">
								<table width="100%" border="0" cellspacing="1" cellpadding="5">
									<tr bgcolor="ffffff">
										<td width="166" align=center class="date_fontcssd" nowrap
											bgcolor="#F6F6F6"><font size="2">����</font></td>
										<td width="632" bgcolor="ffffff"><input type=text size=15
											maxlength="8" class="input01"
											value="<%=memberDto.getName() %>" name="oname"></td>
									</tr>
									<tr bgcolor="ffffff">
										<td width="166" align=center class="txt_pro" bgcolor="#F6F6F6"><font
											size="2">�ּ�</font></td>
										<td width="632" bgcolor="ffffff">
											<table width="510" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td height="26"><input type=text class="input01"
														name="ozipcode1" maxlength="13" size="13"
														value="<%=memberDto.getZipcode() %>" maxlength="3">
														<input type="button" value="������ȣã��"
									onClick="javascript:openConfirmAddressUp(this.form)">
							  <!--  <a href="javascript:search_zip()">
                              <img src="http://img0001.echosting.cafe24.com/front/type_b/image/button/but_zipcodesearch.gif" name="image" align="absmiddle" border="0"></a> -->
													</td>
												</tr>
												<tr>
													<td height="26"
														STYLE="color: #555555; font-size: 12; font-family: ����;">
														<input type=text size=40 name="oaddr1"
														value="<%=memberDto.getAddress() %>" class="input01">
												</tr>
											</table>
										</td>
									</tr>
									<tr bgcolor="ffffff">
										<td height=10 align="center" bgcolor="#F6F6F6" width="166"
											class="date_fontcssd"><font size="2">������ȭ</font></td>
										<td height=10 bgcolor="ffffff" width="632"><input
											class="input01" maxlength="20" size="30"
											value="<%=memberDto.getHomephone() %>" name="ophone1">
										</td>
									</tr>
									<tr bgcolor="ffffff">
										<td height=10 align="center" bgcolor="#F6F6F6" width="166"
											class="date_fontcssd"><font size="2">�޴���ȭ</font></td>
										<td height=10 bgcolor="ffffff" width="632"><input
											class="input01" maxlength="20" size="30"
											value="<%=memberDto.getCellphone() %>" name="ophone2">
										</td>
									</tr>
									
									<tr>
							<td width="20%" class="t1" bgcolor="#F6F6F6" align="center">
							<font size="2" >�̸���</font>
							</td>
							<td width="80%" height=10 bgcolor="ffffff" width="632">
							<input type="text" name="email1" maxlength="15" size="45" class="input01" value="<%=memberDto.getEmail() %>">
							</td>
						<tr>	
						<td bgcolor="#F6F6F6"></td>
								<td bgcolor="white" height="20" class="date_fontcssd"><img
									src="./images/basket/main_n_bl.gif" align="absmiddle">
									<font size="2">��ǰ���Խ� E-mail�� ���� �ֹ�ó�������� ���� �帳�ϴ�.</font>
								</td>
							</tr>
							
							<tr>
							<td bgcolor="#F6F6F6"></td>
								<td bgcolor="white" height="20" class="date_fontcssd"><img
									src="./images/basket/main_n_bl.gif" align="absmiddle">
									<font size="2"> E-mail �ּҶ����� �ݵ�� ���Ű����� E-mail �ּҸ�
										�Է��� �ֽʽÿ�. </font>
								</td>
						</tr>
									
									
								</table>
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td>&nbsp;</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="10"><img src="./images/basket/main_n_bl.gif"></td>
										<td width="470"><span class="date_fontcssd"><font
												size="2">���������</font></span></td>
										<td width="320" class="date_fontcssd"><font size="2">�����
												������ �ֹ��� ������ �����մϱ�?</font><br> <input
											onclick="javascript:set_receiverT()" type="radio" value="T"
											name="sameaddr"> <font size="2"> ��</font> <input
											onclick="javascript:set_receiverF()" type="radio" value="F"
											name="sameaddr" checked> <font size="2">�ƴϿ�</font></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td bgcolor="eeeeee">
								<table width="100%" border="0" cellspacing="1" cellpadding="5">
									<tr bgcolor="ffffff">
										<td width="166" align=center class="date_fontcssd" nowrap
											bgcolor="#F6F6F6"><font size="2">����</font></td>
										<td width="632" bgcolor="ffffff"><input class="input01"
											maxlength="8" name="rname" value=''></td>
									</tr>
									<tr bgcolor="ffffff">
										<td width="166" align=center class="txt_pro" bgcolor="#F6F6F6"><font
											size="2">�ּ�</font></td>
										<td width="632" bgcolor="ffffff">
											<table width="510" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td height="26"><input class="input01"
														name="rzipcode1" maxlength="13" size="13" maxlength="3"
														value=''> <input type="button" value="������ȣã��"
														onClick="javascript:openConfirmAddress(this.form)">

														<!--  <a href="javascript:search_zip('rzipcode1', 'rzipcode2', 'raddr1', 'frm','r')"><img src="http://img0001.echosting.cafe24.com/front/type_b/image/button/but_zipcodesearch.gif" name="image" align="absmiddle" border="0"></a> -->
													</td>
												</tr>
												<tr>
													<td height="26" class="date_fontcssd"><input type=text
														size=40 name="raddr1" class="input01" value=''></td>
												</tr>
											</table>
										</td>
									</tr>
									<tr bgcolor="ffffff">
										<td height=10 align="center" bgcolor="#F6F6F6" width="166"
											class="date_fontcssd"><font size="2">������ȭ</font></td>
										<td height=10 bgcolor="ffffff" width="632"><input
											type=text size=30 maxlength="20" name="rphone1"
											class="input01" value=''>
									</tr>
									<tr bgcolor="ffffff">
										<td height=10 align="center" bgcolor="#F6F6F6" width="166"
											class="date_fontcssd"><font size="2">�޴���ȭ</font></td>
										<td height=10 bgcolor="ffffff" width="632">
											<!-- input type=text size=4 name="rphone2_1" class="input01" value='' -->
											<input type=text size=30 maxlength="20" name="rphone2"
											class="input01" value=''>
										</td>
									</tr>
									<tr bgcolor="ffffff">
										<td height=10 align="center" bgcolor="#F6F6F6" width="166"
											class="date_fontcssd"><font size="2">��۸޽���</font></td>
										<td height=10 bgcolor="ffffff" width="632">
											<table width="510" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td height="10"><textarea class="input01"
															maxlength="250" name="omessage" rows=0 cols=70 value=""></textarea>
													</td>
												</tr>
												<tr>
													<td height="20" class="date_fontcssd"><img
														src="./images/basket/main_n_bl.gif" align="absmiddle">
														<font size="2"> ��۸޼��������� ��۽� ������ ������ ������ �����ֽʽÿ�.</font></td>
												</tr>
											</table>
										</td>
									</tr>


								</table>
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td height="20">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="10"><img src="./images/basket/main_n_bl.gif"></td>
										<td width="650"><span class="date_fontcssd"><font
												size="2">��������</font></span></td>
									</tr>
								</table>
							</td>
						</tr>


						<tr>
							<td bgcolor="eeeeee">
								<table width="100%" border="0" cellspacing="1" cellpadding="5">
									<tr bgcolor="#FFFFFF">
										<td width="127" align=center class="txt_pro" nowrap
											bgcolor="#F6F6F6"><font size="2">������� ����</font></td>
										<td width="510" bgcolor="#FFFFFF"
											STYLE="color: #555555; font-size: 12; font-family: ����;">
											<input type="radio" name="sPayMethodTmp" value="cash" checked>
											������ �Ա�&nbsp;&nbsp;<input type="radio" name="sPayMethodTmp"
											value="card"> ī�����&nbsp;&nbsp;<input type="radio"
											name="sPayMethodTmp" value="cell"> �޴�������&nbsp;&nbsp;<input
											type="radio" name="sPayMethodTmp" value="pgescrow">
											����ũ��(�ǽð�������ü)&nbsp;&nbsp;
										</td>
									</tr>

									<tr>
										<td width="127" align=center class="date_fontcssd" nowrap
											bgcolor="#F6F6F6"><font size="2">�����ݾ�</font></td>


										<td width="510" bgcolor="ffffff"font-weight:bold;"><input
											type='text' name='total_price'
											value='<%= ((c_count*petDto.getC_price())+20000)%>' size='10'
											class="input02" onfocus="this.blur()"
											style='text-align: right; ime-mode: disabled; clear: none; border: 0px; float: none;'>
											won</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td>&nbsp;</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td align="center"><a href="javascript:pay()"><img
									src="./images/order/b_icon_gyul.gif" name="image" border="0"></a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<% } %>
		</table>
	</form> <!-- --------------------------------------------------------------------------- -->
	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=20><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table>
</td>