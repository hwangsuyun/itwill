package com.itwill.member.controller.annotation;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.member.ExistedUserException;
import com.itwill.member.Member;
import com.itwill.member.MemberService;

@Controller

public class JoinController {
	@Autowired private MemberService memberService;
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String write(Member command, Model model) throws Exception {
	
		String path="";
		
		try {
			int insertRowCount = memberService.create(command);
			path = "main.jsp?contentPage=member/login";
			System.out.println("1111");
		
		} catch (ExistedUserException e) {
			path = "main.jsp?contentPage=member/join";
			model.addAttribute("msg", e.getMessage());
			System.out.println("22222");
		
		} catch (Exception e) {
			e.printStackTrace();
			path = "main.jsp?contentPage=member/join";
			model.addAttribute("msg", e.getMessage());
			System.out.println("333");
		}

		return path;
		
	}

	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String writeGet(Member member) {
		
				
		return "join.jsp";
		
	}
	
}
