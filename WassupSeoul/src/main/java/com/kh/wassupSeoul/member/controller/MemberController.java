
package com.kh.wassupSeoul.member.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.wassupSeoul.common.FileRename;
import com.kh.wassupSeoul.member.model.service.MemberService;
import com.kh.wassupSeoul.mail.model.vo.App;
import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.hobby.model.vo.MemberHobby;
import com.kh.wassupSeoul.hobby.model.vo.SearchHobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.member.model.vo.ProfileStreet;
import com.kh.wassupSeoul.street.model.vo.Keyword;

@SessionAttributes({ "loginMember", "msg", "myHobby", "myStreet","myStreetKeyword" })
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
			RedirectAttributes rdAttr, HttpServletRequest request, 
			@RequestParam(value="originProfileUrl" , required=false) MultipartFile originProfileUrl) 
	{

		String memberPhone = phone1 + "-" + phone2 + "-" + phone3;

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/" + "profileImage";
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdir();
 
		try {
			String newProfileImg = FileRename.renameProfile(originProfileUrl.getOriginalFilename());
			
			Member signUpMember = new Member(member.getMemberEmail(), member.getMemberPwd(), member.getMemberNm(),
					member.getMemberNickname(), memberPhone, member.getMemberGender(), member.getMemberAge(), newProfileImg);
			
			int result = memberService.signUp(signUpMember);
			
			System.out.println("signUpMember :" + signUpMember);
			
			String msg = null;

			if (result > 0) {
				 
				originProfileUrl.transferTo(new File(savePath+"/"+signUpMember.getMemberProfileUrl()));
				
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
				
				
				// 골목번호 배열
				int[] streetNoArr = new int[3];
				
				// 1) 해당 관심사 가져오기
				List<Hobby> myHobby = memberService.selectHobby(loginMember.getMemberNo());
				for(int k=0;k<myHobby.size();k++) {
					System.out.println(myHobby.get(k));
				}
				model.addAttribute("myHobby",myHobby);
				
				// 2) 해당 골목 가져오기
				List<ProfileStreet> myStreet = memberService.selectProfileStreet(loginMember.getMemberNo());
				for(int k=0;k<myStreet.size();k++) {
					System.out.println(myStreet.get(k));
				}
				
				// 골목 keyword에 사용할 컬렉션 선언
				List<Keyword> myStreetKeyword = new ArrayList<Keyword>(); 
				
				if(!myStreet.isEmpty()) {
					
					for(int i=0;i<myStreet.size();i++) {
						
						// 골목번호
						int streetNo = myStreet.get(i).getStreetNo();
						
						// 2_1) 골목대장 가져오기
						String StreetMaster = memberService.selectStreetMaster(streetNo);
						myStreet.get(i).setMemberNm(StreetMaster);
						streetNoArr[i] = streetNo; // 골목번호 구분용 배열
					}	
					
					// 2_2) 키워드 가져오기
					for(int i=0;i<streetNoArr.length;i++) {
						switch(i) {
						case 0: List<Keyword> myStreetKeyword1 = memberService.selectMyKeyword(streetNoArr[i]);
								myStreetKeyword.addAll(myStreetKeyword1);break;
						case 1: List<Keyword> myStreetKeyword2 = memberService.selectMyKeyword(streetNoArr[i]);
								myStreetKeyword.addAll(myStreetKeyword2);break; 						
						case 2: List<Keyword> myStreetKeyword3 = memberService.selectMyKeyword(streetNoArr[i]);
								myStreetKeyword.addAll(myStreetKeyword3);break;
						}
					}
					model.addAttribute("myStreetKeyword",myStreetKeyword);
					for(int g=0;g<myStreetKeyword.size();g++) {
						System.out.println("myStreetKeyword : " + myStreetKeyword.get(g));
					}
					for(int t=0;t<myStreet.size();t++) {
						System.out.println("내골목 : " + myStreet.get(t));
					}
					model.addAttribute("myStreet", myStreet);
					
				}
				//
				
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
		member.setMemberNm(name);
		member.setMemberPhone(phone);
		
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
	
	// 비밀번호 찾기
	@RequestMapping("findPassword")
	public String findPassword(String name, String phone, String email, Model model, 
			HttpServletResponse response, HttpServletRequest request) {
		Member member = new Member();
		
		member.setMemberNm(name);
		member.setMemberEmail(email);
		member.setMemberPhone(phone);
		
		
		try {
			String memberPassword = memberService.findPassword(member);
			
			if(memberPassword != null) { // 계정이 있으면 난수발생하여 DB상의 비밀번호 변경하기
				
				// 난수 비밀번호 생성
				Random rnd =new Random();
	            StringBuffer buf =new StringBuffer();
	            
	            for(int i=0;i<10;i++){
	                // rnd.nextBoolean() 는 랜덤으로 true, false 를 리턴. true일 시 랜덤 한 소문자를, false 일 시 랜덤 한 숫자를 StringBuffer 에 append 한다.
	                if(rnd.nextBoolean()){
	                    buf.append((char)((int)(rnd.nextInt(26))+97));
	                }else{
	                    buf.append((rnd.nextInt(10)));
	                }
	            }
	            System.out.println("난수 비밀번호 :" +  buf);
	            String randomPwd = buf.toString();
	            
	            Map<String, String> randomMap = new HashMap<String, String>();
	            
	            randomMap.put("randomPwd", randomPwd);
	            randomMap.put("email", email);
	            
	            int result = memberService.makeRandomPwd(randomMap);
				System.out.println("리저트값이다!!!: "+result);
				
				/* return new EmailController().sendEmail(model,request,randomMap); */
				App app = new App();
				app.sendEmail(randomMap);
				
				
			}else {
				PrintWriter out = response.getWriter();
				out.print(memberPassword);
			}
			
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
	
	// 회원 탈퇴 페이지 이동
	@RequestMapping("deleteForm")
	public String deleteForm() {
		return "member/secession";
	} 
		
	// 회원 수정 페이지 이동
	@RequestMapping("updateForm")
	public String updateForm(Model model) {
		return "member/updateForm";
	} 
	
	// 현재비밀번호 일치 검사
	@ResponseBody
	@RequestMapping(value="beforePwdCheck", method = RequestMethod.POST)
	public String beforePwdCheck(String beforePwd,int memberNo,Model model) {
		try {	
			return memberService.beforePwdCheck(beforePwd,memberNo) == 1 ? true+"" : false+"";
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg","현재 비밀번호 확인 과정에서 오류 발생");
			return "common/errorPage";
		}
	}
	
	// 관심사 검색 조회
	@ResponseBody
	@RequestMapping("searchHobby")
	public void searchHobby(HttpServletResponse response,String searchHobbyContent) {
		try {
			System.out.println("검색관심사 : " + searchHobbyContent);
			
			// 검색 결과 전송용 리스트
			ArrayList<SearchHobby> searchHobbyList = new ArrayList<SearchHobby>();
			
			// DB조회용 리스트
			List<Hobby> hobbyList = memberService.searchHobby(searchHobbyContent);
			for(int b=0;b<hobbyList.size();b++) {
				System.out.println(hobbyList.get(b));
			}
			
			for(int i=0;i<hobbyList.size();i++) {
				SearchHobby temp = new SearchHobby(); // 임시 저장
				int count = memberService.selectHobbyCount(hobbyList.get(i).getHobbyName());
				
				// 전송할 관심사 정보 객체 저장
				temp.setHobbyNo(hobbyList.get(i).getHobbyNo());
				temp.setHobbyNm(hobbyList.get(i).getHobbyName());
				temp.setHobbyCount(count);
				
				searchHobbyList.add(temp);
			}
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(searchHobbyList, response.getWriter());
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원 정보 수정
		@RequestMapping(value="update", method = RequestMethod.POST)
		public String updateMember(String phone1,String phone2,String phone3,String memberNickname,
								   @RequestParam(value="memberProfileUrl", required=false) MultipartFile memberProfileUrl,
								   @RequestParam(value="newPwd", required=false) String newPwd,
								   @RequestParam(value="maintainPwd", required=false) String maintainPwd,
								   int[] hobbyNoArr, String[] hobbyNmArr,
								   Model model, HttpServletRequest request) {
			try {
				Member member = (Member)model.getAttribute("loginMember");
				
				// 닉네임 변경
				member.setMemberNickname(memberNickname);
				
				
				// 전화번호 변경
				String memberPhone = phone1 + "-" + phone2 + "-" + phone3;
				member.setMemberPhone(memberPhone);
				
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "/" + "profileImage";
				File folder = new File(savePath);
				if(!folder.exists()) folder.mkdir();
				
				// 프로필사진 변경
				if(!memberProfileUrl.getOriginalFilename().equals("")) {
					String updateProfileUrl = FileRename.rename(memberProfileUrl.getOriginalFilename());
					member.setMemberProfileUrl(updateProfileUrl);
					
				} 
				
				// 비밀번호 변경
				int flag = 0;
				if(maintainPwd != null) {
					String memberPwd = memberService.selectMemberPwd(member.getMemberNo());
					member.setMemberPwd(memberPwd);
					flag = 0;
				} else {
					member.setMemberPwd(newPwd);
					flag = 1;
				}
				
				// 1)Member 테이블 update
				int result = memberService.updateMember(member,flag);
				
				if(result > 0)	{
					//model.addAttribute("msg","회원정보 수정 성공");
					String memberPwd = memberService.selectMemberPwd(member.getMemberNo());
					member.setMemberPwd(memberPwd);
					// 파일을 서버에 저장
					if(!memberProfileUrl.getOriginalFilename().equals("")) {
						memberProfileUrl.transferTo(new File(savePath+"/"+member.getMemberProfileUrl()));
					}
					// 수정된 회원정보 조회 후 session저장
					model.addAttribute("loginMember",member);
				
				// 2)Member_Hobby , Hobby 테이블 update -> 중복된 값, 새로 추가된 값 구별하여 추가
					List<Hobby> myHobby = new ArrayList<Hobby>(); // session에 저장할 값
					List<MemberHobby> changeHobby = new ArrayList<MemberHobby>(); // MEMBER_HOBBY에 저장할때 사용하는 리스트
					
					// 새로 추가된 관심사가 있는 경우 관심사 추가 및 해당하는 hobbyNo얻기
					for(int i=0;i<hobbyNoArr.length;i++) {
						if(hobbyNoArr[i] == 0) {
							// 새로 추가된 관심사를 hobby 테이블에 추가
							String tempHobbyName = hobbyNmArr[i].substring(1);
							int addResult = memberService.insertHobby(tempHobbyName);
							if(addResult > 0) { // 추가 성공
								// 해당하는 hobbyNo얻기 
								int hobbyNo = memberService.getInsertHobbyNo(tempHobbyName);
								hobbyNoArr[i] = hobbyNo;
								System.out.println("추가한 관심사의 관심사번호 : " + hobbyNo);
							} else {
								model.addAttribute("msg","관심사 추가 실패");
								return "redirect:/";
							}
							
						}
					}
					
					for(int i=0;i<hobbyNoArr.length;i++) {
						MemberHobby temp = new MemberHobby(member.getMemberNo(), hobbyNoArr[i]);
						changeHobby.add(temp);
					}
					
					// 기존 관심사 모두 제거(MEMBER_HOBBY 테이블)
					int result1 = memberService.deleteMemberHobby(member.getMemberNo());
					// 변경된 관심사 모두 추가(MEMBER_HOBBY 테이블)
					if(result1 > 0) {
						result1 = memberService.updateMemberHobby(changeHobby);
						if(result1 > 0) {
							
							for(int i=0;i<hobbyNmArr.length;i++) {
								// 변경된 hobby들 저장
								String tempHobbyName = hobbyNmArr[i].substring(1);
								System.out.println("관심사 : " +tempHobbyName);
								Hobby temp = new Hobby(hobbyNoArr[i],tempHobbyName);
								myHobby.add(temp);
							}
							
							model.addAttribute("myHobby",myHobby);
							//model.addAttribute("msg","관심사 수정 성공");
						} else {
							model.addAttribute("msg","관심사 수정 실패");
							return "redirect:/";
						}
					} else {
						model.addAttribute("msg","관심사 삭제 과정 실패");
						return "redirect:/";
					}
							
				}
				else {
					model.addAttribute("msg","회원정보 수정 실패");
					return "redirect:/";
				}
				
				model.addAttribute("msg","회원정보 수정 성공");
				return "redirect:updateForm";
				
			} catch(Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMsg","회원 정보 수정과정 중 오류 발생");
				return "common/errorPage";
			}
			
		}
	
	// 직접 입력한 관심사 중복 조회
	@ResponseBody
	@RequestMapping("hobbyDupCheck")
	public String hobbyDupCheck(String hobbyName) {
		Hobby hobby = memberService.hobbyDupCheck(hobbyName);
		System.out.println("직접입력 : " + hobby);
		if(hobby != null)	{
			return hobby.getHobbyNo()+"";
		}
		else {
			return "0";
		}
	}
	
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // 컨트롤러 종료