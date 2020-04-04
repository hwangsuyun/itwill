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
	 <!-- �α��� �ߴ��� ���ߴ��� Ȯ�� -->    
<%@include file="../login_check.jspf" %> 
<%
	request.setCharacterEncoding("EUC-KR");
	
	ArrayList basketList = null;
	
	String gubun_id = "";
	
	if(userId==null){
		//System.out.println("���̵�  null�̴�.");
		String member_id = session.getId();
		basketList =BasketManager.getBasketManager().findBasketJoin(session.getId());
		
		gubun_id = member_id;
		
	}else{
		//System.out.println("���̵�  null�� �ƴϴ�.");
		
		basketList = BasketManager.getBasketManager().findBasketJoin(userId);
		System.out.println("loginList ������:"+basketList.size());
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
			alert("������ ��ǰ�� �������ּ���"); 
		}
	}
	 function basket_allDelete() 
	 {	
		if(confirm("��ٱ��ϸ� ��ü �����Ͻðڽ��ϱ�?"))
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
			<td width="90%" class=date_fontcssd>��ٱ��� | <b>�Ϲ� ��ǰ </b></td>
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
			<td width="20%" bgcolor="#F6F6F6" height="10" align="center" class=date_fontcssd>��۱���</td>
			<td width="35%" bgcolor="#F6F6F6" align="center" style="word-break: break-all" class=date_fontcssd>��ǰ��</td>
			<td width="10%" bgcolor="#F6F6F6" align="center" class=date_fontcssd>�ǸŰ�</td>
			<td width="10%" bgcolor="#F6F6F6" align="center" class=date_fontcssd>����</td>			
			<td width="10%" bgcolor="#F6F6F6" align="center" class=date_fontcssd>�հ�</td>
			<td width="10%" bgcolor="#F6F6F6" align="center" class=date_fontcssd>����</td>
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
			<td align="center" class=date_fontcssd rowspan="2">�⺻���</td>
			
			<td>
				<img src='./images/<%=part_code %>/<%=name_code %>/<%=name_code %>_0001.jpg' width="50" height="50"> 
				<a href=main.jsp?contentPage=shopping/pet_detail&c_name_code=<%=name_code %>><%= item_name %><font color=#aaaaaa size="3"> &nbsp;����:<%= item_sex %>
				</a>
			</td>
			
			<td align="center" class=date_fontcss>
				<input type="hidden" name="one_price" value="<%= item_price%>"><%= item_price%>��
			</td>
			
			<td align="center" class=date_fontcssd>
				<input size="2" value="<%= item_cnt %>" name="basket_cnt" class="input01" readonly> 
				<a href="basket/basketUpdateCount.jsp?basket_no=<%=basket_no %>&count=up">��</a>
				<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="basket/basketUpdateCount.jsp?basket_no=<%=basket_no %>&count=down">��</a>
			</td>
			
			<td align="center" class=date_fontcss><%=Integer.parseInt(item_price)* Integer.parseInt(item_cnt)%>��<br>
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
			<!--�ֹ��ϱ� ��ư-->
			<a href="main.jsp?contentPage=order/order&c_name_code=<%=name_code %>">
		<img src="./images/basket/b_icon_order.gif" name="image" border="0"></a>
			</td></tr>
		</tr> --%>
		<tr>
			<td class="txt_pro" height="1" colspan="6" bgcolor="eeeeee"
				align="center"></td>
		</tr>
	
		
		<%
						//������ ���� ���
						int cats_price = 0 ;	//������ ����
						int deliveryFee = 20000;//��۰���
						int cats_cnt = 0;
						int tot_price = 0 ;	//��Ż
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
									<td width="230" bgcolor="ffffff" class=date_fontcssd>&nbsp;<strong>��������
											�� �ֹ� �հ� �ݾ��Դϴ�.</strong></td>
									<td align="right" style="padding: 7 12 7 0" bgcolor="ffffff">
										<table width="100%" border="0" cellspacing="0" cellpadding="0"
											bgcolor="ffffff">
											<tr>
												<td bgcolor="ffffff" align="right" height="20"
													class=date_fontcssd>��ǰ �հ�ݾ�&nbsp;&nbsp;:</td>
												<td bgcolor="ffffff" align="right" style="padding-left: 20"
													class=date_fontcssd><%=cats_price %>��</td>
											</tr>
											<tr>
												<td bgcolor="ffffff" align="right" height="20"
													class=date_fontcssd>��ۺ�&nbsp;&nbsp;:</td>
												<td bgcolor="ffffff" align="right" style="padding-left: 20"
													class=date_fontcssd><%=deliveryFee %>��</td>
											</tr>
											<tr>
												<td bgcolor="ffffff" align="right" height="20"
													class=date_fontcssd><strong>�� �ֹ��հ� �ݾ�</strong>&nbsp;&nbsp;:</td>
												<td bgcolor="ffffff" align="right" style="padding-left: 20"
													class=date_fontcssd><strong><span
														class="font_sum"><%=tot_price %> ��</span></strong></td>
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
				<!-- ���� ����  -->
				<img src="./images/basket/order_icon02.gif" name="image" border="0"	hspace="0" onClick="basket_allDelete();"></a> 
				<!-- üũ�ڽ� ���� -->
				<img src="./images/basket/order_icon03.gif" name="image" border="0" hspace="0" onClick="checkbox_delete();"> 
				<!-- ��ü�ֹ� -->
				<span style="display:"><a href="./main.jsp?contentPage=orderAllBuy&name_code=<%=name_code %>&member_id=<%=gubun_id%>">
				<img src="./images/basket/order_icon06.gif" name="image" border="0"></a></span> <!--�ֹ��ϱ� ��ư--> 
				<a href="./main.jsp"> <img src="./images/basket/order_icon05.gif" name="image" border="0"></a></td>
			</tr>
			<tr>
				<td height=10></td>
			</tr>
			

			<tr>
				<td width="100%" class="date_fontcssd"><b><img
						src="./images/basket/main_n_bl.gif" border=0 align="absmiddle">��ٱ����̿�ȳ�</b></td>


			</tr>
			<td width="100%" class="date_fontcssd"><img
				src="./images/basket/main_n_bl.gif" border=0 align="absmiddle"><font
				size="2">�������Һ� ��ǰ �ֹ��� ���, �������Һ� ������ �����÷��� "��ٱ��� - �������Һ� ��ǰ"
					�Ʒ��� [�ֹ��ϱ�] ��ư�� ���� �ֹ�/����<br>&nbsp;&nbsp;&nbsp; �Ͻø� �˴ϴ�.
			</font></td>
			</tr>
			<tr>
				<td width="100%" class="date_fontcssd"><img
					src="./images/basket/main_n_bl.gif" border=0 align="absmiddle"><font
					size="2">[��ü ��ǰ �ֹ�] ��ư�� �����ø� ��ٱ����� ���о��� ���õ� ��� ��ǰ�� ���� �ֹ�/������
						�̷�����ϴ�.<br>&nbsp;&nbsp; ��, ��ü ��ǰ�� �ֹ�/�����Ͻ� ���, ��ǰ�� �������Һ� ������
						������ �� �����ϴ�.
				</font></td>
			</tr>
			<tr>
				<td width="100%" class="date_fontcssd"><img
					src="./images/basket/main_n_bl.gif" border=0 align="absmiddle"><font
					size="2">�����Ͻ� ��ǰ�� ������ �����Ͻ÷��� �������� �� [����] ��ư�� �����ø� �˴ϴ�. <br>&nbsp;&nbsp;
						[���� ���] ��ư�� �����ø� ������ ��� �Ͻ� �� �ֽ��ϴ�.
				</font></td>
			</tr>
			<tr>
				<td width="100%" class="date_fontcssd"><img
					src="./images/basket/main_n_bl.gif" border=0 align="absmiddle"><font
					size="2">��ٱ��Ͽ� ��� ��ǰ�� 7�� ���� �����˴ϴ�.<br>&nbsp;&nbsp; ������
						��ǰ�� 7�� ���Ŀ� �����ǿ��� ��ٱ��Ͽ��� ������ ��� �ٽ� ��ٱ��Ͽ� �����ñ� �ٶ��ϴ�.
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
