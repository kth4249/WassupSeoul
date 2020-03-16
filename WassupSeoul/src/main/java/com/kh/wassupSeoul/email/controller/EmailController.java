package com.kh.wassupSeoul.email.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.wassupSeoul.email.model.service.EmailServiceImpl;


@SessionAttributes({ "loginMember", "msg" })
@RequestMapping("/email/*")
@Controller
public class EmailController {
	
	@Autowired
	private EmailServiceImpl emailServiceImpl;
	
	@RequestMapping("emailsending")
	public String sendEmail(Model model, HttpServletRequest request, Map<String,String> randomMap) {
		try {
			System.out.println("야야야야:"+randomMap);
			emailServiceImpl.mailSend(randomMap,request);
			


		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
