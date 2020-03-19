package com.kh.wassupSeoul.friends.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.wassupSeoul.friends.model.service.FriendsService;
import com.kh.wassupSeoul.member.model.vo.Member;

@SessionAttributes({"loginMember","msg"})
@Controller
@RequestMapping("/friends/*")
public class FriendsController {

	@Autowired
	private FriendsService friendsService;
	
	@RequestMapping(value = "friendRequest",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public String friendRequest(int myNum) {
		
		System.out.println(myNum);
		
		
		return null;
	}
	
	
	
	
	
	
}
