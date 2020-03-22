package com.kh.wassupSeoul.street.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import com.kh.wassupSeoul.friends.model.vo.Relationship;
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


	// -------------------------------------------- 중하 ---------------------------------------------
	
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
	public List<Board> selectBoard(Member loginMember) throws Exception {
		return streetDAO.selectBoard(loginMember);
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

	/** 게시글 삭제용 Service
	 * @param postNo
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int deletePost(int postNo) throws Exception {
		return streetDAO.deletePost(postNo);
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


	
	/** 댓글 조회용 
	 * @param postNo
	 * @return list
	 */
	@Override
	public List<Reply> selectReply(Member loginMember)  {
		return streetDAO.selectReply(loginMember);
	}
	
	
	/** 작성자 회원 프로필 조회용
	 * @param memberNo
	 * @return member
	 * @throws Exception
	 */
	@Override
	public Member checkProfile(int memberNo) throws Exception {
		return streetDAO.checkProfile(memberNo);
	}
	
		
	// -------------------------------------------- 중하 끝  ---------------------------------------------
	


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
	public List<Member> selectJuminList(Map<String, Object> map) throws Exception {
		return streetDAO.selectJuminList(map);
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
	
	/** 골목 개설용 Service2
	 * @param changeCoverName
	 * @param street
	 * @param memberNo
	 * @param streetKeywords
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int insertStreet2(String changeCoverName, Street street, int memberNo, String[] streetKeywords)
			throws Exception {
		
		int result = 0;
		int imgNo = 0;
		int streetNo = 0;
		Map<String, Object> map = null;
		Map<String, Object> map2 = null;
		
		imgNo = streetDAO.selectCoverNextNo();
		
		if(imgNo > 0) {
			
			map = new HashMap<String, Object>();
			map.put("imgNo", imgNo);
			map.put("changeCoverName", changeCoverName);
			
			result = streetDAO.insertStreetCover(map);
			
			if(result > 0) {
				street.setImgNo(imgNo);				
				streetNo = streetDAO.selectStreetNextNo();				
				street.setStreetNo(streetNo);				
				result = streetDAO.insertStreet(street);
				
				if(result > 0) {
					// 골목 대장 정보 저장
					map = new HashMap<String, Object>();
					map.put("memberNo", memberNo);
					map.put("streetNo", street.getStreetNo());
					
					result = streetDAO.insertStreetMaster(map);
					
					if(result > 0 && streetKeywords != null) {
						for (int i = 0; i < streetKeywords.length; i++) {

							map2 = new HashMap<String, Object>();
							map2.put("streetNo", street.getStreetNo());
							map2.put("keyword", streetKeywords[i]);
							
							result = streetDAO.insertStreetKeyword(map2); 

						}
					}
				}
			}
		} 	
		
		if(result > 0) {
			result = streetNo;			
		}
		return result;		
	}
	
	
	/** 골목 개설용 Service1
	 * @param street
	 * @param memberNo
	 * @param streetKeywords
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int insertStreet1(Street street, int memberNo, String[] streetKeywords) throws Exception {
		int streetNo = 0;
		int result = 0;
		Map<String, Object> map = null;
		Map<String, Object> map2 = null;
		
		streetNo = streetDAO.selectStreetNextNo();				
		street.setStreetNo(streetNo);	
		
		if(streetNo > 0) {
			
			result = streetDAO.insertStreet(street);
			
			if(result > 0) {
				// 골목 대장 정보 저장
				map = new HashMap<String, Object>();
				map.put("memberNo", memberNo);
				map.put("streetNo", street.getStreetNo());
				
				result = streetDAO.insertStreetMaster(map);
			}	
		}
		
		if(result > 0 && streetKeywords != null) {
			map2 = new HashMap<String, Object>();
			map2.put("streetNo", street.getStreetNo());
			for (int i = 0; i < streetKeywords.length; i++) {

				map2.put("keyword", streetKeywords[i]);
				
				result = streetDAO.insertStreetKeyword(map2); 
			}
		}
		
		if(result > 0) {
			result = streetNo;
		}			
			return result;			
	}
	

	@Override
	public int fileUpload(Board board, MultipartFile file, HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	/** 관계(친구신청, 친구, 숨김, 차단) 추가용 Service
	 * @param addRelation
	 * @return result
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int addRelation(Relationship addRelation){
		return streetDAO.addRelation(addRelation);
	}
	
	
	/*------------------------------태훈 시작 (03/22) -------------------------------*/
	/** 골목 가입신청 허가용 Service
	 * @param map
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void joinCheck(Map<String, Object> map) {
		streetDAO.joinCheck(map);
	}
	
	/** 골목 가입신청 거절용 Service
	 * @param map
	 */
	@Override
	public void joinDelete(Map<String, Object> map) {
		streetDAO.joinDelete(map);
	}
	
	/*--------------------------------태훈 끝-------------------------------------*/
}
