<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");

	String contentPage = request.getParameter("contentPage");

	String m_name = (String)session.getAttribute("m_name");
	String p_engname=request.getParameter("p_engname");
	String p_name=request.getParameter("p_name");
	String price=request.getParameter("p_price");
	String basket_code = request.getParameter("basket_code");
	String m_id = (String)session.getAttribute("m_id");
	String p_code = request.getParameter("p_code");
	String quantity = request.getParameter("quantity");
	if(quantity==null || quantity.equals("")){
		quantity = "1";
	}
	
	if(contentPage == null || contentPage.equals("")){
		contentPage = "shopping";	
	}
	if(contentPage.equals("shopping")){
		contentPage = "shopping/"+contentPage+".jsp";	
	}else if(contentPage.equals("login")){
		contentPage = "member/"+contentPage+".jsp";
	}else if(contentPage.equals("join")){
		contentPage = "member/"+contentPage+".jsp";
	}else if(contentPage.equals("shopping/detail")){
		contentPage = contentPage+".jsp?p_code="+p_code;
	}else if(contentPage.equals("orderAll")){
		contentPage="order/"+contentPage+".jsp?basket_code="+basket_code+"&m_id="+m_id;
	}else if(contentPage.equals("order")){
		contentPage="order/"+contentPage+".jsp?p_code="+p_code+"&quantity="+quantity+"&m_id="+m_id;
	}else if(contentPage.equals("basket")){
		contentPage="basket/"+contentPage+".jsp?p_engname="+p_engname+"&p_name="+p_name+"&p_price="+price+"&p_code="+p_code;
	}else if(contentPage.equals("basket_insert")){
		contentPage="basket/"+contentPage+".jsp?p_engname="+p_engname+"&p_name="+p_name+"&p_price="+price+"&p_code="+p_code;
	}else if(contentPage.equals("mypage")){
		contentPage="mypage/"+contentPage+".jsp";
	}else if(contentPage.equals("modify")){
		contentPage="mypage/"+contentPage+".jsp";
	}else if(contentPage.equals("list")){
		contentPage="mypage/"+contentPage+".jsp";
	}else if(contentPage.equals("bbs_list") || contentPage.equals("bbs_insert")
			|| contentPage.equals("bbs_view") || contentPage.equals("bbs_update")
			 || contentPage.equals("bbs_delete")){ 
		contentPage = "bbs/"+contentPage+"_content.jsp";	
	}
%>

<html>
<head>



</head>
<body>
<!--��޴�(common_top.jsp)����-->
<jsp:include page="main_header.jsp"></jsp:include>
<!--��޴�(common_top.jsp)�� -->

















<!--�۷ι� ���̺���� -->

<table width="1024" border="0" cellspacing="0" cellpadding="0" align="center">
  
  	<tr>
		<!--�����޴�(common_left.jsp) ����-->
		  <jsp:include page="main_left.jsp"></jsp:include> 
		<!--�����޴�(common_left.jsp) ��-->
		
		<!--�߾� ������ ����-->
	<% 	if(m_name!=null){	
			
		%>
		<form name="log" method="post" action="member/logout.jsp"> 
		<font color="blue"><%=m_name %>���� ������!</font>
		 <input type="submit" name="logout" value="�α׾ƿ�">
		 </form>
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
<%
	}else{
%>		
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
<%} %>

