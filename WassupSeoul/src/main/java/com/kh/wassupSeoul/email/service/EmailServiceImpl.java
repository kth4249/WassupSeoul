package com.kh.wassupSeoul.email.service;


import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.wassupSeoul.email.dao.EmailDAO;

@Service
public class EmailServiceImpl {
	
	@Autowired 
	private EmailDAO emailDao;
	@Autowired
	private JavaMailSender mailSender;



	public void mailSend(Map<String,String> randomMap, HttpServletRequest request) throws Exception{
		
		System.out.println("조아조아: "+randomMap.get("email"));
		
		MimeMessage mail = mailSender.createMimeMessage();
		String email = randomMap.get("email");
		String randomPwd = randomMap.get("randomPwd");
		
		System.out.println("이메일이다:"+email+",임비다 : "+randomPwd);
		String htmlStr = 
				"<h2>안녕하세요 ! Wassup Seoul 관리자입니다 :) </h2><br><br>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다) <br><br><br>"
				+ "임시 비밀번호 : "+ randomPwd; 
		try {
			mail.setSubject("[임시비밀번호] Wassup Seoul 임시 비밀번호 발송", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}


	}

	



}
