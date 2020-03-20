package com.kh.wassupSeoul.street.model.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.street.model.vo.Board;
import com.kh.wassupSeoul.street.model.vo.Count;
import com.kh.wassupSeoul.street.model.vo.Reply;
import com.kh.wassupSeoul.street.model.vo.Street;

@Service
public interface StreetService {

	/** 골목 조회용 service
	 * @param streetNo 
	 * @return street
	 * @throws Exception
	 */
	public abstract Street selectStreet(Integer streetNo) throws Exception;

	
	/** 골목 게시글 조회용 service
	 * @param streetNo
	 * @return list
	 * @throws Exception
	 */
	public abstract List<Board> selectBoard(Integer streetNo) throws Exception;


	/** 게시글 등록용 Service
	 * @param board
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertBoard(Board board) throws Exception ;


	/** 좋아요 기록용 Service
	 * @param loginMember
	 * @return result
	 * @throws Exception
	 */
	public abstract int likeCheck(Member loginMember) throws Exception;


	/** 좋아요, 댓글수 조회용
	 * @param postNo
	 * @return board
	 * @throws Exception
	 */
	public abstract int[] checkLikeReplyNum(int postNo) throws Exception;


	/** 게시글 삭제용 Service
	 * @param postNo
	 * @return result
	 * @throws Exception
	 */
	public abstract int deletePost(int postNo) throws Exception;


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

	
	/** 골목 개설용 Service1
	 * @param changeCoverName
	 * @param street
	 * @param memberNo
	 * @param streetKeywords
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertStreet1(String changeCoverName, Street street, int memberNo, String[] streetKeywords) throws Exception;





	/** 회원 관심사 조회용 Service (memberMapper에서)
	 * @param memberNo
	 * @return myHobby
	 * @throws Exception
	 */
	public abstract List<Hobby> selectHobby(int memberNo) throws Exception;

	
	/**	댓글 입력용 Service
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public abstract int writeComment(Reply reply) throws Exception;




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


	/** 골목 개설용 Service2
	 * @param street
	 * @param memberNo
	 * @param streetKeywords
	 * @return result
	 * @throws Exception
	 */
	public abstract int insertStreet2(Street street, int memberNo, String[] streetKeywords) throws Exception;
  
  
  /** 추천 친구 리스트 조회용 Service
	 * @param map
	 * @return mList
	 * @throws Exception
	 */
	public abstract List<Member> selectRecommendList(Map<String, Object> map) throws Exception;




	/** 추천 친구 주민별 관심사 조회용 Service
	 * @param mList
	 * @return hList
	 * @throws Exception
	 */
	public abstract List<Hobby> selectHobbyList(List<Member> mList) throws Exception;


	/** 좋아요 개수 조회용 
	 * @param streetNo
	 * @return result
	 * @throws Exception
	 */
	public abstract List<Count> thumbCount(Integer streetNo) throws Exception ;


	/** 댓글 개수 조회용 
	 * @param streetNo
	 * @return result
	 * @throws Exception
	 */
	public abstract List<Count> replyCount(Integer streetNo) throws Exception;


	/** 댓글 조회용 
	 * @param postNo
	 * @return list
	 */
	public abstract List<Reply> selectReply(int postNo);
	/**
	 * @param board
	 * @param file
	 * @param request
	 * @param response
	 * @return 
	 */
	public abstract int fileUpload(Board board, MultipartFile file, HttpServletRequest request,
			HttpServletResponse response);



	 
}
