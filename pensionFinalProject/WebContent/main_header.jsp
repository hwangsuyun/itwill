<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>��ǵѷ�����</title>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
</head>


<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tbody>
        <tr>
            <td>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tbody>

                    <tr>
                        <td colspan="4"><a href="main.jsp"><img width="100%" alt="" src="images/main/main_01.jpg" /></a></td>
                    </tr>
                    <tr>
                    
                   <%if((String)session.getAttribute("id") != null) { %>
				
				
				<td width="25%"><a href="main.jsp?contentPage=member/logout"><img width="100%" alt="" src="images/main/main_02-1.jpg" /></a></td>

		
				<%}if ((String)session.getAttribute("id") == null) {%>
							
				<td width="25%"><a href="main.jsp?contentPage=member/login"><img width="100%" alt="" src="images/main/main_02.jpg" /></a></td>
				
				<%}%>
                    

                        
                     	<!-- <td width="25%"><a href="main.jsp?contentPage=member/login"><img width="100%" alt="" src="images/main/main_02.jpg" /></a></td> -->
                       
                       
                       
                       
                        <td width="25%"><a href="main.jsp?contentPage=member/join"><img width="100%" alt="" src="images/main/main_03.jpg" /></a></td>
                        <td width="25%"><a href="main.jsp?contentPage=pension/pension"><img width="100%" alt="" src="images/main/main_04.jpg" /></a></td>
                        <td width="25%"><a href="BoardList.bo"><img width="100%" alt="" src="images/main/main_05.jpg" /></a></td>
                    </tr>
                </tbody>
            </table>
            </td>
        </tr>

</html>