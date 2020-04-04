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

	// ��ٱ��� �߰�
	public int insert(BasketDTO basketDto) throws Exception{
		return getBasketDao().insert(basketDto);
	}

	//��ٱ��� ����
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
	

	//��ٱ��� ���� basket_no��
	public int remove(String basket_code) throws Exception{
		return getBasketDao().remove(basket_code);
	}
	
	//��ٱ��� ���� m_id��
	public int delete(String m_id) throws Exception{
		return getBasketDao().delete(m_id);
	}
	
	//��ü ��ٱ��ϸ��
	public ArrayList<BasketDTO> findAll() throws Exception{
		return getBasketDao().findAll();
	}
	
	//basket_no�� ��ٱ����ϳ�ã��
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
	
	//m_id�� ��ٱ����ϳ�ã��
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
	
	//m_id�� ����Ʈ �Ѹ���
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
	
	
	
	
	// ��ü��ȯ
	private BasketDAO getBasketDao() {
		return BasketDAO.getBasketDAO();
	}

}
