package com.kh.wassupSeoul.street.controller;

import java.io.File;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.wassupSeoul.common.FileRename;
import com.kh.wassupSeoul.friends.model.vo.Relationship;
import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.square.model.vo.Alarm;
import com.kh.wassupSeoul.street.model.service.StreetService;
import com.kh.wassupSeoul.street.model.vo.Board;
import com.kh.wassupSeoul.street.model.vo.Calendar;
import com.kh.wassupSeoul.street.model.vo.Keyword;
import com.kh.wassupSeoul.street.model.vo.Reply;
import com.kh.wassupSeoul.street.model.vo.SettingCalendar;
import com.kh.wassupSeoul.street.model.vo.Street;
import com.kh.wassupSeoul.street.model.vo.StreetJoin;

@SessionAttributes({ "loginMember", "msg", "streetNo", "myStreet", "memGradeInSt"})
@Controller
@RequestMapping("/street/*")
public class StreetController {

	@Autowired
	private StreetService streetService;

	// -------------------------------------------- 중하  ---------------------------------------------
	
	// 타임라인 이동
	@RequestMapping(value = "streetMain", method = RequestMethod.GET)
	public String timeLine(Integer streetNo, Model model, RedirectAttributes rdAttr, HttpServletRequest request) {

		Member loginMember = (Member)model.getAttribute("loginMember");

		
		Reply checkStreet = new Reply();
		
		checkStreet.setStreetNo(streetNo);
		checkStreet.setMemberNo(loginMember.getMemberNo());
		
		System.out.println("골목번호 : " + streetNo);
		System.out.println("로그인정보 : " + loginMember.getMemberNo());
		
		//System.out.println("프로필사진정보 : " + loginMember.getMemberProfileUrl());

		model.addAttribute("streetNo", streetNo);

		String beforeUrl = request.getHeader("referer");

		try {
			// 회원 해당 골목 등급, 가입여부 조회
			StreetJoin memGradeInSt = streetService.memGradeInSt(checkStreet);
			
			// 해당 골목 정보 조회
			Street street = streetService.selectStreet(streetNo);

			// 해당 골목 게시물 조회
			List<Board> board = streetService.selectBoard(checkStreet);
			Collections.reverse(board);
			
			// 해당 골목 댓글, 대댓글 조회
			List<Reply> reply  = streetService.selectReply(checkStreet);

//			for(int i = 0 ; i < board.size(); i++ ) {
//				System.out.println(board.get(i));
//			}
//			
//			for(int i = 0 ; i < reply.size(); i++ ) {
//				System.out.println(reply.get(i));
//			}
			
			//System.out.println(reply);
			
			if (street != null) {

				model.addAttribute("street", street); 
				model.addAttribute("board", board);
				model.addAttribute("reply", reply);
				model.addAttribute("reReply", reply);

				// 회원 해당 골목 등급, 가입여부 
				model.addAttribute("memGradeInSt", memGradeInSt);
				
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
	public String insertBoard(Board board, Model model, HttpServletRequest request, 
			RedirectAttributes rdAttr,
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
		System.out.println("board.getBoardContent : " + board.getBoardContent());

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

	// 게시글 좋아요 등록, 해제
	@ResponseBody
	@RequestMapping("likeFunction")
	public String likeFunction(int postNo, Model model) {

		Member loginMember = (Member) model.getAttribute("loginMember");

		System.out.println("글번호 출력 : " + postNo);
				
		Reply reply = new Reply();
		reply.setMemberNo(loginMember.getMemberNo());
		reply.setBoardNo(postNo);

		try {

			return streetService.likeCheck(reply) == 1 ? true + "" : false + "";

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "좋아요 기록 과정에서 오류발생");
			return "/common/errorPage";
		}
	}
	
	// 댓글 좋아요 등록, 해제
	@ResponseBody
	@RequestMapping("replyLikeFunction")
	public String replyLikeFunction(int replyNo, int boardNo, Model model) {

		Member loginMember = (Member) model.getAttribute("loginMember");

		System.out.println("댓글번호 출력 : " + replyNo);
		
		Reply reply = new Reply();

		// 게시글 번호 
		
		// memberAge에 게시글 번호 담아서 재활용
		reply.setReplyNo(replyNo);
		reply.setMemberNo(loginMember.getMemberNo());
		reply.setBoardNo(boardNo);

		try {

			return streetService.replyLikeFunction(reply) == 1 ? true + "" : false + "";

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "좋아요 기록 과정에서 오류발생");
			return "/common/errorPage";
		}
	}
	
	// 대댓글 좋아요 등록, 해제
		@ResponseBody
		@RequestMapping("reReplyLikeFunction")
		public String reReplyLikeFunction(int replyNo, int boardNo, Model model) {

			Member loginMember = (Member) model.getAttribute("loginMember");

			System.out.println("대댓글번호 출력 : " + replyNo);
			
			Reply reply = new Reply();

			// 게시글 번호 
			
			// memberAge에 게시글 번호 담아서 재활용
			reply.setReplyNo(replyNo);
			reply.setMemberNo(loginMember.getMemberNo());
			reply.setBoardNo(boardNo);

			try {

				return streetService.reReplyLikeFunction(reply) == 1 ? true + "" : false + "";

			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMsg", "좋아요 기록 과정에서 오류발생");
				return "/common/errorPage";
			}
		}


	// 게시글 삭제
	@ResponseBody
	@RequestMapping("deletePost")
	public String deletePost(int postNo, Model model) {

		System.out.println("글삭제 번호 출력 : " + postNo);

		try {

			int test = streetService.deletePost(postNo);

			return test == 1 ? true + "" : false + "";

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "게시글 삭제 과정에서 오류발생");
			return "/common/errorPage";
		}
	}
	
	// 댓글 작성
	@ResponseBody
	@RequestMapping("writeComment")
	public String writeComment(int postNo, Model model, String commentContent) {
		
		System.out.println("댓글 달릴 게시글  번호 출력 : " + postNo);
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		Reply reply = new Reply();
		
		System.out.println("댓글 입력 내용 : " + commentContent );
		
		reply.setBoardNo(postNo);
		reply.setMemberNo(loginMember.getMemberNo());
		reply.setReplyContent(commentContent);
	
		try {
	
			int test = streetService.writeComment(reply);
			
			if ( test > 0) {
				System.out.println("댓글 입력 완료");
			}else {
				System.out.println("댓글 입력 실패");
			}
			
			return  test == 1 ? true + "" : false + "";
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "게시글 삭제 과정에서 오류발생");
			return "/common/errorPage";
		}
	}
	
		// 대댓글 작성
		@ResponseBody
		@RequestMapping("writeReComment")
		public String writeReComment(int replyNo, Model model, String commentContent, int boardNo) {
			
			System.out.println("대댓글 달릴 댓글 번호 출력 : " + replyNo);
			
			Member loginMember = (Member)model.getAttribute("loginMember");
			
			Reply reply = new Reply();
			
			System.out.println("댓글 입력 내용 : " + commentContent );
			
			reply.setReReplyNo(replyNo);
			reply.setMemberNo(loginMember.getMemberNo());
			reply.setReplyContent(commentContent);
			reply.setBoardNo(boardNo);
		
			try {
		
				int test = streetService.writeReComment(reply);
				
				if ( test > 0) {
					System.out.println("대댓글 입력 완료");
				}else {
					System.out.println("대댓글 입력 실패");
				}
				
				return  test == 1 ? true + "" : false + "";
				
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMsg", "대댓글 입력 과정에서 오류발생");
				return "/common/errorPage";
			}
		}
	
	
	// 작성자 프로필 클릭시 회원 정보 조회
    @ResponseBody
	@RequestMapping("checkProfile")
    public ArrayList<Object>  checkProfile(HttpServletResponse response, int memberNo) {
    	ArrayList<Object> mList = new ArrayList<Object>();
    	
    	System.out.println("작성자 얻어온 정보 : " + memberNo);
    	try {
    		
        	// 1) 회원 정보 가져오기
    		Member member = streetService.checkProfile(memberNo);
    		System.out.println("작성자 조회한 정보 : " + member);
    		mList.add(member); // 0번 인덱스에 회원정보
    		
        	// 2) 회원 관심사 가져오기
    		List<Hobby> myHobby = streetService.selectHobby(memberNo);
			for(int k=0;k<myHobby.size();k++) {
				System.out.println("작성자 관심사 : " + myHobby.get(k));
				mList.add(myHobby.get(k)); // 1~3번 인덱스에 회원 관심사
			}
			
			for(int i=0;i<mList.size();i++) {
				System.out.println("작성자 회원 : " + mList.get(i));
			}
			
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(mList, response.getWriter());
    		
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	return null;
    }
    
    
    // 지도 게시글 입력
    @ResponseBody
	@RequestMapping("mapPost")
	public String mapPost(String address, Model model, String mapPostContent ) {
		
		System.out.println("입력한 주소 : " + address);
		System.out.println("입력한 게시글 내용 : " + mapPostContent);
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		int streetNo = (int) model.getAttribute("streetNo");
		
		Board board = new Board();
		
		board.setStreetNo(streetNo);
		board.setMemberNo(loginMember.getMemberNo());
		board.setBoardContent(mapPostContent +"<br>"+ address);
		board.setTypeNo(6);
		
		
//		board.setBoardUrl(address); 
	
		/* 게시글타입
		0 : NONE
		1 : 게시글파일
		2 : 일정
		3 : 투표
		4 :  N빵
		5 : 스케치
		6 : 지도*/
		
		try {
	
			int test = streetService.mapPost(board);
			
			if ( test > 0) {
				System.out.println("지도 게시글 입력 완료");
			}else {
				System.out.println("지도 게시글 입력 실패");
			}
			
			return  test == 1 ? true + "" : false + "";
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "대댓글 입력 과정에서 오류발생");
			return "/common/errorPage";
		}
	}
    
    
	
	// -------------------------------------------- 중하 끝  ---------------------------------------------
	// -------------------------------------------- 지원 -----------------------------------------------
	// 골목 개설 화면 이동
	@RequestMapping("streetInsert")
	public String insertStreetForm(Model model) {
		
		// 회원 번호 얻어오기
		Member loginMember = (Member)model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();
				
		String msg = null; 
		int result = 0;
		
		try {
						
			result = streetService.selectMyStreet(memberNo);
			
			if (result > 0) {
				
				return "street/streetInsert";
			}

			else {
				msg = "골목 개설 불가";
				model.addAttribute("msg", msg);
				return "redirect:/square";
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "골목 개설 화면 이동 과정에서 오류 발생");
			return "/common/errorPage";
		}
	
	}

	// 골목 개설
	@RequestMapping("insertStreet")
	public String insertStreet(Street street,
			@RequestParam(value = "streetKeywords", required = false) String[] streetKeywords,
			@RequestParam(value = "sampleImg", required = false) String sampleImg,
			@RequestParam(value = "streetCoverUpload", required = false) MultipartFile streetCoverUpload,
			HttpServletRequest request, RedirectAttributes rdAttr, Model model) {

		// 회원 번호 얻어오기
		Member loginMember = (Member) model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();

		// 골목 커버
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/" + "streetCoverImage";
		File folder = new File(savePath);
		if (!folder.exists())
			folder.mkdir();
				 
		String msg = null;
		int result = 0;

		try {
						
			if(!sampleImg.equals("")) {
								
				if(sampleImg.equals("골목.jpg")) {					
					street.setImgNo(6);
				} else if(sampleImg.equals("골목2.jpg")) {
					street.setImgNo(7);
				} else if(sampleImg.equals("골목3.jpg")) {
					street.setImgNo(8);
				} else if (sampleImg.equals("골목4.jpg")) { 
					street.setImgNo(9);
				}
								
				result = streetService.insertStreet1(street, memberNo, streetKeywords);
				
			} else if(sampleImg.equals("") && !streetCoverUpload.getOriginalFilename().equals("")) {
				
				// 골목 커버 이름 바꾸기
				String changeCoverName = FileRename.rename(streetCoverUpload.getOriginalFilename());

				result = streetService.insertStreet2(changeCoverName, street, memberNo, streetKeywords);
				
				if (result > 0) { // 정보 다 저장된 경우 골목 커버 서버에 저장

					streetCoverUpload.transferTo(new File(savePath + "/" + changeCoverName));
					 
				}
			}

			if(result > 0) {
				msg = "골목 개설 성공~!! 우르르ㄱ끼기ㅣ긱";
				model.addAttribute("msg", msg);
				return "redirect:/square"; // 골목으로 이동하게 바꾸기
			} else {
				
				msg = "골목 개설 실패했다ㅠㅠ 흐규흐규";
				model.addAttribute("msg", msg);
				return "redirect:/square";
			}

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "골목 개설 과정에서 오류 발생");
			return "common/errorPage";
		}
	}
	// -------------------------------------------- 지원 끝 -----------------------------------------------
	
	// 추천 친구 페이지 이동 ----> 기능 만들어야함
	@RequestMapping("recommendFriend")
	public String recommendFriend(Model model) {
		int streetNo = (int) model.getAttribute("streetNo");
		Member loginMember = (Member)model.getAttribute("loginMember");
		try {
			List<Hobby> myHobby = streetService.selectHobby(loginMember.getMemberNo());
			
			System.out.println(myHobby);
			List<Member> mList = null;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("streetNo", streetNo);
			map.put("memberNo", loginMember.getMemberNo());
			/*---------태훈 수정---------*/
			char[] status = {'Y'};
			map.put("status", status);
			/*---------태훈 수정 끝---------*/
			if(!myHobby.isEmpty() && myHobby != null) {
				map.put("myHobby", myHobby);
				mList = streetService.selectJuminList(map);
			}
			
			List<Hobby> hList = null;
			
			if(mList != null && !mList.isEmpty()) {
				hList = streetService.selectHobbyList(mList);
			}
			
			System.out.println(mList);
			System.out.println(hList);
			
			model.addAttribute("myHobby", myHobby);
			model.addAttribute("mList", mList);
			model.addAttribute("hList", hList);
			return "street/recommendFriend";
			
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "추천 친구 조회 과정에서 오류 발생");
			return "common/errorPage";
		}
			
	}

	// 골목 가입
	@ResponseBody
	@RequestMapping("streetJoin")
	public int streetJoin(Model model) {
		int streetNo = (int) model.getAttribute("streetNo");
		Member member = (Member) model.getAttribute("loginMember");
		Street street = (Street)model.getAttribute("street");
		System.out.println(street);
		int memberNo = member.getMemberNo();
		
		int myStreetCount = streetService.myStreetCount(memberNo);
		
		if(myStreetCount >= 3) {
			return -1;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("streetNo", streetNo);
		map.put("memberNo", memberNo);

		int result = streetService.streetJoin(map);
		
		if(result > 0) {
			// 알람 테이블에 데이터 삽입
			// 가입 신청한 골목의 골목대장 번호 가져오기
			int masterNo = streetService.selectMasterNo(streetNo);
			
			// 가입 신청한 골목의 골목이름 가져오기
			String streetNm = streetService.selectStreetNm(streetNo);
			Alarm alarm = new Alarm("["+streetNm+"] 골목 가입 요청", '1', 
						"street/joinCheck?memberNo="+memberNo+"&streetNo="+streetNo,
						memberNo+"", masterNo);
			result = streetService.insertAlarm(alarm);
		}

		return result;

	}
	
	// 주민목록 조회
	@RequestMapping
	public String juminList(Model model) {
		int streetNo = (int) model.getAttribute("streetNo");
		Member loginMember = (Member)model.getAttribute("loginMember");
		try {
			
			List<Member> mList = null;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("streetNo", streetNo);
			/*---------태훈 수정---------*/
			char[] status = {'Y', 'W'};
			map.put("status", status);
			/*---------태훈 수정 끝---------*/
			mList = streetService.selectJuminList(map);
			
			List<Hobby> hList = null;
			List<Relationship> rList = null;
			
			if(mList != null && !mList.isEmpty()) {
				hList = streetService.selectHobbyList(mList);
				Map<String, Object> relationMap = new HashMap<String, Object>();
				relationMap.put("myNo", loginMember.getMemberNo());
				relationMap.put("mList", mList);
				rList = streetService.selectRelationList(relationMap);
			}
			
			
			System.out.println(rList);
			
			model.addAttribute("rList", rList);
			model.addAttribute("mList", mList);
			model.addAttribute("hList", hList);
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "주민 목록 조회 과정에서 오류 발생");
			return "common/errorPage";
		}
		
		return "street/juminList";
	}
	
	@ResponseBody
	@RequestMapping("addFriend")
	public void addFriend(Model model, int yourNum) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		int myNum = loginMember.getMemberNo();
		Relationship addRelation = new Relationship(myNum, yourNum, '1');
		
		streetService.addRelation(addRelation);
    
	}
	
	/*----------------------- 미현 시작 (03/23) -----------------------------------*/
	// 썸머노트 파일 DB삽입용
	@ResponseBody
	@RequestMapping(value="fileUpload", produces = "application/text; charset=utf8")
	public String fileUpload(Board board, Model model, MultipartFile file, HttpServletRequest request, HttpServletResponse response) {

		Member loginMember = (Member) model.getAttribute("loginMember");

		System.out.println("파일명 : " + file.getOriginalFilename());

		try {
			String filePath = streetService.fileUpload(board,file,request);
			
			System.out.println("오고있는거니filePath : " + filePath);
			
			
			if (filePath.equals("")) {
				return null;
			}else{
				return filePath;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "피곤...";
		}
		
	}
	
	/*----------------------- 미현 끝 -----------------------------------*/
	
	/*============== 3/25 미현 수정 ==============================*/
	// 썸머노트 Bfile 수정용
	@ResponseBody
	@RequestMapping(value="refileUpload", produces = "application/text; charset=utf8")
	public String refileUpload(Board board, Model model, MultipartFile file, HttpServletRequest request, HttpServletResponse response) {
	
	return null;
	}
	
	/*------------------------ 태훈 시작 (03/22) -----------------------------------*/
	/** 골목 가입 허가/거절 용 Controller
	 * @param model
	 * @param applyCheck
	 * @param memberNo
	 * @return result
	 */
	@ResponseBody
	@RequestMapping("joinCheck")
	public int joinCheck(Model model, Boolean applyCheck, int memberNo,
						@RequestParam(required = false) Integer streetNo) {
		System.out.println(memberNo);
		if(streetNo == null) {
			streetNo = (Integer)model.getAttribute("streetNo");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("streetNo", streetNo);
		map.put("memberNo", memberNo);
		if(applyCheck == true) {
			streetService.joinCheck(map);
			return 1;
		} else {
			streetService.joinDelete(map);
			return 0;
		}
	}
	/*--------------------------------태훈 끝-------------------------------------*/
	
	/* 지원 골목 수정 시작 */
	// 골목 수정 페이지 이동
	@RequestMapping("streetUpdate")
	public String streetUpdateForm(Integer no, Model model, HttpServletRequest request) {
		
		String detailUrl = request.getHeader("referer");
		
		model.addAttribute("detailUrl", detailUrl);
				
		try {
			
			Street street = streetService.selectStreet(no);
			
			if(street != null) {
				
				String imgUrl = streetService.selectImageUrl(street.getImgNo());
				model.addAttribute("imgNo", street.getImgNo());
				model.addAttribute("imgUrl", imgUrl);
				
				List<Keyword> keywords = streetService.selectKeywords(no);
				System.out.println("123");
				System.out.println("keywords 확인 : "+ keywords);
				
				if(keywords != null) {
					model.addAttribute("keywords", keywords);
				}
				
			}
			
			model.addAttribute("street", street);
			
			return "street/streetUpdate"; 
			
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "골목 수정 화면 이동 과정에서 오류 발생");
			return "common/errorPage";
		}
		
	}
	
	
	// 골목 수정
	@RequestMapping("updateStreet")
	public String updateStreet(Integer imgNo, Integer no, Street street,
			@RequestParam(value = "streetKeywords", required = false) String[] streetKeywords,
			@RequestParam(value = "sampleImg", required = false) String sampleImg,
			@RequestParam(value = "streetCoverUpload", required = false) MultipartFile streetCoverUpload,
			Model model, RedirectAttributes rdAttr, HttpServletRequest request) {
		
		String detailUrl = (String) model.getAttribute("detailUrl");
		
		street.setStreetNo(no);
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/" + "streetCoverImage";
		File folder = new File(savePath);
		if (!folder.exists())
			folder.mkdir();
		
		int result = 0;
		
		try {
			
			/*
			  이미지 그대로일때 -> set 할 필요 없음			 			 
			 */ 
			System.out.println("imgNo : "+ imgNo);
			System.out.println("no : "+ no);
			System.out.println("street : "+ street);
			for(int i=0; i<streetKeywords.length; i++) {
				System.out.println("키워드 : " + streetKeywords[i]);
			}
			System.out.println("sampleImg : "+ sampleImg);
			System.out.println("streetCoverUpload.getOriginalFilename() : "+ streetCoverUpload.getOriginalFilename());
			 
			
			if(!sampleImg.equals("")) {
				
				if(sampleImg.equals("골목.jpg")) {					
					street.setImgNo(6);
				} else if(sampleImg.equals("골목2.jpg")) {
					street.setImgNo(7);
				} else if(sampleImg.equals("골목3.jpg")) {
					street.setImgNo(8);
				} else if (sampleImg.equals("골목4.jpg")) { 
					street.setImgNo(9);
				}
				
				result = streetService.updateStreet1(street, streetKeywords);
				
			} else if(sampleImg.equals("") && 
					!streetCoverUpload.getOriginalFilename().equals("")) {
				// 골목 커버 이름 바꾸기
				String changeCoverName = FileRename.rename(streetCoverUpload.getOriginalFilename());
				
				result = streetService.updateStreet2(street, streetKeywords, changeCoverName);
				
				if (result > 0) { // 정보 다 저장된 경우 골목 커버 서버에 저장

					streetCoverUpload.transferTo(new File(savePath + "/" + changeCoverName));
					 
				}
				
			} else if(sampleImg.equals("") && 
					streetCoverUpload.getOriginalFilename().equals("")) {
				
				result = streetService.updateStreet1(street, streetKeywords);
				
			}
			
			return "redirect:" + detailUrl;
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "골목 수정 과정에서 오류 발생");
			return "common/errorPage";
		}
		
	}
	
	
	/* 지원 골목 수정 끝 */
/*------------------------ 정승환 추가코드 시작-----------------------------------*/
	
	/*------------------------ 정승환 코드수정(20.03.25) 시작-----------------------------------*/
	// 일정 조회
	@RequestMapping("calendar")
	public String calendar(Model model, Integer tempStreetNo) {
		
		return "street/streetCalendar";
		
	}
	/*------------------------ 정승환 코드수정(20.03.25) 끝-----------------------------------*/
	
	// 일정 추가
	@RequestMapping(value="addSCSC", method = RequestMethod.POST)
	public String addSchedule(Model model,Calendar sendCalendar,String startDate,String startTime,String endDate,String endTime,
			String joinCalendar,@RequestParam(value="openBoard", required=false) String openBoard,
			@RequestParam(value="cJoinEndDate", required=false) String cJoinEndDate,
			@RequestParam(value="cJoinLimit", required=false) Integer cJoinLimit ) {
		try {
			Member loginMember = (Member)model.getAttribute("loginMember");
			
			// 게시글 번호 조회
			int boardNo = streetService.selectBoardNo();
			sendCalendar.setBoardNo(boardNo);
			
			// 골목 번호 
			int streetNo = (int)model.getAttribute("streetNo");
			sendCalendar.setStreetNo(streetNo);
			
			// 일정 시작 시간
			startTime = startTime+ ":00.0";
			String tempStart = startDate+ " " + startTime;
			// 일정 종료 시간
			endTime = endTime+ ":00.0";
			String tempEnd = endDate + " " + endTime;
			
			// String을 Timestamp로 변환
			Timestamp calendarStartDate = Timestamp.valueOf(tempStart);
			Timestamp calendarEndDate = Timestamp.valueOf(tempEnd);
			
			sendCalendar.setCalendarStartDate(calendarStartDate);
			sendCalendar.setCalendarEndDate(calendarEndDate);
			
			// 일정 등록이 되기전 게시글 등록 -> 등록된 게시글 번호가 필요
			
			// 일정 참가가 있을 경우 추가할 버튼
			String btnPlus = "<br><button class='nanum btn btn-primary joinBtn' data-toggle='modal' data-target='#calendarJoinModal\'>일정 참가하기</button>";
			// 일정 참가시 해당 글번호
			String boardNoPlus = "<input type='hidden' value='" + boardNo + "'>";
			
			// 게시글 등록할 양식 지정
			Board board = new Board();
			board.setBoardNo(boardNo);
			board.setBoardWriter(loginMember.getMemberNickname());
			board.setMemberNo(loginMember.getMemberNo());board.setStreetNo(streetNo);
			board.setTypeNo(2);
			String content = "<h5 class='nanum'>새 일정 등록</h5>" + sendCalendar.getCalendarContent()
			+"<br>장소 : "+ sendCalendar.getCalendarLocation()
			+"<br>기간 : "+ tempStart.substring(0, tempStart.length()-5) +" ~ " 
			+ tempEnd.substring(0, tempEnd.length()-5);
			
			board.setBoardContent(content);
			// boardNo, boardWriter, memberNo, typeNo, boardContent,streetNo
			
			if(openBoard != null) {
				board.setBoardStatus("Y");
			} else {
				board.setBoardStatus("N");
			}
			
			if(joinCalendar.equals("Y")) {
				Date d = Date.valueOf(cJoinEndDate); // 날짜 변환
				sendCalendar.setCalendarJoinEndDate(d);
				sendCalendar.setCalendarJoinLimit(cJoinLimit);
				board.setBoardContent(board.getBoardContent() + btnPlus + boardNoPlus);
			}
			
			sendCalendar.setCalendarJoin(joinCalendar.charAt(0));
			
			int result = streetService.insertCalendarBoard(board);
			if(result == 0) {
				model.addAttribute("msg","게시글 등록 실패");
				return "redirect:calendar";
			}
			
			// 일정 등록 
			result = streetService.addSchedule(sendCalendar);
			
			String msg;
			if(result > 0)	msg = "일정 등록 성공";
			else 			msg = "일정 등록 실패";
			
			model.addAttribute("msg",msg);
			return "redirect:calendar";
			
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "일정 추가 과정에서 오류발생");
			return "/common/errorPage";
		}
		
	}
	
	/*------------------------ 정승환 추가코드(20.03.25) 시작-----------------------------------*/
	// 일정 삭제
	@RequestMapping("deleteSchedule")
	public String deleteSchedule(int boardNo, Model model) {
		int streetNo = (int) model.getAttribute("streetNo");
		Calendar temp = new Calendar();
		temp.setBoardNo(boardNo); temp.setStreetNo(streetNo);
		try {
			// 해당하는 Calendar 행 삭제
			int result = streetService.deleteSchedule(temp);
			if(result == 0) {
				model.addAttribute("msg","일정 삭제 실패");
				return "redirect:calendar";
			}
			
			// 해당하는 Board 행 삭제
			result = streetService.deleteBoardCalendar(boardNo);
			if(result == 0) {
				model.addAttribute("msg","일정 게시글 삭제 실패");
				return "redirect:calendar";
			}
			
			/*
			// 만약 참여인원 있으면 해당 테이블행도 삭제
			result = streetService.selectJoinCalendar(boardNo);
			if(result > 0) {
				result = streetService.deleteJoinCalendar(boardNo);
				if(result == 0) {
					model.addAttribute("msg","제거된 일정 참여 인원 목록 삭제 실패");
					return "redirect:calendar";
				}
			}
			*/
			
			model.addAttribute("msg","일정 삭제 성공");
			return "redirect:calendar";
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "일정 추가 과정에서 오류발생");
			return "/common/errorPage";
		}
	}
	
	// 일정 수정
	@RequestMapping("updateSchedule")
	public String updateSchedule(int boardNo, Model model) {
		int streetNo = (int) model.getAttribute("streetNo");
		System.out.println("일정 수정용 글번호 : " + boardNo);
		return null;
	}
	
	/*------------------------ 정승환 추가코드(20.03.25) 끝-----------------------------------*/
	
/*------------------------ 정승환 추가코드 끝-----------------------------------*/
	
	
	
	
	/*------------------------ 지원 골목삭제 시작-----------------------------------*/
	// 골목 삭제
	@RequestMapping("streetDelete")
	public String streetDeleteForm(Integer no, Model model, HttpServletRequest request) {

		String detailUrl = request.getHeader("referer");

		model.addAttribute("detailUrl", detailUrl);
		
		try {
			
			int result = streetService.deleteStreet(no);
			
			if(result > 0) {
				
				return "square";
				
			} else {
				
				model.addAttribute("msg", "골목 삭제 실패");
				return "redirect:/";
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "골목 삭제 과정에서 오류발생");
			return "/common/errorPage";
		}
	}
	
	@RequestMapping("newMaster")
	public String newMaster(Integer no, Model model) {
		model.addAttribute("no", no);
		return "street/streetNewMaster";
	}
	// 주민 검색(골목대장 위임)
	@ResponseBody
	@RequestMapping(value = "searchJumin", method = RequestMethod.POST,
			produces = "application/json; charset=utf-8")
	public String searchJumin(Integer no, String juminNickName, HttpServletResponse response) {
		try {
			
			System.out.println("주민 닉네임 : " + juminNickName);
			System.out.println("골목 번호 : " + no);
			
			
			Member jumin = streetService.searchJumin(juminNickName, no);
			System.out.println(jumin);
			
			return new Gson().toJson(jumin);
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return null;
	}
	
	
	
	/*------------------------ 지원 골목삭제 끝-----------------------------------*/ 
	
	/*------------------------ 3/24 미현 코드추가-----------------------------------*/ 
	
	// 썸머 게시글 작성
	@RequestMapping("insertSummer")
	public String insertSummer(Board board, Model model, HttpServletRequest request, RedirectAttributes rdAttr,
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
		board.setTypeNo(1);

		System.out.println("등록할 게시글 : " + board);
		System.out.println("board.getBoardContent : " + board.getBoardContent());

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
	
	
	// 썸머노트 게시글 수정
	@ResponseBody
	@RequestMapping(value="updateSummer", produces = "application/text; charset=utf8")
	public String updateSummer(Board board, Model model, MultipartFile file, HttpServletRequest request, HttpServletResponse response) {
		
		Member loginMember = (Member) model.getAttribute("loginMember");
		int boardWriter = loginMember.getMemberNo();
		// 수정 실패or성공할때 원래 street페이지로 돌아오기 위함
		int streetNo = (int) model.getAttribute("streetNo");
		
		board.setMemberNo(boardWriter);
		board.setStreetNo(streetNo);
		
		// 수정 또는 새롭게 추가된 파일이 저장될 경로 얻어오기
		String writer = board.getBoardWriter();	
		String root = request.getSession().getServletContext().getRealPath("resources") + "/uploadImage";
		String savePath = root + "//" + writer;
		
		// 저장 폴더가 있는지 검사하고 없을 경우에 생성하는 구문
		File folder = new File(savePath);
		if(!folder.exists())
			folder.mkdir();
		
		try {
			int result =streetService.updateSummer(board,file,savePath);
			
			System.out.println("미현 result : "+result);
			String msg;
			if(result > 0)	msg = "썸머 게시글 수정 성공";
			else 			msg = "썸머 게시글 수정 실패";
			
			model.addAttribute("msg",msg);
			
			return "redirect:streetMain?streetNo=" + streetNo;
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "썸머노트 수정 과정에서 오류 발생");
			return "redirect:streetMain?streetNo=" + streetNo;
		}
	}
	
	
	
	/*------------------------ 미현 코드추가 끝-----------------------------------*/ 
}
