<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="joincheck.jspf"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="member/common.css">
<script language="JavaScript">


	function Create() {
		if (joinjoin.id.value == "") {
			alert("���̵��Է��ϼ���.");
			joinjoin.id.focus();
			return;
		}
		if (joinjoin.passwd.value == "") {
			alert("��й�ȣ���Է��ϼ���.");
			joinjoin.passwd.focus();
			return;
		}
		if (joinjoin.passwd.value != joinjoin.passwd2.value) {
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			joinjoin.passwd.focus();
			return;
		}
		if (joinjoin.name.value == "") {
			alert("�̸����Է��ϼ���.");
			joinjoin.name.focus();
			return;
		}
		if (joinjoin.email1.value == "") {
			alert("�̸����ּҸ� �Է��ϼ���.");
			joinjoin.email1.focus();
			return;
		}
		
		if (joinjoin.email2.value == "") {
			alert("�̸����ּҸ� �����ϼ���.");
			joinjoin.email2.focus();
			return;
		}
				
		joinjoin.action = "join.do";
		joinjoin.submit();
	}

	
</script>

<br/>
<br/>


<table width="1130" height="100%" cellpadding="0" cellspacing="0" border="0" class="outline_both">

<center><h1><font color='red'>${msg }</font></h1></center>

<!-- ����̹��� || ������ġ -->
<table width="95%" cellpadding="0" cellspacing="0" border="0">
<tbody><tr>
<td></td>
</tr>

</tbody></table>

<div class="indiv"><!-- Start indiv -->

<form name="joinjoin" method="post">
<div><img src="images/member/join_txt_04.gif" border="0" align="absmiddle"></div>
<div style="border:1px solid #DEDEDE;" class="hundred">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tbody><tr>
<td style="border:5px solid #F3F3F3;">

<table width="100%" cellpadding="0" cellspacing="0">
<tbody><tr>
<td style="padding:10px 0" align="">

<table width="97%" cellpadding="5" cellspacing="0" border="0">
<tbody><tr>
	<td class="memberCols1"><font color="FF6000">*</font>���̵�</td>
	<td class="memberCols2">
	<input type="text" name="id" value="${id }" maxlength="10" required="" option="regId" label="���̵�">
	</td>
</tr>
<tr><td colspan="2" height="1" bgcolor="#DEDEDE" style="padding:0px;"></td></tr>
<tr>
	<td class="memberCols1"><font color="FF6000">*</font> ��й�ȣ</td>
	<td class="memberCols2">
	<input type="password" name="passwd" value="${passwd }" option="regPass" label="��й�ȣ">
	<span style="padding:0 10px 0 30px; letter-spacing:-1"><font color="FF6000">*</font> ��й�ȣȮ��</span>
	<input type="password" name="passwd2" value="${passwd }" option="regPass" label="��й�ȣ">
	</td>
</tr>
<tr><td colspan="2" height="1" bgcolor="#DEDEDE" style="padding:0px;"></td></tr>
<tr>
	<td class="memberCols1"><font color="FF6000">*</font> �̸�</td>
	<td class="memberCols2">
	<input type="text" name="name" value="${name }" required="" label="�̸�">
	</td>
</tr>

<tr><td colspan="2" height="1" bgcolor="#DEDEDE" style="padding:0px;"></td></tr>

<tr>
	<td class="memberCols1"><font color="FF6000">*</font> �̸���</td>
	<td class="memberCols2">
	<input type="text" name="email1" value="${email1 }" size="20" required="" option="regEmail" label="�̸���"> @
	<select name="email2" style="BORDER-RIGHT: #0099ff 1px solid; BORDER-TOP: #0099ff 1px solid; FONT-SIZE: 9pt; BORDER-LEFT: #0099ff 1px solid; COLOR: black; BORDER-BOTTOM: #0099ff 1px solid; FONT-FAMILY: ����ü; HEIGHT: 18px; BACKGROUND-COLOR: white"
 	class="select">
	
	<option value="${email2 }">===�����ϼ���===
	</option><option value="naver.com">naver.com
	</option><option value="hanmail.net">hanmail.net
	</option><option value="nate.com">nate.com
	</option><option value="gmail.com">gmail.com
	</option><option value="pran.com">pran.com

	</option></select>
	</td>



</tr>


</tr>
</tbody></table>

</td>
</tr>
</tbody></table>

</td>
</tr>
</tbody></table>
</div>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tbody><tr>
<td id="avoidDbl" align="center" height="100">
<div style="width:100%" class="noline">
<tr><br>
<center><a href="javascript: Create()"><image src ="images/member/btn_join.gif" align="center"></image></a>
<a href="main.jsp"><img src="images/member/btn_back.gif" border="0" align="center" ></tr>
</td>
</tr>
</tbody></table>

</form>

</div>
</html>