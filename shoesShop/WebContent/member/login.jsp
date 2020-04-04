<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  
      
<script language="JavaScript">
function form_submit(form, action){
	if(login.id.value==""){
		alert("아이디 입력해라");
		login.id.focus();
		return;
	}
	if(login.pwd.value==""){
		alert("비밀번호 입력해라");
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
		alert("주문자이름 입력해라");
		login2.ono.focus();
		return;
	}
	if(login2.phone.value==""){
		alert("휴대전화번호 입력해라");
		login2.phone.focus();
		return;
	}
	if(login2.email.value==""){
		alert("이메일 입력해라");
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
	    
    
<!-- 내용 시작  -->	
	    
    <br>
    <br>
    <br>
    <br>
    <br>
    
    		<form name="login" action="JavaScript:form_submit(document.login);">
			<table align="center" width="50%" border="0" cellspacing="0" bordercolordark="white">
			<tr>
			<br>
			<font size="5">	회원 로그인 </font>
			<br>
			<br>
			</tr>
			<tr><td>
					
				<font size="3"> 아이디</font>&nbsp;&nbsp;&nbsp;<input type="text" name="id" value="" class="input"  maxlength="16"/></td>
				<td rowspan="2">
				<input type="image" src="./images/member/btn_login[1].gif" alt="로그인" />
				</td>
				</tr>
				<tr><td>
					<font size="3">비밀번호</font><input type="password" name="pwd" class="input"  value = "" maxlength="10" />
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
					<font size="5">비회원 주문조회</font>
					<br>
					<br>
					</tr>
					<tr><td>
				<font size="3">이름  </font><input type="text" name="ono" id="ono" class="input"  maxlength="15" /></td>
					<td rowspan="2">
						<input type="image" src="./images/member/btn_enter[1].gif" alt="비회원 주문조회" tabindex="10" /></td></tr>
						<tr><td>
				<font size="3">전화번호</font><input type="text" name="phone" value="" class="input" maxlength="14" /></td></tr>
						<tr><td>
				<font size="3">이메일 </font><input type="text" name="email" value="" class="input" maxlength="30" /></td></tr>
		</table>
	</form>


	
<!-- 내용 끝  -->

<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=20><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table>
</td>			
			
	
		






