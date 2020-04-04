<%@page import="member.MemberDTO"%>
<%@page import="member.MemberManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String m_id = (String)session.getAttribute("m_id");
	MemberDTO memberDto = null;
	
	
	if(m_id==null){
		System.out.println("m_id:"+m_id);	
%>
	<script>
	alert("로그인해라");
	location.href="./main.jsp?contentPage=login"
	</script>
			
<% 		
	}else{
	
	try{
		memberDto = MemberManager.getMembermanager().findOne(m_id); 	
	}catch(Exception e){
		
	}
	
%>
	
	
	<td width="100%" valign="middle">
	<table cellspacing=0 cellpadding=0 border=0>

		<tr>
			<td height=1><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table> <!-- 내용 시작  -->


	<form name="join" method="post" action="./member/joinok.jsp">

		<table cellspacing="2" cellpadding="2" id="boxStyle" align="center">
			<colgroup>
				<col width="25%"></col>
				<col width="75%"></col>
			</colgroup>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="<%=memberDto.getM_name() %>" class="input"
					style="width: 133px;" /></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><select name="birth1" onChange="">
						<option value="">----</option>
						<option value="2013">2013</option>
						<option value="2012">2012</option>
						<option value="2011">2011</option>
						<option value="2010">2010</option>
						<option value="2009">2009</option>
						<option value="2008">2008</option>
						<option value="2007">2007</option>
						<option value="2006">2006</option>
						<option value="2005">2005</option>
						<option value="2004">2004</option>
						<option value="2003">2003</option>
						<option value="2002">2002</option>
						<option value="2001">2001</option>
						<option value="2000">2000</option>
						<option value="1999">1999</option>
						<option value="1998">1998</option>
						<option value="1997">1997</option>
						<option value="1996">1996</option>
						<option value="1995">1995</option>
						<option value="1994">1994</option>
						<option value="1993">1993</option>
						<option value="1992">1992</option>
						<option value="1991">1991</option>
						<option value="1990">1990</option>
						<option value="1989">1989</option>
						<option value="1988">1988</option>
						<option value="1987">1987</option>
						<option value="1986">1986</option>
						<option value="1985">1985</option>
						<option value="1984">1984</option>
						<option value="1983">1983</option>
						<option value="1982">1982</option>
						<option value="1981">1981</option>
						<option value="1980">1980</option>
						<option value="1979">1979</option>
						<option value="1978">1978</option>
						<option value="1977">1977</option>
						<option value="1976">1976</option>
						<option value="1975">1975</option>
						<option value="1974">1974</option>
						<option value="1973">1973</option>
						<option value="1972">1972</option>
						<option value="1971">1971</option>
						<option value="1970">1970</option>
						<option value="1969">1969</option>
						<option value="1968">1968</option>
						<option value="1967">1967</option>
						<option value="1966">1966</option>
						<option value="1965">1965</option>
						<option value="1964">1964</option>
						<option value="1963">1963</option>
						<option value="1962">1962</option>
						<option value="1961">1961</option>
						<option value="1960">1960</option>
						<option value="1959">1959</option>
						<option value="1958">1958</option>
						<option value="1957">1957</option>
						<option value="1956">1956</option>
						<option value="1955">1955</option>
						<option value="1954">1954</option>
						<option value="1953">1953</option>
						<option value="1952">1952</option>
						<option value="1951">1951</option>
						<option value="1950">1950</option>
						<option value="1949">1949</option>
						<option value="1948">1948</option>
						<option value="1947">1947</option>
						<option value="1946">1946</option>
						<option value="1945">1945</option>
						<option value="1944">1944</option>
						<option value="1943">1943</option>
						<option value="1942">1942</option>
						<option value="1941">1941</option>
						<option value="1940">1940</option>
						<option value="1939">1939</option>
						<option value="1938">1938</option>
						<option value="1937">1937</option>
						<option value="1936">1936</option>
						<option value="1935">1935</option>
						<option value="1934">1934</option>
						<option value="1933">1933</option>
						<option value="1932">1932</option>
						<option value="1931">1931</option>
						<option value="1930">1930</option>
						<option value="1929">1929</option>
						<option value="1928">1928</option>
						<option value="1927">1927</option>
						<option value="1926">1926</option>
						<option value="1925">1925</option>
						<option value="1924">1924</option>
						<option value="1923">1923</option>
						<option value="1922">1922</option>
						<option value="1921">1921</option>
						<option value="1920">1920</option>
						<option value="1919">1919</option>
						<option value="1918">1918</option>
						<option value="1917">1917</option>
						<option value="1916">1916</option>
						<option value="1915">1915</option>
						<option value="1914">1914</option>
						<option value="1913">1913</option>
						<option value="1912">1912</option>
						<option value="1911">1911</option>
						<option value="1910">1910</option>
						<option value="1909">1909</option>
						<option value="1908">1908</option>
						<option value="1907">1907</option>
						<option value="1906">1906</option>
						<option value="1905">1905</option>
						<option value="1904">1904</option>
						<option value="1903">1903</option>
						<option value="1902">1902</option>
						<option value="1901">1901</option>
						<option value="1900">1900</option>
				</select> 년 <select name="birth2" onChange="">
						<option value="">--</option>
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
				</select> 월 <select name="birth3" onChange="">
						<option value="">--</option>
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						<option value="31">31</option>
				</select> 일</td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="sex" value="남"
					style="border: none;" checked/>남 <input type="radio" name="sex" value="여"
					style="border: none;" />여</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" value="<%=memberDto.getM_id() %>" class="input"
					maxlength="16" style="width: 133px;" /> <b></b></td>
			</tr>
			<tr>
				<th>
					<!--..K..Y…‥·
새 ·‥…S..Y..//--> 비밀번호
				</th>
				<td><input type="password" name="pwd" value="<%=memberDto.getM_pass() %>" class="input"
					maxlength="10" style="width: 133px;" /></td>
			</tr>
			<tr>
				<th>
					<!--..K..Y…‥·
새 ·‥…S..Y..//--> 비밀번호확인
				</th>
				<td><input type="password" name="repwd" value="<%=memberDto.getM_pass()%>" class="input"
					maxlength="10" style="width: 133px;" /></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" id="phone" value=""
					class="input" style="width: 133px;" maxlength="15" /></td>
			</tr>
			<tr>
				<th>휴대폰번호</th>
				<td><input type="text" name="cell" id="cell" value="<%=memberDto.getM_cellphone() %>"
					class="input" style="width: 133px;" maxlength="15" /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input
					type="text" name="addr1" value="<%=memberDto.getM_address() %>" class="input"
					style="width: 300px;" maxlength="50" /><br />
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email1" value="<%=memberDto.getM_email() %>" class="input"
					style="width: 110px;" />
					<br /></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="image"
					src="./images/member/ok[1].gif" alt="확인" /></td>
			</tr>


		</table>
	</form> <!-- 내용 끝  -->

	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td height=20><spacer type=BLOCK height=10 width=100%></td>
		</tr>
	</table>
</td>
<%} %>
	 