package com.kh.wassupSeoul.street.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

<<<<<<< HEAD
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.street.model.vo.Board;
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
=======
import com.kh.wassupSeoul.street.model.vo.Board;
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
>>>>>>> branch 'master' of https://github.com/kth4249/WassupSeoul.git
	 
}
