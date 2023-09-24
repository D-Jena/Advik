package com.advik.divine.exception;

public class AdvikDivineException extends RuntimeException{

	private static final long serialVersionUID = 1L;
	
	public AdvikDivineException() {
		
	}
	
	public AdvikDivineException(String errMsg) {
		super(errMsg);
	}

}
