package com.kh.wassupSeoul.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.wassupSeoul.admin.model.service.AdminService;
import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;

@SessionAttributes({"loginMember", "msg"})
@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	@RequestMapping("admin")
	public String adminPage(Model model) {
		try {
			
			// 회원 목록 조회
			List<Member> mList = null;
			mList = adminService.selectMemberList();
			
			if(mList != null) {
				model.addAttribute("mList", mList);
			}
			
			// 회원 관심사 목록 조회
			List<Hobby> mhList = null;
			//mhList = adminService.selectHobbyList();
			System.out.println("회원 관심사 조회 : " + mhList);
			
			//if(mhList != null) { 
			//	model.addAttribute("mhList", mhList);
			//}
			
			// 골목 목록 조회
			
			
			
			// 활동보고서 목록 조회
			
			
			// 관심사 목록 조회
			
			
			
			return "admin/admin"; 
			
		}catch (Exception e) {

			e.printStackTrace();
			model.addAttribute("errorMsg", "관리자 페이지 이동 과정에서 오류 발생");
			return "common/errorPage";
		}
	}
	
	

}
