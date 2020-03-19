package com.kh.wassupSeoul.friends.controller;

import java.util.ArrayList;
import java.util.List;

import javax.management.relation.Relation;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.wassupSeoul.friends.model.service.FriendsService;
import com.kh.wassupSeoul.member.model.vo.Member;

@SessionAttributes({"loginMember","msg"})
@Controller
public class FriendsController {

	@Autowired
	private FriendsService friendsService;
	
	@RequestMapping("friendRequest")
	@ResponseBody
	public String friendRequest(Model model, HttpServletResponse response) {
		
		Member me = (Member)model.getAttribute("loginMember");
		int myNum = me.getMemberNo();
		try {
		List<Member> fList = friendsService.friendRequest(myNum);
		return new Gson().toJson(fList);
		} catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	
	
}
