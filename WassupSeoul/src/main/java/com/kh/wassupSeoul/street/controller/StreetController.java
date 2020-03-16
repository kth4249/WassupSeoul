package com.kh.wassupSeoul.street.controller;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;

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

import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.street.model.service.StreetService;
import com.kh.wassupSeoul.street.model.vo.Board;
import com.kh.wassupSeoul.street.model.vo.Street;

@SessionAttributes({"loginMember", "msg", "streetNo"})
@Controller
@RequestMapping("/street/*")
public class StreetController {
	
	@Autowired
	private StreetService streetService;
	
	//타임라인 이동
	@RequestMapping(value = "streetMain", method = RequestMethod.GET)
	public String timeLine(Integer streetNo, 
			Model model,  
			RedirectAttributes rdAttr, 
			HttpServletRequest request) { 
		
		System.out.println("골목번호 : "+ streetNo);
		
		model.addAttribute("streetNo", streetNo);
		
		String beforeUrl = request.getHeader("referer");
		
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy년 MM월 dd일 E요일 a hh:mm");
		
		try {
			Street street = streetService.selectStreet(streetNo);
			
			List<Board> board = streetService.selectBoard(streetNo);
			Collections.reverse(board);
			
			// 게시글, 댓글 조회해서 같이 넘겨줘야함 
			
			System.out.println("street : " + street );
			
			for(int i= 0; i <board.size(); i++) {

				
				System.out.println("날짜 출력 : " + board.get(i).getBoardWriteDt());
			
				System.out.println("골목 게시글 조회 : "+ board.get(i));


			}
			
			if(street != null) {
				
				model.addAttribute("street", street);
				model.addAttribute("board", board);
				
				return "street/streetMain";
				
			} else {
				rdAttr.addFlashAttribute("msg", "골목 상세 조회 실패");
				return "redirect:" + beforeUrl;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:" + beforeUrl;
		}
		
	}
	
	
	// 게시글 작성
	@RequestMapping("insert")
	public String insertBoard(Board board, // 커맨드 객체    @ModelAttribute 생략되어 있는 상태
							  Model model, // session 접근용
							  HttpServletRequest request, // 파일 경로
							  RedirectAttributes rdAttr,   // 리다이렉트 시 메세지 전달용 
							  @RequestParam(value="images", required=false) List<MultipartFile> images
								) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		System.out.println(loginMember);
		int boardWriter = loginMember.getMemberNo();
		System.out.println(boardWriter);
		
		int streetNo = (int)model.getAttribute("streetNo");
		System.out.println(streetNo);
		
		board.setBoardContent(board.getBoardContent().replace("\r\n", "<br>"));
		board.setMemberNo(boardWriter);
		board.setStreetNo(streetNo);
		board.setTypeNo(0);
		
		System.out.println("등록할 게시글 : " + board);
		
		try {
			
			int result = streetService.insertBoard(board);
						
			
			if(result > 0) System.out.println("게시글 등록 성공"+ result);
			else           System.out.println("게시글 등록 실패"+ result);
			
			return "redirect:streetMain?streetNo=" + streetNo;
			
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:streetMain?streetNo=" + streetNo;
			
		}
		
	}
	
	// 좋아요 등록, 해제
	@ResponseBody
	@RequestMapping("likeFunction")
	public String likeFunction(int postNo, Model model) {
		
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		System.out.println("글번호 출력 : "+postNo);
		
		// memberAge에 게시글 번호 담아서 재활용
		loginMember.setMemberAge(postNo);
		
		try {
//			int test = streetService.likeCheck( loginMember );
//			
//			System.out.println("좋아요 기록 조회:"+test);
//			System.out.println("변경된 loginMemer:"+ loginMember);
			
			return streetService.likeCheck( loginMember ) == 1 ? true + "" : false + "";
			
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
		
		System.out.println("글번호 출력 : "+postNo);
		
	
		try {
	
			
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "좋아요 기록 과정에서 오류발생");
			return "/common/errorPage";
		}
		return "/common/errorPage";
	}
	
	
}
