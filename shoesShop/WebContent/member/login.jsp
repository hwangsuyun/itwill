<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  
      
<script language="JavaScript">
function form_submit(form, action){
	if(login.id.value==""){
		alert("���̵� �Է��ض�");
		login.id.focus();
		return;
	}
	if(login.pwd.value==""){
		alert("��й�ȣ �Է��ض�");
		login.pwd.focus();
		return;
	}
	login.method="post";
	login.action="./member/loginok.jsp";
	login.submit();
	return;

}
function form_submit2(form, action){
	if(login2.ono.value==""){
		alert("�ֹ����̸� �Է��ض�");
		login2.ono.focus();
		return;
	}
	if(login2.phone.value==""){
		alert("�޴���ȭ��ȣ �Է��ض�");
		login2.phone.focus();
		return;
	}
	if(login2.email.value==""){
		alert("�̸��� �Է��ض�");
		login2.email.focus();
		return;
	}
	login.method="post";
	login.action="./mypage/guest_list.jsp?phone="+login2.phone.value+"&email="+login2.email.value;
	login.submit();
	return;

}



</script>
    
    
    
<td width="100%" valign="middle">
	<table cellspacing=0 cellpadding=0 border=0>
	
		<tr>
			<td height=10 ><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table>
	    
    
<!-- ���� ����  -->	
	    
    <br>
    <br>
    <br>
    <br>
    <br>
    
    		<form name="login" action="JavaScript:form_submit(document.login);">
			<table align="center" width="50%" border="0" cellspacing="0" bordercolordark="white">
			<tr>
			<br>
			<font size="5">	ȸ�� �α��� </font>
			<br>
			<br>
			</tr>
			<tr><td>
					
				<font size="3"> ���̵�</font>&nbsp;&nbsp;&nbsp;<input type="text" name="id" value="" class="input"  maxlength="16"/></td>
				<td rowspan="2">
				<input type="image" src="./images/member/btn_login[1].gif" alt="�α���" />
				</td>
				</tr>
				<tr><td>
					<font size="3">��й�ȣ</font><input type="password" name="pwd" class="input"  value = "" maxlength="10" />
				</td></tr>
				</table>
				<br>
				<br>
				<br>
				<br>
				<br>
				</form>
				<form name="login2" action="JavaScript:form_submit2(document.login2);">
				<table align="center" width="50%" border="0" cellspacing="0" bordercolordark="white" >
				<tr>
				<br>
					<font size="5">��ȸ�� �ֹ���ȸ</font>
					<br>
					<br>
					</tr>
					<tr><td>
				<font size="3">�̸�  </font><input type="text" name="ono" id="ono" class="input"  maxlength="15" /></td>
					<td rowspan="2">
						<input type="image" src="./images/member/btn_enter[1].gif" alt="��ȸ�� �ֹ���ȸ" tabindex="10" /></td></tr>
						<tr><td>
				<font size="3">��ȭ��ȣ</font><input type="text" name="phone" value="" class="input" maxlength="14" /></td></tr>
						<tr><td>
				<font size="3">�̸��� </font><input type="text" name="email" value="" class="input" maxlength="30" /></td></tr>
		</table>
	</form>


	
<!-- ���� ��  -->

<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=20><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table>
</td>			
			
	
		






