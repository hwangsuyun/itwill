<%@page import="pet.shopping.PetManager"%>
<%@page import="pet.shopping.PetDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="../login_check.jspf"%>

<%
	//유저 아이디 파라메타 구별 코드
	//--start--
	String id = "";
	if (userId != null) {
		id = userId;
	} else {
		id = session.getId();
	}
	//--end--

	String c_name_code = request.getParameter("c_name_code");
	if (c_name_code == null || c_name_code == "") {
		c_name_code = "PC_0001";
	}

	PetDTO dto = PetManager.getPetManager().findPet(c_name_code);
%>
<!-- <script language="JavaScript">
function buynow() {
	alert("구매확인");
	petdepail.action="order/order.jsp";
	petdepail.submit();
}
function addtocart() {
	alert("장바구니이동");
	petdepail.action="basket/basket.jsp";
	petdepail.submit();
}
</script> -->
<td width="60%" valign="top">
	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=1><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table> 
<!-- detail 화면 시작 -->
	<table width="100%" cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td
				style="padding-left: 10px; padding-bottom: 10px;"
				valign="middle" align="left">
				<%-- <font style="color: #888888; font-size: 20px; font-style:; font-weight: bold"><b>쇼핑몰 >></b> <%= dto.getC_part() %></font> --%>
				<img alt=""
				src="./images/<%=dto.getC_part_code()%>/<%=dto.getC_part_code()%>.gif"
				border="0">
			</td>
		</tr>
	</table> 
	<table cellspacing=0 cellpadding=0 border=0>
		<tr bgcolor="#FFFFFF">
			<td height="30"></td>
		</tr>
	</table>
	<!-- <hr /> --> 
	<%-- <form name="petdepail" method="post">
		<input type="hidden" name="c_code" value="<%= dto.getC_code() %>">
		<input type="hidden" name="c_count" value="1">
		<input type="hidden" name="contentPage" value="basket">
	</form> --%>
	<table width="100%">
		<tr>
			<td style="padding-bottom: 5px; " align="center">
				<img src='images/<%=dto.getC_part_code()%>/<%=dto.getC_name_code()%>/<%=dto.getC_name_code()%>_0001.jpg' border="0">
			</td>
		</tr>
		<tr height="20">
			<td><hr align="center" color="#eeeeee" size="10" /></td>
		</tr>
		<tr align="center">
			<td align="center"><font
				style="color: #888888; font-size: 15px; font-style:; font-weight: bold">이&nbsp;&nbsp;&nbsp;름
					: <%=dto.getC_name()%>
			</font>
				<hr align="center" color="#eeeeee" size="10" /></td>
		</tr>
		<tr align="center">
			<td align="center"><font
				style="color: #888888; font-size: 15px; font-style:; font-weight: bold">분양가
					: <%=dto.getC_price()%></font>
				<hr align="center" color="#eeeeee" size="10" /></td>
		</tr>
		<tr align="center">
			<td align="center"><font
				style="color: #888888; font-size: 15px; font-style:; font-weight: bold">성&nbsp;&nbsp;&nbsp;별
					: <%=dto.getC_sex()%></font>
				<hr align="center" color="#eeeeee" size="10" /></td>
		</tr>
		<tr>
			<td align="center">
				<table width="100%">
					<tr >
						<!-- BUY NOW -->
						<td width="50%" style="padding-bottom: 10px" align="center">
							<!-- <INPUT type=image src="images/basket/buyicon01.gif" onClick="buynow()"> -->
							<a
							href="main.jsp?contentPage=order/order&c_name_code=<%=dto.getC_name_code()%>&c_count=<%=1%>&member_id=<%=id%>"
							onmouseover="this.style.backgroundColor='#cccccc';"
							onmouseout="this.style.backgroundColor='#ffffff';"> <img
								src="images/basket/buyicon01.gif" border="0"></a>
						</td>
						<!-- ADD TO CART -->
						<td width="50%" style="padding-bottom: 10px" align="center">
							<!-- <INPUT type=image src="images/basket/buyicon02.gif" onClick="addtocart()"> -->
							<a
							href="main.jsp?contentPage=basket_insertAction&c_name_code=<%=dto.getC_name_code()%>&c_count=<%=1%>"
							onmouseover="this.style.backgroundColor='#cccccc';"
							onmouseout="this.style.backgroundColor='#ffffff';"> 
							<img src="images/basket/buyicon02.gif" border="0"></a>
						</td>
					</tr>
				</table>
			</td>
		</tr>

		<%
			for (int i = 2; i <= 6; i++) {
		%>
		<tr>
			<td style="padding-bottom: 10px" align="center">
			<img src='images/<%=dto.getC_part_code()%>/<%=dto.getC_name_code()%>/<%=dto.getC_name_code()%>_000<%=i%>.jpg' />
			</td>
		</tr>
		<%
			}
		%>
	</table>
 <!-- detail 화면 끝 -->
	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=20><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table>
</td>