package com.itwill.member;

import java.util.List;

//����Ŭ������ ����
public interface MemberService{
	public int create(Member member) throws ExistedUserException,Exception;
	public Member login(String id, String passwd)throws  MemberNotFoundException, PasswordMismatchException,Exception;
	
}