<%@page import="board.common.JDU"%>
<%@page import="board.bbs.BBSManager"%>
<%@page import="board.bbs.BBSRec"%>
<%
/********************************************************
파    일   명 : bbs_view.jsp
기         능 : 게시판 신규/답변 글입력 페이지 
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

	String insertType = request.getParameter("insertType");
		if(insertType == null) insertType = "new";

	String bbs_no = request.getParameter("bbs_no");
	
	String bbs_to_no = request.getParameter("bbs_to_no");
		if(bbs_to_no == null) bbs_to_no = "";
	
	String bbs_group_no = request.getParameter("bbs_group_no");
		if(bbs_group_no == null) bbs_group_no = "";

	String bbs_level = request.getParameter("bbs_level");
		if(bbs_level == null) bbs_level = "0";
	
	String bbs_step = request.getParameter("bbs_step");
		if(bbs_step == null) bbs_step = "0";
%>


	
<%
	BBSRec RET = null;
	if(insertType.equals("re"))
	{
		// BBSBean의 메소드 콜
	//	RET = BBS.getBBSListView(bbs_no);
		RET = BBSManager.getBBSManager().getBBSListView(bbs_no);
	}
%>





<SCRIPT language="JavaScript">
function loading(form)
{
	form.bbs_title.focus();
}

function form_submit(form, action)
{
	if(is_null_field(form)) return;
	sp_form_submit(form, action, 'POST', '', '');
}

function is_null_field(form)
{
	
	if(is_null(form.bbs_title.value) || is_space(form.bbs_title.value))
	{
		alert("제목을 입력하여 주세요...");
		form.bbs_title.focus();
		return true;
	}
	if(is_null(form.bbs_name.value) || is_space(form.bbs_name.value))
	{
		alert("글쓴이를 입력하여 주세요...");
		form.bbs_name.focus();
		return true;
	}
	if(is_null(form.bbs_passwd.value) || is_space(form.bbs_passwd.value))
	{
		alert("비밀번호를 입력하여 주세요...");
		form.bbs_passwd.focus();
		return true;
	}
	if(is_null(form.bbs_content.value) || is_space(form.bbs_content.value))
	{
		alert("내용을 입력하여 주세요...");
		form.bbs_content.focus();
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
		  
          <%
			if(insertType.equals("new"))
			{
		  %>
		  <td height="25" class="t1" align="center"><b><font color="#FFFFFF">::: IamPet 게시판 글쓰기 :::</font></b></td>
		  <%
		  }
		  else
		  {
		  %>
		  <td height="25" class="t1" align="center"><b><font color="#FFFFFF">::: IamPet 게시판 답변글 쓰기 :::</font></b></td>
		  <%
		  }	  
		  %>
		  
        </tr>
        
	    <tr> 
          <td height="1" background="images/bbs/line.gif" bgcolor="e5e5e5"><img src="images/bbs/blank.gif" width="10" height="1"></td>
        </tr>
		<tr> 
          <td height="30" align="right" valign="bottom" class="t1"><font color="#0000FF">♣ 비밀번호는 글 수정, 삭제시 필요합니다.</font></td>
        </tr>

		<form name="bbs" enctype="multipart/form-data" action="JavaScript:form_submit(document.bbs, 'bbs/bbs_insertok.jsp');">
		<tr>
		  <td>
		    <table width="100%" align="center" border=1 cellspacing=0  bordercolordark="white" bordercolorlight="#ADADAD">

						
				<%
				if(insertType.equals("re"))
				{
				%>
				<tr>
					<td>
						<table width="100%" align="center" border="0" cellspacing="0"> 
							<tr>
								<td bgcolor="#2C686D" align="center" height="20" width="20%" class="t1">
								<font color="#FFFFFF">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</font></td>
								<td align="left" height="20" width="80%" class="t1">&nbsp;<input type="text" name="bbs_title"  value="[RE] <%=RET.bbs_title%>" maxlength="100" size="70" class="TXTFLD"></td>
							</tr>
						</table>
					</td>
				</tr>
				<%
				}
				else
				{
				%>
				<tr>
					<td>
						<table width="100%" align="center" border="0" cellspacing="0"> 
							<tr>
								<td bgcolor="#2C686D" align="center" height="20" width="20%" class="t1">
								<font color="#FFFFFF">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</font></td>
								<td align="left" height="20" width="80%" class="t1">&nbsp;<input type="text" name="bbs_title"  maxlength="100" size="70" class="TXTFLD"></td>
							</tr>
						</table>
					</td>
				</tr>
				
				<%
				}	
				%>

				<tr>
					<td>
						<table width="100%" align="center" border="0" cellspacing="0"> 
							<tr>
								<td  bgcolor="#2C686D" align="center" height="20" width="20%" class="t1"><font color="#FFFFFF">작 성 자</font></td>
								<td align="left" height="20" width="30%" class="t1">&nbsp;<input type="text" name="bbs_name"  maxlength="5" size="24" class="TXTFLD"></td>
								<td  bgcolor="#2C686D" align="center" height="20" width="20%" class="t1"><font color="#FFFFFF">비밀번호</font></td>
								<td align="left" height="20" width="30%" class="t1">&nbsp;<input type="password" name="bbs_passwd"  maxlength="8" size="24" class="TXTFLD"></td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<table width="100%" align="center" border="0" cellspacing="0"> 
							<tr>
								<td  bgcolor="#2C686D" align="center" height="20" width="20%" class="t1"><font color="#FFFFFF">홈페이지</font></td>
								<td align="left" height="20" width="30%" class="t1">&nbsp;<input type="text" name="bbs_homepage" value="http://" maxlength="24" size="24" class="TXTFLD"></td>
								<td  bgcolor="#2C686D" align="center" height="20" width="20%" class="t1"><font color="#FFFFFF">이 메 일</font></td>
								<td align="center" height="20" width="30%" class="t1">&nbsp;<input type="text" name="bbs_email"  maxlength="24" size="24" class="TXTFLD"></td>
							</tr>
						</table>
					</td>
				</tr>

				<%
				if(insertType.equals("re"))
				{
				%>
				<tr>
					<td>
						<table width="100%" align="center" border="0" cellspacing="0"> 
							<tr>
								<td height="50" width="100%" class="t1"><textarea cols="87" name="bbs_content" rows="10" wrap="hard" class="TXTFLD">>><%=JDU.getReplace(RET.bbs_content, "\n", ">>")%></textarea></td>
							</tr>
						</table>
					</td>
				</tr>
				<%
				}
				else
				{
				%>
				<tr>
					<td>
						<table width="100%" align="center" border="0" cellspacing="0"> 
							<tr>
								<td height="50" width="100%" class="t1"><textarea cols="87" name="bbs_content" rows="10" wrap="hard" class="TXTFLD"></textarea></td>
							</tr>
						</table>
					</td>
				</tr>
				<%
				}
				%>

				<tr>
					<td>
						<table width="100%" align="center" border="0" cellspacing="0"> 
							<tr>
								<td bgcolor="#2C686D" align="center" height="20" width="20%" class="t1">
								<font color="#FFFFFF">파일첨부</font></td>
								<td align="left" height="20" width="80%" class="t1">&nbsp;<input type="file" name="bbs_upfile" maxlength="50" size="50" class="TXTFLD"></td>
							</tr>
						</table>
					</td>
				</tr>
			
				<input type="hidden" name="insertType" value="<%=insertType%>">
				<input type="hidden" name="bbs_no" value="<%=bbs_no%>">
				<input type="hidden" name="bbs_to_no" value="<%=bbs_to_no%>">
				<input type="hidden" name="bbs_group_no" value="<%=bbs_group_no%>">
				<input type="hidden" name="bbs_level" value="<%=bbs_level%>">
				<input type="hidden" name="bbs_step" value="<%=bbs_step%>">

			</table>
		  </td>
		</tr>

		<tr> 
          <td height="35" align="right"><a href="main.jsp?contentPage=bbs_list"><img src="images/bbs/bbs_list.gif"  border="0"></a>&nbsp;&nbsp;
		  <input type="image" border="0" name="submit" src="images/bbs/bbs_input.gif">&nbsp;
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

 