<%@page import="member.MemberManager"%>
<%@page import="member.MemberDTO"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	

	String p_code = request.getParameter("p_code");

	try{
		ProductDTO productDto = ProductManager.getMembermanager().findOne(p_code);
%>

<script>
function optionCal(){
	if(detail.option1.value=="yellow"){
		detail.option1.value="yellow";
	}else if(detail.option1.value=="LightBrown"){
		detail.option1.value=="LightBrown"
	}else if(detail.option1.value=="Red"){
		detail.option1.value=="Red"
	}else if(detail.option1.value=="Olive"){
		detail.option1.value=="Olive"
	}else if(detail.option1.value=="DeepBrown"){
		detail.option1.value=="DeepBrown"
	}
}


function addCart1(detail){
	
		detail.action = "main.jsp?contentPage=basket_insert";
		detail.method = "post";
		detail.submit();
	
}

function addCart2(detail){

		detail.action = "main.jsp?contentPage=order";
		detail.method = "post";
		detail.submit();
	
}



</script>






<td width="60%" valign="top">
	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=1><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table> 
	<!-- 내용 시작  -->



	<div class="titlebox">
		<h2 class="tit">
			<img src="./images/shopping/detail[1].gif" alt="product detail"
				title="" />
		</h2>
	</div>


	
		


	<form name="detail" method="post" action="javascript:addCart1(),addCart2()" >

	
	<table cellspacing="0" cellpadding="0" class="detail_info">
		<colgroup>
			<col width="28%"></col>
			<col width="72%"></col>
		</colgroup>
		<tr>
		<td rowspan="2">
		<img id="mainImg" src="./images/product/<%=productDto.getP_engname()%>/<%=productDto.getP_engname()%>1.jpg" width="280" height="280">
		</td>
	
		
		<td>
	<font style="color: #888888; font-size: 15px; font-style:; font-weight: bold" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<%=productDto.getP_name() %></font>
	<br>
	<br>
		<font size="3px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;판매가</font>
	<span id="sell_prc_str" class="listprice">&nbsp;&nbsp;&nbsp;&nbsp;<%=productDto.getP_price() %>원</span>
	<br>
	<br>	
	<font size="3px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;적립금</font>&nbsp;&nbsp;&nbsp;&nbsp;4500 원
	<br>
	<br>	
		
				
				
				<input type="hidden" name="p_engname" value="<%=productDto.getP_engname()%>">
				<input type="hidden" name="p_name" value="<%=productDto.getP_name()%>">
				<input type="hidden" name="p_price" value="<%=productDto.getP_price()%>"> 
				<input type="hidden" name="p_code" value="<%=p_code%>"> 
				 
				<input type="hidden" name="color" value=""> 
				<input type="hidden" name="size" value=""> 
				<input type="hidden" name="quantity" value="1"><!--바로구매로 넘길때 수량을 무조건 1만 넘김  -->
				
				
				<!--<font size="3px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Colors.</font>
				&nbsp;&nbsp;&nbsp;&nbsp; <select name="option1" id="option1"
				onChange="optionCal()"><option
						value="">::Colors.::</option>
					<option value="Yellow.::0::0">Yellow.</option>
					<option value="LightBrown.::0::0">Light Brown.</option>
					<option value="Red.::0::0">Red.</option>
					<option value="Olive.::0::0">Olive.</option>
					<option value="DeepBlue.::0::0">Deep Blue.</option>
			</select> 
	<br>
	<br>	
			<input type="hidden" name="option_necessary2" value="Y">
				<input type="hidden" name="option_type2" value="2"> <input
				type="hidden" name="option_name2" value="Sizes."> <input
				type="hidden" name="option_prc2" value="0"> <input
				type="hidden" name="option_how_cal2" value="1"> <input
				type="hidden" name="option_sel_item2" value=""> <input
				type="hidden" name="option_ea_ck2" value="N"> <input
				type="hidden" name="option_ea_num2" value=""><font size="3px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sizes.</font>
				&nbsp;&nbsp;&nbsp;&nbsp;<select name="option2" id="option2"
				onChange="optionCal2()"><option
						value="">::Sizes.::</option>
					<option value="240.::0::0">240.</option>
					<option value="250.::0::0">250.</option>
					<option value="260.::0::0">260.</option>
					<option value="270.::0::0">270.</option>
					<option value="280.::0::0">280.</option>
					<option value="290.::0::0">290.</option>
					<option value="300.::0::0">300.</option>
			</select>
	<br>
	<br>
				<font size="3px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수량</font>
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="quantity" value="1" class="ea" />
						<a href="javascript:change();"><img src="./images/shopping/edit_sjdjia01.gif"
								alt="수정" title="" style="margin-bottom: 3px;" /></a> 
								
		<br>
		<br>	-->
		
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="javascript:addCart1(document.detail)"><img src="./images/shopping/cart[1].gif" alt="장바구니"></a>
			<a href="javascript:addCart2(document.detail)" onfocus='this.blur()'><img src="./images/shopping/buy[1].gif" alt="바로구매"></a>
		
		<input type="hidden" name="opt_no" value="2"><!-- 옵션 길이 : 필수 -->
	


	
	</td>
	</tr>
		
		
</table>
		
	

		
</form>



<IMG src="./images/product/<%=productDto.getP_engname()%>/<%=productDto.getP_engname()%>2.jpg">
<IMG src="./images/product/<%=productDto.getP_engname()%>/<%=productDto.getP_engname()%>3.jpg">
<IMG src="./images/product/<%=productDto.getP_engname()%>/<%=productDto.getP_engname()%>4.jpg">

<%
		}catch(Exception e){
		
		}

%>


		<!-- 내용 끝  -->

		<table cellspacing=0 cellpadding=0 border=0>
			<tr>
				<td height=20><spacer type=BLOCK height=10 width=100%></td>
			</tr>
		</table>
		</td>