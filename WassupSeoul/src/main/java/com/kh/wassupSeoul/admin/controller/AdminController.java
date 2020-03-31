package com.kh.wassupSeoul.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
			
			if(rList != null) {
				model.addAttribute("rList", rList);
			}
			
			// 관심사 목록 조회
			List<Hobby> hList = null;
			hList = adminService.selectHobbyList();
			
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
	
	// 회원 상세보기
	@ResponseBody
	@RequestMapping(value="selectMember", method=RequestMethod.POST)
	public String selectMember(Integer selectMemberNo, HttpServletResponse response, Model model) {
				
		try {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map = adminService.selectMember(selectMemberNo);
						
			
			if(map != null) {
				return new Gson().toJson(map);
			} else {
				map = null;				
				return new Gson().toJson(map);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 회원 강퇴
	@RequestMapping(value = "deleteMember", method = RequestMethod.POST)
	public String deleteMember(Integer deleteMemberNo, Model model) {
		
		int result = 0;
		
		try {
			
			result = adminService.deleteMember(deleteMemberNo);			
			
			if(result > 0) {
				
				model.addAttribute("msg", "강퇴 성공");
				return "redirect:admin";
				
			} else {
				
				result = 0;
				model.addAttribute("msg", "강퇴 실패");
				return "redirect:admin";				
			}
			
			
		}catch (Exception e) {
			
			e.printStackTrace();
			model.addAttribute("errorMsg", "회원 강퇴 과정에서 오류 발생");
			return "common/errorPage";
		}
		
		
	}
	
	
	// 경고메일
	
	
	// 골목 폐쇄
	@RequestMapping(value="deleteStreet", method=RequestMethod.POST)
	public String deleteStreet(Integer deleteStreetNo, Model model) {
		
		int result = 0;
		
		try {
			
			result = adminService.deleteStreet(deleteStreetNo);
			
			if (result > 0) {

				model.addAttribute("msg", "폐쇄 성공");
				return "redirect:admin";

			} else {

				result = 0;
				model.addAttribute("msg", "폐쇄 실패");
				return "redirect:admin";
			}
						
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "골목 폐쇄 과정에서 오류 발생");
			return "common/errorPage";
		}
		
	}
	
	// 관심사 삭제
	@RequestMapping("deleteHobby")
	public String deleteHobby(Integer deleteHobbyNo, Model model) {
		
		int result = 0;
		
		try {
			
			result = adminService.deleteHobby(deleteHobbyNo);
			
			if (result > 0) {

				model.addAttribute("msg", "삭제 성공");
				return "redirect:admin";

			} else {

				result = 0;
				model.addAttribute("msg", "삭제 실패");
				return "redirect:admin";
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "관심사 삭제 과정에서 오류 발생");
			return "common/errorPage";
		}
	}
	
	// 활동보고서 확인
	@ResponseBody
	@RequestMapping(value="selectReport", method=RequestMethod.POST)
	public String selectReport(Integer selectReportNo, HttpServletResponse response, Model model) {
				
		try {
			
			Report report = adminService.selectReport(selectReportNo);
			
			if(report != null) {
				return new Gson().toJson(report);
			} else {
				report = null;				
				return new Gson().toJson(report);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	

}
