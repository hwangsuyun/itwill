<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
    
<!-- 로그인 했는지 안했는지 확인 -->    
<%@include file="login_check.jspf" %>   	

<script type="text/javascript" src="js/header.js"></script>
<script>
function f_search(){
    var search = document.getElementById("search");
    var searchVal = search.value;
    location.href="main.jsp?contentPage=search/search_Action&searchVal="+searchVal;
}
</script>

<!-- 메인타이틀 -->
<table width=1024 border=0 cellpadding=8 align="center">
	<tr align=left>
		<td>
			<a href="main.jsp" >
			<img src="images/main/top_header.gif" border="0"
			onmouseover="this.style.filter='alpha(opacity=50)';" 
			onmouseout="this.style.filter='alpha(opacity=100)';"></a>
		</td>
		
		<td>
			<a href="main.jsp">
			<img src="images/main/top_cat.jpg" border="0" width="400px" height="200"
			onmouseover="this.style.filter='alpha(opacity=50)';" 
			onmouseout="this.style.filter='alpha(opacity=100)';"></a>
		</td>
	
		<td align=right>
		<table>
		<tr>
		<td valign="middle"><input type="text" id="search" name="search" value=""/></td>
		<td valign="middle">
		<a href="#">
			<img src="images/main/search-icon.png" border="0" width="40px"height="40px" onClick="f_search()"
			onmouseover="this.style.filter='alpha(opacity=50)';" 
			onmouseout="this.style.filter='alpha(opacity=100)';"></a></td>
		</tr>
		</table>
		
			
		</td>
	</tr>
</table>

<!-- 오른쪽 (login, join, basket, order, mypage) -->
<table width=1024 border=0 cellspacing=0 cellpadding=0 align="left">
	<tr align=left>
		<td align=right>
			<%
				// 로그인중이라면 안보이게 
				if(userId == null)
				{
			%>
					<a href="main.jsp?contentPage=login"
					onmouseover="this.style.backgroundColor='#FAED7D';" 
					onmouseout="this.style.backgroundColor='#ffffff';">
					<img src="images/main/top_login.gif" border="0"></a>
					&nbsp;&nbsp;
					<a href="main.jsp?contentPage=join"
					onmouseover="this.style.backgroundColor='#FAED7D';" 
					onmouseout="this.style.backgroundColor='#ffffff';">
					<img src="images/main/top_join.gif" border="0"></a>
					&nbsp;&nbsp;
			<%
				}
			%>
			
			<a href="main.jsp?contentPage=basket"
			onmouseover="this.style.backgroundColor='#FAED7D';" 
			onmouseout="this.style.backgroundColor='#ffffff';">
			<img src="images/main/top_basket.gif" border="0"></a>
			&nbsp;&nbsp;
			<a href="main.jsp?contentPage=order"
			onmouseover="this.style.backgroundColor='#FAED7D';" 
			onmouseout="this.style.backgroundColor='#ffffff';">
			<img src="images/main/top_order.gif" border="0"></a>
			&nbsp;&nbsp;
			<a href="main.jsp?contentPage=mypage"
			onmouseover="this.style.backgroundColor='#FAED7D';" 
			onmouseout="this.style.backgroundColor='#ffffff';">
			<img src="images/main/top_mypage.gif" border="0"></a>
		</td>
	</tr>
</table>

<br/><br/>

<table cellspacing=0 cellpadding=0 border=0>
	<tr>
		<td height=3><spacer type=BLOCK height=5 width=100%></td>
	</tr>
</table>
