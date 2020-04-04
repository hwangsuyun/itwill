package pet.shopping;

import java.util.ArrayList;

/*
����ڰ��� API(Ŭ����)�� ����ϴ� �����ڵ��� ���������ϰԵǴ� Ŭ����
UserDao(XXXDao)�� ����ؼ� ����Ÿ���̽� �����۾��� �����ϵ����ϸ�
����Ÿ���̽��� ����Ÿ���� �̿��ؼ� �����Ͻ� ������ �����ϴ� �������Ѵ�.

<<��������Ʈ��(jsp,servlet)�� ����ϴ�Ŭ����>>
*/
public class PetManager {
	private static PetManager _petManager;
		
	private PetManager() {	}
	
	public static PetManager getPetManager() {
		if(_petManager == null){
			_petManager = new PetManager();
		}
		
		return _petManager;
	}
	
	/*
	 * Pet �󼼺��� c_codeã��
	 */
	public PetDTO findPet(int c_code) throws PetNotFoundException, Exception {

		PetDTO petDto = getPetDao().findPet(c_code);
		if (petDto == null) {
			// ���������ʴ� ���̵�
			System.out.println(c_code + " �� �������� �ʴ� ����� �Դϴ�.");
			throw new PetNotFoundException("�������� �ʴ� ����� �Դϴ�.");
		}
		return petDto;
	}
	/*
	 * Pet �󼼺��� c_name_codeã��
	 */
	public PetDTO findPet(String c_name_code) throws PetNotFoundException, Exception {

		PetDTO petDto = getPetDao().findPet(c_name_code);
		if (petDto == null) {
			// ���������ʴ� ���̵�
			System.out.println(c_name_code + " �� �������� �ʴ� ����� �Դϴ�.");
			throw new PetNotFoundException("�������� �ʴ� ����� �Դϴ�.");
		}
		return petDto;
	}
	/*
	 * Pet �󼼺��� c_nameã��
	 */
	public ArrayList<PetDTO> findnamePet(String c_name) throws PetNotFoundException, Exception {

		ArrayList<PetDTO> petNameList = getPetDao().findNamePet(c_name);
		if (petNameList == null) {
			// ���������ʴ� ���̵�
			System.out.println(c_name + " �� �������� �ʴ� ����� �Դϴ�.");
			throw new PetNotFoundException("�������� �ʴ� ����� �Դϴ�.");
		}
		return petNameList;
	}
	/*
	 * Pet ����Ʈ����
	 */
	public ArrayList<PetDTO> petAll() throws PetNotFoundException, Exception {

		ArrayList<PetDTO> petlist= getPetDao().petList();
		if (petlist == null) {
			// ���������ʴ� ���̵�
			throw new PetNotFoundException(" �������� �ʴ� ����Ʈ �Դϴ�.");
		}
		return petlist;
	}
	public ArrayList<PetDTO> findGroupPet(String c_name_code)throws PetNotFoundException, Exception
	{
		ArrayList<PetDTO> petlist= getPetDao().findGroupPet(c_name_code);
		if (petlist == null) {
			// ���������ʴ� ���̵�
			throw new PetNotFoundException(" �������� �ʴ� ����Ʈ �Դϴ�.");
		}
		return petlist;
	}

	/*
	 * PetDao ��ü��ȯ
	 */
	private PetDAO getPetDao() {
		return PetDAO.getPetDAO();
	}
	
}
