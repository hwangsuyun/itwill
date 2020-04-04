<%@page import="member.MemberManager"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script type="text/javascript" src="../js/common.js">
	
</script>
<script type="text/javascript">
	function form_submit(form, action) {
		sp_form_submit(form, action, 'POST', '', '');
	}
</script>
<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String passresult = request.getParameter("result");

	ArrayList<MemberDTO> passlist = MemberManager.getMembermanager()
			.passsearch2(passresult);

	/*	String pass = "1111";
		String id = "babu";
		String email = "babu123babu@naver.com";
	 */
%>


<td width="580" valign="middle"> 
      <table cellspacing=0 cellpadding=0 border=0>
        <tr> 
          <td height=1><spacer type=BLOCK height=10 width=100%></td>
        </tr>
      </table>

<%if(passlist.size() > 0){%>

<form name="passsearch"
	action="JavaScript:form_submit(document.passsearch, './main.jsp?contentPage=login');">
		
	
			<%
				for (int i = 0; i < passlist.size(); i++) {
			%>
			<center><font color="gray" face="돋움"><%=passlist.get(i).getId()%>님의 비밀번호는 [<%=passlist.get(i).getPassword()%>]
				입니다.</font></center>
			<%
				}
			%>
		<table align="center">
		<tr valign="middle">
		<tr>

			<td height="30" class="t1" align="center"><input type="image"
				border="0" name="submit" src="./images/member/logingo.jpg">
				&nbsp;</td>

		</tr>

	
	</table>
</form>
<%}else{ %>
<form name="passsearch"
	action="JavaScript:form_submit(document.passsearch, 'main.jsp?contentPage=passsearch');">
		
	
			<center><font color="gray" face="돋움">입력정보가 틀렸습니다.</font></center>
			
		<table align="center">
		<tr valign="middle">
		<tr>

			<td height="30" class="t1" align="center"><input type="image"
				border="0" name="submit" src="./images/member/ok.jpg">
				&nbsp;</td>

		</tr>

	
	</table>
</form>
<%}%>

<!-- -------------------------------------------------------------------- -->
		<table cellspacing=0 cellpadding=0 border=0>
			<tr>
				<td height=20><spacer type=BLOCK height=10 width=100%></td>
			</tr>
		</table>


		</td>
		<!--중앙 컨텐츠 끝-->