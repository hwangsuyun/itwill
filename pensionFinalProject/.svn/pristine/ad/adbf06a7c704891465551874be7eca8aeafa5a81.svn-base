<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

	<table width='100%' border='0' cellspacing='0' cellpadding='0'>
		<tr>
			<h4>${p_group}</h4>	<!-- el사용 -->
		</tr>
		
		<!-- jstl 사용 시작 -->
		<c:forEach var="pension" items="${pensionList}">
		
		<tr>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<td width='138' height='200%' align='center'><a href='${pension.p_site}'
				target='_blank'> <img src='images/pension/${pension.p_image}.jpg'
					width='250' height='88'></a><br>${pension.p_name}<br>
					 <font size="2">${pension.p_address}<br>${pension.p_tel}</font>
					&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		</c:forEach>			
		<!-- jstl 사용 끝-->			
					
	</table>