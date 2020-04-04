package com.itwill.pension;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

//컨트롤러(어노테이션 사용)
@Controller
public class PensionListController {
	@RequestMapping("/pension_detail.do")	//매핑작업(pension_detail.do)로 들어오는 모든 작업을 처리함
public String list(Pension command, Model model) throws Exception {
		WebApplicationContext wac=ContextLoader.getCurrentWebApplicationContext();
		PensionDao pensionDao =
				(PensionDao)wac.getBean("pensionDao");	
		//applicationContext2.xml에 선언된 pensionDao lookup, pensionDao에는 jdbcTemplate을 사용하도록 참조되있음
		List<Pension> pensionList=pensionDao.findPension(command.getP_group());	//지역명으로 검색 후 펜션리스트에 담아줌
		//List<Pension> pensionList2=pensionDao.findAllPension();
		model.addAttribute("pensionList", pensionList);			//담긴 펜션리스트를 model에 담는다(jsp에서 사용할 수 있음)
		model.addAttribute("p_group",command.getP_group());		//지역명을 model에 담는다
		//System.out.println("p_group:"+command.getP_group());
		//System.out.println("pensionList:"+pensionList);
		return "main.jsp?contentPage=pension/pension_detail";	//jsp페이지로 리턴시킴
	}
}
