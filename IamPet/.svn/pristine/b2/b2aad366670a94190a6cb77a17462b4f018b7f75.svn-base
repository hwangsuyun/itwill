<%@page import="member.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberManager"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript" src="../js/common.js">
</script>
<script type="text/javascript">
function form_submit(form, action)
{		
	sp_form_submit(form, action, 'POST', '', '');
}
</script> 
<%
	request.setCharacterEncoding("euc-kr");

	String name = request.getParameter("name1");
	String email = request.getParameter("email1")+"@"
					 +request.getParameter("email2");
	
	ArrayList<MemberDTO> idlist = MemberManager.getMembermanager().idsearch(email, name);
	
%>


<td width="580" valign="middle"> 
      <table cellspacing=0 cellpadding=0 border=0>
        <tr> 
          <td height=1><spacer type=BLOCK height=10 width=100%></td>
        </tr>
      </table>
<center><img src="images/member/logintitle.jpg"></center>
<%if(idlist.size() > 0){%>

 <form name="join"
		action="JavaScript:form_submit(document.join, './main.jsp?contentPage=login');">
		
		<%for(int i=0; i < idlist.size(); i++) {%>
		<center><font color="gray" face="돋움"><%=name%> 회원님의 아이디는 <%=idlist.get(i).getId()%>입니다.</font></center>
		 <%} %>
		
		<table align="center">
			<tr bgcolor="#008baf" valign="middle">
			
			<tr>
				<td height="30" class="t1" align="center"><input type="image"
					border="0" name="submit" src="./images/member/logingo.jpg">&nbsp;
				
  				<a href="main.jsp?contentPage=passsearch"><img
					src="./images/member/passsearch.jpg" border="0"></a></td>
					
			</tr>

		</table>
	</form>
<%}else{ %>
 <form name="join"
		action="JavaScript:form_submit(document.join, 'main.jsp?contentPage=idsearch');">
		
	
		<center><font color="gray">입력정보가 틀렸습니다.</font></center>
	
		
		<table align="center">
			<tr bgcolor="#008baf" valign="middle">
			
			<tr>
				<td height="30" class="t1" align="center"><input type="image"
					border="0" name="submit" src="./images/member/ok.jpg">&nbsp;
	
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