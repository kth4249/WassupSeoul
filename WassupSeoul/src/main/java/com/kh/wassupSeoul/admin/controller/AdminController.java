package com.kh.wassupSeoul.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.kh.wassupSeoul.admin.model.service.AdminService;
import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.street.model.vo.Report;
import com.kh.wassupSeoul.street.model.vo.Street;

@SessionAttributes({"loginMember", "msg"})
@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	// 관리자 페이지 이동
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
			/*
			List<Hobby> mhList = null;
			mhList = adminService.selectMemberHobbyList();
			System.out.println("회원 관심사 조회 : " + mhList);			
			
			if(mhList != null) { 
				model.addAttribute("mhList", mhList);
			}
			*/
			
			// 골목 목록 조회
			List<Street> sList = null;
			sList = adminService.selectStreetList();
			
			if(sList != null) {
				model.addAttribute("sList", sList);
			}
			
			
			// 활동보고서 목록 조회
			List<Report> rList = null;
			rList = adminService.selectReportList(); 
			System.out.println("활동 보고서 목록 조회 : " + rList);
			
			if(rList != null) {
				model.addAttribute("rList", rList);
			}
			
			// 관심사 목록 조회
			List<Hobby> hList = null;
			hList = adminService.selectHobbyList();
			System.out.println("전체 관심사 목록 조회 : " + hList);
			
			if(hList != null) {
				model.addAttribute("hList", hList);
			}			
			
			return "admin/admin"; 
			
		}catch (Exception e) {

			e.printStackTrace();
			model.addAttribute("errorMsg", "관리자 페이지 이동 과정에서 오류 발생");
			return "common/errorPage";
		}
	}
	
	
	
	// 회원 강퇴
	@ResponseBody
	@RequestMapping(value = "deleteMember", method = RequestMethod.POST,
			produces = "application/json; charset=utf-8")
	public String deleteMember(int memberNo, HttpServletResponse response, Model model) {
		
		int result = 0;
		System.out.println("강퇴할 회원 번호 : " + memberNo);
		try {
			
			result = adminService.deleteMember(memberNo);			
			
			if(result > 0) {
				return new Gson().toJson(result);
				
			} else {
				
				result = 0;
				return new Gson().toJson(result);				
			}
			
			
		}catch (Exception e) {
			
			e.printStackTrace();
			return null;
		}
		
		
	}
	
	
	// 경고메일
	
	
	// 골목 폐쇄
	
	
	// 관심사 삭제
	
	
	// 활동보고서 확인
	
	
	

}
