package com.project.trading.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.project.trading.pojo.Investor;


public class UserValidator implements Validator{

	
	public boolean supports(Class aClass) {
		// 
		return aClass.equals(Investor.class);
	}
	
	
	
	
	public void validate(Object obj, Errors errors) {
		// TODO Auto-generated method stub
		Investor investor = (Investor) obj;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fName", "error.invalid.investor", "First Name Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lName", "error.invalid.investor", "Last Name Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "error.invalid.investor", "User Name Required");
     
     
   
		
	}

}
