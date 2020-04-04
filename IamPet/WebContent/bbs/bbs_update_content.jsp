<%@page import="board.bbs.BBSManager"%>
<%@page import="board.bbs.BBSRec"%>
<%
/********************************************************
파    일   명 : bbs_update.jsp
기         능 : 게시판 수정 페이지 
관련 프로그램 : 
변         경 :
*********************************************************/
%>
<%@page contentType="text/html;charset=euc-kr"%>


<%
	// 리스트 관련 변수
	String cPage = request.getParameter("cPage");
	if(cPage == null) cPage = "";

	String bbs_no = request.getParameter("bbs_no");
%>


<%
//	BBSBean BBS=new BBSBean();
	// BBSBean의 메소드 콜
//	BBSRec RET = BBS.getBBSListView(bbs_no);
	BBSRec RET = BBSManager.getBBSManager().getBBSListView(bbs_no); 
%>

<SCRIPT language="JavaScript">
function form_submit(form, action)
{
	if(is_null_field(form)) return;

	sp_form_submit(form, action, 'POST', '', '');
}
function is_null_field(form)
{
	
	if(is_null(form.bbs_passwd.value) || is_space(form.bbs_passwd.value))
	{
		alert("비밀번호를 입력하여 주세요...");
		form.bbs_passwd.focus();
		return true;
	}
}

</SCRIPT>
    <!--중앙 컨텐츠 부분<td>-->
    <td width="580" valign="top">

      <table cellspacing=0 cellpadding=0 border=0>
        <tr> 
          <td height=20><spacer type=BLOCK height=10 width=100%></td>
        </tr>
      </table>
      
      <!-- 중앙 컨테츠 바뀔 부분 -->
	  <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0">
        
	<tr bgcolor="#009966" valign="middle"> 
          <td height="25" class="t1" align="center"><b><font color="#FFFFFF">::: 글수정 :::</font></b></td>
        </tr>
        
	    <tr> 
          <td height="1" background="images/bbs/line.gif" bgcolor="e5e5e5"><img src="images/bbs/blank.gif" width="10" height="1"></td>
        </tr>
		<tr> 
          <td height="30" align="right" valign="bottom" class="t1"><font color="#0000FF">♣ 비밀번호는 글 수정, 삭제시 필요합니다.</font></td>
        </tr>

		 
		<form name="bbs" action="JavaScript:form_submit(document.bbs, 'bbs/bbs_updateok.jsp?bbs_no=<%=bbs_no%>');">
		<tr>
		  <td>
		    <table width="100%" align="center" border=1 cellspacing=0  bordercolordark="white" bordercolorlight="#ADADAD">
								
				<tr>
					<td>
						<table width="100%" align="center" border="0" cellspacing="0"> 
							<tr>
								<td bgcolor="#2C686D" align="center" height="20" width="20%" class="t1">
								<font color="#FFFFFF">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</font></td>
								<td align="left" height="20" width="80%" class="t1">&nbsp;<input type="text" name="bbs_title" value="<%=RET.bbs_title%>" maxlength="70" size="70" class="TXTFLD"></td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<table width="100%" align="center" border="0" cellspacing="0"> 
							<tr>
								<td  bgcolor="#2C686D" align="center" height="20" width="20%" class="t1"><font color="#FFFFFF">작 성 자</font></td>
								<td align="left" height="20" width="30%" class="t1">&nbsp;<%=RET.bbs_name%></td>
								<td  bgcolor="#2C686D" align="center" height="20" width="20%" class="t1"><font color="#FFFFFF">비밀번호</font></td>
								<td align="left" height="20" width="30%" class="t1">&nbsp;<input type="password" name="bbs_passwd"  maxlength="24" size="24" class="TXTFLD"></td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<table width="100%" align="center" border="0" cellspacing="0"> 
							<tr>
								<td  bgcolor="#2C686D" align="center" height="20" width="20%" class="t1"><font color="#FFFFFF">홈페이지</font></td>
								<td align="left" height="20" width="30%" class="t1">&nbsp;<input type="text" name="bbs_homepage" value="<%=RET.bbs_homepage%>" maxlength="24" size="24" class="TXTFLD"></td>
								<td  bgcolor="#2C686D" align="center" height="20" width="20%" class="t1"><font color="#FFFFFF">이 메 일</font></td>
								<td align="center" height="20" width="30%" class="t1">&nbsp;<input type="text" name="bbs_email" value="<%=RET.bbs_email%>" maxlength="24" size="24" class="TXTFLD"></td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<table width="100%" align="center" border="0" cellspacing="0"> 
							<tr>
								<td height="50" width="100%" class="t1"><textarea cols="87" name="bbs_content" rows="10" class="TXTFLD"><%=RET.bbs_content%></textarea></td>
							</tr>
						</table>
					</td>
				</tr>

		    </table>
		  </td>
		</tr>
		

		<tr> 
          <td height="35" align="right"><a href="main.jsp?contentPage=bbs_list"><img src="images/bbs/bbs_list.gif" border="0"></a>&nbsp;&nbsp;
		  <input type="image" border="0" name="submit" src="images/bbs/bbs_input.gif">
		  </td>
        </tr>

		<tr> 
          <td height="1" background="images/bbs/line.gif"><img src="images/bbs/blank.gif" width="10" height="1"></td>
        </tr>

		</form>

		
	  </table>

      
      <table cellspacing=0 cellpadding=0 border=0>
        <tr> 
          <td height=20><spacer type=BLOCK height=10 width=100%></td>
        </tr>
      </table>
     

	</td>
    <!--중앙 컨텐츠 끝-->
