
package com.kh.wassupSeoul.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.wassupSeoul.member.model.service.MemberService;
import com.kh.wassupSeoul.member.model.vo.Member;

@SessionAttributes({ "loginMember", "msg" })
@RequestMapping("/member/*")
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	// 약관 동의 페이지 이동
	@RequestMapping("agreeForm")
	public String agreeForm() {
		return "/member/agreeForm";
	}

	// 회원가입 페이지 이동
	@RequestMapping("signUpForm")
	public String signUpForm() {
		return "/member/signUpForm";
	}

	// 회원가입
	@RequestMapping("signUp")
	public String signUp(Member member, Model model, String phone1, String phone2, String phone3,
			RedirectAttributes rdAttr) {

		String memberPhone = phone1 + "-" + phone2 + "-" + phone3;

		Member signUpMember = new Member(member.getMemberEmail(), member.getMemberPwd(), member.getMemberNm(),
				member.getMemberNickname(), memberPhone, member.getMemberGender(), member.getMemberAge());

		System.out.println(signUpMember);

		try {
			int result = memberService.signUp(signUpMember);
			String msg = null;

			if (result > 0) {
				msg = "가입성공";
				rdAttr.addFlashAttribute("msg", msg);
				return "redirect:/";
			} else {
				msg = "가입실패";
				rdAttr.addFlashAttribute("msg", msg);
				return "redirect:/";
			}

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "회원 가입 과정에서 오류 과정");
			return "/common/errorPage";
		}

	}

	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String memberLogin(Member member, Model model, RedirectAttributes rdAttr) {

		try {
			Member loginMember = memberService.loginMember(member);
			String msg = null;
			if (loginMember != null) {
				msg = "로그인 성공";
				rdAttr.addFlashAttribute("msg", msg);
				model.addAttribute("loginMember", loginMember);
				return "redirect:/square";
			} else {
				msg = "로그인 실패";
				rdAttr.addFlashAttribute("msg", msg);
				return "redirect:/";
			}

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "로그인 과정에서 오류 발생");
			return "common/errorPage";
		}

	}

	// 로그아웃
	@RequestMapping("logout")
	public String memberLogout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}

	// 이메일 찾기
	@RequestMapping("findEmail")
	public String findEmail(String name, String phone, Model model, HttpServletResponse response) {
		Member member = new Member();
		try {
			String memberEmail = memberService.findEmail(member);
			System.out.println("이거: "+memberEmail);
			
			PrintWriter out = response.getWriter();
			out.print(memberEmail);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 이메일 중복 검사
	@ResponseBody
	@RequestMapping("emailDupCheck")
	public String emailDupCheck(String memberEmail, Model model) {
		try {
			return memberService.emailDupCheck(memberEmail) == 0 ? true + "" : false + "";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "아이디 중복체크 과정에서 오류발생");
			return "/common/errorPage";
		}
		
	}
	
	// 닉네임 중복 검사
		@ResponseBody
		@RequestMapping("nickNameDupCheck")
		public String nickNameDupCheck(String memberNickname, Model model) {
			try {
				int result = memberService.nickNameDupCheck(memberNickname);
				return memberService.nickNameDupCheck(memberNickname) == 0 ? true + "" : false + "";
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMsg", "닉네임 중복 체크 과정에서 오류발생");
				return "/common/errorPage";
			}
			
		}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // 컨트롤러 종료