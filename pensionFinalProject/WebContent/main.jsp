<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	String contentpage = (String)request.getParameter("contentPage");
	if(contentpage == null){	
		contentpage = "main_index";
	}
	contentpage = contentpage+".jsp";
	
%>

<html>
<head>
<meta name="viewport" content="user-scalable=no width=device-width" />


</head>
<body>
<!--��޴�(common_top.jsp)����-->
<jsp:include page="main_header.jsp"></jsp:include>
<!--��޴�(common_top.jsp)�� -->





<table width="1024" border="0" cellspacing="0" cellpadding="0" align="center">
  
  	<tr>
			
		<!--�߾� ������ ����-->

		<jsp:include page="<%=contentpage %>"></jsp:include> 
		<!--�߾� ������ ��-->
	</tr>
</table>






<br><br>
<!--bottom�޴�(common_bottom.jsp)����-->
<jsp:include page="main_footer.jsp"></jsp:include>
<!--bottom�޴�(common_bottom.jsp)��-->
</body>

</html>
	

    