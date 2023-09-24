package com.advik.divine.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class AdvikDivineExceptionHandler {

	@ExceptionHandler(value=AdvikDivineException.class)
	public String handleException(AdvikDivineException ade,Model model) {
		
		return"site.unknownError";
	}
}
