<%@page import="java.util.ArrayList"%>
<%@page import="basket.BasketDAO"%>
<%@page import="basket.BasketDTO"%>
<%@page import="pet.shopping.PetDAO"%>
<%@page import="basket.BasketManager"%>
<%@page import="pet.shopping.PetManager"%>
<%@page import="pet.shopping.PetDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@page session="true" %>
 
 <!-- 로그인 했는지 안했는지 확인 -->    
<%@include file="../login_check.jspf" %> 

<%
	String c_code = request.getParameter("c_name_code");
	String c_count = request.getParameter("c_count");
	
	//펫 불러오기.
	PetDTO petDto = PetManager.getPetManager().findPet(c_code);
	//비회원 일경우
	if(userId==null)
	{
		session.setAttribute("id", session.getId());
		System.out.println(session.getAttribute("id"));
		
		//고양이 중복검사.(모든정보 호출.)
		ArrayList<BasketDTO> arrayList = BasketManager.getBasketManager().allBasket();
		System.out.println("1");
		for(BasketDTO basket : arrayList)
		{	//현재 비회원아이디와 동일한 아이디가 있는지 검색을 한다.
			System.out.println("2");
			if(basket.getMember_id().equals(session.getId()))
			{	//비회원이나 아이디 뽑아내고 상품 중복검사를 실시한다
				System.out.println("3");
				ArrayList<BasketDTO> bassket = BasketManager.getBasketManager().findBasket(session.getId());
				for(BasketDTO bas : bassket)
				{	System.out.println("4");
					//아이디를 뽑아냈으면 아이템코드로 중복검사를 실시한다
					if(bas.getItem_code().equals(c_code))
					{	System.out.println("5");
						int cnt = bas.getItem_cnt();//고객의 바스킷의 담긴 고양이 중복 갯수를 확인후 cnt에 담는다
						++cnt;//그다음 bas.getItem_cnt 를 ++ 시켜주고
						bas.setItem_cnt(cnt);//set 을 이용해 cnt의 갯수를 바꿔주고
						BasketManager.getBasketManager().update(bas);//bas를 업데이트 시켜준다.
						%>
						<script type="text/javascript">
							var contentPage = "basket";
							location.href="./main.jsp?contentPage="+contentPage;
						</script>
						<%
						return;
					}//if
				}//for2
			}//if
		}//for1
				  BasketManager.getBasketManager().create(new BasketDTO(																	
																							  petDto.getC_name_code(),
																						   	  petDto.getC_sex(),
																						      petDto.getC_price(),
																							  1,
																							  session.getId()));
	}
	//회원일 경우 
	else
	{	
				//고양이 중복검사.(모든정보 호출.)
				ArrayList<BasketDTO> arrayList = BasketManager.getBasketManager().allBasket();
				System.out.println("1");
				
				for(BasketDTO basket : arrayList)
				{	
					System.out.println(userId);
				
					System.out.println("2");
					//현재 회원아이디와 동일한 아이디가 있는지 검색을 한다.
					if(userId.equals(basket.getMember_id()))
					{	
						System.out.println("3");
						//첫번째 if문을 통과하면 userId는 현재 것과 동일한 것이다.
						ArrayList<BasketDTO> bassket = BasketManager.getBasketManager().findBasket(userId);
						for(BasketDTO bas : bassket)
						{	System.out.println("4");
							//아이디를 뽑아냈으면 아이템코드로 중복검사를 실시한다
							if(bas.getItem_code().equals(c_code))
							{	System.out.println("5");
								int cnt = bas.getItem_cnt();//고객의 바스킷의 담긴 고양이 중복 갯수를 확인후 cnt에 담는다
								++cnt;//그다음 bas.getItem_cnt 를 ++ 시켜주고
								bas.setItem_cnt(cnt);//set 을 이용해 cnt의 갯수를 바꿔주고
								BasketManager.getBasketManager().update(bas);//bas를 업데이트 시켜준다.
								%>
								<script type="text/javascript">
									var contentPage = "basket";
									location.href="./main.jsp?contentPage="+contentPage;
								</script>
								<%
								return;
							}//if
						}//for2
					}//if
				}//for1
						BasketManager.getBasketManager().create(new BasketDTO(																	
				 																  petDto.getC_name_code(),
			   															     	  petDto.getC_sex(),
			    																  petDto.getC_price(),
																				  1,
																				  userId));
	}
	
	
	//페이지 이동
	%>
		<script type="text/javascript">
		var contentPage = "basket";
		location.href="./main.jsp?contentPage="+contentPage;
		</script>
	