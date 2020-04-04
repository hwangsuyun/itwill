<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript" src="../js/common.js">
</script>
<script type="text/javascript">
function form_submit(form, action)
{		
	if(form.id.value == "")
	{
		alert("사용자 아이디를 입력하세요.");
		form.id.focus();
		return;
	}
	if(form.name.value == "")
	{
		alert("사용자 이름 입력하세요.");
		form.name.focus();
		return;
	}
	
	if (form.email1.value == "") 
	{
		alert("이메일을 입력하세요.");
		form.email1.focus();
		return;
	}

	sp_form_submit(form, action, 'POST', '', '');
}
</script> 

<td width="580" valign="middle"> 
      <table cellspacing=0 cellpadding=0 border=0>
        <tr> 
          <td height=1><spacer type=BLOCK height=10 width=100%></td>
        </tr>
      </table>
   			
<center><img src="images/member/logintitle.jpg"></center>
      <form name="passsearch"
		action="JavaScript:form_submit(document.passsearch, 'main.jsp?contentPage=passsearch_result');">
		<table width="85%" cellspacing="0" bordercolordark="white"
			bordercolorlight="black" cellpadding="0" align="center">
			<tr bgcolor="#008baf" valign="middle">
			
			
			</tr>

			<tr>
				<td height="1" background="../images/member/line.gif" bgcolor="e5e5e5"><img
					src="../images/member/blank.gif" width="10" height="1"></td>
			</tr>

<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#E5E5E5">
						<tr>
							<td width="15%" class="t1" bgcolor="#F0F0F0" align="center">&nbsp;
							<font color = "gray" size="2" face="돋움">아이디</font>
							</td>
							<td width="85%" class="t1">&nbsp;<input type="text"
								name="id" title="ID" maxlength="13" size="13" class="TXTFLD">
						</tr>
					</table>
				</td>
			</tr>

			
			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#E5E5E5">
						<tr>
							<td width="15%" class="t1" bgcolor="#F0F0F0" align="center">&nbsp;
							<font color = "gray" size="2" face="돋움">이름</font>
							</td>
							<td width="85%" class="t1">&nbsp;<input type="text"
								name="name" maxlength="13" size="13" class="TXTFLD"></td>
						</tr>
					</table>
				</td>
			</tr>



<!--	</font> 주문 및 배송확인 정보 등이 E-mail로 발송되므로 반드시 수신가능한 E-mail 주소를
										입력하여주십시오.  -->
			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#E5E5E5">
						<tr>
							<td width="15%" class="t1" bgcolor="#F0F0F0" align="center">
							<font color = "gray" size="2" face="돋움">이메일</font>
							</td>
							<td width="85%" class="t1">&nbsp;<input type="text"
								name="email1" maxlength="15" size="15" class="TXTFLD"> &nbsp;@&nbsp;
								<select name="email2"size="1" class="TXTFLD">
									<option value=":::::: 선택 ::::::" selected>:::::: 선택 ::::::</option>
									<option value="chol.com">chol.com</option>
									<option value="dreamwiz.com">dreamwiz.com</option>
									<option value="emapl.com">emapl.com</option>
									<option value="hanmir.com">hanmir.com</option>
									<option value="hanafos.com">hanafos.com</option>
									<option value="lycos.co.kr">lycos.co.kr</option>
									<option value="nate.com">nate.com</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="paran.com">paran.com</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option>
									
							</select></td>
							
						</tr>
					</table>
				</td>
			</tr>	



			<tr>
				<td height="30" class="t1" align="center"><input type="image"
					border="0" name="submit" src="./images/member/ok.jpg"> &nbsp;

					
			</tr>

			<tr>
				<td height="1" background="./images/member/line.gif"><img
					src="./images/member/blank.gif" width="10" height="1"></td>
			</tr>

		</table>
	</form>