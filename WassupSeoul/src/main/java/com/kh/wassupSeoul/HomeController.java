package com.kh.wassupSeoul;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.wassupSeoul.common.Pagination;
import com.kh.wassupSeoul.common.vo.PageInfo;
import com.kh.wassupSeoul.street.model.vo.Street;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HomeService homeService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "squre", method = RequestMethod.GET)
	public String squre(Locale locale, 
						Model model,
						@RequestParam(value="currentPage", required=false) Integer currentPage) {
		
		try {
			int listCount = homeService.getListCount();
			
			if(currentPage == null) currentPage = 1;
			
			PageInfo pInf = Pagination.getPageInfo(10, 10, currentPage, listCount);
			
			List<Street> list = homeService.selectList(pInf);
			
			for(Street street : list) {
				System.out.println(street);
			}
			
			model.addAttribute("list", list);
			model.addAttribute("pInf", pInf);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "squre";
	}
	
	
	
	
	
	
	
	
}
