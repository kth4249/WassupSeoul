package com.kh.wassupSeoul.street.model.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.wassupSeoul.friends.model.vo.Relationship;
import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.street.model.dao.StreetDAO;
import com.kh.wassupSeoul.street.model.vo.Board;
import com.kh.wassupSeoul.street.model.vo.Calendar;
import com.kh.wassupSeoul.street.model.vo.Keyword;
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
	public List<Board> selectBoard(Reply checkStreet) throws Exception {
		return streetDAO.selectBoard(checkStreet);
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
	public int likeCheck( Reply reply) throws Exception {
		System.out.println("serviceImple boardNo 확인 : " + reply.getBoardNo());
		System.out.println("serviceImple boardNo 확인 : " + reply.getMemberNo());
		
		String result = streetDAO.likeCheck(reply);
		int result2 = 0;
		
		System.out.println("serviceImple 체크결과 기존기록  : "+result);
		// 좋아요 기록안되어 있을시 기록 
		if( result == null) {
			
			result2 = streetDAO.recordLike(reply);
			
			return result2 = 1;
			
		// 좋아요 Y로 기록시 N으로 업데이트 	
		} else if( result.equals("Y")) {
			
			// loginMember 활용
			reply.setThumbStatus("N");
			result2 = streetDAO.updateLike(reply);
			
			return result2 = 0;
			
		// 좋아요 N으로 기록시 Y로 업데이트 	
		} else {
			
			// loginMember 활용
			reply.setThumbStatus("Y");
			result2 = streetDAO.updateLike(reply);
			
			return result2 = 1;
		}
		
	}
	
	/** 댓글 좋아요 기록용 
	 * @param loginMember
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int replyLikeFunction(Reply reply) throws Exception {
		String result = streetDAO.replyLikeFunction(reply);
		int result2 = 0;
		
		System.out.println("serviceImple 체크결과 기존기록  : "+result);
		
		// 좋아요 기록안되어 있을시 기록 
		if( result == null) {
			
			result2 = streetDAO.recordReplyLike(reply);
			
			return result2 = 1;
			
		// 좋아요 Y로 기록시 N으로 업데이트 	
		} else if( result.equals("Y")) {
			
			// loginMember 활용
			reply.setThumbStatus("N");
			result2 = streetDAO.updateReplyLike(reply);
			
			return result2 = 0;
			
		// 좋아요 N으로 기록시 Y로 업데이트 	
		} else {
			
			// loginMember 활용
			reply.setThumbStatus("Y");
			result2 = streetDAO.updateReplyLike(reply);
			
			return result2 = 1;
		}
		
	}

	/** 대댓글 좋아요 등록용 Service
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int reReplyLikeFunction(Reply reply) throws Exception {
		String result = streetDAO.reReplyLikeFunction(reply);
		int result2 = 0;
		
		System.out.println("serviceImple 체크결과 기존기록  : "+result);
		
		// 좋아요 기록안되어 있을시 기록 
		if( result == null) {
			
			result2 = streetDAO.recordReReplyLike(reply);
			
			return result2 = 1;
			
		// 좋아요 Y로 기록시 N으로 업데이트 	
		} else if( result.equals("Y")) {
			
			// loginMember 활용
			reply.setThumbStatus("N");
			result2 = streetDAO.updateReReplyLike(reply);
			
			return result2 = 0;
			
		// 좋아요 N으로 기록시 Y로 업데이트 	
		} else {
			
			// loginMember 활용
			reply.setThumbStatus("Y");
			result2 = streetDAO.updateReReplyLike(reply);
			
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

	
	/** 대댓글 입력용 Service
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int writeReComment(Reply reply) throws Exception {
		return streetDAO.writeReComment(reply);
	}


	/** 댓글 조회용 
	 * @param postNo
	 * @return list
	 */
	@Override
	public List<Reply> selectReply(Reply checkStreet)  {
		return streetDAO.selectReply(checkStreet);
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
	@Transactional(rollbackFor = Exception.class)
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
	@Transactional(rollbackFor = Exception.class)
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
	
	/*==========================================미현 시작 3/23 ============================*/
	
	/** 썸머노트 업로드,DB삽입용
	 * @param board
	 * @param file
	 * @param request
	 * @param response
	 * @return result
	 * @throws IOException 
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public String fileUpload(Board board, MultipartFile file, HttpServletRequest request) throws Exception{
		
		//response.setContentType("text/html;charset=utf-8");
		//PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("resources") + "/uploadImage";
		String accessPath = request.getContextPath() + "/resources/uploadImage";
		UUID uuid = UUID.randomUUID();

		System.out.println("realFolder : " + realFolder);
		System.out.println("accessPath : " + accessPath);
		
		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;
		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);
		
		System.out.println("작성자명 : " + board.getMemberNo());
		
		String writer = board.getBoardWriter();	
		
		
		String filepath1 = realFolder + "\\" + writer;
		System.out.println("실제 파일 저장 경로 : " + filepath1);

		File f = new File(filepath1);
		if (!f.exists()) {
			f.mkdirs();
		}
		
		String filepath2 = accessPath + "/"  + writer + "/" + str_filename;
				
		System.out.println("파일 url : " + filepath2);
		
		//out.println("filepath : " + filepath);
		
		//out.close();
		
		//filepath = request.getContextPath() + "/" + str_filename;
		int result = streetDAO.fileUpload(filepath2);
		
		System.out.println("result : " +result);
		if(result > 0) {
			f = new File(filepath1 + "/" + str_filename);
			file.transferTo(f);
		}else{
			filepath2 = "";
		}
		//return filepath;
		
		
		return filepath2;
		
	}
	
	
	
	/*@Override
	public int insertSummer(Board board) throws Exception {
		return streetDAO.insertSummer(board);
	}*/
	
	
	
	
	
	/*============================== 미현 끝 ============================*/



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
	
	
	
	/* 지원 골목 수정 시작 */
	/** 골목 수정 이미지 조회용 Service
	 * @param imgNo
	 * @return imgUrl
	 * @throws Exception
	 */
	@Override
	public String selectImageUrl(int imgNo) throws Exception {
		
		return streetDAO.selectImageUrl(imgNo);
	}
	
	/** 골목 수정 키워드 조회용 Service
	 * @param no
	 * @return kList
	 * @throws Exception
	 */
	@Override
	public List<Keyword> selectKeywords(Integer no) throws Exception {
		
		return streetDAO.selectKeywords(no);
	}
	
	/** 골목 수정용 Service1
	 * @param street
	 * @param streetKeywords
	 * @return result
	 * @throws Exception
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateStreet1(Street street, String[] streetKeywords) throws Exception {
		
		int result = 0;
		Map<String, Object> map = null;
		
		result = streetDAO.updateStreet(street); 
		
		if(result > 0) {
			
			result = streetDAO.deleteStreetKeyword(street.getStreetNo());
			
			if(result > 0 && streetKeywords != null) {
				
				map = new HashMap<String, Object>();
				map.put("streetNo", street.getStreetNo());
				for(int i = 0; i < streetKeywords.length; i++) {
					map.put("keyword", streetKeywords[i]);
					result = streetDAO.insertStreetKeyword(map);
				}
			}
		}
				
		return result;
	}
	
	/** 골목 수정용 Service2
	 * @param street
	 * @param streetKeywords
	 * @param changeCoverName
   * @return result
	 * @throws Exception
	*/
  @Transactional(rollbackFor = Exception.class)
  @Override
	public int updateStreet2(Street street, String[] streetKeywords, String changeCoverName) throws Exception {
		int result = 0;
		int imgNo = 0;
		Map<String, Object> map = null;
		
		imgNo = streetDAO.selectCoverNextNo();
		
		if(imgNo > 0) {
			map = new HashMap<String, Object>();
			map.put("imgNo", imgNo);
			map.put("changeCoverName", changeCoverName);
			
			result = streetDAO.insertStreetCover(map);
			
			if(result > 0) {
				
				street.setImgNo(imgNo);
				result = streetDAO.updateStreet(street);
				
				if(result > 0) {
					
					result = streetDAO.deleteStreetKeyword(street.getStreetNo());
					
					if(result > 0 && streetKeywords != null) {
						
						map = new HashMap<String, Object>();
						map.put("streetNo", street.getStreetNo());
						for(int i = 0; i < streetKeywords.length; i++) {
							map.put("keyword", streetKeywords[i]);
							result = streetDAO.insertStreetKeyword(map);
						}
					}
				}
			}
		}		
		return result;
	}
	/* 지원 골목 수정 끝 */
/*------------------------ 정승환 추가코드 시작-----------------------------------*/
	
	/** 현재 골목 주민 수  조회용 Service
	 * @param streetNo
	 * @return citizenCount
	 * @throws Exception
	 */
	@Override
	public int selectCitizenCount(int streetNo) throws Exception {
		return streetDAO.selectCitizenCount(streetNo);
	}

	/** 현재 골목 골목대장 닉네임 조회용 Service
	 * @param streetNo
	 * @return streetMasterNm
	 * @throws Exception
	 */
	@Override
	public String selectStreetMasterNm(int streetNo) throws Exception {
		return streetDAO.selectStreetMasterNm(streetNo);
	}
	
	/** 골목 키워드 조회용 Service
	 * @param streetNo
	 * @return keyword
	 * @throws Exception
	 */
	@Override
	public List<Keyword> selectMyKeyword(int streetNo) throws Exception {
		return streetDAO.selecyMyKeyword(streetNo);
	}

	/** 현재 골목 등급 조회용 Service
	 * @param streetPoint
	 * @return badgeUrl
	 * @throws Exception
	 */
	@Override
	public String selectBadgeUrl(int streetNo, int streetPoint) throws Exception {
		return streetDAO.selectBadgeUrl(streetNo, streetPoint);
	}

	/** 로그인 회원 골목 등급 조회용 Service
	 * @param memberNo
	 * @param streetNo
	 * @return citizenGrade
	 * @throws Exception
	 */
	@Override
	public String selectCitizenGrade(int memberNo, int streetNo) throws Exception {
		return streetDAO.selectCitizenGrade(memberNo, streetNo);
	}

	/** 골목 썸네일 조회용 Service
	 * @param imgNo
	 * @return imgUrl
	 * @throws Exception
	 */
	@Override
	public String selectImgUrl(int imgNo) throws Exception {
		return streetDAO.selectImgUrl(imgNo);
	}

	/** 게시판 번호 조회용 Serivce
	 * @return boardNo
	 * @throws Exception
	 */
	@Override
	public int selectBoardNo() throws Exception {
		return streetDAO.selectBoardNo();
	}
	
	/** 일정 등록용 Serivce
	 * @param sendCalendar
    */	
  @Override
	public int addSchedule(Calendar sendCalendar) throws Exception {
		return streetDAO.addSchedule(sendCalendar);
	}
	
/*------------------------ 정승환 추가코드 시작-----------------------------------*/
}
