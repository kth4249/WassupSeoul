package com.kh.wassupSeoul.street.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.wassupSeoul.street.model.vo.Street;
import com.kh.wassupSeoul.street.service.StreetService;


@RequestMapping("/street/*")
@Controller
public class StreetController {
	
	@Autowired
	private StreetService streetService;
	
	//타임라인 이동
	@RequestMapping(value = "streetMain", method = RequestMethod.GET)
	public String timeLine(Integer streetNo, 
			Model model,  
			RedirectAttributes rdAttr, 
			HttpServletRequest request) { 
		
		System.out.println("골목번호 : "+ streetNo);
		
		try {
			Street street = streetService.selectStreet();
			
		}catch(Exception e) {
			
		}
		
		return null;
	}
	
	
	
	
}
