package com.kh.wassupSeoul.street.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.wassupSeoul.street.model.vo.Board;
import com.kh.wassupSeoul.street.model.vo.Street;
import com.kh.wassupSeoul.street.service.StreetService;


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
		
		String beforeUrl = request.getHeader("referer");
		
		try {
			Street street = streetService.selectStreet(streetNo);
			
			List<Board> board = streetService.selectBoard(streetNo);
					
			// 게시글, 댓글 조회해서 같이 넘겨줘야함 
			
			System.out.println("street : " + street );
			
			for(int i= 0; i <board.size(); i++) {
				System.out.println("골목 게시글 조회 : "+ board.get(i));
			}
			
			
			if(street != null) {
				
				model.addAttribute("street", street);
				
				return "street/streetMain";
				
			} else {
				rdAttr.addFlashAttribute("msg", "골목 상세 조회 실패");
				return "redirect:" + beforeUrl;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:" + beforeUrl;
		}
		
	}
	
}
