package com.itwill.member;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.web.context.ContextLoader;

//���������� ���� ��ü
public class MemberServiceImpl implements MemberService, ApplicationContextAware {

	private MemberDao memberDao;
	private String serviceName;

	public MemberServiceImpl() {
		System.out.println("#### MemberServiceImpl() : ����Ʈ������ȣ��");

	}

	public MemberServiceImpl(MemberDao memberDao) {
		this.memberDao = memberDao;
		System.out.println("#### MemberServiceImpl(MemberDao memberDao) : ������ȣ��");
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
		System.out.println("#### MemberServiceImpl : create() ȣ��");
		if(getMemberDao().existedUser(member.getId())){
						
			String msg = ContextLoader.getCurrentWebApplicationContext()
					.getMessage("member.existed.exception",
								new Object[]{member.getId()},
								"�̹� �����ϴ� ���̵��Դϴ�. ",
								Locale.getDefault());
			throw new ExistedUserException(msg); 
			//throw new ExistedUserException(member.getId()+" �� �̹������ϴ� ���̵��Դϴ�.");  
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
	 * �α���
	 */
	public Member login(String id, String passwd)
			throws MemberNotFoundException, PasswordMismatchException, Exception {
		System.out.println("#### MemberServiceImpl : login() ȣ��");
		// �ԷµǴ� ���̵�� User ã�ƿ���
		// ??????????????????????
		Member member = null;
		try {
			member = memberDao.findMember(id);
		} catch (Exception e) {
		
		}
		if (member == null) {
			throw new MemberNotFoundException(id + " �������� �ʴ� ���̵��Դϴ�.");
		}
		if (member.isMatchPassword(passwd) == false) {

			throw new PasswordMismatchException("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		}
		return member;

	}




	

	

}
