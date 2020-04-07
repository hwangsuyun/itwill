<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<%@ page import="java.util.*"%> 

<%@ page import="java.text.SimpleDateFormat" %> 

<%@ page import="com.itwill.board.db.*" %> 


<% 

    String id=null; 

    if(session.getAttribute("id")!=null){ 

        id=(String)session.getAttribute("id"); 

    } 
    List boardList=(List)request.getAttribute("boardlist"); 

    int listcount=((Integer)request.getAttribute("listcount")).intValue(); 

    int nowpage=((Integer)request.getAttribute("page")).intValue(); 

    int maxpage=((Integer)request.getAttribute("maxpage")).intValue(); 

    int startpage=((Integer)request.getAttribute("startpage")).intValue(); 

    int endpage=((Integer)request.getAttribute("endpage")).intValue(); 

%> 

 

<html> 

<head> 
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
                        <td width="10%"><a href="main.jsp?contentPage=member/join"><img width="100%" alt="" src="images/main/main_02.jpg" /></a></td>
                        <td width="10%"><a href="main.jsp?contentPage=member/login"><img width="100%" alt="" src="images/main/main_03.jpg" /></a></td>
                        <td width="10%"><a href=""><img width="100%" alt="" src="images/main/main_04.jpg" /></a></td>
                        <td width="10%"><a href="BoardList.bo"><img width="100%" alt="" src="images/main/main_05.jpg" /></a></td>
                    </tr>
                </tbody>
            </table>
    <title>�Խ���</title> 

</head> 

 

<body> 

<!-- �Խ��� ����Ʈ --> 

<table width=100% border="0" cellpadding="0" cellspacing="0"> 

    <tr align="center" valign="middle"> 

        <td colspan="4">�Խ���</td> 

        <td align=right > 

            <font size=2>�� ���� : ${listcount }</font> 

        </td> 

    </tr> 

     

    <tr align="center" valign="middle" bordercolor="#333333"> 

        <td style="font-family:Tahoma;font-size:8pt;" width="5%" height="26"> 

            <div align="center">��ȣ</div> 

        </td> 

        <td style="font-family:Tahoma;font-size:8pt;" width="35"> 

            <div align="center">����</div> 

        </td> 

        <td style="font-family:Tahoma;font-size:8pt;" width="8%"> 
		
            <div align="center">�ۼ���</div> 
			
        </td> 

        <td style="font-family:Tahoma;font-size:8pt;" width="13%"> 

            <div align="center">��¥</div> 

        </td> 

        <td style="font-family:Tahoma;font-size:8pt;" width="8%"> 

            <div align="center">��ȸ��</div> 

        </td> 

    </tr> 


    <% 

        for(int i=0;i<boardList.size();i++){ 

            BoardBean bl=(BoardBean)boardList.get(i); 

    %> 

    <tr align="center" valign="middle" bordercolor="#333333" 

        onmouseover="this.style.backgroundColor='F8F8F8'" 

        onmouseout="this.style.backgroundColor=''"> 

        <td height="23" style="font-family:Tahoma;font-size:10pt;"> 

            <%=bl.getBOARD_NUM()%> 

        </td> 

         

        <td style="font-family:Tahoma;font-size:10pt;"> 

            <div align="left"> 

            <%if(bl.getBOARD_RE_LEV()!=0){ %> 

                <%for(int a=0;a<=bl.getBOARD_RE_LEV()*2;a++){ %> 

                &nbsp; 

                <%} %> 

                �� 

            <%}else{ %> 

                �� 

            <%} %> 

            <a href="./BoardDetailAction.bo?num=<%=bl.getBOARD_NUM()%>"> 

                <%=bl.getBOARD_SUBJECT()%> 

            </a> 

            </div> 

        </td> 

         

        <td style="font-family:Tahoma;font-size:10pt;"> 

            <div align="center"><%=bl.getBOARD_ID() %></div> 

        </td> 

        <td style="font-family:Tahoma;font-size:10pt;"> 

            <div align="center"><%=bl.getBOARD_DATE() %></div> 

        </td>     

        <td style="font-family:Tahoma;font-size:10pt;"> 

            <div align="center"><%=bl.getBOARD_READCOUNT() %></div> 

        </td> 

    </tr> 

    <%} %> 

    <tr align=center height=20> 

        <td colspan=7 style=font-family:Tahoma;font-size:10pt;> 

            <%if(nowpage<=1){ %> 

            [����]&nbsp; 

            <%}else{ %> 

            <a href="./BoardList.bo?page=<%=nowpage-1 %>">[����]</a>&nbsp; 

            <%} %> 

             

            <%for(int a=startpage;a<=endpage;a++){ 

                if(a==nowpage){%> 

                [<%=a %>] 

                <%}else{ %> 

                <a href="./BoardList.bo?page=<%=a %>">[<%=a %>]</a>&nbsp; 

                <%} %> 

            <%} %> 

             

            <%if(nowpage>=maxpage){ %> 

            [����] 

            <%}else{ %> 

            <a href="./BoardList.bo?page=<%=nowpage+1 %>">[����]</a> 

            <%} %> 

        </td> 

    </tr> 

    <tr align="right"> 

        <td colspan="5"> 

             <a href="./BoardWrite.bo">[�۾���]</a> 

        </td> 

    </tr> 
<td colspan="4"><img width="100%" alt="" src="images/main/main_06.jpg" /></td>
</table> 

</body> 

</html>



    