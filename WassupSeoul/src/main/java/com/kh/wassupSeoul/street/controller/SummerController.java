package com.kh.wassupSeoul.street.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.street.model.vo.Board;

public class SummerController {
	
	@RequestMapping("fileUpload")
	public void fileUpload(Board board, 
			Model model, 
			MultipartFile file, 
			HttpServletRequest request, 
			HttpServletResponse response) {
		
		Member loginMember = (Member) model.getAttribute("loginMember");
		System.out.println(loginMember);
		int boardWriter = loginMember.getMemberNo();
		System.out.println(boardWriter);
		
		
		
		
	}
	
}
