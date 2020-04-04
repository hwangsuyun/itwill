package pet.shopping;

import java.util.ArrayList;

/*
사용자관리 API(클래스)를 사용하는 개발자들이 직접접근하게되는 클래스
UserDao(XXXDao)를 사용해서 데이타베이스 조작작업이 가능하도록하며
데이타베이스의 데이타들을 이용해서 비지니스 로직을 수행하는 역할을한다.

<<웹컴포넌트들(jsp,servlet)이 사용하는클래스>>
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
	 * Pet 상세보기 c_code찾기
	 */
	public PetDTO findPet(int c_code) throws PetNotFoundException, Exception {

		PetDTO petDto = getPetDao().findPet(c_code);
		if (petDto == null) {
			// 존재하지않는 아이디
			System.out.println(c_code + " 는 존재하지 않는 고양이 입니다.");
			throw new PetNotFoundException("존재하지 않는 고양이 입니다.");
		}
		return petDto;
	}
	/*
	 * Pet 상세보기 c_name_code찾기
	 */
	public PetDTO findPet(String c_name_code) throws PetNotFoundException, Exception {

		PetDTO petDto = getPetDao().findPet(c_name_code);
		if (petDto == null) {
			// 존재하지않는 아이디
			System.out.println(c_name_code + " 는 존재하지 않는 고양이 입니다.");
			throw new PetNotFoundException("존재하지 않는 고양이 입니다.");
		}
		return petDto;
	}
	/*
	 * Pet 상세보기 c_name찾기
	 */
	public ArrayList<PetDTO> findnamePet(String c_name) throws PetNotFoundException, Exception {

		ArrayList<PetDTO> petNameList = getPetDao().findNamePet(c_name);
		if (petNameList == null) {
			// 존재하지않는 아이디
			System.out.println(c_name + " 는 존재하지 않는 고양이 입니다.");
			throw new PetNotFoundException("존재하지 않는 고양이 입니다.");
		}
		return petNameList;
	}
	/*
	 * Pet 리스트보기
	 */
	public ArrayList<PetDTO> petAll() throws PetNotFoundException, Exception {

		ArrayList<PetDTO> petlist= getPetDao().petList();
		if (petlist == null) {
			// 존재하지않는 아이디
			throw new PetNotFoundException(" 존재하지 않는 리스트 입니다.");
		}
		return petlist;
	}
	public ArrayList<PetDTO> findGroupPet(String c_name_code)throws PetNotFoundException, Exception
	{
		ArrayList<PetDTO> petlist= getPetDao().findGroupPet(c_name_code);
		if (petlist == null) {
			// 존재하지않는 아이디
			throw new PetNotFoundException(" 존재하지 않는 리스트 입니다.");
		}
		return petlist;
	}

	/*
	 * PetDao 객체반환
	 */
	private PetDAO getPetDao() {
		return PetDAO.getPetDAO();
	}
	
}
