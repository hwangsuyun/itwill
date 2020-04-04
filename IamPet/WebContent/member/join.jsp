<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script type="text/javascript" src="../js/common.js">
</script>
<SCRIPT language="JavaScript">
function idCheck(form)
{
	if(is_null(form.id.value))
	{
		alert("�˻��� ���̵� �Է��Ͻð� �ߺ�üũ�� Ȯ���ϼ���");
		form.id.focus();
		return true;
	}
	
	if(!isID(form.id))
	{
		alert("���̵� �������� �ʽ��ϴ�...\n" + "������ ���ڸ� ����ϼſ�...");
		return ;
	}
	
	url = "./member/idcheck.jsp?id="+form.id.value;
	sp_window_open(url, "�ߺ�Ȯ��", "toolbar='no',resizable='no',width=500,height=300,left=250,top=200");
}


function form_submit(form, action)
{
	if(is_null_field(form)) return;

	if(!isID(form.id))
	{

		alert("���̵� �������� �ʽ��ϴ�...\n" + "������ ���� ���");
		return ;
	}
	
	if(!isSame(form.passwd1, form.passwd2))
	{
		alert("��й�ȣ�� ���Է��� ��ġ���� �ʽ��ϴ�..");
		return ;
	}
	
	if(!isSSN(form.jumin1, form.jumin2))
	{
		alert("�ֹε�� ��ȣ�� �������� �ʽ��ϴ�..");
		return ;
	}
	
	sp_form_submit(form, action, 'POST', '', '');
}


function is_null_field(form)
{
	
	if(is_null(form.id.value) || is_space(form.id.value))
	{
		alert("���̵� �Է��Ͽ� �ֽʽÿ�.");
		form.id.focus();
		return true;
	}
	if(is_null(form.passwd1.value) || is_space(form.passwd1.value))
	{
		alert("��й�ȣ�� �Է��Ͽ� �ֽʽÿ�.");
		form.passwd1.focus();
		return true;
	}
	if(is_null(form.passwd2.value) || is_space(form.passwd2.value))
	{
		alert("��й�ȣ�� �Է��Ͽ� �ֽʽÿ�.");
		form.passwd2.focus();
		return true;
	}
	if(is_null(form.passresult.value) || is_space(form.passresult.value))
	{
		alert("��й�ȣ Ȯ�ν� �亯�� �Է��Ͽ� �ֽʽÿ�.");
		form.passresult.focus();
		return true;
	}
	
	if(is_null(form.name.value) || is_space(form.name.value))
	{
		alert("�̸��� �Է��Ͽ� �ֽʽÿ�.");
		form.name.focus();
		return true;
	}
	if(is_null(form.jumin1.value) || is_space(form.jumin1.value))
	{
		alert("�ֹε�Ϲ�ȣ�� �Է��Ͽ� �ֽʽÿ�.");
		form.jumin1.focus();
		return true;
	}
	if(is_null(form.jumin2.value) || is_space(form.jumin2.value))
	{
		alert("�ֹε�Ϲ�ȣ�� �Է��Ͽ� �ֽʽÿ�.");
		form.jumin1.focus();
		return true;
	}
	if(is_null(form.callno1.value) || is_space(form.callno1.value))
	{
		alert("������ȣ�� �Է��Ͽ� �ֽʽÿ�.");
		form.ddd.focus();
		return true;
	}
	if(is_null(form.callno2.value) || is_space(form.callno2.value))
	{
		alert("��ȭ��ȣ�� �Է��Ͽ� �ֽʽÿ�.");
		form.no1.focus();
		return true;
	}
	if(is_null(form.callno3.value) || is_space(form.callno3.value))
	{
		alert("��ȭ��ȣ�� �Է��Ͽ� �ֽʽÿ�.");
		form.no2.focus();
		return true;
	}
	if(is_null(form.mobile2.value) || is_space(form.mobile2.value))
	{
		alert("�ڵ��� ��ȣ�� �Է��Ͽ� �ֽʽÿ�.");
		form.mobile2.focus();
		return true;
	}
	if(is_null(form.mobile3.value) || is_space(form.mobile3.value))
	{
		alert("�ڵ��� ��ȣ�� �Է��Ͽ� �ֽʽÿ�.");
		form.mobile3.focus();
		return true;
	}
	if(is_null(form.email1.value) || is_space(form.email1.value))
	{
		alert("�̸����� �Է��Ͽ� �ֽʽÿ�.");
		form.email.focus();
		return true;
	}
}


// �����ȣ �˻� 
// �ּ� �˻� 
    function openConfirmAddress(userinput)
    {
        // ���̵� �Է��ߴ��� �˻�
   //    if(userinput.zipcode.value == "")
   //    {
   //         alert("���� �Է��ϼ���");
    //        return;
   //     }
        // url�� ����� �Է� id�� �����մϴ�.
        url = "./member/zipcode.jsp?zipcode="+userinput.zipcode.value;
      //  url = "./member/zipcode.jsp";    
        
        // ���ο� �����츦 ���ϴ�.
        open(url, "confirm", 
        		"toolbar=no, location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=650, height=500");
    }



</Script>
<td width="580" valign="middle"> 
      <table cellspacing=0 cellpadding=0 border=0>
        <tr> 
          <td height=1><spacer type=BLOCK height=10 width=100%></td>
        </tr>
      </table>
   		

      <form name="join"
		action="JavaScript:form_submit(document.join, './member/joinok.jsp');">
		<table width="85%" cellspacing="0" bordercolordark="white"
			bordercolorlight="black" cellpadding="0" align="center" >
			<tr bgcolor="#008baf" valign="middle">
			
			
			</tr>
			<tr>
			<td height="1">
			<center><img src="images/member/membership.jpg"></center></br></br>
			</tr>
			

			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#E5E5E5">
						<tr>
							<td width="20%" class="t1" bgcolor="#F0F0F0" align="center">
							<Strong><font color = "gray" size="2" face="����">���̵�</font></Strong></td>
							<td width="85%" class="t1">&nbsp;
							<input type="text" name="id" title="ID" maxlength="13" size="13" class="TXTFLD">&nbsp;&nbsp;&nbsp;
							<input type="button" value="���̵��ߺ�Ȯ��"  class="TXTFLD"  
								onClick="javascript:idCheck(document.join)"></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#E5E5E5">
						<tr>
							<td width="20%" class="t1" bgcolor="#F0F0F0" align="center">&nbsp;
							<Strong><font color = "gray" size="2" face="����">��й�ȣ</font></Strong></td>
							<td width="85%" class="t1">&nbsp;<input type="password"
								name="passwd1" maxlength="13" size="13" class="TXTFLD"></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#E5E5E5">
						<tr>
							<td width="20%" class="t1" bgcolor="#F0F0F0" align="center">&nbsp;
							<Strong><font color = "gray"  size="2" face="����">��й�ȣ<br/>Ȯ��</font></Strong>
							</td></td>
							<td width="85%" class="t1">&nbsp;<input type="password"
								name="passwd2" maxlength="13" size="13" class="TXTFLD"></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#E5E5E5">
						<tr>
							<td width="20%" class="t1" bgcolor="#F0F0F0" align="center">&nbsp;
							<Strong><font color = "gray" size="2" face="����">��й�ȣ <br/>Ȯ�ν� ����</font></Strong>
							</td>

							<td width="85%" class="t1">&nbsp;<select name="passquiz"
								size="1" class="TXTFLD">
									<option value="��￡ ���� �߾��� ��Ҵ�?" selected>��￡ ���� �߾��� ��Ҵ�?</option>
									<option value="�ڽ��� �λ� �¿����?">�ڽ��� �λ� �¿����?</option>
									<option value="�ڽ��� ���� ��1ȣ��?">�ڽ��� ���� ��1ȣ��?</option>
									<option value="���� ��￡ ���� ������ ������?">���� ��￡ ���� ������ ������?</option>
									<option value="Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?">Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
									<option value="�߾��ϰ� ���� ��¥�� �ִٸ�?">�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
									<option value="�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?">�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
									<option value="������� ���� �������� ģ�� �̸���?">������� ���� �������� ģ�� �̸���?</option>
									<option value="�λ� ��� ���� å �̸���?">�λ� ��� ���� å �̸���?</option>
									<option value="���� å �߿��� �����ϴ� ������ �ִٸ�?">���� å �߿��� �����ϴ� ������ �ִٸ�?</option>
									<option value="�ڽ��� �ι�°�� �����ϴ� �ι���?">�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
									<option value="ģ���鿡�� �������� ���� � �� ������ �ִٸ�?">ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
									<option value="�ʵ��б� �� ��￡ ���� ¦�� �̸���?">�ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
									<option value="�ٽ� �¾�� �ǰ� ���� ����?">�ٽ� �¾�� �ǰ� ���� ����?</option>
									<option value="���� �����ϴ� ĳ���ʹ�?">���� �����ϴ� ĳ���ʹ�?</option>
							</select>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#E5E5E5">
						<tr>
							<td width="20%" class="t1" bgcolor="#F0F0F0" align="center">&nbsp;
							<Strong><font color = "gray" size="2" face="����">��й�ȣ <br/>Ȯ�ν� �亯</font></Strong>
							</td>
							<td width="85%" class="t1">&nbsp;<input type="text"
								name="passresult" maxlength="13" size="13" class="TXTFLD"></td>
						</tr>
					</table>
				</td>
			</tr>
			
			
			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#E5E5E5">
						<tr>
							<td width="20%" class="t1" bgcolor="#F0F0F0" align="center">&nbsp;
							<Strong><font color = "gray" size="2" face="����">�̸�</font></Strong>
							</td>
							<td width="85%" class="t1">&nbsp;<input type="text"
								name="name" maxlength="8" size="8" class="TXTFLD"></td>
						</tr>
					</table>
				</td>
			</tr>


			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#E5E5E5">
						<tr>
							<td width="20%" class="t1" bgcolor="#F0F0F0" align="center">&nbsp;
							<Strong><font color = "gray" size="2" face="����">�ֹε�Ϲ�ȣ</font></Strong>
							</td>
							<td width="85%" class="t1">&nbsp;<input type="text"
								name="jumin1" maxlength="6" size="13" class="TXTFLD">&nbsp;&nbsp;-&nbsp;&nbsp;<input
								type="password" name="jumin2" maxlength="7" size="17" class="TXTFLD"></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#E5E5E5">
						<tr>
							<td rowspan="3" width="20%" class="t1" bgcolor="#F0F0F0" align="center">&nbsp;
							<Strong><font color = "gray" size="2" face="����">�ּ�</font></Strong>							
						
							<td class="t1">&nbsp;
								<input type="text" name="zipcode" maxlength="13" size="13" class="TXTFLD">&nbsp;&nbsp;&nbsp;&nbsp;								
								<input type="button" value="�����ȣã��"  class="TXTFLD"  
									onClick="javascript:openConfirmAddress(this.form)">
							</td>
						</tr>					
							<td class="t1">&nbsp;
								<input type="text" name="address1" maxlength="70" size="45" class="TXTFLD">							
								<font color = "gray" size="2" face="����">�⺻�ּ�</font>
							</td>
						</tr>
						
							<td class="t1">&nbsp;
								<input type="text" name="address2" maxlength="70" size="45" class="TXTFLD">								
								<font color = "gray" size="2" face="����">�������ּ�</font>
							</td>
						</tr>
					
					</table>
					
			</tr>
								

				<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#E5E5E5">
						<tr>
							<td width="20%" class="t1" bgcolor="#F0F0F0" align="center">
							<Strong><font color = "gray" size="2" face="����">������ȭ</font></Strong>
							</td>
							<td width="85%" class="t1">&nbsp;<input type="text"
								name="callno1" maxlength="4" size="5" class="TXTFLD">&nbsp;-&nbsp;
								<input type="text" name="callno2" maxlength="5" size="5"
								class="TXTFLD">&nbsp;-&nbsp; <input type="text"
								name="callno3" maxlength="4" size="5" class="TXTFLD">
							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#E5E5E5">
						<tr>
							<td width="20%" class="t1" bgcolor="#F0F0F0" align="center">
							<Strong><font color = "gray" size="2" face="����">�޴���ȭ</font></Strong>
							</td>
							<td width="85%" class="t1">&nbsp;<select name="mobile1"
								size="1" class="TXTFLD">
									<option value="010" selected>010</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select>&nbsp;-&nbsp; 
							<input type="text" name="mobile2" maxlength="4"
							size="5" class="TXTFLD">&nbsp;-&nbsp; 
							<input type="text" name="mobile3" maxlength="4" 
							size="5" class="TXTFLD">
							</td>
						</tr>
					</table>
				</td>
			</tr>

<!--	</font> �ֹ� �� ���Ȯ�� ���� ���� E-mail�� �߼۵ǹǷ� �ݵ�� ���Ű����� E-mail �ּҸ�
										�Է��Ͽ��ֽʽÿ�.  -->
			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#E5E5E5">
						<tr>
							<td width="20%" class="t1" bgcolor="#F0F0F0" align="center">
							<Strong><font color = "gray" size="2" face="����">�̸���</font></Strong>
							</td>
							<td width="85%" class="t1">&nbsp;<input type="text"
								name="email1" maxlength="15" size="15" class="TXTFLD"> &nbsp;@&nbsp;
								<select name="email2"size="1" class="TXTFLD">
									<option value=":::::: ���� ::::::" selected>:::::: ���� ::::::</option>
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
					border="0" name="submit" src="images/member/okbtn.gif"> &nbsp;

					<a href="main.jsp"><img
						src="images/member/resetbtn.gif" border="0"></a></td>
			</tr>

			<tr>
				<td height="1" background="images/member/line.gif"><img
					src="images/member/blank.gif" width="10" height="1"></td>
			</tr>

		</table>
	</form>