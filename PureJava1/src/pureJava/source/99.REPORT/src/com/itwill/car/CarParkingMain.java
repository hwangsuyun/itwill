package com.itwill.car;

public class CarParkingMain
{
	public static void main(String[] args)
	{
		CarParkingManager carManager = new CarParkingManager();
		
		System.out.println("1. 입차");
		
		// 차를 줄테니 입차시켜 주세요
		Car car1 = new Car("1111", 4);
		Car car2 = new Car("2222", 5);
		Car car3 = new Car("3333", 6);
		Car car4 = new Car("4444", 7);
		Car car5 = new Car("5555", 8);
		Car car6 = new Car("6666", 10);
		
		carManager.addCar(car1);
		carManager.addCar(car2);
		carManager.addCar(car3);
		carManager.addCar(car4);
		carManager.addCar(car5);
		carManager.addCar(car6);

		// 총 주차 대수를 반환해 주세요		
		int tot = carManager.getCount();
		System.out.println("2. 총 주차 대수 : "+tot);
		
		// 현재 차량의 15시 현재 총 주차 요금을 계산후 반환해 주세요  
		int tot_fee = carManager.getTotFee(15);
		System.out.println("3. 15시 현재 총 주차 요금 : "+tot_fee);

		// 입차 8시이후 시간으로 차들 찾아서 반환해 주세요 
		// public Car[] findByInTime(int inTime)
		// 차배열을 리턴받아서 몇개를 만들었는지 알아본다. 
		int carArrayCount = carManager.getCarArrayCount();
		System.out.println("-------------------------------");
		System.out.println("주차장 저장 공간 확인 : "+carArrayCount);
		System.out.println("-------------------------------");
		Car[] carTemp = new Car[carArrayCount];		
		carTemp = carManager.findByInTime(8);
		
		System.out.println("4. 8시이후 입차된 차량 리스트");
		for(int i = 0; i < carTemp.length; i++)
		{
			if(carTemp[i] != null)
			{				
				carTemp[i].print();					
			}
		}
		
		// 차량번호로 차 찾아서 반환해 주세요 ex) 3333
		Car carCheck = new Car();
		carCheck = carManager.findByNo("3333");
		System.out.println("5. 3333번 차량 찾아서 출력");
		carCheck.print();
		
		// 번호로 출차시켜 주세요.
		// 2222번 출차 
		// public String removeCar(String no, int outTime)
		System.out.println("6. 2222번 차량 찾아서 요금 계산후 출차");
		String msg = carManager.removeCar("2222", 17);		
		if(msg != null)	System.out.println(msg);
		
		tot = carManager.getCount();
		System.out.println("7. 총 주차 대수 : "+tot);
						
	}

	
	

}












