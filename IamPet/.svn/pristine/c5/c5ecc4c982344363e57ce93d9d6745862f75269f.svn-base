package basket;

import java.util.ArrayList;

public class BasketManager {

	private static BasketManager _basketManager;
	private BasketManager(){}
	public static BasketManager getBasketManager()
	{
		if(_basketManager==null){
			_basketManager=new BasketManager();
		}
		return _basketManager;
	}


	//멤버아이디 장바구니삭제
	public int remove(String member_id)throws Exception
	{	
		int rows = getBasketDao().remove(member_id);
		return rows;
	}
	

	//장바구니 번호로 장바구니삭제
	public int DeleteByNo(String basket_no)throws Exception
	{	
		int rows = getBasketDao().DeleteByNo(basket_no);
		return rows;
	}

	//장바구니 생성날짜별 전체조회
	public ArrayList<BasketDTO> dateAll(String basket_date)throws Exception
	{
		return getBasketDao().dateAll(basket_date);
	}
	//전체 장바구니 조회
	public ArrayList<BasketDTO> allBasket()throws Exception
	{
		return getBasketDao().allBasket();
	}
	//멤버아이디 장바구니 찾기
	public ArrayList<BasketDTO> findBasket(String member_id)throws Exception
	{
		ArrayList<BasketDTO> arrayList = getBasketDao().findBasket(member_id);
		return arrayList;
	}		

	//아이디로 장바구니 데이터 찾기(조인)
	public ArrayList findBasketJoin(String member_id)throws Exception
	{
		ArrayList arrayList = getBasketDao().findBasketJoin(member_id);
		return arrayList;
	}		

	//해당아이템 구매한 사람들 찾기
	public ArrayList<BasketDTO> itemMember(String item_code)throws Exception
	{
		ArrayList<BasketDTO> list = getBasketDao().itemMember(item_code);
		return list;
	}
	/*
	 * 장바구니 생성
	 */
	public int create(BasketDTO basketDto) throws Exception{
		int rows = getBasketDao().create(basketDto);
		return rows;
	}
	/*
	 * 장바구니 수정
	 */
	public int update(BasketDTO basketDto) throws Exception{
		int rows = getBasketDao().update(basketDto);
		return rows;
	}

	public BasketDTO findBasketByNo(int no) throws Exception
	{	
		BasketDTO basket = getBasketDao().findBasketByNo(no);
		return basket;			
	}


	/*
	 * BasketDAO 객체반환
	 */

	private BasketDAO getBasketDao() 
	{
		return BasketDAO.getBasketDAO();
	}
}
