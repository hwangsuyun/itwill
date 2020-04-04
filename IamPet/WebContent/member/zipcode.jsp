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

<!-- �ڹٽ�ũ��Ʈ �߰� -->
<script type = "text/javascript" src = "<%=path %>/js/jquery-1.8.3.js"></script>
<script type = "text/javascript">
$(document).ready(function()
{
	$("#btnSearch").click(function()
	{
		var dong = $("#dong");
		// �Է°��� ������ ���� 
		if(dong.val().length > 0) 
		{
		//	form1.submit();
			openAddress(dong.val());
		}
		else 
		{
			alert('���̸��� �Է��ϼ���.');
			form1.dong.focus();
			return;
		}
	});
		
	
});

function openAddress(dong)
{
    // url�� ����� �Է� id�� �����մϴ�.
    url = "./zipcode.jsp?zipcode="+dong;	  	    
    // ���ο� �����츦 ���ϴ�.
    open(url, "confirm", 
    		"toolbar=no, location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=650, height=500");
}

function zipcode_copy(zipcode, address)
{	
	// ȸ������â�� ������ȣ, �ּ�1 �ʵ忡 ���� ���� 
	opener.document.join.zipcode.value = zipcode;	
	opener.document.join.address1.value = address;
	// ������ȣ ��ȸâ�� ����
	window.close();
}
</script>

<font>ã�����ϴ� ������ ��/��/��/��/�ǹ����� �Է��ϼ���.</br>
����� ������ �Ｚ���̶�� �Ｚ �Ǵ� �Ｚ���̶�� �Է��Ͻø�
�˴ϴ�.</font>

	
<!-- ������ȣ ã�� �� -->
<form name = "form1" id="form1" method="post" action="">		
	������
	<input type="text" name="dong" id="dong" value="<%=strDong%>">
	<input type="button" value="�˻�" id="btnSearch">
</form>
<%

%>

	<table border="1" style="width:600px;">
		<tr>
			<th>������ȣ</th>
			<th>�ּ�</th>
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


