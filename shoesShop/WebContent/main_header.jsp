<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String m_name = (String)session.getAttribute("m_name");
%>


<!-- 메인타이틀 -->
<html>
<head>


<title>간지난다 강북멋쟁이 슈즈</title>
<meta http-equiv="imagetoolbar" content="no">



<link rel="stylesheet" type="text/css" href="http://www.dasmann.co.kr/_template/css/style.css">


<div id="bg_layout">
<div id="layout">
<div id="container">
<div id="header">
	<div class="banner"></div>
	<h1>
			<span style="display:inline-block; height:100%; vertical-align:middle;"></span>
			<a href="main.jsp"  onfocus=this.blur()><img src="http://www.dasmann.co.kr/_data/banner/a2ba691dff93980b2e0c621bd8d8c5e0.gif" border=0 ></a>	</h1>
	<div class="menu">
		<ul class="menu1">
			
		
		</ul>
		<ul class="menu2">
		
			<% 	if(m_name==null){	
			
			%>
		
				<li><a href="main.jsp?contentPage=login"><font color="white" size="2">로그인&nbsp;&nbsp;</font></a></li>
			<li><a href="main.jsp?contentPage=join"><font color="white" size="2">회원가입&nbsp;&nbsp;</font></a></li>
			<li><a href="main.jsp?contentPage=basket"><font color="white" size="2">장바구니&nbsp;&nbsp;</font></a></li>
			<li><a href="main.jsp?contentPage=bbs_list"><font color="white" size="2">게시판&nbsp;&nbsp;</font></a></li>
			<li><a href="main.jsp?contentPage=mypage"><font color="white" size="2">마이페이지</font></a></li>
			
		</ul>
	</div>
</div><!-- //header -->
</div>
</div>
</div>
</body>
</html>
<%
	}else{
	
	%>
	<li><a href="main.jsp?contentPage=basket"><font color="white" size="2">장바구니&nbsp;&nbsp;</font></a></li>
			<li><a href="main.jsp?contentPage=bbs_list"><font color="white" size="2">게시판&nbsp;&nbsp;</font></a></li>
			<li><a href="main.jsp?contentPage=mypage"><font color="white" size="2">마이페이지</font></a></li>
		</ul>
	</div>
</div><!-- //header -->
</div>
</div>
</div>
</body>
</html>
<%} %>
	
	

