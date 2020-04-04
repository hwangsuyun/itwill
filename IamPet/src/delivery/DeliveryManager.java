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
	
	//��������Է�
	public int insert(DeliveryDTO deliveryDto)throws Exception
	{
		int rows = getDeliveryDAO().insert(deliveryDto);
		return rows;
	}
	
	//�� �Ѹ� ��ۻ��� Ȯ��
	public DeliveryDTO findStatus(String delivery_status)throws Exception
	{
		DeliveryDTO deliveryDto = getDeliveryDAO().findStatus(delivery_status);
		return deliveryDto;
	}
	
	//������
	public int remove(String member_id)throws Exception
	{
		int rows = getDeliveryDAO().remove(member_id);
		return rows;
	}
	
	//�� ������� 1�� Ȯ��
	public DeliveryDTO findDelivery(String member_id)throws Exception
	{
		DeliveryDTO deliveryDto = getDeliveryDAO().findDelivery(member_id);
		return deliveryDto;
	}
	
	//���� ������� Ȯ��
	public ArrayList<DeliveryDTO> allDelivery()throws Exception
	{
		ArrayList<DeliveryDTO> arrayList = getDeliveryDAO().allDelivery();
		return arrayList;
	}
	
	//�߼� ��¥�� ������ ���� Ȯ��
	public ArrayList<DeliveryDTO> findDate(String send_date)throws Exception
	{
		ArrayList<DeliveryDTO> arrayList = getDeliveryDAO().findDate(send_date);
		return arrayList;
	}
	
	//XX��ǰ�� ������ �������� Ȯ��
	public DeliveryDTO findItem(int order_code)throws Exception
	{
		System.out.println("��۸Ŵ��� : "+order_code);
		DeliveryDTO deliveryDTO = getDeliveryDAO().findItem(order_code);
		System.out.println("��� ��۸Ŵ��� ���� : "+deliveryDTO.getDelivery_status());
		return deliveryDTO;
	}
	
	
	/*
	 * DeliveryDAO ��ü ��ȯ
	 */
	private DeliveryDAO getDeliveryDAO(){
		return DeliveryDAO.getDeliveryDAO();
	}
}
