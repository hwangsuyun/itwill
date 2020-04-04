<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String id = (String)request.getAttribute("m_id");
	String password = (String)request.getAttribute("m_password");
	
	if(id == null) id = "";
	if(password == null) password = "";
	
	System.out.println("id : "+id);
	System.out.println("password : "+password);
	
%>	


<SCRIPT language="JavaScript">

function form_submit(form, action)
{	
	if (login.id.value == "") {
		alert("사용자 아이디를 입력하십시요.");
		login.id.focus();
		return;
	}
	if (login.passwd1.value == "") {
		alert("비밀번호를 입력하십시요.");
		login.passwd1.focus();
		return;
	}
	sp_form_submit(form, action, 'POST', '', '');
}


</script>   


<td width="100%" valign="middle">
	<table cellspacing=0 cellpadding=0 border=0>
	
		<tr>
			<td height=1 ><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table>
<!-- --------------------------------------------------------------------------- -->
<!-- 이안에 작성 html body  없이 -->
		<table align="center" width="30%" border="0" cellspacing="0" bordercolordark="white" bordercolorlight="#FFFFFF">
			<tr>
				<td align="center" valign="middle" style="padding-bottom: 30px">
					<img src="images/member/logintitle.jpg">
				</td>
			</tr>
		</table>
		<form name="login" action="JavaScript:form_submit(document.login, './member/loginok.jsp');">
		<table align="center" width="30%" border="0" cellspacing="0" bordercolordark="white" bordercolorlight="#FFFFFF">
				<tr>
					<td width="30%" class="t1" bgcolor="#FFFFFF" align="right">&nbsp;
						<font color = "#C0C000" size="2" face="돋움" >아이디</font>&nbsp;</td>
					<td width="70%" class="t1" v>&nbsp;&nbsp;
						<input type="text" name="id" style="margin-bottom: 5px" title="ID" maxlength="13" size="13" class="TXTFLD" value="<%=id%>">
					</td>
					<td rowspan="2" height="25" class="t1" style="padding-left: 20px">
						<input type="image" border="0" name="submit"  src="images/member/login.gif">
					</td>
				</tr>
				<tr>
					<td width="40%" class="t1" bgcolor="#FFFFFF" align="right">&nbsp;
						<font color="#C0C000" size="2" face="돋움">비밀번호</font>&nbsp;
					</td>
					<td width="60%" class="t1" >&nbsp;
						<input type="password" name="passwd1" style="margin-bottom: 5px"  maxlength="13" size="13" class="TXTFLD">
					</td>
				</tr>				
			
				<tr style="padding-top: 10px">			
					<td>	
						<a href='main.jsp?contentPage=join'>
						<img src="images/member/memberjoin.gif" border="0"></a>
					</td>						
					<td>
					<!--  	<a href='./member/idsearch.jsp'>  -->
						<a href='main.jsp?contentPage=idsearch'>
						<img src="images/member/idfind.gif" border="0"></a>
					</td>						
					<td>
					<!--  	<a href='./member/passsearch.jsp'>  -->
						<a href='main.jsp?contentPage=passsearch'>
						<img src="images/member/passfind.gif" border="0"></a>
					</td>		
				</tr>
				</table>
			</form>	
<!-- --------------------------------------------------------------------------- -->
	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=20><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table>
</td>			
			