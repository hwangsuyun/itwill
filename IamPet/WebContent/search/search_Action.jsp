<%@page import="pet.shopping.PetManager"%>
<%@page import="pet.shopping.PetDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String searchVal=request.getParameter("searchVal");
	ArrayList<PetDTO> searchPet = PetManager.getPetManager().findnamePet(searchVal);
	int listSize = searchPet.size();
%>

<td width="580" valign="top">
	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=1><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table> <!-- --------------------------------------------------------------------------- -->
	<!-- �̾ȿ� �ۼ� html body  ���� -->
		
	<marquee behavior="scroll" direction="left">
		<img src="images/main/pet_title.gif">	 
	</marquee> 		
	<img src="images/search/search.gif">
	<br/>
	&nbsp;&nbsp;&nbsp;
	<font style="color: black; font-size: 15px; font-weight: bold;">�� [<%=listSize %>]���� ��ǰ�� �˻��Ǿ����ϴ�.</font>
	<table >
		<tr style="padding-bottom: 20px">
			
			<%
				int count=0;
				for (PetDTO dto : searchPet) {
					count++;
			%>
			<td style="padding-left: 20px">
				<table width="100%" border="0">
					<tr>
						<td>
							<table border="0">
								<tr>
									<td><a 
										href="main.jsp?contentPage=shopping/pet_detail&c_name_code=<%=dto.getC_name_code()%>">
											<img width="170px" src='images/<%= dto.getC_part_code() %>/<%= dto.getC_name_code() %>/<%= dto.getC_name_code() %>_0001.jpg' border="0"
											onmouseover="this.style.filter='alpha(opacity=50)';" 
											onmouseout="this.style.filter='alpha(opacity=100)';">
									</a></td>
								</tr>
								<%-- <tr><td><%= dto.getC_code() %></td></tr> --%>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table border='0' >
								<tr>
									<td><font
										style="color: #888888; font-size: 12px; font-style:; font-weight: bold">��&nbsp;&nbsp;&nbsp;�� :</font></td>
									<td align="center">
										<a href="main.jsp?contentPage=shopping/pet_detail&c_name_code=<%=dto.getC_name_code()%>" >
											<font style="color: #888888; font-size: 12px; font-style:; font-weight: bold" >
												<%= dto.getC_name() %>
											</font >
										</a>
									</td>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table border=0>
								<tr>
									<td><font
										style="color: #888888; font-size: 12px; font-style:; font-weight: bold">�о簡 :</font></td>
									<td><font
										style="color: #888888; font-size: 12px; font-style:; font-weight: bold"><%=dto.getC_price()%>&nbsp;��</font></td>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table border=0>
								<tr>
									<td><font
										style="color: #888888; font-size: 12px; font-style:; font-weight: bold">��&nbsp;&nbsp;&nbsp;�� :</font></td>
									<td><font
										style="color: #888888; font-size: 12px; font-style:; font-weight: bold"><%=dto.getC_sex()%></font></td>
							</table>
						</td>
					</tr>
				</table>
			</td>
		<%
			//��ǰ����Ʈ ��ȣ�� 4��°�϶�, tr�� ����, 1�ٿ� 4���� �ѱ��.
				if (count % 4 == 0) {
		%>
			</tr>
		<%
				}
			}
		%>
		<%
			//��ǰ����Ʈ�� 4��°�� �ƴҶ�
			if (count % 4 != 0) {
		%>
		</tr>
		<%
			}
		%>
	</table> <!-- --------------------------------------------------------------------------- -->
	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=20><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table>
</td>
