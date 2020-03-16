package com.kh.wassupSeoul.street.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.street.model.dao.StreetDAO;
import com.kh.wassupSeoul.street.model.vo.Board;
import com.kh.wassupSeoul.street.model.vo.Street;

@Service
public class StreetServiceImpl implements StreetService{

	
	@Autowired
	private StreetDAO streetDAO;


	/** 골목 조회용 service
	 * @return street
	 * @throws Exception
	 */
	@Override
	public Street selectStreet(Integer streetNo) throws Exception {
		return streetDAO.selectStreet(streetNo);
	}

	/** 골목 게시글 조회용 service
	 * @param streetNo
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<Board> selectBoard(Integer streetNo) throws Exception {
		return streetDAO.selectBoard(streetNo);
	}

	
	/** 게시글 등록용 Service
	 * @param board
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor= Exception.class)
	@Override
	public int insertBoard(Board board) throws Exception {
		return streetDAO.insertBoard(board);
	}

	/** 좋아요 기록용 Service
	 * @param postNo
	 * @param loginMember
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int likeCheck( Member loginMember) throws Exception {
		String result = streetDAO.likeCheck(loginMember);
		int result2 = 0;
		
		System.out.println("serviceImple 체크결과 기존기록  : "+result);
		// 좋아요 기록안되어 있을시 기록 
		if( result == null) {
			
			result2 = streetDAO.recordLike(loginMember);
			
			return result2 = 1;
			
		// 좋아요 Y로 기록시 N으로 업데이트 	
		} else if( result.equals("Y")) {
			
			// loginMember 활용
			loginMember.setMemberNm("N");
			result2 = streetDAO.updateLike(loginMember);
			
			return result2 = 0;
			
		// 좋아요 N으로 기록시 Y로 업데이트 	
		} else {
			
			// loginMember 활용
			loginMember.setMemberNm("Y");
			result2 = streetDAO.updateLike(loginMember);
			
			return result2 = 1;
		}
		
	}

	/** 좋아요, 댓글수 조회용
	 * @param postNo
	 * @return board
	 * @throws Exception
	 */
	@Override
	public int[] checkLikeReplyNum(int postNo) throws Exception {
		return streetDAO.checkLikeReplyNum(postNo);
	}
	
	
	
	
	
	
	
	
}
