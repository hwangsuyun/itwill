
<%@page import="board.bbs.BBSRec"%>
<%@page import="board.bbs.BBSManager"%>
<%
/********************************************************
파    일   명 : bbs_delete.jsp
기         능 : 게시판 삭제 페이지 
관련 프로그램 : 
변         경 :
*********************************************************/
%>
<%@page contentType="text/html;charset=euc-kr"%>

<%
//	BBSBean BBS=new BBSBean();
	// 리스트 관련 변수
	String cPage = request.getParameter("cPage");
	if(cPage == null) cPage = "";

	String bbs_no = request.getParameter("bbs_no");

	/// BBSBean의 메소드 콜
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
          <td height="25" class="t1" align="center"><b><font color="#FFFFFF">::: 글삭제 :::</font></b></td>
        </tr>
        	    
		<tr> 
          <td height="1" background="images/bbs/line.gif" bgcolor="e5e5e5"><img src="images/bbs/blank.gif" width="10" height="1"></td>
        </tr>
		<tr> 
          <td height="20" ></td>
        </tr>

		<form name="bbs" action="JavaScript:form_submit(document.bbs, 'bbs/bbs_deleteok.jsp');">

		<tr>
		  <td>
		    <table width="100%" align="center" border=1 cellspacing=0  bordercolordark="white" bordercolorlight="#ADADAD">
								
				<tr>
					<td>
						<table width="100%" align="center" border="0" cellspacing="0"> 
							<tr>
								<td bgcolor="#2C686D" align="center" height="20" width="20%" class="t1">
								<font color="#FFFFFF">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</font></td>
								<td align="left" height="20" width="80%" class="t1">&nbsp;<%=RET.bbs_title%></td>
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
								<td align="left" height="20" width="30%" class="t1">&nbsp;<input type="password" name="bbs_passwd"  maxlength="8" size="24" class="TXTFLD"></td>
							</tr>
							<input type="hidden" name="bbs_no" value="<%=RET.bbs_no%>">
							<input type="hidden" name="bbs_group_no" value="<%=RET.bbs_group_no%>">
							<input type="hidden" name="bbs_level" value="<%=RET.bbs_level%>">

						</table>
					</td>
				</tr>
			

		    </table>
		  </td>
		</tr>

 
		<tr> 
          <td height="40" align="center">
		  <input type="image" border="0" name="submit" src="images/bbs/bbs_deleteok.gif">
		  &nbsp;&nbsp;<a href="main.jsp?contentPage=bbs_view&bbs_no=<%=RET.bbs_no%>"><img src="images/bbs/back.gif" border="0"></a></td>
        </tr>

		<tr> 
          <td height="1" background="images/bbs/line.gif"><img src="images/bbs/blank.gif" width="10" height="1"></td>
        </tr>
		</form>
		
	  </table>

	  <!-- 중앙 컨텐츠 부분 끝-->   
      
      
      <table cellspacing=0 cellpadding=0 border=0>
        <tr> 
          <td height=20><spacer type=BLOCK height=10 width=100%></td>
        </tr>
      </table>
     

	</td>
    <!--중앙 컨텐츠 끝-->
  