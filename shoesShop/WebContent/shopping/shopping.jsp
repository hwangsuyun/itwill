<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="org.apache.catalina.startup.Catalina"%>
<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	try{
	ArrayList<ProductDTO> list = ProductManager.getMembermanager().findAll();
	
	

%>
<td width="60%" valign="top">
	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=1><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table> 
	
	
<!-- 내용 시작  -->	
	
	<table cellspacing="0" cellpadding="0">
	<tr>
	<td>
	</td>
	</tr>

	<%
		int count = 0;
		for(ProductDTO pList : list){
			pList.getP_code();
			pList.getP_engname();
			pList.getP_name();
			pList.getP_price();
		count++;
	
	%>


	
	<td align="center">
	<dl style="width:250;">
		<dd class="prd_icon"></dd>
		<dd style="width:215;height:215;"><a href="main.jsp?contentPage=shopping/detail&p_code=<%=pList.getP_code()%>">
		<img src="./images/product/<%=pList.getP_engname()%>/<%=pList.getP_engname()%>1.jpg" width="215" height="215" title="" /></a></dd>
		<dt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<font style="color: #888888; font-size: 12px; font-style:; font-weight: bold" >
		<%=pList.getP_name() %></dt></font >
			<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<font style="color: #888888; font-size: 12px; font-style:; font-weight: bold" >
			<%=pList.getP_price() %>원</dt></font >
			
		
	</dl>
</div></td>

<%
		if(count%4==0){
%>
	<tr/>

<%			
			}
		}
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

	
		