
package com.kh.wassupSeoul.street.model.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.wassupSeoul.friends.model.vo.Relationship;
import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.square.model.vo.Alarm;
import com.kh.wassupSeoul.street.model.vo.Board;
import com.kh.wassupSeoul.street.model.vo.Calendar;
import com.kh.wassupSeoul.street.model.vo.Keyword;
import com.kh.wassupSeoul.street.model.vo.Reply;
import com.kh.wassupSeoul.street.model.vo.Street;
import com.kh.wassupSeoul.street.model.vo.StreetJoin;

@Service
public interface StreetService {

	
	// -------------------------------------------- 중하  ---------------------------------------------
	
	/** 골목 조회용 service
	 * @param streetNo 
	 * @return street
	 * @throws Exception
	 */
	public abstract Street selectStreet(Integer streetNo) throws Exception;

	/** 회원 골목 등급 조회
	 * @param checkStreet
	 * @return memGradeInSt
	 * @throws Exception
	 */
	public abstract StreetJoin memGradeInSt(Reply checkStreet) throws Exception;
	
	/** 골목 게시글 조회용 service
	 * @param checkStreet
	 * @return list
	 * @throws Exception
	 */
	public abstract List<Board> selectBoard(Reply checkStreet) throws Exception;


	/** 게시글 등록용 Service
	 * @param board
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertBoard(Board board) throws Exception ;


	/** 좋아요 기록용 Service
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public abstract int likeCheck(Reply reply) throws Exception;
	
	/** 댓글 좋아요 기록용 
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public abstract int replyLikeFunction(Reply reply) throws Exception;
	
	/** 대댓글 좋아요 등록용 Service
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public abstract int reReplyLikeFunction(Reply reply) throws Exception;


	/** 게시글 삭제용 Service
	 * @param postNo
	 * @return result
	 * @throws Exception
	 */
	public abstract int deletePost(int postNo) throws Exception;
	
	/**	댓글 입력용 Service
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public abstract int writeComment(Reply reply) throws Exception;
	
	/** 대댓글 입력용 Service
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public abstract int writeReComment(Reply reply) throws Exception;
	
	/** 댓글 조회용 
	 * @param checkStreet
	 * @return list
	 */
	public abstract List<Reply> selectReply(Reply checkStreet);
	
	/** 회원 프로필 조회용
	 * @param memberNo
	 * @return member
	 * @throws Exception
	 */
	public abstract Member checkProfile(int memberNo) throws Exception;
	
	/** 지도 게시글 업로드 Service
	 * @param board
	 * @return result
	 * @throws Exception
	 */
	public abstract int mapPost(Board board)throws Exception;


	// -------------------------------------------- 중하 끝  ---------------------------------------------
	

	/** 골목 가입용 Service
	 * @param map
	 * @return result
	 */
	public abstract int streetJoin(Map<String, Object> map);

	
	
	
	/** 골목 개설 화면 이동용 Service
	 * @param memberNo
	 * @return result
	 * @throws Excepction
	 */
	public abstract int selectMyStreet(int memberNo) throws Exception;

	
	/** 골목 개설용 Service
	 * @param changeCoverName
	 * @param street
	 * @param memberNo
	 * @param streetKeywords
	 * @return result
	 * @throws Exception
	 */
	//public abstract int insertStreet(String changeCoverName, Street street, int memberNo, String[] streetKeywords) throws Exception;


	/** 회원 관심사 조회용 Service (memberMapper에서)
	 * @param memberNo
	 * @return myHobby
	 * @throws Exception
	 */
	public abstract List<Hobby> selectHobby(int memberNo) throws Exception;


	
	/** 추천 친구 리스트 조회용 Service
	 * @param map
	 * @return mList
	 * @throws Exception
	 */
	public abstract List<Member> selectJuminList(Map<String, Object> map) throws Exception;


	/** 회원 가입한 골목 수 조회용 Service
	 * @param memberNo
	 * @return myStreetCount
	 */
	public abstract int myStreetCount(int memberNo);


	/** 추천 친구 주민별 관심사 조회용 Service
	 * @param mList
	 * @return hList
	 * @throws Exception
	 */
	public abstract List<Hobby> selectHobbyList(List<Member> mList) throws Exception;


	/** 관계(친구신청, 친구, 숨김, 차단) 추가용 Service
	 * @param addRelation
	 * @return result
	 */
	public abstract int addRelation(Relationship addRelation);

  
  /** 골목 개설용 Service2
	 * @param changeCoverName
	 * @param street
	 * @param memberNo
	 * @param streetKeywords
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertStreet2(String changeCoverName, Street street, int memberNo, String[] streetKeywords) throws Exception;




	/** 골목 개설용 Service1
	 * @param street
	 * @param memberNo
	 * @param streetKeywords
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertStreet1(Street street, int memberNo, String[] streetKeywords) throws Exception;
  

	
	/** 썸머노트 업로드,DB삽입용
	 * @param board
	 * @param file
	 * @param request
	 * @param response
	 * @return result
	 * @throws Exception
	 */
	public abstract String fileUpload(Board board, MultipartFile file, HttpServletRequest request) throws Exception;

	/*-----------------------------태훈 시작 (03/22) -------------------------------*/
	/** 골목 가입신청 허가용 Service
	 * @param map
	 */
	public abstract void joinCheck(Map<String, Object> map);




	
	/** 골목 가입신청 거절용 Service
	 * @param map
	 */
	public abstract void joinDelete(Map<String, Object> map);


	/** 골목 대장 번호 조회용 Service(알림용)
	 * @param streetNo
	 * @return masterNo
	 */
	public abstract int selectMasterNo(int streetNo);


	/** 가입신청 알람 삽입용 Service
	 * @param alarm
	 * @return result
	 */
	public abstract int insertAlarm(Alarm alarm);

  
  

	/*--------------------------------태훈 끝-------------------------------------*/
	
	
	
	/* 지원 골목 수정 시작 */
	
	/** 골목 수정 이미지 조회용 Service
	 * @param imgNo
	 * @return imgUrl
	 * @throws Exception
	 */
	public abstract String selectImageUrl(int imgNo) throws Exception;


	/** 골목 수정 키워드 조회용 Service
	 * @param no
	 * @return kList
	 * @throws Exception
	 */
	public abstract List<Keyword> selectKeywords(Integer no) throws Exception;


	/** 골목 수정용 Service1
	 * @param street
	 * @param streetKeywords
	 * @return result
	 * @throws Exception
	 */
	public abstract int updateStreet1(Street street, String[] streetKeywords) throws Exception;


	/** 골목 수정용 Service2
	 * @param street
	 * @param streetKeywords
	 * @param changeCoverName
	 * @return result
	 * @throws Exception
	 */
	public abstract int updateStreet2(Street street, String[] streetKeywords, String changeCoverName) throws Exception;
	
	
	
	
	
	
	
	
	/* 지원 골목 수정 끝 */
/*------------------------ 정승환 추가코드 시작-----------------------------------*/
	
	/** 현재 골목 주민수 조회용 Service
	 * @param streetNo
	 * @return citizenCount
	 * @throws Exception
	 */
	public abstract int selectCitizenCount(int streetNo) throws Exception;

	
	/** 현재 골목 골목대장 닉네임 조회용 Service
	 * @param streetNo
	 * @return streetMasterNm
	 * @throws Exception
	 */
	public abstract String selectStreetMasterNm(int streetNo) throws Exception;
	
	/** 골목 키워드 조회용 Service
	 * @param streetNo
	 * @return keyword
	 * @throws Exception
	 */
	public abstract List<Keyword> selectMyKeyword(int streetNo) throws Exception;


	/** 현재 골목 등급 조회용 Service
	 * @param streetPoint
	 * @return badgeUrl
	 * @throws Exception
	 */
	public abstract String selectBadgeUrl(int streetNo, int streetPoint) throws Exception;


	/** 로그인 회원 골목 등급 조회용 Service
	 * @param memberNo
	 * @param streetNo
	 * @return citizenGrade
	 * @throws Exception
	 */
	public abstract String selectCitizenGrade(int memberNo, int streetNo) throws Exception;


	/** 골목 썸네일 조회용 Service
	 * @param imgNo
	 * @return imgUrl
	 * @throws Exception
	 */
	public abstract String selectImgUrl(int imgNo) throws Exception;


	/** 게시판 번호 조회용 Serivce
	 * @return boardNo
	 * @throws Exception
	 */
	public abstract int selectBoardNo() throws Exception;


	/** 일정 등록용 Serivce
	 * @param sendCalendar
	 * @return result
	 * @throws Exception
	 */
	public abstract int addSchedule(Calendar sendCalendar) throws Exception;


	
/*------------------------ 정승환 추가코드 끝-----------------------------------*/
	 
}
