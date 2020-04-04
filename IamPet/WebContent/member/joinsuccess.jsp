
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script type="text/javascript" src="../js/common.js">
</script>
<SCRIPT language="JavaScript">
function form_submit(form, action) {sp_form_submit(form, action, 'POST', '', '');}
</Script>


<%
	
	String name = (String)request.getAttribute("name");
	System.out.println("name : "+name);
	
%>

 <form name="join"
		action="JavaScript:form_submit(document.join, '../main.jsp?contentPage=login');">
		<table align="center">
			<tr bgcolor="white" valign="middle">
			<td align="center">
			<font>	<%= name%>고객님의 회원가입이 성공적으로 이루어졌습니다.<br/>
				항상 고객님의 즐겁고 편리한 쇼핑을 위해 최선의 노력을 다하겠습니다.
				</font>
				
				<p>즐거운 쇼핑되세요 ^-^</p>
      			<meta http-equiv="Refresh" content="3; url=../main.jsp?contentPage=login" >
				
			</td>
			
			<tr>
				<td height="30" class="t1" align="center">
				<input type="image" border="0" name="submit" src="../images/member/home.jpg">
			</tr>

		</table>
	</form>