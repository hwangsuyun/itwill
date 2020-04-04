package com.itwill.member.controller.annotation;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.member.Member;
import com.itwill.member.MemberNotFoundException;
import com.itwill.member.MemberService;
import com.itwill.member.PasswordMismatchException;

@Controller
public class LoginController {
	@Autowired private MemberService memberService;
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(@ModelAttribute("fuser") Member command, HttpServletRequest request, Model model)
			throws Exception {
		String path = "";
		System.out.println("ㅁㄴㅇㄹㄴㅁㅇㄹ");

		try {
			
			Member member = memberService.login(command.getId(), command.getPasswd());
			
			request.getSession().setAttribute("id", member.getId());
			
			request.getSession().setAttribute("member", member);
			
			path = "redirect:main.jsp";
					
		} catch (MemberNotFoundException e) {
			
			path = "main.jsp?contentPage=member/login";
			model.addAttribute("msg", e.getMessage());
		
		} catch (PasswordMismatchException e) {
			
			path = "main.jsp?contentPage=member/login";
			model.addAttribute("msg", e.getMessage());
		
		}
		
		System.out.println("66666ㅁㄴㅇㄹㄴㅁㅇㄹ");
		return path;
	}
	
	
	
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String loginGet(Member member) throws Exception {
		member.setId("아이디를써용~~");
		member.setPasswd("패에쓰써용~~~");

		return "login.jsp";
	}

	

}
