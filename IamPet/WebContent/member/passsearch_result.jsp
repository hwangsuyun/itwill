<%@page import="member.MemberManager"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript" src="../js/common.js">
</script>
<script type="text/javascript">
function form_submit(form, action)
{			
if(form.result.value == "")
{
	alert("�亯�� �Է��ϼ���.");
	form.result.focus();
	return;
}
	sp_form_submit(form, action, 'POST', '', '');
}
function form_submit2(form, action)
{			

	sp_form_submit(form, action, 'POST', '', '');
}

</script> 
<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email1")+"@"+
			 	   request.getParameter("email2");
	MemberDTO passlist = MemberManager.getMembermanager().passsearch1(id, name, email); 
	MemberDTO memberDto = new MemberDTO();

%>


<td width="580" valign="middle"> 

<%if(passlist != null){ %>
			
 <form name="join"
		action="JavaScript:form_submit(document.join, 'main.jsp?contentPage=passsearch_result2');">
		<table width="85%" cellspacing="0" bordercolordark="white"
			bordercolorlight="black" cellpadding="0" align="center">
			<tr bgcolor="white" valign="middle">

		
			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="white">
						<br/><br/>						
						<tr align=left>															
							<td>
								<font color="gray" face="����">����&nbsp;:&nbsp;<%=passlist.getId()%></font>
							</td>							
						</tr>	
						
						<tr align=left>
							<td>
								<font color="gray" face="����">�亯&nbsp;:&nbsp;<input type="text" name="result" size="15"></font>																
							</td>							
						</tr>
						
						<tr align=center>
							<td height="30" class="t1" align="center"><input type="image"
								border="0" name="submit" src="./images/member/ok.jpg"> &nbsp;								
						</tr>
													
					</table>
				</td>
			</tr>

			

		</table>
	</form>
	<%}else{%>
		<form name="join"
		action="JavaScript:form_submit2(document.join, 'main.jsp?contentPage=passsearch');">
		
	
		<center><font color="gray" face="����"> ������ �����ϴ�.</font></center>
	
		
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
	

		</td>
		<!--�߾� ������ ��-->	