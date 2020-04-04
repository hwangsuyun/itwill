<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!-- 로그인 했는지 안했는지 확인 -->    
<%@include file="login_check.jspf" %>      
<%@include file="geustlogin_check.jspf"%>     
<%
	request.setCharacterEncoding("euc-kr");

	String contentPage = request.getParameter("contentPage");
	/* pet_detail -> order / basket 이동시 사용할 코드 시작 */
	//상품코드
	String c_codeM=request.getParameter("c_code"); //c_code 에서 c_name_code로 변경 예정
	//상품이름코드
	String c_name_codeM=request.getParameter("c_name_code");
	//상품수량코드
	String c_countM=request.getParameter("c_count");
	String searchVal=request.getParameter("searchVal");
	//out.println(c_codeM+" "+c_countM+"\t");
	if(c_countM==null || c_countM.equals("")){
		//기본 수량 1개
		c_countM="1";
	}
	/* pet_detail -> order / basket 이동시 사용할 코드 끝 */
	
	if(contentPage == null) contentPage = "shopping";				// 기본메인화면을 쇼핑몰로 보여준다. 
	
	String scriptPage = "";
	if(contentPage.equals("member_join"))
	{
		scriptPage = "member.js";
	}
		 	 
	// contentPage 에 따라서 분류해준다. 
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
		//상품리스트페이지에서 상품클릭 :: 상품코드 전달 -> 상품네임코드로 변경예정
		contentPage = contentPage+".jsp?c_name_code="+c_name_codeM;
	}
	else if(contentPage.equals("order/order")||contentPage.equals("basket/basket")){
		//petdetail페이지에서 클릭 :: 상품코드에서 상품네임코드로 변경예정
		contentPage = contentPage+".jsp?c_name_code="+c_name_codeM+"&c_count="+c_countM;
	}
	else if(contentPage.equals("order/order_list")||contentPage.equals("basket/basket_list")){
		//마이페이지에서 클릭 :: 장바구니, 결재된 리스트 표시
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

<!--톱메뉴(common_top.jsp)시작-->
<jsp:include page="main_header.jsp"></jsp:include>
<!--톱메뉴(common_top.jsp)끝 -->

<!-- 네비게이션바 --> 
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
          		<font style="color: #888888; font-size: 13px; font-style:; font-weight: bold"> 님이 로그인 중입니다. </font>
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
		          		<font style="color: blue; font-size: 15px; font-style:; font-weight: bold">(비회원)
		          		<%=guestName%></font>
		          		<font style="color: #888888; font-size: 13px; font-style:; font-weight: bold"> 님이 로그인 중입니다.</font>
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
          	<font style="color: #888888; font-size: 13px; font-style:; font-weight: bold">로그인후 이용하시기 바랍니다.</font></td>
          	<%	
          	}//else2 end
            }//else1 end
          %>
              
        </tr>
      </table>
    </td>
  </tr>
</table>

<!--글로벌 테이블시작 -->
<table width="1024" border="0" cellspacing="0" cellpadding="0" align="center">
  
  	<tr>
		<!--좌측메뉴(common_left.jsp) 시작-->
		<jsp:include page="main_left.jsp"></jsp:include> 
		<!--좌측메뉴(common_left.jsp) 끝-->
		
		<!--중앙 컨텐츠 시작-->
		<jsp:include page="<%=contentPage %>"></jsp:include> 
		<!--중앙 컨텐츠 끝-->
	</tr>

</table>
<!--글로벌 테이블 끝-->

<!--bottom메뉴(common_bottom.jsp)시작-->
<jsp:include page="main_footer.jsp"></jsp:include>
<!--bottom메뉴(common_bottom.jsp)끝-->
</body>

</html>
