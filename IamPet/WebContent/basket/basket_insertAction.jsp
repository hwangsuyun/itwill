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
 
 <!-- �α��� �ߴ��� ���ߴ��� Ȯ�� -->    
<%@include file="../login_check.jspf" %> 

<%
	String c_code = request.getParameter("c_name_code");
	String c_count = request.getParameter("c_count");
	
	//�� �ҷ�����.
	PetDTO petDto = PetManager.getPetManager().findPet(c_code);
	//��ȸ�� �ϰ��
	if(userId==null)
	{
		session.setAttribute("id", session.getId());
		System.out.println(session.getAttribute("id"));
		
		//����� �ߺ��˻�.(������� ȣ��.)
		ArrayList<BasketDTO> arrayList = BasketManager.getBasketManager().allBasket();
		System.out.println("1");
		for(BasketDTO basket : arrayList)
		{	//���� ��ȸ�����̵�� ������ ���̵� �ִ��� �˻��� �Ѵ�.
			System.out.println("2");
			if(basket.getMember_id().equals(session.getId()))
			{	//��ȸ���̳� ���̵� �̾Ƴ��� ��ǰ �ߺ��˻縦 �ǽ��Ѵ�
				System.out.println("3");
				ArrayList<BasketDTO> bassket = BasketManager.getBasketManager().findBasket(session.getId());
				for(BasketDTO bas : bassket)
				{	System.out.println("4");
					//���̵� �̾Ƴ����� �������ڵ�� �ߺ��˻縦 �ǽ��Ѵ�
					if(bas.getItem_code().equals(c_code))
					{	System.out.println("5");
						int cnt = bas.getItem_cnt();//���� �ٽ�Ŷ�� ��� ����� �ߺ� ������ Ȯ���� cnt�� ��´�
						++cnt;//�״��� bas.getItem_cnt �� ++ �����ְ�
						bas.setItem_cnt(cnt);//set �� �̿��� cnt�� ������ �ٲ��ְ�
						BasketManager.getBasketManager().update(bas);//bas�� ������Ʈ �����ش�.
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
	//ȸ���� ��� 
	else
	{	
				//����� �ߺ��˻�.(������� ȣ��.)
				ArrayList<BasketDTO> arrayList = BasketManager.getBasketManager().allBasket();
				System.out.println("1");
				
				for(BasketDTO basket : arrayList)
				{	
					System.out.println(userId);
				
					System.out.println("2");
					//���� ȸ�����̵�� ������ ���̵� �ִ��� �˻��� �Ѵ�.
					if(userId.equals(basket.getMember_id()))
					{	
						System.out.println("3");
						//ù��° if���� ����ϸ� userId�� ���� �Ͱ� ������ ���̴�.
						ArrayList<BasketDTO> bassket = BasketManager.getBasketManager().findBasket(userId);
						for(BasketDTO bas : bassket)
						{	System.out.println("4");
							//���̵� �̾Ƴ����� �������ڵ�� �ߺ��˻縦 �ǽ��Ѵ�
							if(bas.getItem_code().equals(c_code))
							{	System.out.println("5");
								int cnt = bas.getItem_cnt();//���� �ٽ�Ŷ�� ��� ����� �ߺ� ������ Ȯ���� cnt�� ��´�
								++cnt;//�״��� bas.getItem_cnt �� ++ �����ְ�
								bas.setItem_cnt(cnt);//set �� �̿��� cnt�� ������ �ٲ��ְ�
								BasketManager.getBasketManager().update(bas);//bas�� ������Ʈ �����ش�.
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
	
	
	//������ �̵�
	%>
		<script type="text/javascript">
		var contentPage = "basket";
		location.href="./main.jsp?contentPage="+contentPage;
		</script>
	