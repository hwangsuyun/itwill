<%@page import="member.MemberDAO"%>
<%@page import="member.MemberManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<script type="text/javascript" src="../js/common.js">
</script>
    
<SCRIPT language="JavaScript">
	function idCheck(form) {
		if (is_null(form.id.value)) {
			alert("�˻��� ���̵� �Է��Ͻð� �ߺ�üũ�� Ȯ���ϼſ�....");
			form.id.focus();
			return true;
		}

		if (!isID(form.id)) {
			alert("���̵� �������� �ʽ��ϴ�...\n" + "������ ���ڸ� ����ϼſ�...");
			return;
		}

		url = "idcheck.jsp?id=" + form.id.value;
		sp_window_open(url, "�ߺ�Ȯ��",
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
					<td align="center" class="t1"><font color="#FF0000"><%=id %></font>��
						�̹� ������� ���̵��Դϴ�.
					</td>
				</tr>
				<tr>
					<td align="center" valign="bottom"><input type="text"
						name="id" size="16" maxlength="16" class="TXTFLD"><input
						type="button" value="�ٽð˻�" class="TXTFLD"
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
					<td align="center" class="t1"><font color="#FF0000"><%=id %></font>��
						��� ������ ���̵��Դϴ�.<input type="hidden" name="id" value=<%=id%>>
					</td>
				</tr>

				<tr>
					<td align="center" valign="bottom"><input type="button"
						value="����ϱ�" class="TXTFLD" onClick="onClose()"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</form>
	<%} %>
</body>
</html>