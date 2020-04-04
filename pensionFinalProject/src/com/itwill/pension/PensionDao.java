package com.itwill.pension;

import java.util.List;
//dao는 db에만 관여를 하고 service를 사용하여 manager 역할을 하여야 하는데
//펜션은 딱히 service를 만들 필요가 없어서 그냥 dao에서 모든걸 처리하게 함
public interface PensionDao {
	
	//펜션지역으로 검색 후 펜션리스트 뿌리기
	public abstract List<Pension> findPension(String p_group) throws Exception;
	
	//모든 펜션리스트 뿌리기
		public abstract List<Pension> findAllPension() throws Exception;
		
}
