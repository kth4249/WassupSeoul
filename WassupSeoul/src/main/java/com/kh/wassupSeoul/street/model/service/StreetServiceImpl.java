package com.kh.wassupSeoul.street.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.street.model.dao.StreetDAO;
import com.kh.wassupSeoul.street.model.vo.Board;
import com.kh.wassupSeoul.street.model.vo.Reply;
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

	/** 게시글 삭제용 Service
	 * @param postNo
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int deletePost(int postNo) throws Exception {
		return streetDAO.deletePost(postNo);
	}
	
	
/** 골목 가입용 Service
	 * @param map
	 * @return result
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int streetJoin(Map<String, Object> map) {
		return streetDAO.streetJoin(map);
	}
	
	
	
	/** 회원 관심사 조회용 Service (memberMapper에서)
	 * @param memberNo
	 * @return myHobby
	 * @throws Exception
	 */
	@Override
	public List<Hobby> selectHobby(int memberNo) throws Exception {
		return streetDAO.selectHobby(memberNo);
	}
	
	
	/** 추천 친구 리스트 조회용 Service
	 * @param map
	 * @return mList
	 * @throws Exception
	 */
	@Override
	public List<Member> selectRecommendList(Map<String, Object> map) throws Exception {
		return streetDAO.selectRecommendList(map);
	}
	
	
	/** 회원 가입한 골목 수 조회용 Service
	 * @param memberNo
	 * @return myStreetCount
	 * @throws Exception
	 */
	@Override
	public int myStreetCount(int memberNo){
		return streetDAO.myStreetCount(memberNo);
	}
	
	
	
	/** 추천 친구 주민별 관심사 조회용 Service
	 * @param mList
	 * @return hList
	 * @throws Exception
	 */
	@Override
	public List<Hobby> selectHobbyList(List<Member> mList) throws Exception {
		return streetDAO.selectHobbyList(mList);
	}
	
	
	/** 골목 개설 화면 이동용 Service
	 * @param memberNo
	 * @return result
	 * @throws Excepction
	 */
	@Override
	public int selectMyStreet(int memberNo) throws Exception {
		
		int result = 0;
		
		result = streetDAO.selectMyStreet(memberNo); 
				
		if(result < 3) { // 골목 가입한게 3개 미만일 경우
			
			result = streetDAO.selectStreetMaster(memberNo);
			
			if(result == 0) return 1; // 골목 개설한게 없는 경우
			else return -1;
			
		} else {
			return -1;
		}
		
		// 이거 나중에 다시하자!!!!! 
		
	}
	
	/** 골목 개설용 Service
	 * @param changeCoverName
	 * @param street
	 * @param memberNo
	 * @param streetKeywords
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int insertStreet(String changeCoverName, Street street, int memberNo, String[] streetKeywords)
			throws Exception {
		
		int result = 0;
		int imgNo = 0;
		int streetNo = 0;
		Map<String, Object> map = null;
		Map<String, Object> map2 = null;
		
		
		if(changeCoverName != null) { // 새로 등록한 커버일 경우
			
			imgNo = streetDAO.selectCoverNextNo(); // 성공
						
			if(imgNo > 0) {
				// 골목 커버 정보 저장
				//result = streetDAO.insertStreetCover(changeCoverName); // 성공
							
				if(result == 0) { // 잠깐 result > 0 && !street.isEmpty()
					
					// 골목 정보 저장
					street.setImgNo(imgNo); // 성공
					
					streetNo = streetDAO.selectStreetNextNo(); // 성공	
					
					street.setStreetNo(streetNo); // 성공
					
					//result = streetDAO.insertStreet(street);
					
					if(streetNo > 0) { // (result > 0)
						
						// 골목 대장 정보 저장
						map = new HashMap<String, Object>();
						map.put("memberNo", memberNo);
						map.put("streetNo", street.getStreetNo());
						
						System.out.println("map 확인 : " + map);
						
						// result = streetDAO.insertStreetMaster(map);
						
						if(streetKeywords != null) {
							for (int i = 0; i < streetKeywords.length; i++) {

								map2 = new HashMap<String, Object>();
								map2.put("streetNo", street.getStreetNo());
								map2.put("keyword", streetKeywords[i]);
								
								System.out.println("map2 확인 : "+ map2);

								//result = streetDAO.insertStreetKeyword(map);

							}
						}
					}
				}
				
			} else {
				
				return -1;
				
			}
			
		} else {
			
			// imgNo = streetDAO.selectSampleImgNo(imgName);
			street.setImgNo(imgNo);
			//streetNo = streetDAO.selectStreetNextNo()
			street.setStreetNo(streetNo);
			
		}
		
		
		
		
		return 0;
	}
	
	
	
	
	/**	댓글 입력용 Service
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int writeComment(Reply reply) throws Exception {
		return streetDAO.writeComment(reply);
	}
	
	
	
}
