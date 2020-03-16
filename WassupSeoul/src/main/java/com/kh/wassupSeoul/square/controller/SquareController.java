package com.kh.wassupSeoul.square.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*import org.slf4j.Logger;
import org.slf4j.LoggerFactory;*/
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.wassupSeoul.common.Pagination;
import com.kh.wassupSeoul.common.vo.PageInfo;
import com.kh.wassupSeoul.square.model.service.SquareService;
import com.kh.wassupSeoul.street.model.vo.Keyword;
import com.kh.wassupSeoul.street.model.vo.Street;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SquareController {
	
	/*
	 * private static final Logger logger =
	 * LoggerFactory.getLogger(SquareController.class);
	 */
	
	@Autowired
	private SquareService squareService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */ 
	@RequestMapping(value = "square", method = RequestMethod.GET)
	public String square(Model model,
						@RequestParam(value="currentPage", required=false) Integer currentPage,
						@RequestParam(value="districtNo", required=false) Integer districtNo,
						@RequestParam(value="streetSort", required=false) Integer streetSort, 
						@RequestParam(value="searchStreet", required=false) String searchStreet){
		System.out.println("currentPage : " + currentPage + ", districtNo : " + districtNo
							+ ", streetSort : " + streetSort);
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("districtNo", districtNo);
			map.put("searchStreet", searchStreet);
			if(streetSort == null) {
				streetSort = 0;
			}
			map.put("streetSort", streetSort);
			
			int listCount = squareService.getListCount(map);
			
			if(currentPage == null) currentPage = 1;
			
			PageInfo pInf = Pagination.getPageInfo(10, 10, currentPage, listCount);
			
			List<Street> sList = squareService.selectList(pInf, map);
			/*for(Street street : sList) {
				System.out.println("street : " + street);
			}*/
			
			List<Keyword> kList = null;
			if(!sList.isEmpty()) {
				kList = squareService.selectKeywordList(sList);
				for(Keyword key : kList) {
					System.out.println("keyword : " + key);
				}
			}
			
			
			
			model.addAttribute("sList", sList);
			model.addAttribute("kList", kList);
			model.addAttribute("pInf", pInf);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "square";
	}
	
	
	
	
	
}
