<%@page import="board.common.JDU"%>
<%@page import="board.bbs.OUTS_BBS"%>
<%@page import="board.common.IN_PAGE"%>
<%@page import="board.bbs.BBSManager"%>
<%
/********************************************************
��    ��   �� : bbs_list.jsp
��         �� : �Խ��� ����Ʈ ������ 
���� ���α׷� : 
��         �� :
*********************************************************/
%>

<%@page contentType="text/html;charset=euc-kr"%>
<%--@ page import="board.common.*,board.bbs.*"--%>


<%
	
	// ����Ʈ ���� ����
	String cPage = request.getParameter("cPage");
	if(cPage == null) cPage = "";
	
	int linesPerPage = 10; // �������� ��� ������ ��
	int pageIndex = 10;     // �������� ��Ÿ���� ������ �ε����� ����

	//�˻� ���� ����
	String search_type      = request.getParameter("search_type");
    //�˻����� 0:����Ʈ, 1:����, 2:�۾���, 3:����
		if(search_type == null) search_type = "0";

	String search_content   = request.getParameter("search_content");//�˻�����
		if(search_content == null) search_content = "";

	// IN_PAGE ����
	IN_PAGE inPage = new IN_PAGE(linesPerPage, pageIndex, cPage);

//	BBSBean BBS=new BBSBean();
	// BBSBean�� �޼ҵ� ��
//	OUTS_BBS RET = BBS.getBBSList(inPage, search_type, search_content);
	
	OUTS_BBS RET = BBSManager.getBBSManager().getBBSList(inPage, search_type, search_content);	
	
%>

<SCRIPT language="JavaScript">
function click_search( form , action )
{    
	if(is_null_field(form)) return;
	sp_form_submit( form , action , 'POST' , '' , '' );
}
function is_null_field( form )
{
 
    if( is_null( form.search_content.value ) || is_space( form.search_content.value ) )
    {
        alert( "�˻�� �Է��Ͽ� �ֽʽÿ�" );
        form.search_content.focus();
        return true;
    }
}
</SCRIPT>
     
    <!--�߾� ������ �κ�<td>-->
    <td width="580" valign="top">

      <table cellspacing=0 cellpadding=0 border=0>
        <tr> 
          <td height=20><spacer type=BLOCK height=10 width=100%></td>
        </tr>
      </table>
      
      <!-- �߾� ������ �ٲ� �κ� -->
	  <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr bgcolor="#FFFFFF" valign="middle"> 
          <td height="20" class="t1" align="right" valign="bottom">�� ��ü �Խù� �� <font color="#FF0000"><%=RET.outPage.rowCount%></font>�� | ����������( <font color="#FF0000"><%=RET.outPage.currentPage%></font> / <font color="#0000FF"><%=RET.outPage.pageSize%></font> )</td>
       </tr>
		<tr bgcolor="#B7F0B1" valign="middle"> 
          <td height="25" class="t1" align="center">
          	<b>
          		<font color="#353535">
          			<marquee behavior="scroll" direction="left">
          				<img src="images/main/bbs_title.gif">
          			<!--  ::: IamPet Community ::: --> 
          			</marquee>          			
          		</font>
          	</b>
          </td>
        </tr>
        
	    <tr> 
          <td height="1" background="images/bbs/line.gif" bgcolor="e5e5e5"><img src="images/bbs/blank.gif" width="10" height="1"></td>
        </tr>
		<tr> 
          <td height="20" >&nbsp;</td>
        </tr>
		

		<tr>
		  <td>
		    <table width="100%" align="center" border=1 cellspacing=0  bordercolordark="white" bordercolorlight="#FDADAF">
				
				<tr bgcolor="#FFC19E">
					<td align="center" height="10" width="10%" class="t1"><font color="#FFFFFF">��ȣ</font></td>
					<td align="center" height="20" width="15%" class="t1"><font color="#FFFFFF">÷������</font></td>
					<td align="center" height="20"  width="45%" class="t1"><font color="#FFFFFF">����</font></td>
					<td align="center" height="20"  width="10%" class="t1"><font color="#FFFFFF">�۾���</font></td>
					<td align="center" height="20"  width="10%" class="t1"><font color="#FFFFFF">�����</font></td>
					<td align="center" height="20"  width="10%" class="t1"><font color="#FFFFFF">��ȸ</font></td>
				</tr>

				<!--������ ������ �� ��-->
				<%
					if(RET.outPage.rowCount == 0)
					{
				%>
						<script>
							alert("�˻��� �Խù��� �����ϴ�..");
							history.back();
							
						</script>
				<%
						return;
					}
					else
					{
						int whatLevel, howSpace;
						for(int cnt=0; cnt<RET.BBSRecArray.length; cnt++)
						{
							// Ʈ������ �����...
							whatLevel = Integer.parseInt(RET.BBSRecArray[cnt].bbs_level.trim());
							if(whatLevel > 0)
								howSpace = 15 * whatLevel;
							else
								howSpace = 0;
				%>
							<tr onMouseOver="this.style.backgroundColor='#e6e6fa'" onMouseOut="this.style.backgroundColor='#FFFFFF'">
							<td align="center" width="10%" height="20" class="t1">
								<%
								if(howSpace == 0) // �ֻ������� ���
								{
								%>
								<%=RET.BBSRecArray[cnt].bbs_no%>
								<%
								}
								else // �亯���� ��� �Խù� ��ȣ�� ǥ������ �ʴ´�..
								{
								%>
								&nbsp;
								<%
								}
								%>
							</td>
							
							<td align="center" width="15%" height="20" class="t1">
								
								<%
									//÷�������� ���� ���
									if(RET.BBSRecArray[cnt].bbs_filename.equals("x")||RET.BBSRecArray[cnt].bbs_filename.equals("�̵��"))
									{
								%>
										x						
								<%
									}
									else
									{
								%>
										<a href="./download.jsp?file_name=<%=RET.BBSRecArray[cnt].bbs_filename%>"><%=JDU.getStringLen(RET.BBSRecArray[cnt].bbs_filename, 7)%></a>
								<%
									}
								
								%>
								</td>
							
							<td width="45%" height="20" class="t1"><img src="images/bbs/level.gif" border="0" width="<%=howSpace%>" height="10">
							<%
								if(howSpace == 0)// �ֻ������� ���
								{
							%>
								<a href="bbs/bbs_preview.jsp?cPage=<%=RET.outPage.currentPage%>&bbs_no=<%=RET.BBSRecArray[cnt].bbs_no%>"><%=JDU.getStringLen(RET.BBSRecArray[cnt].bbs_title, 18)%></a></td>	
							<%
								}
								else // �亯���� ���
								{
							%>
								<img src="images/bbs/re.gif" border="0" height="10">
								<a href="main.jsp?contentPage=bbs_view&cPage=<%=RET.outPage.currentPage%>&bbs_no=<%=RET.BBSRecArray[cnt].bbs_no%>"><%=JDU.getStringLen(RET.BBSRecArray[cnt].bbs_title, 15)%></a></td>
							<%
								}
							%>
						
								
							<td align="center"  width="10%" height="15" class="t1"><a href="mailto:<%=RET.BBSRecArray[cnt].bbs_email%>"><%=JDU.getStringLen(RET.BBSRecArray[cnt].bbs_name, 4)%></a></td>
							<td align="center" width="10%" height="20" class="t1"><%=RET.BBSRecArray[cnt].bbs_date.substring(5, 10)%></td>
							<td align="center" width="10%" height="10" class="t1"><%=RET.BBSRecArray[cnt].bbs_ref%></td>
							
							</tr>
		
				<%
						
					}// for End..........
				}// if ~else End...............
				%>
							
			
		    </table>
		  </td>
		</tr>

		<tr> 
          <td height="30" align="right"><a href="main.jsp?contentPage=bbs_list"><img src="images/bbs/bbs_home.gif" border="0"></a>&nbsp;<a href="main.jsp?contentPage=bbs_insert"><img src="images/bbs/bbs_write.gif" border="0"></a></td>
        </tr>

		<tr> 
          <td height="1" background="images/bbs/line.gif"><img src="images/bbs/blank.gif" width="10" height="1"></td>
        </tr>
		
		<tr bgcolor="#F0F0F0" valign="middle"> 
          <td height="20" class="t1" align="center" valign="bottom">
			
			<%
			// Previous
			if(RET.outPage.isShowPreviousMoreIcon)
			{
			%>
				<a href="main.jsp?contentPage=bbs_list&cPage=<%=RET.outPage.previousMore%>" class="m2">�� </a>

		  <%
			}
			
			// Page Index
			for(int index=RET.outPage.beginPage; index<=RET.outPage.endPage; ++index)
			{
				if(RET.outPage.currentPage != index)
				{
		  %>
					<a href="main.jsp?contentPage=bbs_list&cPage=<%=index%>" class="m2">[<%=index%>]</a>&nbsp;
		  <%
				}
				else
				{
		  %>
					<b><font color="#0000FF"><%=index%></font></b>&nbsp;
		  <%
				}
			}
		  %>

		  <%
			// Next
			if(RET.outPage.isShowNextMoreIcon)
			{
		  %>
				<a href="main.jsp?contentPage=bbs_list&cPage=<%=RET.outPage.nextMore%>" class="m1"> ��</a>
		  <%
		    }	  
		  %>					
  
		  </td>

	   </tr>

	   <tr> 
          <td height="1" background="images/bbs/line.gif" bgcolor="e5e5e5"><img src="images/bbs/blank.gif" width="10" height="1"></td>
        </tr>

		<tr> 
		  <form  name="search" action="JavaScript:click_search(document.search, 'main.jsp');">
		  <input type="hidden" name="contentPage" value="bbs_list">
		  <td height="60" align="center">
			<%
                  if(search_type.equals("0") || search_type.equals("1"))
                  {
             %>
				  <select name="search_type">
					<option value=1 selected>��&nbsp;&nbsp;��</option>
					<option value=2>�۾���</option>
					<option value=3>��&nbsp;&nbsp;��</option>
				  </select>
		     <%
                  }
                  else if(search_type.equals("2"))
                  {
             %>
				   <select name="search_type">
					<option value=1>��&nbsp;&nbsp;��</option>
					<option value=2 selected>�۾���</option>
					<option value=3>��&nbsp;&nbsp;��</option>
				   </select>
			  <%
                  }
                  else if(search_type.equals("3") )
                  {
              %>
				  <select name="search_type">
					<option value=1>��&nbsp;&nbsp;��</option>
					<option value=2>�۾���</option>
					<option value=3 selected>��&nbsp;&nbsp;��</option>
			     </select>
			  <%
                  }
              %>
		 
			 &nbsp;<input type= text name=search_content size=15 value="<%=search_content%>" class="TXTFLD">&nbsp;
			<input type="image" border="0" name="search" src="images/bbs/search.gif" width="50" height="20" align="absmiddle" alt="�˻�">			 
		  </td>
		  </form>
        </tr>

	  </table>


	  <!-- �߾� ������ �κ� ��-->   
     
      <table cellspacing=0 cellpadding=0 border=0>
        <tr> 
          <td height=20><spacer type=BLOCK height=10 width=100%></td>
        </tr>
      </table>
     

	</td>
    <!--�߾� ������ ��-->
 