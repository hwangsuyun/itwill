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


	//������̵� ��ٱ��ϻ���
	public int remove(String member_id)throws Exception
	{	
		int rows = getBasketDao().remove(member_id);
		return rows;
	}
	

	//��ٱ��� ��ȣ�� ��ٱ��ϻ���
	public int DeleteByNo(String basket_no)throws Exception
	{	
		int rows = getBasketDao().DeleteByNo(basket_no);
		return rows;
	}

	//��ٱ��� ������¥�� ��ü��ȸ
	public ArrayList<BasketDTO> dateAll(String basket_date)throws Exception
	{
		return getBasketDao().dateAll(basket_date);
	}
	//��ü ��ٱ��� ��ȸ
	public ArrayList<BasketDTO> allBasket()throws Exception
	{
		return getBasketDao().allBasket();
	}
	//������̵� ��ٱ��� ã��
	public ArrayList<BasketDTO> findBasket(String member_id)throws Exception
	{
		ArrayList<BasketDTO> arrayList = getBasketDao().findBasket(member_id);
		return arrayList;
	}		

	//���̵�� ��ٱ��� ������ ã��(����)
	public ArrayList findBasketJoin(String member_id)throws Exception
	{
		ArrayList arrayList = getBasketDao().findBasketJoin(member_id);
		return arrayList;
	}		

	//�ش������ ������ ����� ã��
	public ArrayList<BasketDTO> itemMember(String item_code)throws Exception
	{
		ArrayList<BasketDTO> list = getBasketDao().itemMember(item_code);
		return list;
	}
	/*
	 * ��ٱ��� ����
	 */
	public int create(BasketDTO basketDto) throws Exception{
		int rows = getBasketDao().create(basketDto);
		return rows;
	}
	/*
	 * ��ٱ��� ����
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
	 * BasketDAO ��ü��ȯ
	 */

	private BasketDAO getBasketDao() 
	{
		return BasketDAO.getBasketDAO();
	}
}
