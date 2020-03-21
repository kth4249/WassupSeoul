package com.kh.wassupSeoul.street.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.kh.wassupSeoul.common.FileRename;
import com.kh.wassupSeoul.friends.model.vo.Relationship;
import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.member.model.vo.ProfileStreet;
import com.kh.wassupSeoul.street.model.service.StreetService;
import com.kh.wassupSeoul.street.model.vo.Board;
import com.kh.wassupSeoul.street.model.vo.Count;
import com.kh.wassupSeoul.street.model.vo.Keyword;
import com.kh.wassupSeoul.street.model.vo.Reply;
import com.kh.wassupSeoul.street.model.vo.Street;

@SessionAttributes({ "loginMember", "msg", "streetNo", "myStreet" })
@Controller
@RequestMapping("/street/*")
public class StreetController {

	@Autowired
	private StreetService streetService;

	// 타임라인 이동
	@RequestMapping(value = "streetMain", method = RequestMethod.GET)
	public String timeLine(Integer streetNo, Model model, RedirectAttributes rdAttr, HttpServletRequest request) {

		Member loginMember = (Member) model.getAttribute("loginMember");

		System.out.println("골목번호 : " + streetNo);
		System.out.println("로그인정보 : " + loginMember.getMemberNickname());
		System.out.println("프로필사진정보 : " + loginMember.getMemberProfileUrl());

		model.addAttribute("streetNo", streetNo);

		String beforeUrl = request.getHeader("referer");

		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy년 MM월 dd일 E요일 a hh:mm");

		try {
			Street street = streetService.selectStreet(streetNo);

			// 좋아요, 댓글 개수 조회용 
//			List<Count> thumbCount  = streetService.thumbCount(streetNo);
//			List<Count> replyCount  = streetService.replyCount(streetNo);
//			
//			thumbCount.addAll(replyCount);
//		
//			 for (int index = 0; index < thumbCount.size(); index++) {
//			   System.out.println("좋아요, 댓글 개수 출력:" + thumbCount.get(index));
//			 }
//			String chkStreetMem = streetService.chkStreetMem();

			List<Board> board = streetService.selectBoard(streetNo);
			Collections.reverse(board);
			
			
			// 댓글 불러오는 중
//			List<Reply> reply = streetService.selectReply(streetNo);

//			System.out.println("street : " + street);

//			for (int i = 0; i < board.size(); i++) {
//
//				System.out.println("날짜 출력 : " + board.get(i).getBoardWriteDt());
//
//				System.out.println("골목 게시글 조회 : " + board.get(i));
//
//			}

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
		
		System.out.println("댓글 작성 번호 출력 : " + postNo);
		
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
				//msg = "골목 개설 불가";
				//model.addAttribute("msg", msg);
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
						
			if(sampleImg != null) {
								
				if(sampleImg.equals("골목.jpg")) {
					
					street.setImgNo(6);
				} else if(sampleImg.equals("골목2.jpg")) {
					street.setImgNo(7);
				} else if(sampleImg.equals("골목3.jpg")) {
					street.setImgNo(8);
				} else if (sampleImg.equals("골목4.jpg")) { 
					street.setImgNo(9);
				}
				System.out.println("기본이미지 street 확인 : " + street.getImgNo());
				
				result = streetService.insertStreet2(street, memberNo, streetKeywords);
				
			} else if(!streetCoverUpload.getOriginalFilename().equals("")) {
				
				System.out.println("새로 등록한 이미지 : " + streetCoverUpload.getOriginalFilename());
				
				// 골목 커버 이름 바꾸기
				String changeCoverName = FileRename.rename(streetCoverUpload.getOriginalFilename());

				result = streetService.insertStreet1(changeCoverName, street, memberNo, streetKeywords);
				
				if (result > 0) { // 정보 다 저장된 경우 골목 커버 서버에 저장

					streetCoverUpload.transferTo(new File(savePath + "/" + changeCoverName));
					
				}
			}

			if(result > 0) {
				msg = "골목 개설 성공~!! 우르르ㄱ끼기ㅣ긱";
				model.addAttribute("msg", msg);
				return "";
			} else {
				
				msg = "골목 개설 실패했다ㅠㅠ 흐규흐규";
				model.addAttribute("msg", msg);
				return "";
			}
		

//			if (!streetCoverUpload.getOriginalFilename().equals("")) { // 골목커버 등록했을 떄
//
//				// 골목 커버 이름 바꾸기
//				String changeCoverName = FileRename.rename(streetCoverUpload.getOriginalFilename());
//
//				result = streetService.insertStreet(changeCoverName, street, memberNo, streetKeywords);
//				
//				if (result > 0) { // 정보 다 저장된 경우 골목 커버 서버에 저장
//
//					streetCoverUpload.transferTo(new File(savePath + "/" + changeCoverName));
//					
//					// 골목 개설 성공 시
//					msg = "골목 개설 성공!! 꺄아아";
//					model.addAttribute("msg", msg);
//					return "";
//				}
//
//			}
//
//			// 골목 개설 실패 시
//			msg = "골목 개설 실패했다ㅠㅠ 흐규흐규";
//			model.addAttribute("msg", msg);
//			return "";

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "골목 개설 과정에서 오류 발생");
			return "common/errorPage";
		}
	}

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
		int memberNo = member.getMemberNo();
		
		int myStreetCount = streetService.myStreetCount(memberNo);
		
		if(myStreetCount >= 3) {
			return -1;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("streetNo", streetNo);
		map.put("memberNo", memberNo);

		int result = streetService.streetJoin(map);

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
			mList = streetService.selectJuminList(map);
			
			List<Hobby> hList = null;
			
			if(mList != null && !mList.isEmpty()) {
				hList = streetService.selectHobbyList(mList);
			}
			
			System.out.println(mList);
			System.out.println(hList);
			
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
		// 댓글 조회 
		@ResponseBody
		@RequestMapping("selectReply")
		public List<Reply> selectReply(int postNo, Model model ) {
				
				List<Reply> reply = streetService.selectReply(postNo);
			
				System.out.println(reply);
				
				return  reply; 
		}
	
	// 썸머노트 파일 DB삽입용
	@ResponseBody
	@RequestMapping("fileUpload")
	public void fileUpload(Board board, 
			Model model, 
			MultipartFile file, 
			HttpServletRequest request, 
			HttpServletResponse response) {
		
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "resources\\uploadImages\\";
		int maxSize = 1024 * 1024 * 10;

		
		
		Member loginMember = (Member) model.getAttribute("loginMember");
		//System.out.println(loginMember);
		try {
			int result = streetService.fileUpload(board,file,request,response);
			
			if (result > 0)
				System.out.println("썸머노트 등록 성공" + result);
			else
				System.out.println("썸머노트 등록 실패" + result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
