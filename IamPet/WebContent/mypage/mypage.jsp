<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- �α��� �ߴ��� ���ߴ��� Ȯ�� -->
<%@include file="../login_check.jspf"%>
<%
	request.setCharacterEncoding("euc-kr");
	//�α��λ������� äũ�Ѵ�.
	/* if (userId == null) {
		session.invalidate();
		out.println("<script>");
		out.println("alert('�α����ϼž� �����ִ��������Դϴ�');");
		out.println("location.href='main.jsp?contentPage=login';");
		out.println("</script>");
		return;
	} */
%>
<td width="580" valign="top">
	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=1><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table>
<!-- --------------------------------------------------------------------------- -->
<!-- �̾ȿ� �ۼ� html body  ���� -->
	<table cellspacing='0' cellpadding='0' border='0' width=100%>
		<tr>
			<td align="center" valign="middle">
				<img src="./images/mypage/mypage.gif" border="0" >
			</td>
		</tr>
	</table>
	
	<table cellspacing='0' cellpadding='0' border='0' width=100%>
		<tr >
			<td align="center">
				<a href="main.jsp?contentPage=order/order_list">
					<img src="images/mypage/mypageicon01.png" height="100px" border="0" 
					onmouseover="this.style.filter='alpha(opacity=50)';" 
					onmouseout="this.style.filter='alpha(opacity=100)';">
				</a>
			</td>
		</tr>
		<tr >
			<td align="center">
				<a href="main.jsp?contentPage=basket">
				<img src="images/mypage/mypageicon02.png" height="100px" border="0" 
				onmouseover="this.style.filter='alpha(opacity=50)';" 
				onmouseout="this.style.filter='alpha(opacity=100)';">
				</a>
			</td>
		</tr>
		<% if(userId != null){ %>
		<tr >
			<td align="center">
				<a href='main.jsp?contentPage=view&m_id=<%=userId%>'>
					<img src="images/mypage/mypageicon03.png" height="100px" border="0" 
					onmouseover="this.style.filter='alpha(opacity=50)';" 
					onmouseout="this.style.filter='alpha(opacity=100)';">
				</a>
			</td>
		</tr>
		<% }else if( userId == null ){%>
		<tr >
			<td align="center">
				<a href='main.jsp?contentPage=join'>
					<img src="images/mypage/mypageicon03.png" height="100px" border="0" 
					onmouseover="this.style.filter='alpha(opacity=50)';" 
					onmouseout="this.style.filter='alpha(opacity=100)';">
				</a>
			</td>
		</tr>
		<% } %>
	</table> 
<!-- --------------------------------------------------------------------------- -->
	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=20><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table>
</td>