package com.itwill.member;

import java.util.List;

//슈퍼클래스만 추출
public interface MemberService{
	public int create(Member member) throws ExistedUserException,Exception;
	public Member login(String id, String passwd)throws  MemberNotFoundException, PasswordMismatchException,Exception;
	
}