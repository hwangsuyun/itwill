package guest;

import java.util.ArrayList;



public class GuestManager {
	private static GuestManager _guestManager;
	private GuestManager(){}
	public static GuestManager getGuestManager(){
		if(_guestManager==null)
		{
			_guestManager = new GuestManager();
		}
		return _guestManager;
}
	//1.비회원 개인정보찾기
	public GuestDTO findGuest(String name, String email, String phone) throws Exception{
		System.out.println("1");
		return getGuestDao().Guestfind(name, email, phone);
	}
	//2. 비회원 insert
	public int create(GuestDTO guestDto) throws Exception{
		System.out.println("2. 비회원 insert");
		return getGuestDao().create(guestDto);
	}

	private GuestDAO getGuestDao(){
		return GuestDAO.getGeustDAO();
	}
}
