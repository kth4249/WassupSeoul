package com.kh.wassupSeoul.street.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.wassupSeoul.common.FileRename;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.member.model.vo.ProfileStreet;
import com.kh.wassupSeoul.street.model.service.StreetService;
import com.kh.wassupSeoul.street.model.vo.Board;
import com.kh.wassupSeoul.street.model.vo.Keyword;
import com.kh.wassupSeoul.street.model.vo.Street;

@SessionAttributes({ "loginMember", "msg", "streetNo", "myStreet" })
@Controller
@RequestMapping("/street/*")
public class StreetController {

	@Autowired
	private StreetService streetService;

	// 타임라인 이동
	@RequestMapping(value = "streetMain", method = RequestMethod.GET)
	public String timeLine(Integer streetNo, 
			Model model,  
			RedirectAttributes rdAttr, 
			HttpServletRequest request) { 
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		System.out.println("골목번호 : "+ streetNo);
		System.out.println("로그인정보 : "+ loginMember.getMemberNickname());
		
		model.addAttribute("streetNo", streetNo);

		String beforeUrl = request.getHeader("referer");

		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy년 MM월 dd일 E요일 a hh:mm");

		try {
			Street street = streetService.selectStreet(streetNo);

			List<Board> board = streetService.selectBoard(streetNo);
			Collections.reverse(board);

			System.out.println("street : " + street);

			for (int i = 0; i < board.size(); i++) {

				System.out.println("날짜 출력 : " + board.get(i).getBoardWriteDt());

				System.out.println("골목 게시글 조회 : " + board.get(i));

			}

			if (street != null) {

				model.addAttribute("street", street);
				model.addAttribute("board", board);

				model.addAttribute("loginMember", loginMember);
				
				return "street/streetMain";

			} else {
				rdAttr.addFlashAttribute("msg", "골목 상세 조회 실패");
				return "redirect:" + beforeUrl;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:" + beforeUrl;
		}

	}

	// 게시글 작성
	@RequestMapping("insert")
	public String insertBoard(Board board, // 커맨드 객체 @ModelAttribute 생략되어 있는 상태
			Model model, // session 접근용
			HttpServletRequest request, // 파일 경로
			RedirectAttributes rdAttr, // 리다이렉트 시 메세지 전달용
			@RequestParam(value = "images", required = false) List<MultipartFile> images) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		System.out.println(loginMember);
		int boardWriter = loginMember.getMemberNo();
		System.out.println(boardWriter);

		int streetNo = (int) model.getAttribute("streetNo");
		System.out.println(streetNo);

		board.setBoardContent(board.getBoardContent().replace("\r\n", "<br>"));
		board.setMemberNo(boardWriter);
		board.setStreetNo(streetNo);
		board.setTypeNo(0);

		System.out.println("등록할 게시글 : " + board);

		try {

			int result = streetService.insertBoard(board);

			if (result > 0)
				System.out.println("게시글 등록 성공" + result);
			else
				System.out.println("게시글 등록 실패" + result);

			return "redirect:streetMain?streetNo=" + streetNo;

		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:streetMain?streetNo=" + streetNo;

		}

	}

	// 좋아요 등록, 해제
	@ResponseBody
	@RequestMapping("likeFunction")
	public String likeFunction(int postNo, Model model) {

		Member loginMember = (Member) model.getAttribute("loginMember");

		System.out.println("글번호 출력 : " + postNo);

		// memberAge에 게시글 번호 담아서 재활용
		loginMember.setMemberAge(postNo);

		try {
			int test = streetService.likeCheck(loginMember);

			System.out.println("좋아요 기록 조회:" + test);
			System.out.println("변경된 loginMemer:" + loginMember);

			return streetService.likeCheck(loginMember) == 1 ? true + "" : false + "";
      
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "좋아요 기록 과정에서 오류발생");
			return "/common/errorPage";
		}

	}

	// 좋아요, 댓글수 조회
	@ResponseBody
	@RequestMapping("checkLikeReplyNum")
	public String checkLikeReplyNum(int postNo, Model model) {

		System.out.println("글번호 출력 : " + postNo);

		try {

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "좋아요 기록 과정에서 오류발생");
			return "/common/errorPage";
		}
		return "/common/errorPage";
	}
	
	
	//	게시글 삭제
	@ResponseBody
	@RequestMapping("deletePost")
	public String deletePost(int postNo, Model model) {
		
		System.out.println("글삭제 번호 출력 : "+postNo);
	
		try {
	
			int test = streetService.deletePost( postNo );
			
			return  test == 1 ? true + "" : false + "";
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "게시글 삭제 과정에서 오류발생");
			return "/common/errorPage";
		}
	}
	
	
	// 골목 개설 화면 이동
	@RequestMapping("streetInsert")
	public String insertStreetForm(Model model) {

		// 1. 먼저 회원이 개설한 골목이 있거나 내 골목이 3개 이상인지 확인
		// session myStreet 이용
		// 내 골목 얻어오기
		List<ProfileStreet> myStreet = (List<ProfileStreet>) model.getAttribute("myStreet");

		String msg = null;

		int result = 1;

		for (int i = 0; i < myStreet.size(); i++) {

			char citizenGrade = myStreet.get(i).getCitizenGrade();

			if (citizenGrade == 'M' || myStreet.size() >= 3) {

				result = -1;

				break;
			}
		}

		if (result > 0) {

			msg = "골목 개설 가능";
			model.addAttribute("msg", msg);
			return "street/streetInsert";
		}

		else {
			msg = "골목 개설 불가";
			model.addAttribute("msg", msg);
			return "redirect:/square";
		}

	}

	// 골목 개설
	@RequestMapping("insertStreet")
	public String insertStreet(Street street,
			@RequestParam(value = "streetKeywords", required = false) String[] streetKeywords,
			@RequestParam(value = "streetCoverUpload", required = false) MultipartFile streetCoverUpload,
			HttpServletRequest request, RedirectAttributes rdAttr, Model model) {

		// img 먼저 넣고...
		// 이미지 번호 받아서 street 넣고...
		// streetNo 받아서 keyword 넣고
		// session에서 loginMember memberNo 받아서
		// 골목대장 등급 넣기 'M'

		// Street street
		// -> (streetNo), streetNm, streetIntro, (streetStatus), streetMaxMember,
		// districtNo, streetPublic
		System.out.println("Street 확인 : " + street);

		// Keyword keyword
		// -> (keywordNo), keywordContent, (streetNo)
		System.out.println("streetKeywords 확인");
		for (String keywordContent : streetKeywords) {
			System.out.println(keywordContent);
		}
		// 키워드의 각 내용을 Keyword 객체에 담고 객체들을 리스트에 저장
		List<Keyword> keywords = new ArrayList<Keyword>();
		Keyword keyword = null;
		for(String keywordContent : streetKeywords) {
			keyword.setKeywordContent(keywordContent);
		}
		

		// 회원 번호 얻어오기
		Member loginMember = (Member) model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();
		System.out.println("회원번호 확인 : " + memberNo);

		// 골목 커버
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/" + "streetCoverImage";
		File folder = new File(savePath);
		if (!folder.exists())
			folder.mkdir();

		// msg
		String msg = null;
		int result = 0;

		try {

			// 2. 골목 커버 정보를 먼저 삽입한 후 이미지 번호 얻어오기
			if (!streetCoverUpload.getOriginalFilename().equals("")) {

				// 골목 커버
				String changeCoverName = FileRename.rename(streetCoverUpload.getOriginalFilename());

				//result = streetService.insertStreetCover(); // 이미지 정보 삽입 결과, 이미지 번호 저장

				
				if(result > 0) { // 이미지 정보 저장 성공해서 이미지 번호 얻어 왔을 때 
					
					int imgNo = result; // 받아온 이미지 번호 저장
					
					street.setImgNo(imgNo);
					
					//result = streetService.insertStreet(street); // 골목 정보 삽입 결과, 골목 번호 저장
					
					if(result > 0) { // 골목 정보 저장 성공해서 골목 번호 얻어 왔을 때
						
						int streetNo = result; // 받아온 골목 번호 저장
						
						// 키워드는 리스트에 저장하자..
						//result = streetService.insertStreetKeyword(streetKeywords);
					}
					
				}
				
				
				// 골목 키워드

				// 골목 개설 성공 시
				msg = "골목 개설 성공!! 우루루끼ㄱ기ㅣㄱ";
				model.addAttribute("msg", msg);
				return "";

			}
			
			// 골목 개설 실패 시
			msg = "골목 개설 실패했다!! 끼룩끼룩";
			model.addAttribute("msg", msg);
			return "";

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "골목 개설 과정에서 오류 발생");
			return "common/errorPage";
		}
	}
	
	
	
	// 추천 친구 페이지 이동  ----> 기능 만들어야함
	@RequestMapping("recommendFriend")
	public String recommendFriend(Model model) {
		int streetNo = (int) model.getAttribute("streetNo");

		return "street/recommendFriend";
	}
	
  
	// 골목 가입
	@ResponseBody
	@RequestMapping("streetJoin")
	public int streetJoin(Model model) {
		int streetNo = (int)model.getAttribute("streetNo");
		Member member = (Member)model.getAttribute("loginMember");
		int memberNo = member.getMemberNo();
		
		List<ProfileStreet> myStreet = (List<ProfileStreet>)model.getAttribute("myStreet");
		if(myStreet != null) {
			if(myStreet.size() > 3) {
				return -1;
			}
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("streetNo", streetNo);
		map.put("memberNo", memberNo);
		
		int result = streetService.streetJoin(map);
		
		return result;
		
	}
	
}
