<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!-- �α��� �ߴ��� ���ߴ��� Ȯ�� -->    
<%@include file="login_check.jspf" %>      
<%@include file="geustlogin_check.jspf"%>     
<%
	request.setCharacterEncoding("euc-kr");

	String contentPage = request.getParameter("contentPage");
	/* pet_detail -> order / basket �̵��� ����� �ڵ� ���� */
	//��ǰ�ڵ�
	String c_codeM=request.getParameter("c_code"); //c_code ���� c_name_code�� ���� ����
	//��ǰ�̸��ڵ�
	String c_name_codeM=request.getParameter("c_name_code");
	//��ǰ�����ڵ�
	String c_countM=request.getParameter("c_count");
	String searchVal=request.getParameter("searchVal");
	//out.println(c_codeM+" "+c_countM+"\t");
	if(c_countM==null || c_countM.equals("")){
		//�⺻ ���� 1��
		c_countM="1";
	}
	/* pet_detail -> order / basket �̵��� ����� �ڵ� �� */
	
	if(contentPage == null) contentPage = "shopping";				// �⺻����ȭ���� ���θ��� �����ش�. 
	
	String scriptPage = "";
	if(contentPage.equals("member_join"))
	{
		scriptPage = "member.js";
	}
		 	 
	// contentPage �� ���� �з����ش�. 
	if(contentPage.equals("main_index")) contentPage = "main_index.jsp";
	else if(contentPage.equals("login"))
	{
		request.setAttribute("m_id", request.getParameter("m_id"));
		request.setAttribute("m_password", request.getParameter("m_password"));
		contentPage = "member/"+contentPage+".jsp";
	}
	else if(contentPage.equals("guestlogin"))
	{
		request.setAttribute("g_name", request.getParameter("g_name"));
		request.setAttribute("g_email", request.getParameter("g_email"));
		request.setAttribute("g_phone", request.getParameter("g_phone"));
		contentPage = "guest/"+contentPage+".jsp";
	}
	else if(contentPage.equals("join") || contentPage.equals("view") || contentPage.equals("update")
			|| contentPage.equals("idsearch") || contentPage.equals("passsearch")
			|| contentPage.equals("passsearch_result") || contentPage.equals("passsearch_result2")
			 || contentPage.equals("idsearch_result"))
	{		
		contentPage = "member/"+contentPage+".jsp";	
	}
	else if(contentPage.equals("bbs_list") || contentPage.equals("bbs_insert")
			|| contentPage.equals("bbs_view") || contentPage.equals("bbs_update")
			 || contentPage.equals("bbs_delete")) contentPage = "bbs/"+contentPage+"_content.jsp";	
	else if(contentPage.equals("shopping/pet_detail"))
	{
		//��ǰ����Ʈ���������� ��ǰŬ�� :: ��ǰ�ڵ� ���� -> ��ǰ�����ڵ�� ���濹��
		contentPage = contentPage+".jsp?c_name_code="+c_name_codeM;
	}
	else if(contentPage.equals("order/order")||contentPage.equals("basket/basket")){
		//petdetail���������� Ŭ�� :: ��ǰ�ڵ忡�� ��ǰ�����ڵ�� ���濹��
		contentPage = contentPage+".jsp?c_name_code="+c_name_codeM+"&c_count="+c_countM;
	}
	else if(contentPage.equals("order/order_list")||contentPage.equals("basket/basket_list")){
		//�������������� Ŭ�� :: ��ٱ���, ����� ����Ʈ ǥ��
		contentPage = contentPage+".jsp";
	}
	else if(contentPage.equals("basket_insertAction"))
	{
		contentPage = "basket/"+contentPage+".jsp";
	}
	else if(contentPage.equals("basket"))
	{	
		contentPage = "basket/"+contentPage+".jsp";
	}
	else if(contentPage.equals("search/search_Action"))
	{	
		contentPage = contentPage+".jsp?searchVal="+searchVal;
	}
	
	else if(contentPage.equals("orderAllBuy"))
	{	
		contentPage = "order/"+contentPage+".jsp";
	}
	else contentPage = contentPage+"/"+contentPage+".jsp";
	
	
	
	
%>    
    

<html>

<head>
<title>::: IamPet :::</title>

<link rel="stylesheet" type="text/css" href="css/common.css">
 <link rel=stylesheet type=text/css href='css/basket.css'>
  <link rel=stylesheet type=text/css href='css/common_cat.css'>
<SCRIPT type="text/javascript" SRC="js/common.js">
</SCRIPT>

<% if(scriptPage.equals("member.js")) 
   {
%>
<SCRIPT type="text/javascript" SRC="member.js">
</SCRIPT>
<%
   }
%>

</head>
<body>

<!--��޴�(common_top.jsp)����-->
<jsp:include page="main_header.jsp"></jsp:include>
<!--��޴�(common_top.jsp)�� -->

<!-- �׺���̼ǹ� --> 
<table width=1024 bgcolor="#ffffff" cellspacing=0 border=0 cellpadding=1 height="22" align="center">
  <tr> 
    <td> 
      <table width=100% bgcolor="#ffffff" cellspacing=0 border=0 cellpadding=2>
        <tr bgcolor="#ffffff"> 
          <td height="22" valign="middle" class="t1">&nbsp; <b><!-- HOME >> --></b></td>    
          <%
          	if(userId != null)
          	{
          %> 
          	<td height="22" align="right" class="t1" valign="bottom">
          		<a style="color: blue; font-size: 15px; font-style:; font-weight: bold" href='main.jsp?contentPage=view&m_id=<%=userId%>'><%=userName%></a>
          		<font style="color: #888888; font-size: 13px; font-style:; font-weight: bold"> ���� �α��� ���Դϴ�. </font>
          		<a href='member/logout.jsp' valign="bottom" >
          			<img valign="bottom" src="images/main/top_logout.gif" border="0"
					onmouseover="this.style.filter='alpha(opacity=50)';" 
					onmouseout="this.style.filter='alpha(opacity=100)';"></a>
          	</td>          	
          <%
          	}
          	else//slse1 start
          	{
          		if(guestName != null)
              	{
           %> 
		          	<td height="22" align="right" class="t1" valign="bottom">
		          		<font style="color: blue; font-size: 15px; font-style:; font-weight: bold">(��ȸ��)
		          		<%=guestName%></font>
		          		<font style="color: #888888; font-size: 13px; font-style:; font-weight: bold"> ���� �α��� ���Դϴ�.</font>
		          		<a href='member/logout.jsp'>
		          			<img src="images/main/top_logout.gif" border="0"
							onmouseover="this.style.filter='alpha(opacity=50)';" 
							onmouseout="this.style.filter='alpha(opacity=100)';">
						</a>
		          	</td>    
           <%
          	}else
          	{//else2 start
          	%>
          	<td height="22" align="right" class="t1" valign="bottom">
          	<font style="color: #888888; font-size: 13px; font-style:; font-weight: bold">�α����� �̿��Ͻñ� �ٶ��ϴ�.</font></td>
          	<%	
          	}//else2 end
            }//else1 end
          %>
              
        </tr>
      </table>
    </td>
  </tr>
</table>

<!--�۷ι� ���̺����� -->
<table width="1024" border="0" cellspacing="0" cellpadding="0" align="center">
  
  	<tr>
		<!--�����޴�(common_left.jsp) ����-->
		<jsp:include page="main_left.jsp"></jsp:include> 
		<!--�����޴�(common_left.jsp) ��-->
		
		<!--�߾� ������ ����-->
		<jsp:include page="<%=contentPage %>"></jsp:include> 
		<!--�߾� ������ ��-->
	</tr>

</table>
<!--�۷ι� ���̺� ��-->

<!--bottom�޴�(common_bottom.jsp)����-->
<jsp:include page="main_footer.jsp"></jsp:include>
<!--bottom�޴�(common_bottom.jsp)��-->
</body>

</html>