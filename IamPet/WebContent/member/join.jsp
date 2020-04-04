<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script type="text/javascript" src="../js/common.js">
</script>
<SCRIPT language="JavaScript">
function idCheck(form)
{
	if(is_null(form.id.value))
	{
		alert("검색할 아이디를 입력하시고 중복체크를 확인하세요");
		form.id.focus();
		return true;
	}
	
	if(!isID(form.id))
	{
		alert("아이디가 적절하지 않습니다...\n" + "영문과 숫자를 사용하셔요...");
		return ;
	}
	
	url = "./member/idcheck.jsp?id="+form.id.value;
	sp_window_open(url, "중복확인", "toolbar='no',resizable='no',width=500,height=300,left=250,top=200");
}


function form_submit(form, action)
{
	if(is_null_field(form)) return;

	if(!isID(form.id))
	{

		alert("아이디가 적절하지 않습니다...\n" + "영문과 숫자 사용");
		return ;
	}
	
	if(!isSame(form.passwd1, form.passwd2))
	{
		alert("비밀번호와 재입력이 일치하지 않습니다..");
		return ;
	}
	
	if(!isSSN(form.jumin1, form.jumin2))
	{
		alert("주민등록 번호가 적절하지 않습니다..");
		return ;
	}
	
	sp_form_submit(form, action, 'POST', '', '');
}


function is_null_field(form)
{
	
	if(is_null(form.id.value) || is_space(form.id.value))
	{
		alert("아이디를 입력하여 주십시요.");
		form.id.focus();
		return true;
	}
	if(is_null(form.passwd1.value) || is_space(form.passwd1.value))
	{
		alert("비밀번호를 입력하여 주십시요.");
		form.passwd1.focus();
		return true;
	}
	if(is_null(form.passwd2.value) || is_space(form.passwd2.value))
	{
		alert("비밀번호를 입력하여 주십시요.");
		form.passwd2.focus();
		return true;
	}
	if(is_null(form.passresult.value) || is_space(form.passresult.value))
	{
		alert("비밀번호 확인시 답변에 입력하여 주십시요.");
		form.passresult.focus();
		return true;
	}
	
	if(is_null(form.name.value) || is_space(form.name.value))
	{
		alert("이름을 입력하여 주십시요.");
		form.name.focus();
		return true;
	}
	if(is_null(form.jumin1.value) || is_space(form.jumin1.value))
	{
		alert("주민등록번호를 입력하여 주십시요.");
		form.jumin1.focus();
		return true;
	}
	if(is_null(form.jumin2.value) || is_space(form.jumin2.value))
	{
		alert("주민등록번호를 입력하여 주십시요.");
		form.jumin1.focus();
		return true;
	}
	if(is_null(form.callno1.value) || is_space(form.callno1.value))
	{
		alert("지역번호를 입력하여 주십시요.");
		form.ddd.focus();
		return true;
	}
	if(is_null(form.callno2.value) || is_space(form.callno2.value))
	{
		alert("전화번호를 입력하여 주십시요.");
		form.no1.focus();
		return true;
	}
	if(is_null(form.callno3.value) || is_space(form.callno3.value))
	{
		alert("전화번호를 입력하여 주십시요.");
		form.no2.focus();
		return true;
	}
	if(is_null(form.mobile2.value) || is_space(form.mobile2.value))
	{
		alert("핸드폰 번호를 입력하여 주십시요.");
		form.mobile2.focus();
		return true;
	}
	if(is_null(form.mobile3.value) || is_space(form.mobile3.value))
	{
		alert("핸드폰 번호를 입력하여 주십시요.");
		form.mobile3.focus();
		return true;
	}
	if(is_null(form.email1.value) || is_space(form.email1.value))
	{
		alert("이메일을 입력하여 주십시요.");
		form.email.focus();
		return true;
	}
}


// 우편번호 검색 
// 주소 검색 
    function openConfirmAddress(userinput)
    {
        // 아이디를 입력했는지 검사
   //    if(userinput.zipcode.value == "")
   //    {
   //         alert("동을 입력하세요");
    //        return;
   //     }
        // url과 사용자 입력 id를 조합합니다.
        url = "./member/zipcode.jsp?zipcode="+userinput.zipcode.value;
      //  url = "./member/zipcode.jsp";    
        
        // 새로운 윈도우를 엽니다.
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
							<Strong><font color = "gray" size="2" face="돋움">아이디</font></Strong></td>
							<td width="85%" class="t1">&nbsp;
							<input type="text" name="id" title="ID" maxlength="13" size="13" class="TXTFLD">&nbsp;&nbsp;&nbsp;
							<input type="button" value="아이디중복확인"  class="TXTFLD"  
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
							<Strong><font color = "gray" size="2" face="돋움">비밀번호</font></Strong></td>
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
							<Strong><font color = "gray"  size="2" face="돋움">비밀번호<br/>확인</font></Strong>
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
							<Strong><font color = "gray" size="2" face="돋움">비밀번호 <br/>확인시 질문</font></Strong>
							</td>

							<td width="85%" class="t1">&nbsp;<select name="passquiz"
								size="1" class="TXTFLD">
									<option value="기억에 남는 추억의 장소는?" selected>기억에 남는 추억의 장소는?</option>
									<option value="자신의 인생 좌우명은?">자신의 인생 좌우명은?</option>
									<option value="자신의 보물 제1호는?">자신의 보물 제1호는?</option>
									<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
									<option value="타인이 모르는 자신만의 신체비밀이 있다면?">타인이 모르는 자신만의 신체비밀이 있다면?</option>
									<option value="추억하고 싶은 날짜가 있다면?">추억하고 싶은 날짜가 있다면?</option>
									<option value="받았던 선물 중 기억에 남는 독특한 선물은?">받았던 선물 중 기억에 남는 독특한 선물은?</option>
									<option value="유년시절 가장 생각나는 친구 이름은?">유년시절 가장 생각나는 친구 이름은?</option>
									<option value="인상 깊게 읽은 책 이름은?">인상 깊게 읽은 책 이름은?</option>
									<option value="읽은 책 중에서 좋아하는 구절이 있다면?">읽은 책 중에서 좋아하는 구절이 있다면?</option>
									<option value="자신이 두번째로 존경하는 인물은?">자신이 두번째로 존경하는 인물은?</option>
									<option value="친구들에게 공개하지 않은 어릴 적 별명이 있다면?">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
									<option value="초등학교 때 기억에 남는 짝꿍 이름은?">초등학교 때 기억에 남는 짝꿍 이름은?</option>
									<option value="다시 태어나면 되고 싶은 것은?">다시 태어나면 되고 싶은 것은?</option>
									<option value="내가 좋아하는 캐릭터는?">내가 좋아하는 캐릭터는?</option>
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
							<Strong><font color = "gray" size="2" face="돋움">비밀번호 <br/>확인시 답변</font></Strong>
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
							<Strong><font color = "gray" size="2" face="돋움">이름</font></Strong>
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
							<Strong><font color = "gray" size="2" face="돋움">주민등록번호</font></Strong>
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
							<Strong><font color = "gray" size="2" face="돋움">주소</font></Strong>							
						
							<td class="t1">&nbsp;
								<input type="text" name="zipcode" maxlength="13" size="13" class="TXTFLD">&nbsp;&nbsp;&nbsp;&nbsp;								
								<input type="button" value="우편번호찾기"  class="TXTFLD"  
									onClick="javascript:openConfirmAddress(this.form)">
							</td>
						</tr>					
							<td class="t1">&nbsp;
								<input type="text" name="address1" maxlength="70" size="45" class="TXTFLD">							
								<font color = "gray" size="2" face="돋움">기본주소</font>
							</td>
						</tr>
						
							<td class="t1">&nbsp;
								<input type="text" name="address2" maxlength="70" size="45" class="TXTFLD">								
								<font color = "gray" size="2" face="돋움">나머지주소</font>
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
							<Strong><font color = "gray" size="2" face="돋움">유선전화</font></Strong>
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
							<Strong><font color = "gray" size="2" face="돋움">휴대전화</font></Strong>
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

<!--	</font> 주문 및 배송확인 정보 등이 E-mail로 발송되므로 반드시 수신가능한 E-mail 주소를
										입력하여주십시오.  -->
			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#E5E5E5">
						<tr>
							<td width="20%" class="t1" bgcolor="#F0F0F0" align="center">
							<Strong><font color = "gray" size="2" face="돋움">이메일</font></Strong>
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