<%@page import="member.MemberManager"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript" src="../js/common.js">
</script>
<SCRIPT language="JavaScript">
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
  function remove(form, action)
  {
	  
	  sp_form_submit(form, action, 'POST', '', '');
  }
</Script>    
<%
	String updateId = request.getParameter("m_id");
	if(updateId == null) updateId = "";	
		
	MemberDTO memberDto = MemberManager.getMembermanager().findMember(updateId);	

%>    

 
<!--중앙 컨텐츠 부분<td>-->
<td width="580" valign="top">

		<table cellspacing=0 cellpadding=0 border=0>
			<tr>
				<td height=10><spacer type=BLOCK height=10 width=100%></td>
			</tr>
		</table>

	<!-- -------------------------------------------------------------------- -->


		<table width="90%" cellspacing="0" bordercolordark="white"
			bordercolorlight="black" cellpadding="0" align="center">
			<tr bgcolor="white" valign="middle">
				<td height="30" class="t1" align="center">
				<img src="images/member/membership.jpg"><b>
				</b>
				</a></td>
			</tr>

			


			<tr>
				<td height="20" class="t1">&nbsp;</td>
			</tr>

			<form name="join" action="member/update_action.jsp" method="post">
			
			<!-- 번호와 아이디는 수정하지 않는다. -->
			<input type="hidden" name="no" value="<%=memberDto.getNo()%>">
			<input type="hidden" name="id" value="<%=memberDto.getId()%>">

			<tr>
				<td height="25" class="t1">
				<table width="100%" border="1" cellspacing="0"
					bordercolordark="white" bordercolorlight="#ADADAD">
					<tr>
						<td height="25" width="16%" class="t1" bgcolor="#f0f0f0" align="center">
						<strong>&nbsp;<font color="gray" face="돋움">회원번호&nbsp;</font></strong></td>
						<td width="100%" class="t1">&nbsp;&nbsp;
						<%=memberDto.getNo()%></a></td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="25" class="t1">
				<table width="100%" border="1" cellspacing="0"
					bordercolordark="white" bordercolorlight="#ADADAD">
					<tr>
						<td height="25" width="16%" class="t1" bgcolor="#f0f0f0" align="center">
						<strong>&nbsp;<font color="gray" face="돋움">아이디&nbsp;</font></strong></td>
						<td width="100%" class="t1">&nbsp;&nbsp;
						<%=memberDto.getId()%></a></td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="25" class="t1">
				<table width="100%" border="1" cellspacing="0"
					bordercolordark="white" bordercolorlight="#ADADAD">
					<tr>
						<td height="25" width="16%" class="t1" bgcolor="#f0f0f0" align="center">
						<strong>&nbsp;<font color="gray" face="돋움">비밀번호&nbsp;</font></strong></td>
						<td width="100%" class="t1">&nbsp;&nbsp;						
							<input type="password" name="password" value="<%=memberDto.getPassword()%>"></a>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="25" class="t1">
				<table width="100%" border="1" cellspacing="0"
					bordercolordark="white" bordercolorlight="#ADADAD">
					<tr>
						<td height="25" width="16%" class="t1" bgcolor="#f0f0f0" align="center">
						<strong>&nbsp;<font color="gray" face="돋움">이름&nbsp;</font></strong></td>
						<td width="100%" class="t1">&nbsp;&nbsp;
							<input type="text" name="name" value="<%=memberDto.getName()%>"></a>						
						</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="25" class="t1">
				<table width="100%" border="1" cellspacing="0"
					bordercolordark="white" bordercolorlight="#ADADAD">
					<tr>
						<td height="25" width="16%" class="t1" bgcolor="#f0f0f0" align="center">
						<strong>&nbsp;<font color="gray" face="돋움">주민번호&nbsp;</font></strong></td>
						<td class="t1">&nbsp;&nbsp;
							<input type="text" name="jumin1" size="6" maxlength="6" max="6" value="<%=memberDto.getJumin1()%>"></a>	
							- 	
							<input type="password" name="jumin2" size="6"  maxlength="6" max="6" value="<%=memberDto.getJumin2()%>"></a>						
						</td>
					</tr>
				</table>
				</td>
			</tr>
		
			<!--  -->
			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#ADADAD">
						<tr>
							<td width="16%" class="t1" bgcolor="#F0F0F0" align="center">
							<strong>&nbsp;<font color = "gray" size="2" face="돋움">비밀번호 <br/>확인시 질문</font></strong>
							</td>
							
							<td width="85%" class="t1">&nbsp;<select name="passquiz"
								size="1" class="TXTFLD">
							<%if(memberDto.passquiz.equals("기억에 남는 추억의 장소는?")){%>
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
							<%}else if(memberDto.passquiz.equals("자신의 인생 좌우명은?")){%>
									<option value="기억에 남는 추억의 장소는?" >기억에 남는 추억의 장소는?</option>
									<option value="자신의 인생 좌우명은?" selected>자신의 인생 좌우명은?</option>
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
							<%}else if(memberDto.passquiz.equals("자신의 보물 제1호는?")){%>
									<option value="기억에 남는 추억의 장소는?" >기억에 남는 추억의 장소는?</option>
									<option value="자신의 인생 좌우명은?">자신의 인생 좌우명은?</option>
									<option value="자신의 보물 제1호는?" selected>자신의 보물 제1호는?</option>
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
							<%}else if(memberDto.passquiz.equals("가장 기억에 남는 선생님 성함은?")){%>
									<option value="기억에 남는 추억의 장소는?" >기억에 남는 추억의 장소는?</option>
									<option value="자신의 인생 좌우명은?">자신의 인생 좌우명은?</option>
									<option value="자신의 보물 제1호는?">자신의 보물 제1호는?</option>
									<option value="가장 기억에 남는 선생님 성함은?" selected>가장 기억에 남는 선생님 성함은?</option>
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
							<%}else if(memberDto.passquiz.equals("타인이 모르는 자신만의 신체비밀이 있다면?")){%>
									<option value="기억에 남는 추억의 장소는?" >기억에 남는 추억의 장소는?</option>
									<option value="자신의 인생 좌우명은?">자신의 인생 좌우명은?</option>
									<option value="자신의 보물 제1호는?">자신의 보물 제1호는?</option>
									<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
									<option value="타인이 모르는 자신만의 신체비밀이 있다면?" selected>타인이 모르는 자신만의 신체비밀이 있다면?</option>
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
							<%}else if(memberDto.passquiz.equals("추억하고 싶은 날짜가 있다면?")){%>
									<option value="기억에 남는 추억의 장소는?" >기억에 남는 추억의 장소는?</option>
									<option value="자신의 인생 좌우명은?">자신의 인생 좌우명은?</option>
									<option value="자신의 보물 제1호는?">자신의 보물 제1호는?</option>
									<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
									<option value="타인이 모르는 자신만의 신체비밀이 있다면?">타인이 모르는 자신만의 신체비밀이 있다면?</option>
									<option value="추억하고 싶은 날짜가 있다면?" selected>추억하고 싶은 날짜가 있다면?</option>
									<option value="받았던 선물 중 기억에 남는 독특한 선물은?">받았던 선물 중 기억에 남는 독특한 선물은?</option>
									<option value="유년시절 가장 생각나는 친구 이름은?">유년시절 가장 생각나는 친구 이름은?</option>
									<option value="인상 깊게 읽은 책 이름은?">인상 깊게 읽은 책 이름은?</option>
									<option value="읽은 책 중에서 좋아하는 구절이 있다면?">읽은 책 중에서 좋아하는 구절이 있다면?</option>
									<option value="자신이 두번째로 존경하는 인물은?">자신이 두번째로 존경하는 인물은?</option>
									<option value="친구들에게 공개하지 않은 어릴 적 별명이 있다면?">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
									<option value="초등학교 때 기억에 남는 짝꿍 이름은?">초등학교 때 기억에 남는 짝꿍 이름은?</option>
									<option value="다시 태어나면 되고 싶은 것은?">다시 태어나면 되고 싶은 것은?</option>
									<option value="내가 좋아하는 캐릭터는?">내가 좋아하는 캐릭터는?</option>
							<%}else if(memberDto.passquiz.equals("받았던 선물 중 기억에 남는 독특한 선물은?")){%>
									<option value="기억에 남는 추억의 장소는?" >기억에 남는 추억의 장소는?</option>
									<option value="자신의 인생 좌우명은?">자신의 인생 좌우명은?</option>
									<option value="자신의 보물 제1호는?">자신의 보물 제1호는?</option>
									<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
									<option value="타인이 모르는 자신만의 신체비밀이 있다면?">타인이 모르는 자신만의 신체비밀이 있다면?</option>
									<option value="추억하고 싶은 날짜가 있다면?">추억하고 싶은 날짜가 있다면?</option>
									<option value="받았던 선물 중 기억에 남는 독특한 선물은?" selected>받았던 선물 중 기억에 남는 독특한 선물은?</option>
									<option value="유년시절 가장 생각나는 친구 이름은?">유년시절 가장 생각나는 친구 이름은?</option>
									<option value="인상 깊게 읽은 책 이름은?">인상 깊게 읽은 책 이름은?</option>
									<option value="읽은 책 중에서 좋아하는 구절이 있다면?">읽은 책 중에서 좋아하는 구절이 있다면?</option>
									<option value="자신이 두번째로 존경하는 인물은?">자신이 두번째로 존경하는 인물은?</option>
									<option value="친구들에게 공개하지 않은 어릴 적 별명이 있다면?">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
									<option value="초등학교 때 기억에 남는 짝꿍 이름은?">초등학교 때 기억에 남는 짝꿍 이름은?</option>
									<option value="다시 태어나면 되고 싶은 것은?">다시 태어나면 되고 싶은 것은?</option>
									<option value="내가 좋아하는 캐릭터는?">내가 좋아하는 캐릭터는?</option>
							<%}else if(memberDto.passquiz.equals("유년시절 가장 생각나는 친구 이름은?")){%>
									<option value="기억에 남는 추억의 장소는?" >기억에 남는 추억의 장소는?</option>
									<option value="자신의 인생 좌우명은?">자신의 인생 좌우명은?</option>
									<option value="자신의 보물 제1호는?">자신의 보물 제1호는?</option>
									<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
									<option value="타인이 모르는 자신만의 신체비밀이 있다면?">타인이 모르는 자신만의 신체비밀이 있다면?</option>
									<option value="추억하고 싶은 날짜가 있다면?">추억하고 싶은 날짜가 있다면?</option>
									<option value="받았던 선물 중 기억에 남는 독특한 선물은?">받았던 선물 중 기억에 남는 독특한 선물은?</option>
									<option value="유년시절 가장 생각나는 친구 이름은?" selected>유년시절 가장 생각나는 친구 이름은?</option>
									<option value="인상 깊게 읽은 책 이름은?">인상 깊게 읽은 책 이름은?</option>
									<option value="읽은 책 중에서 좋아하는 구절이 있다면?">읽은 책 중에서 좋아하는 구절이 있다면?</option>
									<option value="자신이 두번째로 존경하는 인물은?">자신이 두번째로 존경하는 인물은?</option>
									<option value="친구들에게 공개하지 않은 어릴 적 별명이 있다면?">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
									<option value="초등학교 때 기억에 남는 짝꿍 이름은?">초등학교 때 기억에 남는 짝꿍 이름은?</option>
									<option value="다시 태어나면 되고 싶은 것은?">다시 태어나면 되고 싶은 것은?</option>
									<option value="내가 좋아하는 캐릭터는?">내가 좋아하는 캐릭터는?</option>
							<%}else if(memberDto.passquiz.equals("인상 깊게 읽은 책 이름은?")){%>
									<option value="기억에 남는 추억의 장소는?" >기억에 남는 추억의 장소는?</option>
									<option value="자신의 인생 좌우명은?">자신의 인생 좌우명은?</option>
									<option value="자신의 보물 제1호는?">자신의 보물 제1호는?</option>
									<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
									<option value="타인이 모르는 자신만의 신체비밀이 있다면?">타인이 모르는 자신만의 신체비밀이 있다면?</option>
									<option value="추억하고 싶은 날짜가 있다면?">추억하고 싶은 날짜가 있다면?</option>
									<option value="받았던 선물 중 기억에 남는 독특한 선물은?">받았던 선물 중 기억에 남는 독특한 선물은?</option>
									<option value="유년시절 가장 생각나는 친구 이름은?">유년시절 가장 생각나는 친구 이름은?</option>
									<option value="인상 깊게 읽은 책 이름은?" selected>인상 깊게 읽은 책 이름은?</option>
									<option value="읽은 책 중에서 좋아하는 구절이 있다면?">읽은 책 중에서 좋아하는 구절이 있다면?</option>
									<option value="자신이 두번째로 존경하는 인물은?">자신이 두번째로 존경하는 인물은?</option>
									<option value="친구들에게 공개하지 않은 어릴 적 별명이 있다면?">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
									<option value="초등학교 때 기억에 남는 짝꿍 이름은?">초등학교 때 기억에 남는 짝꿍 이름은?</option>
									<option value="다시 태어나면 되고 싶은 것은?">다시 태어나면 되고 싶은 것은?</option>
									<option value="내가 좋아하는 캐릭터는?">내가 좋아하는 캐릭터는?</option>
							<%}else if(memberDto.passquiz.equals("읽은 책 중에서 좋아하는 구절이 있다면?")){%>
									<option value="기억에 남는 추억의 장소는?" >기억에 남는 추억의 장소는?</option>
									<option value="자신의 인생 좌우명은?">자신의 인생 좌우명은?</option>
									<option value="자신의 보물 제1호는?">자신의 보물 제1호는?</option>
									<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
									<option value="타인이 모르는 자신만의 신체비밀이 있다면?">타인이 모르는 자신만의 신체비밀이 있다면?</option>
									<option value="추억하고 싶은 날짜가 있다면?">추억하고 싶은 날짜가 있다면?</option>
									<option value="받았던 선물 중 기억에 남는 독특한 선물은?">받았던 선물 중 기억에 남는 독특한 선물은?</option>
									<option value="유년시절 가장 생각나는 친구 이름은?">유년시절 가장 생각나는 친구 이름은?</option>
									<option value="인상 깊게 읽은 책 이름은?">인상 깊게 읽은 책 이름은?</option>
									<option value="읽은 책 중에서 좋아하는 구절이 있다면?" selected>읽은 책 중에서 좋아하는 구절이 있다면?</option>
									<option value="자신이 두번째로 존경하는 인물은?">자신이 두번째로 존경하는 인물은?</option>
									<option value="친구들에게 공개하지 않은 어릴 적 별명이 있다면?">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
									<option value="초등학교 때 기억에 남는 짝꿍 이름은?">초등학교 때 기억에 남는 짝꿍 이름은?</option>
									<option value="다시 태어나면 되고 싶은 것은?">다시 태어나면 되고 싶은 것은?</option>
									<option value="내가 좋아하는 캐릭터는?">내가 좋아하는 캐릭터는?</option>
							<%}else if(memberDto.passquiz.equals("자신이 두번째로 존경하는 인물은?")){%>
									<option value="기억에 남는 추억의 장소는?" >기억에 남는 추억의 장소는?</option>
									<option value="자신의 인생 좌우명은?">자신의 인생 좌우명은?</option>
									<option value="자신의 보물 제1호는?">자신의 보물 제1호는?</option>
									<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
									<option value="타인이 모르는 자신만의 신체비밀이 있다면?">타인이 모르는 자신만의 신체비밀이 있다면?</option>
									<option value="추억하고 싶은 날짜가 있다면?">추억하고 싶은 날짜가 있다면?</option>
									<option value="받았던 선물 중 기억에 남는 독특한 선물은?">받았던 선물 중 기억에 남는 독특한 선물은?</option>
									<option value="유년시절 가장 생각나는 친구 이름은?">유년시절 가장 생각나는 친구 이름은?</option>
									<option value="인상 깊게 읽은 책 이름은?">인상 깊게 읽은 책 이름은?</option>
									<option value="읽은 책 중에서 좋아하는 구절이 있다면?">읽은 책 중에서 좋아하는 구절이 있다면?</option>
									<option value="자신이 두번째로 존경하는 인물은?" selected>자신이 두번째로 존경하는 인물은?</option>
									<option value="친구들에게 공개하지 않은 어릴 적 별명이 있다면?">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
									<option value="초등학교 때 기억에 남는 짝꿍 이름은?">초등학교 때 기억에 남는 짝꿍 이름은?</option>
									<option value="다시 태어나면 되고 싶은 것은?">다시 태어나면 되고 싶은 것은?</option>
									<option value="내가 좋아하는 캐릭터는?">내가 좋아하는 캐릭터는?</option>
							<%}else if(memberDto.passquiz.equals("친구들에게 공개하지 않은 어릴 적 별명이 있다면?")){%>
									<option value="기억에 남는 추억의 장소는?" >기억에 남는 추억의 장소는?</option>
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
									<option value="친구들에게 공개하지 않은 어릴 적 별명이 있다면?" selected>친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
									<option value="초등학교 때 기억에 남는 짝꿍 이름은?">초등학교 때 기억에 남는 짝꿍 이름은?</option>
									<option value="다시 태어나면 되고 싶은 것은?">다시 태어나면 되고 싶은 것은?</option>
									<option value="내가 좋아하는 캐릭터는?">내가 좋아하는 캐릭터는?</option>
							<%}else if(memberDto.passquiz.equals("초등학교 때 기억에 남는 짝꿍 이름은?")){%>
									<option value="기억에 남는 추억의 장소는?" >기억에 남는 추억의 장소는?</option>
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
									<option value="초등학교 때 기억에 남는 짝꿍 이름은?" selected>초등학교 때 기억에 남는 짝꿍 이름은?</option>
									<option value="다시 태어나면 되고 싶은 것은?">다시 태어나면 되고 싶은 것은?</option>
									<option value="내가 좋아하는 캐릭터는?">내가 좋아하는 캐릭터는?</option>
							<%}else if(memberDto.passquiz.equals("다시 태어나면 되고 싶은 것은?")){%>
									<option value="기억에 남는 추억의 장소는?" >기억에 남는 추억의 장소는?</option>
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
									<option value="다시 태어나면 되고 싶은 것은?" selected>다시 태어나면 되고 싶은 것은?</option>
									<option value="내가 좋아하는 캐릭터는?">내가 좋아하는 캐릭터는?</option>
							<%}else if(memberDto.passquiz.equals("내가 좋아하는 캐릭터는?")){%>
									<option value="기억에 남는 추억의 장소는?" >기억에 남는 추억의 장소는?</option>
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
									<option value="내가 좋아하는 캐릭터는?" selected>내가 좋아하는 캐릭터는?</option>
							<%}else{%>
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
									<option value="내가 좋아하는 캐릭터는?" >내가 좋아하는 캐릭터는?</option>
							<%} %>
				
							</select>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<!--  -->
			<tr>
				<td height="25" class="t1">
				<table width="100%" border="1" cellspacing="0"
					bordercolordark="white" bordercolorlight="#ADADAD">
					<tr>
						<td height="25" width="16%" class="t1" bgcolor="#f0f0f0" align="center">
						<strong>&nbsp;<font color="gray" face="돋움">비번찾기</br>정답&nbsp;</font></strong></td>
						<td width="100%" class="t1">&nbsp;&nbsp;
							<input type="text" name="passresult" value="<%=memberDto.getPassresult()%>"></a>							
						</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="25" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#ADADAD">
						<tr>
							<td rowspan="3" width="15%" class="t1" bgcolor="#F0F0F0" align="center">&nbsp;
							<strong>&nbsp;<font color="gray" face="돋움">주소&nbsp;&nbsp;</font></strong></td>						
						
							<td width="80%" class="t1">&nbsp;
								<input type="text" name="zipcode" value = "<%=memberDto.getZipcode()%>" maxlength="13" size="13" class="TXTFLD">&nbsp;&nbsp;&nbsp;&nbsp;								
								<input type="button" value="우편번호찾기"  class="TXTFLD"  
									onClick="javascript:openConfirmAddress(this.form)">
							</td>
						</tr>					
							<td width="80%" class="t1">&nbsp;
								<input type="text" name="address1" value="<%=memberDto.getAddress()%>" maxlength="70" size="45" class="TXTFLD">&nbsp;
								<font color = "gray" size="2" face="돋움">나머지주소</font>							
							</td>
						</tr>
						
					
					</table>
					
			</tr>
			
			
			<tr>
				<td height="25" class="t1">
				<table width="100%" border="1" cellspacing="0"
					bordercolordark="white" bordercolorlight="#ADADAD">
					<tr>
						<td height="25" width="16%" class="t1" bgcolor="#f0f0f0" align="center">
						<strong>&nbsp;<font color="gray" face="돋움">이메일&nbsp;</font></strong></td>
						<td width="100%" class="t1">&nbsp;&nbsp;
							<input type="text" name="email" value="<%=memberDto.getEmail()%>"></a>							
						</td>
					</tr>
				</table>
				</td>
			</tr>
			
			
			
			
			
			<tr>
				<td height="25" class="t1">
				<table width="100%" border="1" cellspacing="0"
					bordercolordark="white" bordercolorlight="#ADADAD">
					<tr>
						<td height="25" width="16%" class="t1" bgcolor="#f0f0f0" align="center">
						<strong>&nbsp;<font color="gray" face="돋움">집전화&nbsp;</font></strong></td>
						<td width="100%" class="t1">&nbsp;&nbsp;
							<input type="text" name="homephone" value="<%=memberDto.getHomephone()%>"></a>							
						</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="25" class="t1">
				<table width="100%" border="1" cellspacing="0"
					bordercolordark="white" bordercolorlight="#ADADAD">
					<tr>
						<td height="25" width="16%" class="t1" bgcolor="#f0f0f0" align="center">
						<strong>&nbsp;<font color="gray" face="돋움">휴대폰&nbsp;</font></strong></td>
						<td width="100%" class="t1">&nbsp;&nbsp;
							<input type="text" name="cellphone" value="<%=memberDto.getCellphone()%>"></a>							
						</td>
					</tr>
				</table>
				</td>
			</tr>			

			<tr>
				<td height="20" class="t1">
				<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<tr>
						<td width="75%" class="t1">&nbsp;</td>
					</tr>
				</table>
				</td>
			</tr>
	
			<tr>
				<td height="30" class="t1" align="center" valign="top">
				
				<input type="button" value="메인" onclick="location.href='main.jsp';">
			<!--  	<a href="main.jsp">홈</a>   -->
				&nbsp;&nbsp;|&nbsp;&nbsp;	
				<input type="submit" value="수정">
				&nbsp;&nbsp;|&nbsp;&nbsp;				
				<input type="button" value="탈퇴"	  
					   onClick="javascript:remove(this.form ,'member/remove.jsp')">
					   
			</tr>		

			</form>

			<tr>
				<td height="1" background="images/member/line.gif">
				<img src="images/member/blank.gif" width="10" height="1"></td>
			</tr>

		</table>
		
		
		
		<!-- -------------------------------------------------------------------- -->
		<table cellspacing=0 cellpadding=0 border=0>
			<tr>
				<td height=20><spacer type=BLOCK height=10 width=100%></td>
			</tr>
		</table>


		</td>
		<!--중앙 컨텐츠 끝-->
    