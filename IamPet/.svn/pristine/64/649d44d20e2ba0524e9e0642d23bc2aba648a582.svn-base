<%@page import="member.PostDAO"%>
<%@page import="member.PostDTO"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String path = request.getContextPath();	
	request.setCharacterEncoding("euc-kr");
	
	String strDong = request.getParameter("zipcode");
	if(strDong == null) strDong = "";	
	
	ArrayList<PostDTO> postList = null;	
	if(!strDong.equals(""))
	{
		postList = PostDAO.getPostDAO().getAddress(strDong);
	}
		
%>

<!-- 자바스크립트 추가 -->
<script type = "text/javascript" src = "<%=path %>/js/jquery-1.8.3.js"></script>
<script type = "text/javascript">
$(document).ready(function()
{
	$("#btnSearch").click(function()
	{
		var dong = $("#dong");
		// 입력값이 있으면 실행 
		if(dong.val().length > 0) 
		{
		//	form1.submit();
			openAddress(dong.val());
		}
		else 
		{
			alert('동이름을 입력하세요.');
			form1.dong.focus();
			return;
		}
	});
		
	
});

function openAddress(dong)
{
    // url과 사용자 입력 id를 조합합니다.
    url = "./zipcode.jsp?zipcode="+dong;	  	    
    // 새로운 윈도우를 엽니다.
    open(url, "confirm", 
    		"toolbar=no, location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=650, height=500");
}

function zipcode_copy(zipcode, address)
{	
	// 회원가입창의 우편번호, 주소1 필드에 값을 복사 
	opener.document.count.rzipcode1.value = zipcode;	
	opener.document.count.raddr1.value = address;
	// 우편번호 조회창을 닫음
	window.close();
}
</script>

<font>찾고자하는 지역의 동/읍/면/리/건물명을 입력하세요.</br>
서울시 강남구 삼성동이라면 삼성 또는 삼성동이라고 입력하시면
됩니다.</font>
	
<!-- 우편번호 찾기 폼 -->
<form name = "form1" id="form1" method="post" action="">		
	지역명
	<input type="text" name="dong" id="dong" value="<%=strDong%>">
	<input type="button" value="검색" id="btnSearch">
</form>
<%

%>

	<table border="1" style="width:600px;">
		<tr>
			<th>우편번호</th>
			<th>주소</th>
		</tr>			
	
<%	

if(!strDong.equals(""))
{	
	for(PostDTO dto : postList)
	{		
		String post_zipcode = dto.getZipcode();
		String post_address = dto.getAddress();
		
		%>		
		<tr>
			<td><%=post_zipcode %></td>
			<td>
				<%--=post_address --%>	
				<a href = "javascript:zipcode_copy('<%=post_zipcode %>', '<%=post_address %>')"><%=post_address %></a> 
			</td>
		</tr>			
		<%		
	}	// end for	
		 %>
	 </table>
	<% 
}	// end if 		

%>



