package com.itwill.pension;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

//��Ʈ�ѷ�(������̼� ���)
@Controller
public class PensionListController {
	@RequestMapping("/pension_detail.do")	//�����۾�(pension_detail.do)�� ������ ��� �۾��� ó����
public String list(Pension command, Model model) throws Exception {
		WebApplicationContext wac=ContextLoader.getCurrentWebApplicationContext();
		PensionDao pensionDao =
				(PensionDao)wac.getBean("pensionDao");	
		//applicationContext2.xml�� ����� pensionDao lookup, pensionDao���� jdbcTemplate�� ����ϵ��� ����������
		List<Pension> pensionList=pensionDao.findPension(command.getP_group());	//���������� �˻� �� ��Ǹ���Ʈ�� �����
		//List<Pension> pensionList2=pensionDao.findAllPension();
		model.addAttribute("pensionList", pensionList);			//��� ��Ǹ���Ʈ�� model�� ��´�(jsp���� ����� �� ����)
		model.addAttribute("p_group",command.getP_group());		//�������� model�� ��´�
		//System.out.println("p_group:"+command.getP_group());
		//System.out.println("pensionList:"+pensionList);
		return "main.jsp?contentPage=pension/pension_detail";	//jsp�������� ���Ͻ�Ŵ
	}
}
