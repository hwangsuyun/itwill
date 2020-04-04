package delivery;

import java.util.ArrayList;

public class DeliveryManager {

	private static DeliveryManager _deliveryManager;
	private DeliveryManager(){}
	public static DeliveryManager getDeliveryManager(){
		if(_deliveryManager==null){
			_deliveryManager=new DeliveryManager();
		}
		return _deliveryManager;
	}
	
	//배송정보입력
	public int insert(DeliveryDTO deliveryDto)throws Exception
	{
		int rows = getDeliveryDAO().insert(deliveryDto);
		return rows;
	}
	
	//고객 한명 배송상태 확인
	public DeliveryDTO findStatus(String delivery_status)throws Exception
	{
		DeliveryDTO deliveryDto = getDeliveryDAO().findStatus(delivery_status);
		return deliveryDto;
	}
	
	//배송취소
	public int remove(String member_id)throws Exception
	{
		int rows = getDeliveryDAO().remove(member_id);
		return rows;
	}
	
	//고객 배송정보 1명 확인
	public DeliveryDTO findDelivery(String member_id)throws Exception
	{
		DeliveryDTO deliveryDto = getDeliveryDAO().findDelivery(member_id);
		return deliveryDto;
	}
	
	//고객들 배송정보 확인
	public ArrayList<DeliveryDTO> allDelivery()throws Exception
	{
		ArrayList<DeliveryDTO> arrayList = getDeliveryDAO().allDelivery();
		return arrayList;
	}
	
	//발송 날짜별 구매자 정보 확인
	public ArrayList<DeliveryDTO> findDate(String send_date)throws Exception
	{
		ArrayList<DeliveryDTO> arrayList = getDeliveryDAO().findDate(send_date);
		return arrayList;
	}
	
	//XX제품을 구매한 고객들정보 확인
	public DeliveryDTO findItem(int order_code)throws Exception
	{
		System.out.println("배송매니저 : "+order_code);
		DeliveryDTO deliveryDTO = getDeliveryDAO().findItem(order_code);
		System.out.println("결과 배송매니저 상태 : "+deliveryDTO.getDelivery_status());
		return deliveryDTO;
	}
	
	
	/*
	 * DeliveryDAO 객체 반환
	 */
	private DeliveryDAO getDeliveryDAO(){
		return DeliveryDAO.getDeliveryDAO();
	}
}
