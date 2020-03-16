package com.kh.wassupSeoul.mail.model.vo;

import java.util.Map;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

import com.kh.wassupSeoul.mail.model.bean.Mail;
import com.kh.wassupSeoul.mail.model.configuration.ApplicationConfig;
import com.kh.wassupSeoul.mail.model.service.MailService;

public class App {
	
	/* public static void main(String args[]) { */
	public void sendEmail(Map<String, String> randomMap) {
		
		
        Mail mail = new Mail();
        mail.setMailFrom("WassupSeoul0403@gmail.com");
        mail.setMailTo(randomMap.get("email"));
        mail.setMailSubject("[임시비밀번호 발송]Wassup, Seoul 에서 임시 비밀번호 발송 안내 드립니다. ");
        mail.setMailContent("안녕하세요. Wassup, Seoul 입니다 :) \n임시 비밀번호 발송 안내드립니다.\n"
        		+ "[임시비밀번호] :" + randomMap.get("randomPwd"));
 
        AbstractApplicationContext context = new AnnotationConfigApplicationContext(ApplicationConfig.class);
        MailService mailService = (MailService) context.getBean("mailService");
        mailService.sendEmail(mail);
        context.close();
    }


}
