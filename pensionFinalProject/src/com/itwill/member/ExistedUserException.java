package com.itwill.member;

public class ExistedUserException extends Exception {
	public ExistedUserException() {
		
	}
	public ExistedUserException(String msg) {
		super(msg);
	}
}
