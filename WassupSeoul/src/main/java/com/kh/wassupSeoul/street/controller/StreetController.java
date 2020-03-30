package com.kh.wassupSeoul.street.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
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
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;
import com.kh.wassupSeoul.common.EchoHandler;
import com.kh.wassupSeoul.common.FileRename;
import com.kh.wassupSeoul.common.Pagination;
import com.kh.wassupSeoul.common.vo.PageInfo;
import com.kh.wassupSeoul.friends.model.vo.Relationship;
import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.square.model.vo.Alarm;
import com.kh.wassupSeoul.street.model.service.StreetService;
import com.kh.wassupSeoul.street.model.vo.Board;
import com.kh.wassupSeoul.street.model.vo.Calendar;
import com.kh.wassupSeoul.street.model.vo.Keyword;
import com.kh.wassupSeoul.street.model.vo.Reply;
import com.kh.wassupSeoul.street.model.vo.Report;
import com.kh.wassupSeoul.street.model.vo.Street;
import com.kh.wassupSeoul.street.model.vo.StreetJoin;
import com.kh.wassupSeoul.street.model.vo.Vote;

@SessionAttributes({ "loginMember", "msg", "streetNo", "myStreet"})
@Controller
@RequestMapping("/street/*")
public class StreetController {

	@Autowired
	private StreetService streetService;
	
	@Autowired
	private EchoHandler eco;

	// -------------------------------------------- 중하  ---------------------------------------------
	
	// 타임라인 이동  ,  게시물 검색
	@RequestMapping(value = "streetMain", method = RequestMethod.GET)
	public String timeLine( Model model, RedirectAttributes rdAttr, HttpServletRequest request,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
			@RequestParam(value = "streetNo", required = false) Integer streetNo,
			@RequestParam(value = "boardNo", required = false) Integer boardNo
			) {
		
//		System.out.println("searchKeyword :" +searchKeyword);
//		System.out.println("streetNo : " + streetNo);
		
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		Reply checkStreet = new Reply();
		
		Street street = new Street();
		
		StreetJoin memGradeInSt = new StreetJoin();
		
		List<Board> board = new ArrayList<Board>();
		
		checkStreet.setMemberNo(loginMember.getMemberNo());
		
		System.out.println("골목번호 : " + streetNo);
		System.out.println("로그인정보 : " + loginMember.getMemberNo());
		
		//System.out.println("프로필사진정보 : " + loginMember.getMemberProfileUrl());

		String beforeUrl = request.getHeader("referer");

		try {
			
			// 해당 골목 게시물 조회
			if (searchKeyword == null) {
				
//				System.out.println("일반 조회 :");
				checkStreet.setStreetNo(streetNo);
				
				// 회원 해당 골목 등급, 가입여부 조회
				memGradeInSt = streetService.memGradeInSt(checkStreet);
				
				// 해당 골목 정보 조회
				street = streetService.selectStreet(streetNo);
				System.out.println(street);
				if(boardNo != null) {
					checkStreet.setBoardNo(boardNo);
				}
				board = streetService.selectBoard(checkStreet);
				Collections.reverse(board);
				model.addAttribute("streetNo", streetNo);
				
			}else {
				
				if( searchKeyword.startsWith("@") ) { // 아이디검색
					
//					System.out.println("작성자로 검색 :" +searchKeyword);
					streetNo = (int) model.getAttribute("streetNo");
					
					checkStreet.setStreetNo(streetNo);
					memGradeInSt = streetService.memGradeInSt(checkStreet);
					
					// 해당 골목 정보 조회
					street = streetService.selectStreet(streetNo);
					System.out.println(street);
					
					// @제거후 회원닉네임만 검색
					int idx = searchKeyword.indexOf("@");
					checkStreet.setReplyWriter(searchKeyword.substring(idx+1)); 
					//System.out.println("idx : "+idx);
					//System.out.println("@제거후 회원닉네임만 검색 : "+searchKeyword.substring(idx+1));
					
					board = streetService.searchBoardwithWriter(checkStreet);
					Collections.reverse(board);
					
				}else { // 게시글 내용 검색
//					System.out.println("키워드로 검색 :" +searchKeyword);
					streetNo = (int) model.getAttribute("streetNo");
					checkStreet.setStreetNo(streetNo);
					memGradeInSt = streetService.memGradeInSt(checkStreet);
					
					// 해당 골목 정보 조회
					street = streetService.selectStreet(streetNo);
//					System.out.println(street);
					
					checkStreet.setReplyContent(searchKeyword);
					
					board = streetService.searchBoardwithKeyword(checkStreet);
					Collections.reverse(board);
				}
			}
			
			// 해당 골목 댓글, 대댓글 조회
			List<Reply> reply  = streetService.selectReply(checkStreet);
			
			List<Vote> vote = streetService.selectVoteOption(checkStreet);
			
			if (street != null) {
//				for(int k=0;k<board.size();k++) {
//					System.out.println("게시글 목록 : " + board.get(k));
//				}
				
				model.addAttribute("street", street); // 해당골목 정보
				if(board.isEmpty()) { // 게시물 검색결과 없음 표시하기 위해
					board.add(0, new Board(0));
				}
				
				model.addAttribute("board", board);  // 해당 골목 게시글 조회
				//request.getSession().setAttribute("board", board);
				model.addAttribute("reply", reply);  // 해당 골목 댓글 리스트 (댓글용)
				model.addAttribute("reReply", reply);  // 해당골목 댓글 리스트 (대댓글용)
				model.addAttribute("vote", vote);     // 해당 골목 투표 게시글 정보
				model.addAttribute("voteOption", vote);     // 해당 골목 투표 선택지 

				// 회원 해당 골목 등급, 가입여부 
				//model.addAttribute("memGradeInSt", memGradeInSt);
				request.getSession().setAttribute("memGradeInSt", memGradeInSt);
				
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
//		System.out.println(loginMember);
		int boardWriter = loginMember.getMemberNo();
//		System.out.println(boardWriter);

		int streetNo = (int) model.getAttribute("streetNo");
		System.out.println(streetNo);

		board.setBoardContent(board.getBoardContent().replace("\r\n", "<br>"));
		board.setMemberNo(boardWriter);
		board.setStreetNo(streetNo);
		board.setTypeNo(0);

//		System.out.println("등록할 게시글 : " + board);
//		System.out.println("board.getBoardContent : " + board.getBoardContent());

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

//		System.out.println("글번호 출력 : " + postNo);
				
		Reply reply = new Reply();
		reply.setMemberNo(loginMember.getMemberNo());
		reply.setBoardNo(postNo);

		try {

			return streetService.likeCheck(reply) == 1 ? true + "" : false + "";
			/*
			// 알람 관련해서 수정 하는 중 -태훈
			int result = streetService.likeCheck(reply);
			if(result > 0) {
				int memberNo = streetService.getBoardWriter(reply);
			}
			*/

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

//		System.out.println("댓글번호 출력 : " + replyNo);
		
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

//			System.out.println("대댓글번호 출력 : " + replyNo);
			
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

//		System.out.println("글삭제 번호 출력 : " + postNo);

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
		
//		System.out.println("댓글 입력 내용 : " + commentContent );
		
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
			
//			System.out.println("대댓글 달릴 댓글 번호 출력 : " + replyNo);
			
			Member loginMember = (Member)model.getAttribute("loginMember");
			
			Reply reply = new Reply();
			
//			System.out.println("댓글 입력 내용 : " + commentContent );
			
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
    	
//    	System.out.println("작성자 얻어온 정보 : " + memberNo);
    	try {
    		
        	// 1) 회원 정보 가져오기
    		Member member = streetService.checkProfile(memberNo);
//    		System.out.println("작성자 조회한 정보 : " + member);
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
		
//		System.out.println("입력한 주소 : " + address);
//		System.out.println("입력한 게시글 내용 : " + mapPostContent);
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		int streetNo = (int) model.getAttribute("streetNo");
		
		Board board = new Board();
		
		board.setStreetNo(streetNo);
		board.setMemberNo(loginMember.getMemberNo());
		board.setBoardContent(mapPostContent );
		board.setMapAddress(address);
		board.setTypeNo(6);
	
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
    
    // 스케치 업로드
    @ResponseBody
    @RequestMapping("sketchPost")
	public String fileUpload(HttpServletRequest request, String canvasImgStr, String sketchPostContent,
							Model model){

		Member loginMember = (Member) model.getAttribute("loginMember");
		
		int streetNo = (int) model.getAttribute("streetNo");

		Board board = new Board();
   		
   		board.setStreetNo(streetNo);
   		board.setMemberNo(loginMember.getMemberNo());
   		board.setBoardContent(sketchPostContent);
   		
   		board.setTypeNo(5);
   		
   		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/" + "sketchImage";
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdir();
		
   		String fullPath = "";
   		
   		Date nowDate = new Date(System.currentTimeMillis());
   		
   		String [] strParts = canvasImgStr.split(",");
   		
   		String rstImgStr = strParts[1];  //,로 구분하여 뒷 부분 이미지 데이터를 임시저장
   		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_hhmmss");
   		String filenm = sdf.format(nowDate).toString()+"_sketchImg.png";
   		
   		BufferedImage image = null;
   		byte[] byteImg;
   		
   		Decoder decoder = Base64.getDecoder();
   		
   		try {
   			
   		byteImg = decoder.decode(rstImgStr); // base64 디코더를 이용하여 byte 코드로 변환
   		ByteArrayInputStream bis = new ByteArrayInputStream(byteImg);
   		image = ImageIO.read(bis); // BufferedImage 형식으로 변환후 저장
   		bis.close();
   		File outputFile  = new File(folder+"/"+filenm);  // 파일 객체 생성
   		if( outputFile.exists()) outputFile.delete();
   		ImageIO.write(image, "png", outputFile); // 서버에 파일로 저장
   		
   		System.out.println("스케치 업로드 완료. 파일경로  : " + outputFile );
   		System.out.println("파일이름  : " + filenm );
   		
   		board.setSketchUrl(filenm);   		   		
		
			int test = streetService.sketchUpload(board);
			
			if ( test > 0) {
				System.out.println("스케치 게시글 입력 완료");
			}else {
				System.out.println("스케치 게시글 입력 실패");
			}
			
			return  test == 1 ? true + "" : false + "";
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "스케치 게시글 입력 과정에서 오류발생");
			return "/common/errorPage";
		}
	}
    
    
    
 // 투표 게시글 입력
    @ResponseBody
	@RequestMapping("votePost")
	public String votePost(String anonymity, Model model, String voteLimit,
							String votePostContent, String voteOptionList, String votePostTitle,
							Date endDate) {
		
		/*
		 * System.out.println("입력한 게시글 내용 : " + votePostContent);
		 * System.out.println("입력한 투표 제목 : " + votePostTitle);
		 * System.out.println("입력한 투표 종료일: " + endDate);
		 * System.out.println("무기명 투표 중복여부: " + anonymity);
		 * System.out.println("중복 투표 중복여부: " + voteLimit);
		 * System.out.println("입력한 투표 : " + voteOptionList);
		 */
		 
		String[] voteGet = voteOptionList.split(",");
		
		for(int k=0; k<voteGet.length;k++) {
		System.out.println("입력한 투표 옵션 리스트  : " + voteGet[k]); }
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		int streetNo = (int)model.getAttribute("streetNo");
		
		Board board = new Board();
		
		Vote vote = new Vote();
		
		board.setStreetNo(streetNo);
		board.setMemberNo(loginMember.getMemberNo());
		board.setBoardContent(votePostContent);
		board.setTypeNo(3);
		
		vote.setVoteTitle(votePostTitle);
		vote.setVoteDup(voteLimit);
		vote.setVoteEndDt(endDate);
		vote.setVoteOtion(voteOptionList);
		vote.setAnonymity(anonymity);
		
		String[] voteOption = voteOptionList.split(",");
		
		try {
	
			int test = streetService.votePost(board, vote, voteOption);
			
			if ( test > 0) {
				System.out.println("투표 게시글 입력 완료");
			}else {
				System.out.println("투표 게시글 입력 실패");
			}
			
			return  test == 1 ? true + "" : false + "";
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "대댓글 입력 과정에서 오류발생");
			return "/common/errorPage";
		}
	}
    
 // 투표 기록용
    @ResponseBody
	@RequestMapping("recordVote")
	public String recordVote(int voteNo, Model model, String checkStatus) {
		
		
		  System.out.println("투표 선택지 번호: " + voteNo);
		  System.out.println("투표 체크 상태 : " + checkStatus);
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		int streetNo = (int)model.getAttribute("streetNo");
		
		Vote vote = new Vote();
		
		vote.setMemberNo(loginMember.getMemberNo());
		vote.setVoteNo(voteNo);
		vote.setVoteStatus(checkStatus);
		
		try {
	
			int test = streetService.recordVote(vote);
			
			if ( test > 0) {
				System.out.println("투표 기록 완료");
			}else {
				System.out.println("투표 기록 실패");
			}
			
			return  test == 1 ? true + "" : false + "";
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "대댓글 입력 과정에서 오류발생");
			return "/common/errorPage";
		}
	}
    

	// 1/N용 회원 목록 조회
    @ResponseBody
	@RequestMapping("selectDevideMember")
    public ArrayList<Object>  selectDevideMember(HttpServletResponse response, Model model) {
    	
    	int streetNo = (int)model.getAttribute("streetNo");
    	
    	// 1) 회원 정보 가져오기
    	
    	try {
    		List<Member> selectDevideMember = streetService.selectDevideMember(streetNo);
    		
			
			for(int i=0;i<selectDevideMember.size();i++) {
				System.out.println("선택할 수 있는 회원 : " + selectDevideMember.get(i));
			}
			
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(selectDevideMember);
    		
    	} catch(Exception e) {
    		e.printStackTrace();
    		
    	}
    	return null;
    }
	
	// -------------------------------------------- 중하 끝  ---------------------------------------------
    
	// -------------------------------------------- 지원 -----------------------------------------------
	// 골목 개설 화면 이동
	@RequestMapping("streetInsert")
	public String insertStreetForm(Model model) {
		
		int result = 0;
		
		// 회원 번호 얻어오기
		Member loginMember = (Member)model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();
		
		try {
			
			result = streetService.selectMyStreet(memberNo);
			
			if (result > 0) {
				
				return "street/streetInsert";
			}

			else {
				model.addAttribute("msg", "이미 개설한 골목이 있거나 가입한 골목이 3개 있어 골목 개설이 불가합니다.");
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
		
		int result = 0;

		// 회원 번호 얻어오기
		Member loginMember = (Member) model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();

		// 골목 커버
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/" + "streetCoverImage";
		File folder = new File(savePath);
		if (!folder.exists())
			folder.mkdir();				 

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
				
				model.addAttribute("msg", "골목 개설 성공~!! 우르르ㄱ끼기ㅣ긱");
				return "redirect:/square"; // 골목으로 이동하게 바꾸기
				
			} else {
				
				model.addAttribute("msg", "골목 개설 실패했다ㅠㅠ 흐규흐규");
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
		//System.out.println(street);
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
			streetService.insertAlarm(alarm);
			result = masterNo;
		}

		return result;

	}
	
	// 주민목록 조회
	@RequestMapping
	public String juminList(Integer streetNo, Model model) {
		model.addAttribute("streetNo", streetNo);
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
			
			
			//System.out.println(rList);
			
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
		int result = streetService.addRelation(addRelation);
		if(result > 0) {
			Alarm alarm = new Alarm("친구를 신청합니다!", '3', "메신저창 오픈", myNum+"", yourNum);
			streetService.insertAlarm(alarm);
		}
	}
	
	@ResponseBody
	@RequestMapping("hideFriend")
	public void hideFriend(Model model, int yourNum) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		int myNum = loginMember.getMemberNo();
		Relationship addRelation = new Relationship(myNum, yourNum, '4');
		
		streetService.addRelation(addRelation);
	}
	
	/*----------------------- 미현 시작 (03/23) -----------------------------------*/
	// 썸머노트 파일 Bfile DB삽입용
	@ResponseBody
	@RequestMapping(value="fileUpload", produces = "application/text; charset=utf8")
	public String fileUpload(Board board, Model model, MultipartFile file, HttpServletRequest request, HttpServletResponse response) {

		Member loginMember = (Member) model.getAttribute("loginMember");
		int streetNo = (int) model.getAttribute("streetNo");
		
		System.out.println("파일명 : " + file.getOriginalFilename());

		try {
			String filePath = streetService.fileUpload(board,file,request,streetNo);
			
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
		if(streetNo == null) {
			streetNo = (Integer)model.getAttribute("streetNo");
		}
		String streetNm = streetService.selectStreetNm(streetNo);
		int masterNo = streetService.selectMasterNo(streetNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("streetNo", streetNo);
		map.put("memberNo", memberNo);
		if(applyCheck == true) {
			streetService.joinCheck(map);
			Alarm alarm = new Alarm("["+streetNm+"] 골목에 가입이 완료되었습니다!", '2',
					"street/streetMain?streetNo="+streetNo, masterNo+"", memberNo);
			streetService.insertAlarm(alarm);
			return memberNo;
		} else {
			streetService.joinDelete(map);
			return 0;
		}
	}
	
	// 알람을 확인하지 않고 골목 가입신청을 하였을 때 알람 확인상태로 변경
	@ResponseBody
	@RequestMapping("removeAlarm")
	public void removeAlarm(Model model, int eventer, String alarmType) {
		int memberNo = ((Member)model.getAttribute("loginMember")).getMemberNo();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("eventer", eventer);
		map.put("alarmType", alarmType);
		
		streetService.removeAlarm(map);
	}
	
	// 주민 강퇴
	@RequestMapping("exileJumin")
	public String exileJumin(Model model, int memberNo) {
		int streetNo = (int)model.getAttribute("streetNo");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("streetNo", streetNo);
		map.put("memberNo", memberNo);
		try {
			streetService.exileJumin(map);
			return "redirect:juminList";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "주민 강퇴 과정 중 오류 발생");
			return "common/errorPage";
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
	
	// 일정 조회
	@RequestMapping("calendar")
	public String calendar(Model model, Integer tempStreetNo) {
		
		return "street/streetCalendar";
		
	}
	
	// 일정 추가
	@RequestMapping(value="addSCSC", method = RequestMethod.POST)
	public String addSchedule(Model model,Calendar sendCalendar,String calStartDate,String calStartTime,String calEndDate,String calEndTime,
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
			calStartTime = calStartTime+ ":00.0";
			String tempStart = calStartDate + " " + calStartTime;
			// 일정 종료 시간
			calEndTime = calEndTime+ ":00.0";
			String tempEnd = calEndDate + " " + calEndTime;
			
			// String을 Timestamp로 변환
			Timestamp calendarStartDate = Timestamp.valueOf(tempStart);
			Timestamp calendarEndDate = Timestamp.valueOf(tempEnd);
			
			sendCalendar.setCalendarStartDate(calendarStartDate);
			sendCalendar.setCalendarEndDate(calendarEndDate);
			
			// 일정 등록이 되기전 게시글 등록 -> 등록된 게시글 번호가 필요
			
			// 일정 참가가 있을 경우 추가할 버튼
			String btnPlus = "<br><br><button class='nanum btn btn-primary joinBtn' data-toggle='modal' data-target='#calendarJoinModal\'>일정 참가하기</button>";
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
	
	// 일정 삭제
	@RequestMapping("deleteSchedule")
	public String deleteSchedule(int boardNo, Model model) {
		int streetNo = (int) model.getAttribute("streetNo");
		Calendar temp = new Calendar();
		temp.setBoardNo(boardNo); temp.setStreetNo(streetNo);
		try {
			// 만약 참여인원 있으면 해당 테이블행도 삭제 -> Calendar_Member 행 삭제
			
			// 현재 일정 게시글에 참여인원이 존재하는지 조회
			int result = streetService.selectJoinCalendar(boardNo);
			if(result > 0) {
				// 현재 일정 게시글에 참여한 주민목록 제거
				result = streetService.deleteJoinCalendar(boardNo);
				if(result == 0) {
					model.addAttribute("msg","제거된 일정 참여 인원 목록 삭제 실패");
					return "redirect:calendar";
				}
			}
			
			// 해당하는 Calendar 행 삭제
			result = streetService.deleteSchedule(temp);
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
			
			model.addAttribute("msg","일정 삭제 성공");
			return "redirect:calendar";
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "일정 추가 과정에서 오류발생");
			return "/common/errorPage";
		}
	}
	
	/*------------------------ 정승환 추가코드(20.03.27)시작-----------------------------------*/
	
	// 일정 수정
	@RequestMapping("updateSchedule")
	public String updateSchedule(String updateCalendarTitle, String updateCalendarContent,
								 String updateCalendarLocation, String updateCalendarBoardNo, 
								 Model model) {
		System.out.println("일정 수정 제목 : " + updateCalendarTitle);
		System.out.println("일정 수정 내용 : " + updateCalendarContent);
		System.out.println("일정 수정 위치 : " + updateCalendarLocation);
		System.out.println("일정 수정 글번호 : " + updateCalendarBoardNo);
		
		try {
			// boardNo를 int형으로 변환
			int boardNo = Integer.parseInt(updateCalendarBoardNo);
			// DB에 저장된 일정 정보 조회
			Calendar updateCalendar = streetService.selectCalendarInfo(boardNo);

			// 일정 게시글 수정용 객체 
			Board updateCalendarBoard = new Board();
			// 일정 수정용 객체
			Calendar updateCal = new Calendar();
			
			//////////////////////////////////////////////////////
			// 글번호 지정
			updateCal.setBoardNo(boardNo);
			// 수정 제목 지정
			updateCal.setCalendarTitle(updateCalendarTitle);
			// 수정 위치 지정
			updateCal.setCalendarLocation(updateCalendarLocation);
			// 수정 내용 지정
			updateCal.setCalendarContent(updateCalendarContent);
			//////////////////////////////////////////////////////
			
			// yyyy-MM-dd 일정 시작일
			String calStartDate = new SimpleDateFormat("yyyy-MM-dd").format(updateCalendar.getCalendarStartDate());
			// yyyy-MM-dd 일정 종료일
			String calEndDate = new SimpleDateFormat("yyyy-MM-dd").format(updateCalendar.getCalendarEndDate());
			
			// 오전,오후 HH:mm 일정 시작 시간
			String calStartHour = new SimpleDateFormat("a hh:mm").format(updateCalendar.getCalendarStartDate());
			// 오전,오후 HH:mm 일정 종료 시간
			String calEndHour = new SimpleDateFormat("a hh:mm").format(updateCalendar.getCalendarEndDate());
			
			// yyyy-MM-dd a HH:mm 일정시작
			String tempStart = calStartDate + " " + calStartHour;
			// yyyy-MM-dd a HH:mm 일정종료
			String tempEnd = calEndDate + " " + calEndHour;
			
			// 일정 참가가 있을 경우 추가할 버튼
			String btnPlus = "<br><button class='nanum btn btn-primary joinBtn' data-toggle='modal' data-target='#calendarJoinModal\'>일정 참가하기</button>";
			// 일정 참가시 해당 글번호
			String boardNoPlus = "<input type='hidden' value='" + boardNo + "'>";
			
			String content = "<h5 class='nanum'>수정된 일정 등록</h5>" + updateCalendarContent
			+"<br>장소 : "+ updateCalendarLocation +"<br>기간 : "+ tempStart +" ~ " + tempEnd;
			
			if(updateCalendar.getCalendarJoin() == 'Y') {
				content = content + btnPlus + boardNoPlus;
			}
			
			//////////////////////////////////////////////
			// 글번호 지정
			updateCalendarBoard.setBoardNo(boardNo);
			// 수정 일정 게시글 내용 지정
			updateCalendarBoard.setBoardContent(content);
			//////////////////////////////////////////////
			
			// 일정 게시글 수정
			int result = streetService.updateCalendarBoard(updateCalendarBoard);
			if(result == 0) {
				model.addAttribute("msg","일정 게시글 수정 실패");
				return "redirect:calendar"; 
			}
			
			// 캘린더 수정
			result = streetService.updateSchedule(updateCal);
			String msg = "";
			if(result > 0)	msg = "일정 수정 성공";
			else 			msg = "일정 수정 실패";
			
			model.addAttribute("msg",msg);
			return "redirect:calendar"; 
			
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "일정 수정 과정에서 오류발생");
			return "/common/errorPage";
		}
		
	}
	
	/*------------------------ 정승환 추가코드(20.03.27)끝-----------------------------------*/
	
	// 참가신청 모달 출력 버튼 클릭시 해당 DB데이터 조회
	@ResponseBody
	@RequestMapping("selectJoinModal")
	public void selectJoinModal(HttpServletResponse response, int boardNo) {
		
		try {
			// 1) 일정 참여 인원 목록
			// 값 전달용 리스트(참여인원 정보 목록)
			ArrayList<Member> sendJoinMemberList = new ArrayList<Member>();
			
			// 값 전달용 맵
			HashMap<String,Object> sendJoinInfo = new HashMap<String, Object>();
			
			// 글번호,회원번호만 저장하기 위해 Board객체사용 , CALENDAR_MEMBER에서 해당하는 글번호에 참여한 회원번호 조회(0~n개) -> 글번호,회원번호 조회
			List<Board> tempCalMemNo = streetService.selectCalMemNo(boardNo);
			if(!tempCalMemNo.isEmpty()) {
				for(int k =0;k<tempCalMemNo.size();k++) {
					Member temp = streetService.selectJoinMember(tempCalMemNo.get(k).getMemberNo());
					sendJoinMemberList.add(temp);
				}
			}
			
			// 2) 현재 일정게시판 참여인원 수 저장 목록
			Integer nowJoinMemberCount = streetService.selectJoinCalendar(boardNo);
			
			sendJoinInfo.put("nowJoinMemberCount", nowJoinMemberCount);
			sendJoinInfo.put("sendJoinMemberList", sendJoinMemberList);
			
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(sendJoinInfo, response.getWriter());
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// 참가신청 버튼 클릭시 해당 회원 참여
	@RequestMapping("insertCalendarMember")
	public String insertCalendarMember(Model model,int boardNo,int inCalJoinLimit) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();
		int streetNo = (int)model.getAttribute("streetNo");
		try {
			// 현재 참가인원이 제한인원보다 적은지 판별
			int nowJoinCount = streetService.selectJoinCalendar(boardNo);
			
			// 현재 참가인원이 제한 인원보다 적은 경우 참가
			if(nowJoinCount < inCalJoinLimit) {
				String msg = "";
				Board temp = new Board(); // 값전달용 객체
				temp.setBoardNo(boardNo);temp.setMemberNo(memberNo);
				int result = streetService.insertCalendarMember(temp);
				if(result > 0)	msg = "참가 신청 완료";
				else 			msg = "참가 신청 실패";
				
				model.addAttribute("msg",msg);
				return "redirect:streetMain?streetNo=" + streetNo;
				
			}
			// 많은 경우 참가 불가
			else {
				model.addAttribute("msg","현재 일정 참가 인원이 초과되어 참가불가");
				return "redirect:streetMain?streetNo=" + streetNo;
			}

			
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "일정 참가 과정에서 오류발생");
			return "/common/errorPage";
		}

	}
	
	// 참가탈퇴 버튼 클릭시 해당 회원 탈퇴
	@RequestMapping("deleteCalendarMember")
	public String deleteCalendarMember(Model model,int boardNo) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNo();
		int streetNo = (int)model.getAttribute("streetNo");
		try {
			Board temp = new Board(); // 값전달용 객체
			temp.setBoardNo(boardNo);temp.setMemberNo(memberNo);
			int result = streetService.deleteCalendarMember(temp);
			String msg = "";
			if(result > 0)	msg = "일정 탈퇴 완료";
			else			msg = "일정 탈퇴 실패";
			
			model.addAttribute("msg",msg);
			return "redirect:streetMain?streetNo=" + streetNo;
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "일정 탈퇴 과정에서 오류발생");
			return "/common/errorPage";
		}
		
	}
	
	/*------------------------ 정승환 추가코드(20.03.27)시작-----------------------------------*/
	
	// 일정 수정 모달창 일정 정보 조회
	@ResponseBody
	@RequestMapping("updateModalInfo")
	public void updateModalInfo(HttpServletResponse response, int boardNo) {
		
		try {
			// 수정하려는 일정이 DB에 저장된 값을 조회
			Calendar sendModalInfo = streetService.selectCalendarInfo(boardNo);
			
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(sendModalInfo, response.getWriter());
		} catch(Exception e) {
			e.printStackTrace();
		}

	}
	
	/*------------------------ 정승환 추가코드(20.03.27)끝-----------------------------------*/
	
/*------------------------ 정승환 추가코드 끝-----------------------------------*/
	
	
	
	
	/*------------------------ 지원 골목삭제 시작-----------------------------------*/
	// 골목 삭제
	@RequestMapping("streetDelete")
	public String streetDeleteForm(Integer no, Model model, HttpServletRequest request) {

		String detailUrl = request.getHeader("referer");

		model.addAttribute("detailUrl", detailUrl);
		
		int result = 0;
		
		int streetNo = (int)model.getAttribute("streetNo");
		
		try {
			
			result = streetService.deleteStreet(streetNo);
			
			if(result > 0) {
				
				return "square";
				
			} else {
				
				model.addAttribute("msg", "골목 삭제 실패");
				return "redirect:" + detailUrl;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "골목 삭제 과정에서 오류발생");
			return "/common/errorPage";
		}
	}
	
	// 골목대장 위임 화면 이동
	@RequestMapping("newMaster")
	public String newMaster(Integer no, Model model) {
		model.addAttribute("no", no);
		return "street/streetNewMaster";
	}
	
	// 주민 검색(골목대장 위임)
	@ResponseBody
	@RequestMapping(value = "searchJumin", method = RequestMethod.POST,
			produces = "application/json; charset=utf-8")
	public String searchJumin(String juminNickName, HttpServletResponse response, Model model) {
		
		int result = 0;
		
		try {
			
			int streetNo = (int) model.getAttribute("streetNo");
			
			Member jumin = streetService.searchJumin(juminNickName, streetNo);
			
			int memberNo = jumin.getMemberNo();
			
			result = streetService.selectStreetMaster(memberNo);
			
			if(result == 0) {
				
				jumin.setMemberPwd(null);
				return new Gson().toJson(jumin);
				
			} else {
				
				jumin = null;
				
				return new Gson().toJson(jumin);
			}
			
		}catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
	}
	
	// 골목 대장 위임
	@RequestMapping("yesMaster")
	public String yesMaster(Integer newNo, Model model) {
		
		try {
						
			int streetNo = (int)model.getAttribute("streetNo");
			
			Member master = (Member)model.getAttribute("loginMember");
			
			int original = master.getMemberNo();
			
			/* ---------------태훈 알람 관련 추가---------------*/
			// 변경 전 골목대장 넘버를 가져옴.
			int masterNo = streetService.selectMasterNo(streetNo);
			int result = streetService.yesMaster(newNo, streetNo, original);
			
			if(result > 0) {
				
				String streetNm = streetService.selectStreetNm(streetNo);
				Alarm alarm = new Alarm("["+streetNm+"] 골목의 골목대장으로 임명되셨습니다.", '5',
						"street/streetMain?streetNo="+streetNo, masterNo+"", newNo);
				streetService.insertAlarm(alarm);
				// 이전 골목 가입에 대한 알림을 새로운 골목대장이 조회할 수있도록 알람 테이블 수정
				result = streetService.updateAlarm(masterNo, newNo);
				
				// 해당 유저의 웹소켓 세션에 알람메세지를 보냄
				List<WebSocketSession> wsList = eco.getSessionList();
				for(WebSocketSession ws : wsList) {
					if(((Member)ws.getAttributes().get("loginMember")).getMemberNo() == newNo) {
						ws.sendMessage(new TextMessage(ws.toString()));
					};
				}
				
				/* ---------------태훈 알람 관련 추가 끝---------------*/
				model.addAttribute("msg", "위임 성공");
				return "redirect:streetMain?streetNo=" + streetNo;
				
			} else {
				
				model.addAttribute("msg", "위임 실패");
				return "redirect:/";
				
			}
			
		}catch (Exception e) {
			
			e.printStackTrace();
			model.addAttribute("errorMsg", "골목대장 위임 과정에서 오류 발생");
			return "/common/errorPage";
			
		}
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
	//@ResponseBody
	//@RequestMapping(value="updateSummer", produces = "application/text; charset=utf8")
	@RequestMapping("updateSummer")
	public String updateSummer(Board board, Model model, MultipartFile file, HttpServletRequest request, HttpServletResponse response, int no) {
		
		Member loginMember = (Member) model.getAttribute("loginMember");
		int boardWriter = loginMember.getMemberNo();
		// 수정 실패or성공할때 원래 street페이지로 돌아오기 위함
		int streetNo = (int) model.getAttribute("streetNo");
		
		board.setBoardNo(no);
		/* board.setMemberNo(boardWriter); */
		board.setStreetNo(streetNo);
		System.out.println(board);
		
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
			
			if(result > 0)	System.out.println("썸머 게시글 등록 성공" + result);
			else 			System.out.println("썸머 게시글 등록 실패" + result);
			
			return "redirect:streetMain?streetNo=" + streetNo;
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "썸머노트 수정 과정에서 오류 발생");
			return "redirect:streetMain?streetNo=" + streetNo;
		}
	}
	
	/** 사진첩 사진 목록 조회용 
	 * @param model
	 * @param board
	 * @param currentPage
	 * @return list
	 */
	@RequestMapping("photoAlbum")
	public String photoAlbum(Model model, 
			@RequestParam(value = "currentPage", required = false) Integer currentPage) {
		
		try {
			
			int streetNo = (int) model.getAttribute("streetNo");
			System.out.println(streetNo);
			
			int listCount = streetService.getListCount(streetNo);
			
			// 현재페이지
			if (currentPage == null)
				currentPage = 1;

			// 페이지 정보 저장
			PageInfo pInf = Pagination.getPageInfo(10, 10, currentPage, listCount);

			/*
			 * if (currentPage == null) currentPage = 1; PageInfo pInf =
			 * Pagination.getPageInfo(5, 10, currentPage, listCount);
			 */
			List<String> list = streetService.selectPtList(streetNo, pInf);
			
			System.out.println("list입니당:"+list);
			
			model.addAttribute("list", list);
			model.addAttribute("pInf",pInf);
			/* model.addAttribute("pInf", pInf); */
		
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "앨범 사진 조회 과정에서 오류 발생");
			return "common/errorPage";
		}

		return "street/photoAlbum";
	}
	
	/*------------------------ 미현 코드추가 끝-----------------------------------*/ 
	
	
	
	/*------------------------ 지원 활동보고서 시작 ---------------------------------*/
	// 활동보고서 페이지 이동
	@RequestMapping("streetReport")
	public String streetReport() {
		
		return "street/streetReport";
	}
	
	// 활동보고서 제출
	@RequestMapping("sendReport")
	public String sendReport(Report report, 
						     String post, String address1, String address2, 
						     MultipartFile reportImgUpload,
						     Model model, HttpServletRequest request) {
		int result = 0;
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/" + "reportImage";
		File folder = new File(savePath);
		if (!folder.exists())
			folder.mkdir();
		
		int streetNo = (int) model.getAttribute("streetNo");
		
		String meetingPlace = post + "," + address1 + "," + address2;		
		
		try {
			
			report.setStreetNo(streetNo);
			report.setMeetingPlace(meetingPlace);
			
			if (!reportImgUpload.getOriginalFilename().equals("")) {

				// 골목 커버 이름 바꾸기
				String changeImgName = FileRename.rename(reportImgUpload.getOriginalFilename());

				report.setMeetingImgUrl(changeImgName);
				
				result = streetService.sendReport(report);
				

				if (result > 0) { // 정보 다 저장된 경우 골목 커버 서버에 저장

					reportImgUpload.transferTo(new File(savePath + "/" + changeImgName));

				}
			}
			
			
			
			if(result > 0) {
				model.addAttribute("msg", "활동보고서가 정상적으로 제출되었습니다.");
				return "redirect:streetMain?streetNo=" + streetNo;
			} else {
				model.addAttribute("msg", "활동보고서 제출에 실패하였습니다.");
				return "redirect:streetMain?streetNo=" + streetNo; 
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "활동 보고서 제출 과정에서 오류 발생");
			return "common/errorPage";
		}
	}
	
	/*------------------------ 지원 활동보고서 끝 ---------------------------------*/
}
