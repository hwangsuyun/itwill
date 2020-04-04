<%@page import="member.MemberDAO"%>
<%@page import="member.MemberManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<script type="text/javascript" src="../js/common.js">
</script>
    
<SCRIPT language="JavaScript">
	function idCheck(form) {
		if (is_null(form.id.value)) {
			alert("검색할 아이디를 입력하시고 중복체크를 확인하셔요....");
			form.id.focus();
			return true;
		}

		if (!isID(form.id)) {
			alert("아이디가 적절하지 않습니다...\n" + "영문과 숫자를 사용하셔요...");
			return;
		}

		url = "idcheck.jsp?id=" + form.id.value;
		sp_window_open(url, "중복확인",
				"toolbar='no',resizable='no',width=300,height=200,left=350,top=250");
	}

	function onClose() {
		opener.join.id.value = document.idcheck.id.value;
		window.close();
	}
</script>


<%
	
	String id = request.getParameter("id");
	boolean idcheck = true;
	idcheck = MemberManager.getMembermanager().idcheck(id);

%>



		<%
			if (idcheck) {
		%>
		<form name="idcheck">

			<table width="100%" height="90%" border="0">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td align="center" class="t1"><font color="#FF0000"><%=id %></font>는
						이미 사용중인 아이디입니다.
					</td>
				</tr>
				<tr>
					<td align="center" valign="bottom"><input type="text"
						name="id" size="16" maxlength="16" class="TXTFLD"><input
						type="button" value="다시검색" class="TXTFLD"
						onClick="javascript:idCheck(document.idcheck)"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</form>
		<%
			}else{
		%>
		<form name="idcheck">

			<table width="100%" height="90%" border="0">
				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td align="center" class="t1"><font color="#FF0000"><%=id %></font>는
						사용 가능한 아이디입니다.<input type="hidden" name="id" value=<%=id%>>
					</td>
				</tr>

				<tr>
					<td align="center" valign="bottom"><input type="button"
						value="사용하기" class="TXTFLD" onClick="onClose()"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</form>
	<%} %>
</body>
</html>