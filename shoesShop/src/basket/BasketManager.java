package basket;

import java.util.ArrayList;


public class BasketManager {

	private static BasketManager _basketManager;

	private BasketManager() {
	}

	public static BasketManager getBasketmanager() {
		if (_basketManager == null) {
			_basketManager = new BasketManager();
		}
		return _basketManager;
	}

	// 장바구니 추가
	public int insert(BasketDTO basketDto) throws Exception{
		return getBasketDao().insert(basketDto);
	}

	//장바구니 수정
	public int update(BasketDTO basketDto) {
		int rows = 0;
		try {
			rows = getBasketDao().update(basketDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rows;
	}
	

	//장바구니 삭제 basket_no로
	public int remove(String basket_code) throws Exception{
		return getBasketDao().remove(basket_code);
	}
	
	//장바구니 삭제 m_id로
	public int delete(String m_id) throws Exception{
		return getBasketDao().delete(m_id);
	}
	
	//전체 장바구니목록
	public ArrayList<BasketDTO> findAll() throws Exception{
		return getBasketDao().findAll();
	}
	
	//basket_no로 장바구니하나찾기
	public BasketDTO findbasket(String basket_code) {
		BasketDTO basketDto= null;
		try {
			basketDto = getBasketDao().findbasket(basket_code);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return basketDto;
	}
	
	//m_id로 장바구니하나찾기
	public BasketDTO findOne(String m_id) {
		BasketDTO basketDto = null;
		try {
			basketDto = getBasketDao().findOne(m_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return basketDto;
	}
	
	//m_id로 리스트 뿌리기
	public ArrayList<BasketDTO> find(String m_id) {
		ArrayList<BasketDTO> list = null;
		try { 
			
			list=getBasketDao().find(m_id);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
	// 객체반환
	private BasketDAO getBasketDao() {
		return BasketDAO.getBasketDAO();
	}

}
