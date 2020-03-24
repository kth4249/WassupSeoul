package com.kh.wassupSeoul.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.street.model.service.StreetService;
import com.kh.wassupSeoul.street.model.vo.Keyword;
import com.kh.wassupSeoul.street.model.vo.Reply;
import com.kh.wassupSeoul.street.model.vo.Street;
import com.kh.wassupSeoul.street.model.vo.StreetJoin;

public class StreetInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	private StreetService streetService;
	
	// StreetController 보다 먼저 수행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		return super.preHandle(request, response, handler);
	}
	
	// StreetController가 수행 되고 이후 화면 출력전 수행
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();
		int streetNo = (int) session.getAttribute("streetNo");
		Member loginMember = (Member)session.getAttribute("loginMember");

		try {
			// 사이드바 정보 시작
			// 1. 골목정보
			Street street = streetService.selectStreet(streetNo);
			// 1_1. 골목 썸네일 
			String imgUrl = streetService.selectImgUrl(street.getImgNo());
			//street.setImgUrl(imgUrl);
			request.setAttribute("imgUrl", imgUrl);
			// 2. 현재 골목 주민수 
			int citizenCount = streetService.selectCitizenCount(streetNo);
			request.setAttribute("citizenCount",citizenCount);
			// 3. 현재 골목 골목대장 닉네임
			String streetMasterNm = streetService.selectStreetMasterNm(streetNo);
			request.setAttribute("streetMasterNm",streetMasterNm);
			// 4. 현재 골목 키워드
			List<Keyword> streetKeyword = streetService.selectMyKeyword(streetNo);
			request.setAttribute("streetKeyword",streetKeyword);
			// 5. 현재 골목 등급
			String badgeUrl = streetService.selectBadgeUrl(streetNo, street.getStreetPoint());
			request.setAttribute("badgeUrl",badgeUrl);
			// 6. 로그인 회원 골목 등급 
			String citizenGrade = streetService.selectCitizenGrade(loginMember.getMemberNo(),streetNo);
			request.setAttribute("citizenGrade",citizenGrade);
			// 7. 로그인 회원 골목 가입 여부
			Reply checkStreet = new Reply();
			checkStreet.setStreetNo(streetNo);
			checkStreet.setMemberNo(loginMember.getMemberNo());
			StreetJoin tempStreetJoin = streetService.memGradeInSt(checkStreet);
			String citizenStatus; // 로그인 회원의 골목 가입여부 파악
			if(tempStreetJoin == null) { // 골목 미가입
				citizenStatus = null;
			} else { // 골목 가입
				citizenStatus = tempStreetJoin.getCitizenStatus();
			}
			
			request.setAttribute("citizenStatus", citizenStatus);
			request.setAttribute("street", street);
			// 사이드바 정보 끝
			
			super.postHandle(request, response, handler, modelAndView);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	
}
