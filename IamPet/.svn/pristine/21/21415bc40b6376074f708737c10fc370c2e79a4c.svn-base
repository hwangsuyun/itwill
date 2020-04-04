<%@page import="board.bbs.BBSManager"%>
<%@page import="board.bbs.BBSRec"%>
<%
/********************************************************
파    일   명 : bbs_view.jsp
기         능 : 게시판 상세보기 페이지 
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

	// BBSBean의 메소드 콜
//	BBSRec RET = BBS.getBBSListView(bbs_no);
	BBSRec RET = BBSManager.getBBSManager().getBBSListView(bbs_no);
%>
     
    <!--중앙 컨텐츠 부분<td>-->
    <td width="580" valign="top">

      <table cellspacing=0 cellpadding=0 border=0>
        <tr> 
          <td height=20><spacer type=BLOCK height=10 width=100%></td>
        </tr>
      </table>
      
      <!-- 중앙 컨테츠 바뀔 부분 -->
	  <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0">
        <tr bgcolor="#FFFFFF" valign="middle"> 
          <td height="20" class="t1" align="right" valign="bottom">♣ 지금 보고 계신 글은 <font color="#FF0000"><%=RET.bbs_no%></font>번글입니다.</td>
       </tr>
		<tr bgcolor="#009966" valign="middle"> 
          <td height="25" class="t1" align="center"><b><font color="#FFFFFF">::: 게시물 내용보기 :::</font></b></td>
        </tr>
        
	    <tr> 
          <td height="1" background="images/bbs/line.gif" bgcolor="e5e5e5"><img src="images/bbs/blank.gif" width="10" height="1"></td>
        </tr>
		<tr> 
          <td height="20" >&nbsp;</td>
        </tr>
		

		<tr>
		  <td>
		    <table width="100%" align="center" border=1 cellspacing=0  bordercolordark="white" bordercolorlight="#ADADAD">
				
				<tr>
					<td>
						<table width="100%" align="center" border="0" cellspacing="0"> 
							<tr>
								<td bgcolor="#2C686D" align="center" height="20" width="20%" class="t1">
								<font color="#FFFFFF">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</font></td>
								<td height="20" width="80%" class="t1"><b><font color="#0000FF">&nbsp;&nbsp;<%=RET.bbs_title%></font></b></td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<table width="100%" align="center" border="0" cellspacing="0"> 
							<tr>
								<td  bgcolor="#2C686D" align="center" height="20" width="20%" class="t1"><font color="#FFFFFF">작 성 자</font></td>
								<td align="center" height="20" width="30%" class="t1"><a href="mailto:<%=RET.bbs_email%>" class="m2"><%=RET.bbs_name%></a></td>
								<td  bgcolor="#2C686D" align="center" height="20" width="20%" class="t1"><font color="#FFFFFF">작 성 일</font></td>
								<td align="center" height="20" width="30%" class="t1"><%=RET.bbs_date%></td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<table width="100%" align="center" border="0" cellspacing="0"> 
							<tr>
								<td  bgcolor="#2C686D" align="center" height="20" width="20%" class="t1"><font color="#FFFFFF">홈페이지</font></td>
								<td align="center" height="20" width="30%" class="t1"><a href="<%=RET.bbs_homepage%>" class="m2"><%=RET.bbs_homepage%></a></td>
								<td  bgcolor="#2C686D" align="center" height="20" width="20%" class="t1"><font color="#FFFFFF">조&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회</font></td>
								<td align="center" height="20" width="30%" class="t1"><%=RET.bbs_ref%></td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<table width="100%" align="center" border="0" cellspacing="10"> 
							<tr>
								<td height="50" width="1000%" class="t1"><xmp><%=RET.bbs_content%></xmp></td>
							</tr>
						</table>
					</td>
				</tr>
				
		    </table>
		  </td>
		</tr>

		

		<tr> 
          <td height="35" align="right"><a href="main.jsp?contentPage=bbs_list"><img src="images/bbs/bbs_list.gif"  border="0"></a>&nbsp;&nbsp;<a href="main.jsp?contentPage=bbs_insert&insertType=new"><img src="images/bbs/bbs_write.gif" border="0"></a>&nbsp;&nbsp;<a href="main.jsp?contentPage=bbs_update&bbs_no=<%=RET.bbs_no%>"><img src="images/bbs/bbs_modify.gif" border="0"></a>&nbsp;&nbsp;<a href="main.jsp?contentPage=bbs_insert&insertType=re&bbs_no=<%=RET.bbs_no%>&bbs_to_no=<%=RET.bbs_to_no%>&bbs_group_no=<%=RET.bbs_group_no%>&bbs_level=<%=RET.bbs_level%>&bbs_step=<%=RET.bbs_step%>"><img src="images/bbs/bbs_rewrite.gif" border="0"></a>&nbsp;&nbsp;<a href="main.jsp?contentPage=bbs_delete&bbs_no=<%=RET.bbs_no%>"><img src="images/bbs/bbs_delete.gif" border="0"></a></td>
        </tr>

		<tr> 
          <td height="1" background="images/bbs/line.gif"><img src="images/bbs/blank.gif" width="10" height="1"></td>
        </tr>

	  </table>


	  <!-- 중앙 컨텐츠 부분 끝-->   
      
      
      <table cellspacing=0 cellpadding=0 border=0>
        <tr> 
          <td height=20><spacer type=BLOCK height=10 width=100%></td>
        </tr>
      </table>
     

	</td>
    <!--중앙 컨텐츠 끝-->
 