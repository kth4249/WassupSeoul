package com.kh.wassupSeoul.friends.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WebChattingController {

	private Logger logger=LoggerFactory.getLogger(WebChattingController.class);
	@RequestMapping(value="/chatting.do", method=RequestMethod.POST)
	public ModelAndView  chat(ModelAndView mv, String userName, HttpServletRequest request, HttpSession session) throws Exception
	{
		request.setCharacterEncoding("UTF-8");
		session.setAttribute("userName", userName);
		System.out.println("controller : "+session.getAttribute("userName"));
		String host=request.getRemoteAddr();
		System.out.println("host주소 :"+host);
		mv.addObject("host",host);
		
		//출력할 뷰 선택
		mv.setViewName("chat/chattingView");
		
		
		
		
		return mv;			
	}
	
}
 