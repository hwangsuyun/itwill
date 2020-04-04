<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ include file="joincheck.jspf"%>


<html>

<link rel="stylesheet" type="text/css" href="member/common.css">

<script language="JavaScript">
function login() {
	if ( f.id.value == "" ) {
		alert("아이디를 입력하세요.");
		f.id.focus();
		return;
	}
	
	if ( f.passwd.value == "" ) {
		alert("비밀번호를 입력하세요.");
		f.passwd.focus();
		return;
	}
	
	f.action = "login.do";
	f.submit();
	}	
</script>

<!-- Start indiv -->
<br/><br/><br/>
<center><h1><font color='red'>${msg }</font></h1></center>
<div style="padding-top:10; padding-bottom:30; text-align:center">

<table width=80% align=center cellpadding="0" cellspacing="0" border="00">

<tbody>
<tr>

</tr>
<tr>	
	<td style="border:10px solid #F3F3F3;">

	<div style="margin:10 0 10 0; float:left; width:310;">
	
	
	<form name="f" method="post">
	
	<table cellpadding="3" border="0" align="right">
	
	<tbody><tr>
		<td class="input_txt">아이디</td>
		<td><input type="text" name="id" size="20" value="${fuser.id }"></td>
		<td rowspan="2" class="noline">
		
		<a href="javascript:login()"><image src ="images/member/btn_login.gif"></td>
		
	
	</tr>
	<tr>
		<td class="input_txt">비밀번호</td>
		<td><input type="password" name="passwd" size="20" value="${fuser.passwd }" ></td>
	</tr>
	</tbody></table>
	</form>
	</div>

	<div style="margin:10 0 10 0; float:right; width:315;">
	<table>
	<tbody><tr>
		<td rowspan="3" style="padding-right:10"><img src="images/member/login_div.gif"></td>
		<td><a href="main.jsp?contentPage=member/join"><img src="images/member/login_04.gif"></a></td>
	</tr>
	
	</tbody></table>
	</div>
	</td>
</tr>
</tbody></table>
<br/><br/><br/><br/><br/>

</div>
</html>
