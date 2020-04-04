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
<!--Åé¸Þ´º(common_top.jsp)½ÃÀÛ-->
<jsp:include page="main_header.jsp"></jsp:include>
<!--Åé¸Þ´º(common_top.jsp)³¡ -->





<table width="1024" border="0" cellspacing="0" cellpadding="0" align="center">
  
  	<tr>
			
		<!--Áß¾Ó ÄÁÅÙÃ÷ ½ÃÀÛ-->

		<jsp:include page="<%=contentpage %>"></jsp:include> 
		<!--Áß¾Ó ÄÁÅÙÃ÷ ³¡-->
	</tr>
</table>






<br><br>
<!--bottom¸Þ´º(common_bottom.jsp)½ÃÀÛ-->
<jsp:include page="main_footer.jsp"></jsp:include>
<!--bottom¸Þ´º(common_bottom.jsp)³¡-->
</body>

</html>
	

    