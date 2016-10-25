package com.project.trading.utility;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class SendEmail {
	

public boolean sendAMail(String toAddress,String fName,String lName,String Contact,String add, String userName,String password){
	Email email = new SimpleEmail();
	email.setHostName("smtp.googlemail.com");
	email.setSmtpPort(465);
	email.setAuthenticator(new DefaultAuthenticator("gupta.r1901@gmail.com", "Sweethome@01472"));
	email.setSSL(true);
	try {
		email.setFrom("gupta.r1901@gmail.com");
		email.setSubject("Your New Account Details!");
		email.setMsg("Your Details are as follows: \n \n FirstName :"+fName+" \n LastName :"+lName+"\n Contact Number :"+Contact+" \n Address :"+add+" \n UserName :"+userName+" \n Password :"+password+"\n\n Please reset your password before using it\n Thank You \n\nRegards\nRuchi Gupta");
		email.addTo(toAddress);
		email.send();
		return true;
	} catch (EmailException e) {
		e.printStackTrace();
		return false;
	}
	
	
}




}
