

<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDTO"%>
<%@page import="product.ProductManager"%>
<%@page import="basket.BasketDTO"%>
<%@page import="basket.BasketManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	response.setCharacterEncoding("euc-kr");
	
	ArrayList<BasketDTO> basketList = null;


	String p_code = request.getParameter("p_code");
	/* System.out.println("p_code:" + p_code);*/
	String m_id = (String)session.getAttribute("m_id");
	

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
function deleteCart(){
	var chckType = document.getElementsByName('delete');
	var checkStatus = false;
	
	for(var i = 0; i < chckType.length; i++){
		
		if(chckType[i].checked == true){
			
			var basket_code = chckType[i].value;
			location.href="./basket/basket_delete.jsp?basket_code="+basket_code;
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
			location.href="./basket/basket_deleteAll.jsp?m_id=<%=m_id%>";
		}
} 
	



</script>    

<td width="80%" valign="top">
	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=1><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table> 
	<!-- 내용 시작  -->
	    
    
    <img src="./images/basket/shop_step1[1].gif" alt="주문 스텝 1단계 장바구니" title="" />
<div id="boxTop"><div class="boxTopleft"></div><div class="boxTopright"></div></div>
<div id="boxMiddle">
<form name="cartFrm" method="post" action="http://www.dasmann.co.kr/main/exec.php" target="hidden1367422214" style="padding:0;text-align:center;">
<input type="hidden" name="exec_file" value="cart/cart.exe.php">
<input type="hidden" name="exec" value="">		
	
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
			<th class="prdName"><img src="./images/basket/title01[1].gif" border="0" alt="상품명" /></th>
			<th><img src="./images/basket/title02[1].gif" border="0" alt="상품가격" /></th>
			<th><img src="./images/basket/title03[1].gif" border="0" alt="수량" /></th>
			<th><img src="./images/basket/title04[1].gif" border="0" alt="적립금" /></th>
			<th><img src="./images/basket/title05[1].gif" border="0" alt="합계" /></th>
			<th class="prdSelect"><img src="./images/basket/title06[1].gif" border="0" alt="선택" /></th>
		</tr>
		</thead>
			
			
			<%
				int basket_code = 0;
				for(BasketDTO basketDto: basketList){
					basket_code = basketDto.getBasket_code();
					
			%>
			
			
			<tbody>
		<tr>
			<td style="text-align:left;"><img src="./images/product/<%=basketDto.getP_engname()%>/<%=basketDto.getP_engname()%>1.jpg" width="50" height="50" border="0"> 
			<a href="main.jsp?contentPage=shopping/detail&p_code=<%=basketDto.getP_code()%>"><%=basketDto.getP_engname() %></a> (Colors.:Black.,  Sizes.:265.)</td>
			<td style="text-align:right;"><%=basketDto.getP_price() %></td>
			<td>
			<table cellspacing="0" cellpadding="0">
				<tr>
					<td rowspan="2" style="padding-bottom:5px;"><input type="text" name="quantity" value="<%=basketDto.getP_quantity() %>" class="ea" " /></td>
					<td style="padding-left:5px;" valign="bottom"><a href="basket/basket_update.jsp?basket_code=<%=basketDto.getBasket_code()%>&count=up"><img src="./images/basket/ea_up[1].gif" border="0" alt="수량 증가" title="" /></a></td>
				</tr>
				<tr>
					<td style="padding-left:5px;" valign="top"><a href="basket/basket_update.jsp?basket_code=<%=basketDto.getBasket_code()%>&count=down"><img src="./images/basket/ea_down[1].gif" border="0" alt="수량 감소" title="" /></a></td>
				</tr>
			</table>
			</td>
			<td style="text-align:right;">4,500 원</td>
			<td style="text-align:right;"><%=basketDto.getP_price()*basketDto.getP_quantity() %></td>
			<td valign="middle">
			&nbsp;&nbsp;&nbsp;<span><input type="checkbox" offsrc="/_image/_button/prd_del.gif" onsrc="/_image/_button/prd_del.gif" name="delete" id="cno" value="<%=basketDto.getBasket_code() %>" onclick="javascript:deleteCart();"></span>
			</td>
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

		
				
		<tr>
			<td colspan="6" align="right">
			<ul>
				<li>주문수량합계 :<%=tot_price %> 원</li>
	
				<li>배송료 : 무료</li>
				<li>총 결제금액 :<%=tot_price  %>  원</li>
	
			</ul>
			</td>
		</tr>
	
	
			
		
			</table>
			

			
			
			
<input type="hidden" name="cart_rows" value="1">
</form>
</div>
<div id="boxBottom"><div class="boxBottomleft"></div><div class="boxBottomright"></div></div>
	

		
	
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:basket_allDelete();"><img src="./images/basket/cart_empty[1].gif" alt="장바구니 비우기" title="" /></a>
		<a href="main.jsp"><img src="./images/basket/cart_continue[1].gif" alt="쇼핑 계속하기" title="" /></a>
		<a href="./main.jsp?contentPage=orderAll&basket_code=<%=basket_code%>&m_id=<%=m_id%>"><img src="./images/basket/cart_order[1].gif" alt="주문하기" title="" /></a>
	

    

    

		<!-- 내용 끝  -->

		<table cellspacing=0 cellpadding=0 border=0>
			<tr>
				<td height=20><spacer type=BLOCK height=10 width=100%></td>
			</tr>
		</table>
		</td>
    
    
    
    