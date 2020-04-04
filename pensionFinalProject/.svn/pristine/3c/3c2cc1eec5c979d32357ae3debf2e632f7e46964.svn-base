package com.itwill.member;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.web.context.ContextLoader;

//유저서비스의 구현 객체
public class MemberServiceImpl implements MemberService, ApplicationContextAware {

	private MemberDao memberDao;
	private String serviceName;

	public MemberServiceImpl() {
		System.out.println("#### MemberServiceImpl() : 디폴트생성자호출");

	}

	public MemberServiceImpl(MemberDao memberDao) {
		this.memberDao = memberDao;
		System.out.println("#### MemberServiceImpl(MemberDao memberDao) : 생성자호출");
	}

	public MemberDao getMemberDao() {
		return memberDao;
	}

	public void setMemberDao(MemberDao memberDao) {
		System.out
				.println("#### MemberServiceImpl : setMemberDao(memberDao)");
		this.memberDao = memberDao;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		System.out
				.println("#### MemberServiceImpl : setServiceName(String serviceName)::"
						+ serviceName);
		this.serviceName = serviceName;
	}
	
	public int create(Member member) throws ExistedUserException,Exception{
		System.out.println("#### MemberServiceImpl : create() 호출");
		if(getMemberDao().existedUser(member.getId())){
						
			String msg = ContextLoader.getCurrentWebApplicationContext()
					.getMessage("member.existed.exception",
								new Object[]{member.getId()},
								"이미 존재하는 이이디입니다. ",
								Locale.getDefault());
			throw new ExistedUserException(msg); 
			//throw new ExistedUserException(member.getId()+" 는 이미존재하는 아이디입니다.");  
		}
		
		return memberDao.create(member);
	}
	
	ApplicationContext appContext;
	
	
	
	@Override
	public void setApplicationContext(ApplicationContext arg0)
			throws BeansException {
		appContext=arg0;
		
	} 

	
	/*
	 * 로그인
	 */
	public Member login(String id, String passwd)
			throws MemberNotFoundException, PasswordMismatchException, Exception {
		System.out.println("#### MemberServiceImpl : login() 호출");
		// 입력되는 아이디로 User 찾아오기
		// ??????????????????????
		Member member = null;
		try {
			member = memberDao.findMember(id);
		} catch (Exception e) {
		
		}
		if (member == null) {
			throw new MemberNotFoundException(id + " 존재하지 않는 아이디입니다.");
		}
		if (member.isMatchPassword(passwd) == false) {

			throw new PasswordMismatchException("비밀번호가 일치하지 않습니다.");
		}
		return member;

	}




	

	

}
