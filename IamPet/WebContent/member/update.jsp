<%@page import="member.MemberManager"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript" src="../js/common.js">
</script>
<SCRIPT language="JavaScript">
  function openConfirmAddress(userinput)
    {
        // ���̵� �Է��ߴ��� �˻�
   //    if(userinput.zipcode.value == "")
   //    {
   //         alert("���� �Է��ϼ���");
    //        return;
   //     }
        // url�� ����� �Է� id�� �����մϴ�.
        url = "./member/zipcode.jsp?zipcode="+userinput.zipcode.value;
      //  url = "./member/zipcode.jsp";    
        
        // ���ο� �����츦 ���ϴ�.
        open(url, "confirm", 
        		"toolbar=no, location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=650, height=500");
    }
  function remove(form, action)
  {
	  
	  sp_form_submit(form, action, 'POST', '', '');
  }
</Script>    
<%
	String updateId = request.getParameter("m_id");
	if(updateId == null) updateId = "";	
		
	MemberDTO memberDto = MemberManager.getMembermanager().findMember(updateId);	

%>    

 
<!--�߾� ������ �κ�<td>-->
<td width="580" valign="top">

		<table cellspacing=0 cellpadding=0 border=0>
			<tr>
				<td height=10><spacer type=BLOCK height=10 width=100%></td>
			</tr>
		</table>

	<!-- -------------------------------------------------------------------- -->


		<table width="90%" cellspacing="0" bordercolordark="white"
			bordercolorlight="black" cellpadding="0" align="center">
			<tr bgcolor="white" valign="middle">
				<td height="30" class="t1" align="center">
				<img src="images/member/membership.jpg"><b>
				</b>
				</a></td>
			</tr>

			


			<tr>
				<td height="20" class="t1">&nbsp;</td>
			</tr>

			<form name="join" action="member/update_action.jsp" method="post">
			
			<!-- ��ȣ�� ���̵�� �������� �ʴ´�. -->
			<input type="hidden" name="no" value="<%=memberDto.getNo()%>">
			<input type="hidden" name="id" value="<%=memberDto.getId()%>">

			<tr>
				<td height="25" class="t1">
				<table width="100%" border="1" cellspacing="0"
					bordercolordark="white" bordercolorlight="#ADADAD">
					<tr>
						<td height="25" width="16%" class="t1" bgcolor="#f0f0f0" align="center">
						<strong>&nbsp;<font color="gray" face="����">ȸ����ȣ&nbsp;</font></strong></td>
						<td width="100%" class="t1">&nbsp;&nbsp;
						<%=memberDto.getNo()%></a></td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="25" class="t1">
				<table width="100%" border="1" cellspacing="0"
					bordercolordark="white" bordercolorlight="#ADADAD">
					<tr>
						<td height="25" width="16%" class="t1" bgcolor="#f0f0f0" align="center">
						<strong>&nbsp;<font color="gray" face="����">���̵�&nbsp;</font></strong></td>
						<td width="100%" class="t1">&nbsp;&nbsp;
						<%=memberDto.getId()%></a></td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="25" class="t1">
				<table width="100%" border="1" cellspacing="0"
					bordercolordark="white" bordercolorlight="#ADADAD">
					<tr>
						<td height="25" width="16%" class="t1" bgcolor="#f0f0f0" align="center">
						<strong>&nbsp;<font color="gray" face="����">��й�ȣ&nbsp;</font></strong></td>
						<td width="100%" class="t1">&nbsp;&nbsp;						
							<input type="password" name="password" value="<%=memberDto.getPassword()%>"></a>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="25" class="t1">
				<table width="100%" border="1" cellspacing="0"
					bordercolordark="white" bordercolorlight="#ADADAD">
					<tr>
						<td height="25" width="16%" class="t1" bgcolor="#f0f0f0" align="center">
						<strong>&nbsp;<font color="gray" face="����">�̸�&nbsp;</font></strong></td>
						<td width="100%" class="t1">&nbsp;&nbsp;
							<input type="text" name="name" value="<%=memberDto.getName()%>"></a>						
						</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="25" class="t1">
				<table width="100%" border="1" cellspacing="0"
					bordercolordark="white" bordercolorlight="#ADADAD">
					<tr>
						<td height="25" width="16%" class="t1" bgcolor="#f0f0f0" align="center">
						<strong>&nbsp;<font color="gray" face="����">�ֹι�ȣ&nbsp;</font></strong></td>
						<td class="t1">&nbsp;&nbsp;
							<input type="text" name="jumin1" size="6" maxlength="6" max="6" value="<%=memberDto.getJumin1()%>"></a>	
							- 	
							<input type="password" name="jumin2" size="6"  maxlength="6" max="6" value="<%=memberDto.getJumin2()%>"></a>						
						</td>
					</tr>
				</table>
				</td>
			</tr>
		
			<!--  -->
			<tr>
				<td height="20" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#ADADAD">
						<tr>
							<td width="16%" class="t1" bgcolor="#F0F0F0" align="center">
							<strong>&nbsp;<font color = "gray" size="2" face="����">��й�ȣ <br/>Ȯ�ν� ����</font></strong>
							</td>
							
							<td width="85%" class="t1">&nbsp;<select name="passquiz"
								size="1" class="TXTFLD">
							<%if(memberDto.passquiz.equals("��￡ ���� �߾��� ��Ҵ�?")){%>
									<option value="��￡ ���� �߾��� ��Ҵ�?" selected>��￡ ���� �߾��� ��Ҵ�?</option>
									<option value="�ڽ��� �λ� �¿����?">�ڽ��� �λ� �¿����?</option>
									<option value="�ڽ��� ���� ��1ȣ��?">�ڽ��� ���� ��1ȣ��?</option>
									<option value="���� ��￡ ���� ������ ������?">���� ��￡ ���� ������ ������?</option>
									<option value="Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?">Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
									<option value="�߾��ϰ� ���� ��¥�� �ִٸ�?">�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
									<option value="�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?">�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
									<option value="������� ���� �������� ģ�� �̸���?">������� ���� �������� ģ�� �̸���?</option>
									<option value="�λ� ���� ���� å �̸���?">�λ� ���� ���� å �̸���?</option>
									<option value="���� å �߿��� �����ϴ� ������ �ִٸ�?">���� å �߿��� �����ϴ� ������ �ִٸ�?</option>
									<option value="�ڽ��� �ι�°�� �����ϴ� �ι���?">�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
									<option value="ģ���鿡�� �������� ���� � �� ������ �ִٸ�?">ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
									<option value="�ʵ��б� �� ��￡ ���� ¦�� �̸���?">�ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
									<option value="�ٽ� �¾�� �ǰ� ���� ����?">�ٽ� �¾�� �ǰ� ���� ����?</option>
									<option value="���� �����ϴ� ĳ���ʹ�?">���� �����ϴ� ĳ���ʹ�?</option>
							<%}else if(memberDto.passquiz.equals("�ڽ��� �λ� �¿����?")){%>
									<option value="��￡ ���� �߾��� ��Ҵ�?" >��￡ ���� �߾��� ��Ҵ�?</option>
									<option value="�ڽ��� �λ� �¿����?" selected>�ڽ��� �λ� �¿����?</option>
									<option value="�ڽ��� ���� ��1ȣ��?">�ڽ��� ���� ��1ȣ��?</option>
									<option value="���� ��￡ ���� ������ ������?">���� ��￡ ���� ������ ������?</option>
									<option value="Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?">Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
									<option value="�߾��ϰ� ���� ��¥�� �ִٸ�?">�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
									<option value="�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?">�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
									<option value="������� ���� �������� ģ�� �̸���?">������� ���� �������� ģ�� �̸���?</option>
									<option value="�λ� ���� ���� å �̸���?">�λ� ���� ���� å �̸���?</option>
									<option value="���� å �߿��� �����ϴ� ������ �ִٸ�?">���� å �߿��� �����ϴ� ������ �ִٸ�?</option>
									<option value="�ڽ��� �ι�°�� �����ϴ� �ι���?">�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
									<option value="ģ���鿡�� �������� ���� � �� ������ �ִٸ�?">ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
									<option value="�ʵ��б� �� ��￡ ���� ¦�� �̸���?">�ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
									<option value="�ٽ� �¾�� �ǰ� ���� ����?">�ٽ� �¾�� �ǰ� ���� ����?</option>
									<option value="���� �����ϴ� ĳ���ʹ�?">���� �����ϴ� ĳ���ʹ�?</option>
							<%}else if(memberDto.passquiz.equals("�ڽ��� ���� ��1ȣ��?")){%>
									<option value="��￡ ���� �߾��� ��Ҵ�?" >��￡ ���� �߾��� ��Ҵ�?</option>
									<option value="�ڽ��� �λ� �¿����?">�ڽ��� �λ� �¿����?</option>
									<option value="�ڽ��� ���� ��1ȣ��?" selected>�ڽ��� ���� ��1ȣ��?</option>
									<option value="���� ��￡ ���� ������ ������?">���� ��￡ ���� ������ ������?</option>
									<option value="Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?">Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
									<option value="�߾��ϰ� ���� ��¥�� �ִٸ�?">�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
									<option value="�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?">�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
									<option value="������� ���� �������� ģ�� �̸���?">������� ���� �������� ģ�� �̸���?</option>
									<option value="�λ� ���� ���� å �̸���?">�λ� ���� ���� å �̸���?</option>
									<option value="���� å �߿��� �����ϴ� ������ �ִٸ�?">���� å �߿��� �����ϴ� ������ �ִٸ�?</option>
									<option value="�ڽ��� �ι�°�� �����ϴ� �ι���?">�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
									<option value="ģ���鿡�� �������� ���� � �� ������ �ִٸ�?">ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
									<option value="�ʵ��б� �� ��￡ ���� ¦�� �̸���?">�ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
									<option value="�ٽ� �¾�� �ǰ� ���� ����?">�ٽ� �¾�� �ǰ� ���� ����?</option>
									<option value="���� �����ϴ� ĳ���ʹ�?">���� �����ϴ� ĳ���ʹ�?</option>
							<%}else if(memberDto.passquiz.equals("���� ��￡ ���� ������ ������?")){%>
									<option value="��￡ ���� �߾��� ��Ҵ�?" >��￡ ���� �߾��� ��Ҵ�?</option>
									<option value="�ڽ��� �λ� �¿����?">�ڽ��� �λ� �¿����?</option>
									<option value="�ڽ��� ���� ��1ȣ��?">�ڽ��� ���� ��1ȣ��?</option>
									<option value="���� ��￡ ���� ������ ������?" selected>���� ��￡ ���� ������ ������?</option>
									<option value="Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?">Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
									<option value="�߾��ϰ� ���� ��¥�� �ִٸ�?">�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
									<option value="�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?">�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
									<option value="������� ���� �������� ģ�� �̸���?">������� ���� �������� ģ�� �̸���?</option>
									<option value="�λ� ���� ���� å �̸���?">�λ� ���� ���� å �̸���?</option>
									<option value="���� å �߿��� �����ϴ� ������ �ִٸ�?">���� å �߿��� �����ϴ� ������ �ִٸ�?</option>
									<option value="�ڽ��� �ι�°�� �����ϴ� �ι���?">�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
									<option value="ģ���鿡�� �������� ���� � �� ������ �ִٸ�?">ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
									<option value="�ʵ��б� �� ��￡ ���� ¦�� �̸���?">�ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
									<option value="�ٽ� �¾�� �ǰ� ���� ����?">�ٽ� �¾�� �ǰ� ���� ����?</option>
									<option value="���� �����ϴ� ĳ���ʹ�?">���� �����ϴ� ĳ���ʹ�?</option>
							<%}else if(memberDto.passquiz.equals("Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?")){%>
									<option value="��￡ ���� �߾��� ��Ҵ�?" >��￡ ���� �߾��� ��Ҵ�?</option>
									<option value="�ڽ��� �λ� �¿����?">�ڽ��� �λ� �¿����?</option>
									<option value="�ڽ��� ���� ��1ȣ��?">�ڽ��� ���� ��1ȣ��?</option>
									<option value="���� ��￡ ���� ������ ������?">���� ��￡ ���� ������ ������?</option>
									<option value="Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?" selected>Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
									<option value="�߾��ϰ� ���� ��¥�� �ִٸ�?">�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
									<option value="�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?">�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
									<option value="������� ���� �������� ģ�� �̸���?">������� ���� �������� ģ�� �̸���?</option>
									<option value="�λ� ���� ���� å �̸���?">�λ� ���� ���� å �̸���?</option>
									<option value="���� å �߿��� �����ϴ� ������ �ִٸ�?">���� å �߿��� �����ϴ� ������ �ִٸ�?</option>
									<option value="�ڽ��� �ι�°�� �����ϴ� �ι���?">�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
									<option value="ģ���鿡�� �������� ���� � �� ������ �ִٸ�?">ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
									<option value="�ʵ��б� �� ��￡ ���� ¦�� �̸���?">�ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
									<option value="�ٽ� �¾�� �ǰ� ���� ����?">�ٽ� �¾�� �ǰ� ���� ����?</option>
									<option value="���� �����ϴ� ĳ���ʹ�?">���� �����ϴ� ĳ���ʹ�?</option>
							<%}else if(memberDto.passquiz.equals("�߾��ϰ� ���� ��¥�� �ִٸ�?")){%>
									<option value="��￡ ���� �߾��� ��Ҵ�?" >��￡ ���� �߾��� ��Ҵ�?</option>
									<option value="�ڽ��� �λ� �¿����?">�ڽ��� �λ� �¿����?</option>
									<option value="�ڽ��� ���� ��1ȣ��?">�ڽ��� ���� ��1ȣ��?</option>
									<option value="���� ��￡ ���� ������ ������?">���� ��￡ ���� ������ ������?</option>
									<option value="Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?">Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
									<option value="�߾��ϰ� ���� ��¥�� �ִٸ�?" selected>�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
									<option value="�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?">�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
									<option value="������� ���� �������� ģ�� �̸���?">������� ���� �������� ģ�� �̸���?</option>
									<option value="�λ� ���� ���� å �̸���?">�λ� ���� ���� å �̸���?</option>
									<option value="���� å �߿��� �����ϴ� ������ �ִٸ�?">���� å �߿��� �����ϴ� ������ �ִٸ�?</option>
									<option value="�ڽ��� �ι�°�� �����ϴ� �ι���?">�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
									<option value="ģ���鿡�� �������� ���� � �� ������ �ִٸ�?">ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
									<option value="�ʵ��б� �� ��￡ ���� ¦�� �̸���?">�ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
									<option value="�ٽ� �¾�� �ǰ� ���� ����?">�ٽ� �¾�� �ǰ� ���� ����?</option>
									<option value="���� �����ϴ� ĳ���ʹ�?">���� �����ϴ� ĳ���ʹ�?</option>
							<%}else if(memberDto.passquiz.equals("�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?")){%>
									<option value="��￡ ���� �߾��� ��Ҵ�?" >��￡ ���� �߾��� ��Ҵ�?</option>
									<option value="�ڽ��� �λ� �¿����?">�ڽ��� �λ� �¿����?</option>
									<option value="�ڽ��� ���� ��1ȣ��?">�ڽ��� ���� ��1ȣ��?</option>
									<option value="���� ��￡ ���� ������ ������?">���� ��￡ ���� ������ ������?</option>
									<option value="Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?">Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
									<option value="�߾��ϰ� ���� ��¥�� �ִٸ�?">�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
									<option value="�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?" selected>�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
									<option value="������� ���� �������� ģ�� �̸���?">������� ���� �������� ģ�� �̸���?</option>
									<option value="�λ� ���� ���� å �̸���?">�λ� ���� ���� å �̸���?</option>
									<option value="���� å �߿��� �����ϴ� ������ �ִٸ�?">���� å �߿��� �����ϴ� ������ �ִٸ�?</option>
									<option value="�ڽ��� �ι�°�� �����ϴ� �ι���?">�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
									<option value="ģ���鿡�� �������� ���� � �� ������ �ִٸ�?">ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
									<option value="�ʵ��б� �� ��￡ ���� ¦�� �̸���?">�ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
									<option value="�ٽ� �¾�� �ǰ� ���� ����?">�ٽ� �¾�� �ǰ� ���� ����?</option>
									<option value="���� �����ϴ� ĳ���ʹ�?">���� �����ϴ� ĳ���ʹ�?</option>
							<%}else if(memberDto.passquiz.equals("������� ���� �������� ģ�� �̸���?")){%>
									<option value="��￡ ���� �߾��� ��Ҵ�?" >��￡ ���� �߾��� ��Ҵ�?</option>
									<option value="�ڽ��� �λ� �¿����?">�ڽ��� �λ� �¿����?</option>
									<option value="�ڽ��� ���� ��1ȣ��?">�ڽ��� ���� ��1ȣ��?</option>
									<option value="���� ��￡ ���� ������ ������?">���� ��￡ ���� ������ ������?</option>
									<option value="Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?">Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
									<option value="�߾��ϰ� ���� ��¥�� �ִٸ�?">�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
									<option value="�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?">�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
									<option value="������� ���� �������� ģ�� �̸���?" selected>������� ���� �������� ģ�� �̸���?</option>
									<option value="�λ� ���� ���� å �̸���?">�λ� ���� ���� å �̸���?</option>
									<option value="���� å �߿��� �����ϴ� ������ �ִٸ�?">���� å �߿��� �����ϴ� ������ �ִٸ�?</option>
									<option value="�ڽ��� �ι�°�� �����ϴ� �ι���?">�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
									<option value="ģ���鿡�� �������� ���� � �� ������ �ִٸ�?">ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
									<option value="�ʵ��б� �� ��￡ ���� ¦�� �̸���?">�ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
									<option value="�ٽ� �¾�� �ǰ� ���� ����?">�ٽ� �¾�� �ǰ� ���� ����?</option>
									<option value="���� �����ϴ� ĳ���ʹ�?">���� �����ϴ� ĳ���ʹ�?</option>
							<%}else if(memberDto.passquiz.equals("�λ� ���� ���� å �̸���?")){%>
									<option value="��￡ ���� �߾��� ��Ҵ�?" >��￡ ���� �߾��� ��Ҵ�?</option>
									<option value="�ڽ��� �λ� �¿����?">�ڽ��� �λ� �¿����?</option>
									<option value="�ڽ��� ���� ��1ȣ��?">�ڽ��� ���� ��1ȣ��?</option>
									<option value="���� ��￡ ���� ������ ������?">���� ��￡ ���� ������ ������?</option>
									<option value="Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?">Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
									<option value="�߾��ϰ� ���� ��¥�� �ִٸ�?">�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
									<option value="�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?">�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
									<option value="������� ���� �������� ģ�� �̸���?">������� ���� �������� ģ�� �̸���?</option>
									<option value="�λ� ���� ���� å �̸���?" selected>�λ� ���� ���� å �̸���?</option>
									<option value="���� å �߿��� �����ϴ� ������ �ִٸ�?">���� å �߿��� �����ϴ� ������ �ִٸ�?</option>
									<option value="�ڽ��� �ι�°�� �����ϴ� �ι���?">�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
									<option value="ģ���鿡�� �������� ���� � �� ������ �ִٸ�?">ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
									<option value="�ʵ��б� �� ��￡ ���� ¦�� �̸���?">�ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
									<option value="�ٽ� �¾�� �ǰ� ���� ����?">�ٽ� �¾�� �ǰ� ���� ����?</option>
									<option value="���� �����ϴ� ĳ���ʹ�?">���� �����ϴ� ĳ���ʹ�?</option>
							<%}else if(memberDto.passquiz.equals("���� å �߿��� �����ϴ� ������ �ִٸ�?")){%>
									<option value="��￡ ���� �߾��� ��Ҵ�?" >��￡ ���� �߾��� ��Ҵ�?</option>
									<option value="�ڽ��� �λ� �¿����?">�ڽ��� �λ� �¿����?</option>
									<option value="�ڽ��� ���� ��1ȣ��?">�ڽ��� ���� ��1ȣ��?</option>
									<option value="���� ��￡ ���� ������ ������?">���� ��￡ ���� ������ ������?</option>
									<option value="Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?">Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
									<option value="�߾��ϰ� ���� ��¥�� �ִٸ�?">�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
									<option value="�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?">�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
									<option value="������� ���� �������� ģ�� �̸���?">������� ���� �������� ģ�� �̸���?</option>
									<option value="�λ� ���� ���� å �̸���?">�λ� ���� ���� å �̸���?</option>
									<option value="���� å �߿��� �����ϴ� ������ �ִٸ�?" selected>���� å �߿��� �����ϴ� ������ �ִٸ�?</option>
									<option value="�ڽ��� �ι�°�� �����ϴ� �ι���?">�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
									<option value="ģ���鿡�� �������� ���� � �� ������ �ִٸ�?">ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
									<option value="�ʵ��б� �� ��￡ ���� ¦�� �̸���?">�ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
									<option value="�ٽ� �¾�� �ǰ� ���� ����?">�ٽ� �¾�� �ǰ� ���� ����?</option>
									<option value="���� �����ϴ� ĳ���ʹ�?">���� �����ϴ� ĳ���ʹ�?</option>
							<%}else if(memberDto.passquiz.equals("�ڽ��� �ι�°�� �����ϴ� �ι���?")){%>
									<option value="��￡ ���� �߾��� ��Ҵ�?" >��￡ ���� �߾��� ��Ҵ�?</option>
									<option value="�ڽ��� �λ� �¿����?">�ڽ��� �λ� �¿����?</option>
									<option value="�ڽ��� ���� ��1ȣ��?">�ڽ��� ���� ��1ȣ��?</option>
									<option value="���� ��￡ ���� ������ ������?">���� ��￡ ���� ������ ������?</option>
									<option value="Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?">Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
									<option value="�߾��ϰ� ���� ��¥�� �ִٸ�?">�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
									<option value="�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?">�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
									<option value="������� ���� �������� ģ�� �̸���?">������� ���� �������� ģ�� �̸���?</option>
									<option value="�λ� ���� ���� å �̸���?">�λ� ���� ���� å �̸���?</option>
									<option value="���� å �߿��� �����ϴ� ������ �ִٸ�?">���� å �߿��� �����ϴ� ������ �ִٸ�?</option>
									<option value="�ڽ��� �ι�°�� �����ϴ� �ι���?" selected>�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
									<option value="ģ���鿡�� �������� ���� � �� ������ �ִٸ�?">ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
									<option value="�ʵ��б� �� ��￡ ���� ¦�� �̸���?">�ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
									<option value="�ٽ� �¾�� �ǰ� ���� ����?">�ٽ� �¾�� �ǰ� ���� ����?</option>
									<option value="���� �����ϴ� ĳ���ʹ�?">���� �����ϴ� ĳ���ʹ�?</option>
							<%}else if(memberDto.passquiz.equals("ģ���鿡�� �������� ���� � �� ������ �ִٸ�?")){%>
									<option value="��￡ ���� �߾��� ��Ҵ�?" >��￡ ���� �߾��� ��Ҵ�?</option>
									<option value="�ڽ��� �λ� �¿����?">�ڽ��� �λ� �¿����?</option>
									<option value="�ڽ��� ���� ��1ȣ��?">�ڽ��� ���� ��1ȣ��?</option>
									<option value="���� ��￡ ���� ������ ������?">���� ��￡ ���� ������ ������?</option>
									<option value="Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?">Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
									<option value="�߾��ϰ� ���� ��¥�� �ִٸ�?">�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
									<option value="�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?">�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
									<option value="������� ���� �������� ģ�� �̸���?">������� ���� �������� ģ�� �̸���?</option>
									<option value="�λ� ���� ���� å �̸���?">�λ� ���� ���� å �̸���?</option>
									<option value="���� å �߿��� �����ϴ� ������ �ִٸ�?">���� å �߿��� �����ϴ� ������ �ִٸ�?</option>
									<option value="�ڽ��� �ι�°�� �����ϴ� �ι���?">�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
									<option value="ģ���鿡�� �������� ���� � �� ������ �ִٸ�?" selected>ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
									<option value="�ʵ��б� �� ��￡ ���� ¦�� �̸���?">�ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
									<option value="�ٽ� �¾�� �ǰ� ���� ����?">�ٽ� �¾�� �ǰ� ���� ����?</option>
									<option value="���� �����ϴ� ĳ���ʹ�?">���� �����ϴ� ĳ���ʹ�?</option>
							<%}else if(memberDto.passquiz.equals("�ʵ��б� �� ��￡ ���� ¦�� �̸���?")){%>
									<option value="��￡ ���� �߾��� ��Ҵ�?" >��￡ ���� �߾��� ��Ҵ�?</option>
									<option value="�ڽ��� �λ� �¿����?">�ڽ��� �λ� �¿����?</option>
									<option value="�ڽ��� ���� ��1ȣ��?">�ڽ��� ���� ��1ȣ��?</option>
									<option value="���� ��￡ ���� ������ ������?">���� ��￡ ���� ������ ������?</option>
									<option value="Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?">Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
									<option value="�߾��ϰ� ���� ��¥�� �ִٸ�?">�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
									<option value="�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?">�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
									<option value="������� ���� �������� ģ�� �̸���?">������� ���� �������� ģ�� �̸���?</option>
									<option value="�λ� ���� ���� å �̸���?">�λ� ���� ���� å �̸���?</option>
									<option value="���� å �߿��� �����ϴ� ������ �ִٸ�?">���� å �߿��� �����ϴ� ������ �ִٸ�?</option>
									<option value="�ڽ��� �ι�°�� �����ϴ� �ι���?">�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
									<option value="ģ���鿡�� �������� ���� � �� ������ �ִٸ�?">ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
									<option value="�ʵ��б� �� ��￡ ���� ¦�� �̸���?" selected>�ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
									<option value="�ٽ� �¾�� �ǰ� ���� ����?">�ٽ� �¾�� �ǰ� ���� ����?</option>
									<option value="���� �����ϴ� ĳ���ʹ�?">���� �����ϴ� ĳ���ʹ�?</option>
							<%}else if(memberDto.passquiz.equals("�ٽ� �¾�� �ǰ� ���� ����?")){%>
									<option value="��￡ ���� �߾��� ��Ҵ�?" >��￡ ���� �߾��� ��Ҵ�?</option>
									<option value="�ڽ��� �λ� �¿����?">�ڽ��� �λ� �¿����?</option>
									<option value="�ڽ��� ���� ��1ȣ��?">�ڽ��� ���� ��1ȣ��?</option>
									<option value="���� ��￡ ���� ������ ������?">���� ��￡ ���� ������ ������?</option>
									<option value="Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?">Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
									<option value="�߾��ϰ� ���� ��¥�� �ִٸ�?">�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
									<option value="�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?">�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
									<option value="������� ���� �������� ģ�� �̸���?">������� ���� �������� ģ�� �̸���?</option>
									<option value="�λ� ���� ���� å �̸���?">�λ� ���� ���� å �̸���?</option>
									<option value="���� å �߿��� �����ϴ� ������ �ִٸ�?">���� å �߿��� �����ϴ� ������ �ִٸ�?</option>
									<option value="�ڽ��� �ι�°�� �����ϴ� �ι���?">�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
									<option value="ģ���鿡�� �������� ���� � �� ������ �ִٸ�?">ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
									<option value="�ʵ��б� �� ��￡ ���� ¦�� �̸���?">�ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
									<option value="�ٽ� �¾�� �ǰ� ���� ����?" selected>�ٽ� �¾�� �ǰ� ���� ����?</option>
									<option value="���� �����ϴ� ĳ���ʹ�?">���� �����ϴ� ĳ���ʹ�?</option>
							<%}else if(memberDto.passquiz.equals("���� �����ϴ� ĳ���ʹ�?")){%>
									<option value="��￡ ���� �߾��� ��Ҵ�?" >��￡ ���� �߾��� ��Ҵ�?</option>
									<option value="�ڽ��� �λ� �¿����?">�ڽ��� �λ� �¿����?</option>
									<option value="�ڽ��� ���� ��1ȣ��?">�ڽ��� ���� ��1ȣ��?</option>
									<option value="���� ��￡ ���� ������ ������?">���� ��￡ ���� ������ ������?</option>
									<option value="Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?">Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
									<option value="�߾��ϰ� ���� ��¥�� �ִٸ�?">�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
									<option value="�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?">�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
									<option value="������� ���� �������� ģ�� �̸���?">������� ���� �������� ģ�� �̸���?</option>
									<option value="�λ� ���� ���� å �̸���?">�λ� ���� ���� å �̸���?</option>
									<option value="���� å �߿��� �����ϴ� ������ �ִٸ�?">���� å �߿��� �����ϴ� ������ �ִٸ�?</option>
									<option value="�ڽ��� �ι�°�� �����ϴ� �ι���?">�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
									<option value="ģ���鿡�� �������� ���� � �� ������ �ִٸ�?">ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
									<option value="�ʵ��б� �� ��￡ ���� ¦�� �̸���?">�ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
									<option value="�ٽ� �¾�� �ǰ� ���� ����?">�ٽ� �¾�� �ǰ� ���� ����?</option>
									<option value="���� �����ϴ� ĳ���ʹ�?" selected>���� �����ϴ� ĳ���ʹ�?</option>
							<%}else{%>
									<option value="��￡ ���� �߾��� ��Ҵ�?" selected>��￡ ���� �߾��� ��Ҵ�?</option>
									<option value="�ڽ��� �λ� �¿����?">�ڽ��� �λ� �¿����?</option>
									<option value="�ڽ��� ���� ��1ȣ��?">�ڽ��� ���� ��1ȣ��?</option>
									<option value="���� ��￡ ���� ������ ������?">���� ��￡ ���� ������ ������?</option>
									<option value="Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?">Ÿ���� �𸣴� �ڽŸ��� ��ü����� �ִٸ�?</option>
									<option value="�߾��ϰ� ���� ��¥�� �ִٸ�?">�߾��ϰ� ���� ��¥�� �ִٸ�?</option>
									<option value="�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?">�޾Ҵ� ���� �� ��￡ ���� ��Ư�� ������?</option>
									<option value="������� ���� �������� ģ�� �̸���?">������� ���� �������� ģ�� �̸���?</option>
									<option value="�λ� ���� ���� å �̸���?">�λ� ���� ���� å �̸���?</option>
									<option value="���� å �߿��� �����ϴ� ������ �ִٸ�?">���� å �߿��� �����ϴ� ������ �ִٸ�?</option>
									<option value="�ڽ��� �ι�°�� �����ϴ� �ι���?">�ڽ��� �ι�°�� �����ϴ� �ι���?</option>
									<option value="ģ���鿡�� �������� ���� � �� ������ �ִٸ�?">ģ���鿡�� �������� ���� � �� ������ �ִٸ�?</option>
									<option value="�ʵ��б� �� ��￡ ���� ¦�� �̸���?">�ʵ��б� �� ��￡ ���� ¦�� �̸���?</option>
									<option value="�ٽ� �¾�� �ǰ� ���� ����?">�ٽ� �¾�� �ǰ� ���� ����?</option>
									<option value="���� �����ϴ� ĳ���ʹ�?" >���� �����ϴ� ĳ���ʹ�?</option>
							<%} %>
				
							</select>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<!--  -->
			<tr>
				<td height="25" class="t1">
				<table width="100%" border="1" cellspacing="0"
					bordercolordark="white" bordercolorlight="#ADADAD">
					<tr>
						<td height="25" width="16%" class="t1" bgcolor="#f0f0f0" align="center">
						<strong>&nbsp;<font color="gray" face="����">���ã��</br>����&nbsp;</font></strong></td>
						<td width="100%" class="t1">&nbsp;&nbsp;
							<input type="text" name="passresult" value="<%=memberDto.getPassresult()%>"></a>							
						</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="25" class="t1">
					<table width="100%" border="1" cellspacing="0"
						bordercolordark="white" bordercolorlight="#ADADAD">
						<tr>
							<td rowspan="3" width="15%" class="t1" bgcolor="#F0F0F0" align="center">&nbsp;
							<strong>&nbsp;<font color="gray" face="����">�ּ�&nbsp;&nbsp;</font></strong></td>						
						
							<td width="80%" class="t1">&nbsp;
								<input type="text" name="zipcode" value = "<%=memberDto.getZipcode()%>" maxlength="13" size="13" class="TXTFLD">&nbsp;&nbsp;&nbsp;&nbsp;								
								<input type="button" value="������ȣã��"  class="TXTFLD"  
									onClick="javascript:openConfirmAddress(this.form)">
							</td>
						</tr>					
							<td width="80%" class="t1">&nbsp;
								<input type="text" name="address1" value="<%=memberDto.getAddress()%>" maxlength="70" size="45" class="TXTFLD">&nbsp;
								<font color = "gray" size="2" face="����">�������ּ�</font>							
							</td>
						</tr>
						
					
					</table>
					
			</tr>
			
			
			<tr>
				<td height="25" class="t1">
				<table width="100%" border="1" cellspacing="0"
					bordercolordark="white" bordercolorlight="#ADADAD">
					<tr>
						<td height="25" width="16%" class="t1" bgcolor="#f0f0f0" align="center">
						<strong>&nbsp;<font color="gray" face="����">�̸���&nbsp;</font></strong></td>
						<td width="100%" class="t1">&nbsp;&nbsp;
							<input type="text" name="email" value="<%=memberDto.getEmail()%>"></a>							
						</td>
					</tr>
				</table>
				</td>
			</tr>
			
			
			
			
			
			<tr>
				<td height="25" class="t1">
				<table width="100%" border="1" cellspacing="0"
					bordercolordark="white" bordercolorlight="#ADADAD">
					<tr>
						<td height="25" width="16%" class="t1" bgcolor="#f0f0f0" align="center">
						<strong>&nbsp;<font color="gray" face="����">����ȭ&nbsp;</font></strong></td>
						<td width="100%" class="t1">&nbsp;&nbsp;
							<input type="text" name="homephone" value="<%=memberDto.getHomephone()%>"></a>							
						</td>
					</tr>
				</table>
				</td>
			</tr>
			
			<tr>
				<td height="25" class="t1">
				<table width="100%" border="1" cellspacing="0"
					bordercolordark="white" bordercolorlight="#ADADAD">
					<tr>
						<td height="25" width="16%" class="t1" bgcolor="#f0f0f0" align="center">
						<strong>&nbsp;<font color="gray" face="����">�޴���&nbsp;</font></strong></td>
						<td width="100%" class="t1">&nbsp;&nbsp;
							<input type="text" name="cellphone" value="<%=memberDto.getCellphone()%>"></a>							
						</td>
					</tr>
				</table>
				</td>
			</tr>			

			<tr>
				<td height="20" class="t1">
				<table width="100%" border="0" cellspacing="0" cellpadding="2">
					<tr>
						<td width="75%" class="t1">&nbsp;</td>
					</tr>
				</table>
				</td>
			</tr>
	
			<tr>
				<td height="30" class="t1" align="center" valign="top">
				
				<input type="button" value="����" onclick="location.href='main.jsp';">
			<!--  	<a href="main.jsp">Ȩ</a>   -->
				&nbsp;&nbsp;|&nbsp;&nbsp;	
				<input type="submit" value="����">
				&nbsp;&nbsp;|&nbsp;&nbsp;				
				<input type="button" value="Ż��"	  
					   onClick="javascript:remove(this.form ,'member/remove.jsp')">
					   
			</tr>		

			</form>

			<tr>
				<td height="1" background="images/member/line.gif">
				<img src="images/member/blank.gif" width="10" height="1"></td>
			</tr>

		</table>
		
		
		
		<!-- -------------------------------------------------------------------- -->
		<table cellspacing=0 cellpadding=0 border=0>
			<tr>
				<td height=20><spacer type=BLOCK height=10 width=100%></td>
			</tr>
		</table>


		</td>
		<!--�߾� ������ ��-->
    