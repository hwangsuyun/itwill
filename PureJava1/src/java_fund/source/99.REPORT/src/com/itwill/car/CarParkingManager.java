package com.itwill.car;

public class CarParkingManager
{
	private Car[] carArray;
	
	// 생성자 
	public CarParkingManager()
	{
		carArray = new Car[30];
	}		
	public CarParkingManager(int no)
	{
		if(no <= 0) no = 30;
		
		carArray = new Car[no];
	}
	// 카 배열 리턴 
	public Car[] getCarArray() { return this.carArray; }
	// 몇개의 배열을 만들었는지 리턴 
	public int getCarArrayCount() { return this.carArray.length; }
	
	// 차를 줄테니 입차
	/*
	 * 입차 
	 */
	public void addCar(Car car)//(Object obj)//
	{
		/*
		boolean isSame = false;
		Car inputCar = (Car)obj;
		if(this.no.equals.(inputCar.no))
		{
			isSame = true;
		}
		return isSame;
		*/
		//*
		for(int i = 0; i < carArray.length; i++)
		{
			if(carArray[i] == null)
			{
				// car String형 번호 중복 체크
			//	if(car.getNo().equals(anObject))
				carArray[i] = car;
				break;
			}
		}
		//*/
		
	}

	// 총 주차 대수를 반환해 주세요
	/*
	 * 총 주차 대수 
	 */
	public int getCount()
	{
		int tot = 0;
		for(int i = 0; i < carArray.length; i++)
		{
			if(carArray[i] != null)
			{
				tot++;
			}
		}
		
		return tot;
	}

	// 현재 차량의 15시 현재 총주차 요금을 반환해 주세요
	public int getTotFee(int currentTime)
	{
		int tot_fee = 0;
		for(int i = 0; i < carArray.length; i++)
		{
			if(carArray[i] != null)
			{
				// 15시로 출차 셋팅 
				carArray[i].setOutTime(currentTime);
				// 요금 계산
				carArray[i].calculateFee();
				
				// 총주차요금에 누적 
				tot_fee += carArray[i].getFee();
				
				// 출차, 요금 초기화 
				carArray[i].setOutTime(0);
				carArray[i].setFee(0);
			}
		}
		
		return tot_fee;
	}

	// 특정시간이후 입차된 차들 찾아서 반환해 주세요
	public Car[] findByInTime(int inTime)
	{
		Car[] carTemp = new Car[carArray.length];
		for(int i = 0; i < carArray.length; i++)
		{
			if(carArray[i] != null)
			{
				if(carArray[i].getInTime() >= inTime)
				{
					carTemp[i] = carArray[i];					
				}
			}
		}
		
		return carTemp;
	}

	// 차량번호로 차 찾아서 반환해 주세요
	public Car findByNo(String no)
	{
		Car car = null;
		for(int i = 0; i < carArray.length; i++)
		{
			if(carArray[i] != null)
			{
				if(carArray[i].getNo().equals(no))
				{
					car = carArray[i];
				}
			}
			
		}
		return car;
	}

	// 번호로 출차시키고 메시지를 주세요.
	public String removeCar(String no, int outTime)
	{
		String msg = "";
		for(int i = 0; i < carArray.length; i++)
		{
			if(carArray[i].getNo().equals(no))
			{				
				carArray[i].setOutTime(outTime);	// 출차시간 셋팅
				carArray[i].calculateFee();			// 요금 계산 
				carArray[i] = null;					// 출차 
				break;
			}
		}
		// 아웃타임 셋팅
		// 요금 계산 후 
		// 출차 
		
		return "출차성공!!";
	}

}











