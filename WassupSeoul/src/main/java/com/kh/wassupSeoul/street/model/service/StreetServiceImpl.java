package com.kh.wassupSeoul.street.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.kh.wassupSeoul.common.EchoHandler;
import com.kh.wassupSeoul.common.vo.PageInfo;
import com.kh.wassupSeoul.friends.model.vo.Relationship;
import com.kh.wassupSeoul.hobby.model.vo.Hobby;
import com.kh.wassupSeoul.member.model.vo.Member;
import com.kh.wassupSeoul.square.model.vo.Alarm;
import com.kh.wassupSeoul.street.model.dao.StreetDAO;
import com.kh.wassupSeoul.street.model.vo.Board;
import com.kh.wassupSeoul.street.model.vo.Calendar;
import com.kh.wassupSeoul.street.model.vo.Divide;
import com.kh.wassupSeoul.street.model.vo.Dutch;
import com.kh.wassupSeoul.street.model.vo.Keyword;
import com.kh.wassupSeoul.street.model.vo.Reply;
import com.kh.wassupSeoul.street.model.vo.Report;
import com.kh.wassupSeoul.street.model.vo.Street;
import com.kh.wassupSeoul.street.model.vo.StreetJoin;
import com.kh.wassupSeoul.street.model.vo.Vote;


@Service
public class StreetServiceImpl implements StreetService{

	
	@Autowired
	private StreetDAO streetDAO;
	
	
	@Autowired
	private EchoHandler eco;


	// -------------------------------------------- 중하 ---------------------------------------------
	
	/** 골목 조회용 service
	 * @return street
	 * @throws Exception
	 */
	@Override
	public Street selectStreet(Integer streetNo) throws Exception {
		return streetDAO.selectStreet(streetNo);
	}
	
	/** 작성자명으로 게시글 검색
	 * @param checkStreet
	 * @return List<Board>
	 * @throws Exception
	 */
	@Override
	public List<Board> searchBoardwithWriter(Reply checkStreet) throws Exception {
		return streetDAO.searchBoardwithWriter(checkStreet);
	}
	
	/** 키워드로 골목 게시글 검색
	 * @param checkStreet
	 * @return List<Board>
	 * @throws Exception
	 */
	@Override
	public List<Board> searchBoardwithKeyword(Reply checkStreet) throws Exception {
		return streetDAO.searchBoardwithKeyword(checkStreet);
	}
	

	/** 회원 골목 등급 조회
	 * @param checkStreet
	 * @return memGradeInSt
	 * @throws Exception
	 */
	@Override
	public StreetJoin memGradeInSt(Reply checkStreet) throws Exception {
		return streetDAO.memGradeInSt(checkStreet);
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

	
	
	/** 투표 참여자 목록 조회용 
	 * @param checkStreet
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<Vote> selectVoteMemList(Reply checkStreet) throws Exception {
		return streetDAO.selectVoteMemList(checkStreet);
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
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int likeCheck( Reply reply) throws Exception {
		//System.out.println("serviceImple boardNo 확인 : " + reply.getBoardNo());
		//System.out.println("serviceImple boardNo 확인 : " + reply.getMemberNo());
		
		String result = streetDAO.likeCheck(reply);
		int result2 = 0;
		
		System.out.println("serviceImple 체크결과 기존기록  : "+result);
		// 좋아요 기록안되어 있을시 기록 
		if( result == null) {
			
			result2 = streetDAO.recordLike(reply);
			// 알람 관련해서 수정 -태훈
			if(result2 > 0) {
				int memberNo = streetDAO.getBoardWriter(reply);
				String streetNm = streetDAO.selectStreetNm(reply.getStreetNo());
				
				// 게시글 작성자에게 알람
				Alarm alarm = new Alarm("["+streetNm+"] 게시글에 좋아요를 눌렀습니다!", '6', 
						"street/streetMain?streetNo="+reply.getStreetNo() +"&boardNo="+reply.getBoardNo()
						, reply.getMemberNo() +"", memberNo);
				streetDAO.insertAlarm(alarm);
				
				// 알람 타겟에게 소켓통신
				List<WebSocketSession> wsList = eco.getSessionList();
				for(WebSocketSession ws : wsList) {
					if(((Member)ws.getAttributes().get("loginMember")).getMemberNo() == memberNo) {
						ws.sendMessage(new TextMessage(ws.toString()));
					}
				}
			}
			// 알람 관련해서 수정 -태훈
			
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
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int replyLikeFunction(Reply reply) throws Exception {
		String result = streetDAO.replyLikeFunction(reply);
		int result2 = 0;
		
		//System.out.println("serviceImple 체크결과 기존기록  : "+result);
		
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
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int reReplyLikeFunction(Reply reply) throws Exception {
		String result = streetDAO.reReplyLikeFunction(reply);
		int result2 = 0;
		
		//System.out.println("serviceImple 체크결과 기존기록  : "+result);
		
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
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deletePost(int postNo) throws Exception {
		return streetDAO.deletePost(postNo);
	}
	
	/** 댓글 삭제용
	 * @param rereplyNo
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteRereply(int rereplyNo) throws Exception {
		return streetDAO.deleteRereply(rereplyNo);
	}

	/** 공지사항 확인용 
	 * @param postNo
	 * @return
	 * @throws Exception
	 */
	@Override
	public int checkBoardLevel(int postNo) throws Exception {
		return streetDAO.checkBoardLevel(postNo);
	}

	/** 게시글 공지사항 등록용  Service
	 * @param postNo
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int PinPost(Board board) throws Exception {
		return streetDAO.PinPost(board);
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
	@Transactional(rollbackFor = Exception.class)
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
	

	/** 지도 게시글 업로드 Service
	 * @param board
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int mapPost(Board board) throws Exception {
		return streetDAO.mapPost(board);
	}

	
	/** 스케치 업로드 Service
	 * @param board
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int sketchUpload(Board board) throws Exception {
		return streetDAO.sketchUpload(board);
	}
	
	/** 투표 게시글 업로드용 Service
	 * @param board
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int votePost(Board board, Vote vote, String[] voteOption) throws Exception {
		
		Integer boardNo = streetDAO.checkVoteBoardNo(); // NEXT.VAL 조회
		
		Integer currentVoteNo = streetDAO.checkVoteNo(); // 현재 voteNo 조회
		
		int currentVoteNo1 = currentVoteNo;
		
		//System.out.println("현재 선택지 번호"+ currentVoteNo1);
		
		board.setBoardNo(boardNo);
		
		int result = streetDAO.votePost(board);  // Board 테이블에 게시글 추가 
		
		int result2 = 0;
		
//		List<Vote> voteSel = new ArrayList<Vote>();
//		
//		
//		  for(int i=0; i<voteOption.length; i++) { 
//			  for(int k=1; i<voteOption.length+1; k++) { 
//				  voteSel.add(new Vote(boardNo, voteOption[i], currentVoteNo1+k)); } 
//		  }
		List<Vote> voteSel = new ArrayList<Vote>();

		for(int i=0; i<voteOption.length; i++) {
			voteSel.add(new Vote( boardNo, voteOption[i]));
		}  
		
		for(int i=0; i<voteSel.size(); i++) {
				//System.out.println("입력한 투표 선택지 : " + voteSel.get(i));
		}
		
		if( result > 0) {
			
			//System.out.println("투표 게시글 BOARD 테이블 업로드 성공");
				
			vote.setBoardNo(boardNo);
			
			//System.out.println(vote);
			
			result2 = streetDAO.uploadVote(vote); // Vote 테이블에 게시글 추가
			
			if( result2 > 0 ) {
				//System.out.println("투표 게시글 Vote 테이블 업로드 성공");
			}else {
				//System.out.println("투표 게시글 Vote 테이블 업로드 실패");
			}
			
			int result3 = streetDAO.uploadVoteOption(voteSel); // Vote_pick 테이블에 투표 선택지 추가
			
			if(result3 > 0) {
				System.out.println("투표 선택지 업로드 성공");
			}else {
				System.out.println("투표 선택지 업로드 실패");
			}
			
		}else {
			System.out.println("투표 게시글 BOARD 테이블 업로드 실패");
		}
		
		return result2;
	}
		
	/** 투표 조회용 
	 * @param streetNo
	 * @return voteList
	 * @throws Exception
	 */
	@Override
	public List<Vote> selectVoteOption(Reply checkStreet) throws Exception {
		return streetDAO.selectVoteOption(checkStreet);
	}
	
	/** 투표 기록용 Service
	 * @param vote
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int recordVote(Vote vote) throws Exception {
		
		String checkResult = streetDAO.checkVoteRecord(vote);
		
		int result = 0;
		
		if(checkResult == null) { // 기록없을시 
			vote.setVoteStatus("Y");
			result = streetDAO.recordVote(vote);
			//System.out.println("투표기록 완료 : " + vote.getVoteStatus());
		}else if(checkResult.equals("Y")) { // 투표 기록 있을떄 
			vote.setVoteStatus("N");
			result = streetDAO.updateVoteRecord(vote);
			//System.out.println("투표기록 업데이트 완료 : " + vote.getVoteStatus());
		}else {
			vote.setVoteStatus("Y");
			result = streetDAO.updateVoteRecord(vote);
			//System.out.println("투표기록 업데이트 완료 : " + vote.getVoteStatus());
		}
		
		return result;
	}
	
	/* 1/N 회원 선택 목록 가져오기 
	 * @param streetNo
	 * @return List<Member>
	 * @throws Exception
	 */
	@Override
	public List<Member> selectDivideMember(int streetNo) throws Exception {
		return streetDAO.selectDivideMember(streetNo);
	}
	// -------------------------------------------- 중하 끝  ---------------------------------------------


	
	

	/** 골목 가입용 Service
	 * @param map
	 * @return result
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int streetJoin(Map<String, Object> map) {
		int result = streetDAO.streetJoinCheck(map);
		if(result > 0) {
			result = streetDAO.streetJoin2(map);
		} else {
			result = streetDAO.streetJoin(map);
		}
		return result;
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
	public String fileUpload(Board board, MultipartFile file, HttpServletRequest request, int streetNo) throws Exception{
		
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
		
		String writer = board.getBoardWriter();	
		
		System.out.println("야너뭐야:"+writer);
		
		String filepath1 = realFolder + "\\" + writer;
		System.out.println("실제 파일 저장 경로 : " + filepath1);

		File f = new File(filepath1);
		if (!f.exists()) {
			f.mkdirs();
		}
		
		String filepath2 = accessPath + "/"  + writer + "/" + str_filename;
				
		System.out.println("파일 url : " + filepath2);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("streetNo", streetNo);
		map.put("filepath2", filepath2);
		
		System.out.println(map.get("filepath2"));
		System.out.println(map.get("streetNo"));
		
		int result = streetDAO.fileUpload(map);
		
		System.out.println("result : " +result);
		if(result > 0) {
			f = new File(filepath1 + "/" + str_filename);
			file.transferTo(f);
			System.out.println("외않뒈? :" + result);
		}else{
			filepath2 = "";
		}
		
		return filepath2;
		
	}
	
	
	/*============================== 미현 끝 ============================*/




	
	
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
	
	/** 골목 대장 번호 조회용 Service(알림용)
	 * @param streetNo
	 * @return masterNo
	 */
	@Override
	public int selectMasterNo(int streetNo) {
		return streetDAO.selectMasterNo(streetNo);
	}
	
	/** 가입신청 알람 삽입용 Service
	 * @param alarm
	 * @return result
	 */
	@Override
	public int insertAlarm(Alarm alarm) {
		return streetDAO.insertAlarm(alarm);
	}
	
	/** 가입신청 골목 이름 조회용 Service(알림)
	 * @param streetNo
	 * @return streetNm
	 */
	@Override
	public String selectStreetNm(int streetNo) {
		return streetDAO.selectStreetNm(streetNo);
	}
	
	
	/** 조회된 주민들과 로그인된 멤버와의 관계 조회용 Service
	 * @param rList
	 * @return rList
	 * @throws Exception
	 */
	@Override
	public List<Relationship> selectRelationList(Map<String, Object> relationMap) throws Exception {
		return streetDAO.selectRelationList(relationMap);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void removeAlarm(Map<String, Object> map) {
		streetDAO.removeAlarm(map);
	}
	
	
	/** 관계(친구신청, 친구, 숨김, 차단) 추가용 Service
	 * @param addRelation
	 * @return result
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int addRelation(Relationship addRelation){
		// 이전에 관계가 있는지 조회
		int result = streetDAO.selectRelation(addRelation);
		if(result > 0) {
			return streetDAO.modifyRelation(addRelation);
		} else {
			return streetDAO.addRelation(addRelation);
		}
		
	}
	
	/** 골목대장 변경 시 골목 가입 신청/수락에 대한 알람 변경
	 * @param masterNo
	 * @param newNo
	 * @return result
	 */
	@Override
	public int updateAlarm(int masterNo, Integer newNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 주민이 골목가입 신청한 알람 변경
		map.put("alarmType", "1");
		map.put("master", masterNo);
		map.put("newMaster", newNo);
		streetDAO.updateAlarm1(map);
		// 골목가입 승낙 시 주민이 받는 알람 변경
		map.put("alarmType", "2");
		streetDAO.updateAlarm2(map);
		return 0;
	}
	
	
	/** 골목 주민 추방용
	 * @param map
	 */
	@Override
	public void exileJumin(Map<String, Integer> map) throws Exception{
		streetDAO.exileJumin(map);
	}
	
	
	/** 골목 가입 취소용
	 * @param map
	 * @return result
	 */
	@Override
	public int joinCancel(Map<String, Integer> map) {
		return streetDAO.joinCancel(map);
	}
	
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertDutchBoard(Board board) throws Exception{
		return streetDAO.insertDutchBoard(board);
	}
	
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void insertDutch(Dutch dutch) {
		int result = streetDAO.insertDutch(dutch);
		Divide divide = new Divide();
		divide.setBoardNo(dutch.getBoardNo());
		if(dutch.getDutchTotal() % dutch.getDutchCount() == 0) {
			divide.setDividePrice(dutch.getDutchTotal() / dutch.getDutchCount());
			for(int i = 0 ; i < dutch.getDutchCount() ; i++) {
				divide.setMemberNo(dutch.getMemArray()[i]);
				streetDAO.insertDivide(divide);
			}
		} else {
			int random = (int) Math.floor((Math.random() * dutch.getDutchCount()));
			for(int i = 0 ; i < dutch.getDutchCount() ; i++) {
				divide.setMemberNo(dutch.getMemArray()[i]);
				if(i == random) {
					divide.setDividePrice( (dutch.getDutchTotal() / dutch.getDutchCount())
							+ (dutch.getDutchTotal() % dutch.getDutchCount()));
					streetDAO.insertDivide(divide);
				} else {
					divide.setDividePrice(dutch.getDutchTotal() / dutch.getDutchCount());
					streetDAO.insertDivide(divide);
				}
			}
		}
	}
	
	/** N빵 리스트 조회
	 * @param checkStreet
	 * @return dutch
	 */
	@Override
	public List<Dutch> selectDutch(List<Board> board) throws Exception {
		return streetDAO.selectDutch(board);
	}
	
	/** N빵 참가자 리스트 조회
	 * @param dutch
	 * @return divide
	 */
	@Override
	public List<Divide> selectDivide(List<Dutch> dutch) throws Exception{
		return streetDAO.selectDivide(dutch);
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
	public List<Keyword> selectKeywords(int streetNo) throws Exception {
		
		return streetDAO.selectKeywords(streetNo);
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
		int origin = street.getImgNo();
		
		imgNo = streetDAO.selectCoverNextNo();
		
		if(imgNo > 0) {
			/************* 지원 추가사항 시작 *************/
			// result = streetDAO.deleteStreetCover(origin);
			// 할지말지 의논... 
			/************* 지원 추가사항 끝 *************/
			
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
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int addSchedule(Calendar sendCalendar) throws Exception {
		return streetDAO.addSchedule(sendCalendar);
	}
	
	/** 일정 관련 게시글 등록용 Service
	 * @param board
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertCalendarBoard(Board board) throws Exception {
		return streetDAO.insertCalendarBoard(board);
	}
	
	/** 일정 조회용 Service
	 * @param streetNo
	 * @return storeCalendar
	 * @throws Exception
	 */
	@Override
	public List<Calendar> selectStoreCalendar(int streetNo) throws Exception {
		return streetDAO.selectStoreCalendar(streetNo);
	}
	
	
	/** 일정 삭제용 Service
	 * @param temp 
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteSchedule(Calendar temp) throws Exception {
		return streetDAO.deleteSchedule(temp);
	}
	
	/** 일정 게시글 삭제용 Service
	 * @param boardNo
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteBoardCalendar(int boardNo) throws Exception {
		return streetDAO.deleteBoardCalendar(boardNo);
	}
	
	
	/** 일정 게시글 참여인원수 조회용 Service
	 * @param boardNo
	 * @return count
	 * @throws Exception
	 */
	@Override
	public int selectJoinCalendar(int boardNo) throws Exception {
		return streetDAO.selectJoinCalendar(boardNo);
	}
	
	/** 일정 게시글 참여인원 목록 삭제용 Service
	 * @param boardNo
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteJoinCalendar(int boardNo) throws Exception {
		return streetDAO.deleteJoinCalendar(boardNo);
	}
	
	/** 해당 글번호에 해당하는 참여인원 회원번호 조회용 Service
	 * @param boardNo
	 * @return joinList
	 * @throws Exception
	 */
	@Override
	public List<Board> selectCalMemNo(int boardNo) throws Exception {
		return streetDAO.selectCalMemNo(boardNo);
	}
	
	/** 참가일정 참여 인원 회원정보 조회용 Service
	 * @param memberNo
	 * @return member
	 * @throws Exception
	 */
	@Override
	public Member selectJoinMember(int memberNo) throws Exception {
		return streetDAO.selectJoinMember(memberNo);
	}
	
	/** 일정 참여인원 삽입용 Service
	 * @param temp
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertCalendarMember(Board temp) throws Exception {
		return streetDAO.insertCalendarMember(temp);
	}
	
	/** 일정 참여인원 삭제용 Service
	 * @param temp
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteCalendarMember(Board temp) throws Exception {
		return streetDAO.deleteCalendarMember(temp);
	}
	
	/*------------------------ 정승환 추가코드(20.03.27) 시작-----------------------------------*/
	
	/** 골목대장 회원번호 조회용 Service
	 * @param streetNo
	 * @return memberNo
	 * @throws Exception
	 */
	@Override
	public int selectStreetMasterNo(int streetNo) throws Exception {
		return streetDAO.selectStreetMasterNo(streetNo);
	}
	
	/** 일정 수정 모달창 일정 정보 조회용 Service
	 * @param boardNo
	 * @return calendar
	 * @throws Exception
	 */
	@Override
	public Calendar selectCalendarInfo(int boardNo) throws Exception {
		return streetDAO.selectCalendarInfo(boardNo);
	}
	
	/** 일정 게시글 수정용 Service
	 * @param updateCalendarBoard
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateCalendarBoard(Board updateCalendarBoard) throws Exception {
		return streetDAO.updateCalendarBoard(updateCalendarBoard);
	}
	
	/** 일정 수정용 Service
	 * @param updateCal
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateSchedule(Calendar updateCal) throws Exception {
		return streetDAO.updateSchedule(updateCal);
	}


	
	/*------------------------ 정승환 추가코드(20.03.27) 끝-----------------------------------*/
/*------------------------ 정승환 추가코드 시작-----------------------------------*/
	
	
	/******************** 지원 골목 삭제 시작 ********************************/
	/** 골목 삭제용 Service
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteStreet(int streetNo) throws Exception {
		
		int result = 0;
		
		result = streetDAO.deleteStreet(streetNo);
		
		if(result > 0) {
			
			result = streetDAO.deleteJoin(streetNo);
			
			if(result > 0) {
				
				result = streetDAO.deleteStreetKeyword(streetNo);
			}
		}
		return result;
	}
	
	/** 주민 검색용 Service
	 * @param juminNickName
	 * @return jumin
	 * @throws Exception
	 */
	@Override
	public Member searchJumin(String juminNickName, int streetNo) throws Exception {
		
		Map<String, Object> map = null;
		map = new HashMap<String, Object>();
		
		map.put("juminNickName", juminNickName);
		map.put("streetNo", streetNo);
		
		return streetDAO.searchJumin(map);
	}
	
	
	/** 골목대장 존재 여부 확인용 Service
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int selectStreetMaster(int memberNo) throws Exception {
		
		return streetDAO.selectStreetMaster(memberNo);
	}
	
	
	/** 골목 대장 위임용 Service
	 * @param newNo
	 * @param no
	 * @param original
	 * @return result
	 * @throws Exception
	 */
	@Override
	public int yesMaster(Integer newNo, int streetNo, int original) throws Exception {
		
		int result = 0;
		Map<String, Object> map = null;
		map = new HashMap<String, Object>();
		
		map.put("newNo", newNo);
		map.put("streetNo", streetNo);		
		
		result = streetDAO.updateNewMaster(map);
		
		if(result > 0) {
			
			map.put("original", original);
			
			result = 0;
			
			result = streetDAO.updateOriginalMaster(map);
			
		} 
			
		return result;
		
	}
	/******************** 지원 골목 삭제 끝 ********************************/
	/*==============================3/25 미현 코드추가 시작 ======================*/
	
	/** 썸머노트 수정용 service
	 * @param board
	 * @param file
	 * @param savePath
	 * @return result
	 * @throws Exception
	 */
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateSummer(Board board, MultipartFile file, String savePath) throws Exception {
		/*
		 * String files = streetDAO.selectFiles(board.getBoardNo());
		 * System.out.println("기존 파일 데려오느냐:"+ files);
		 */
		
		/*
		 * // 새로 삽입할 파일,기존 행을 수정할 파일 (썸머노트는 여러가지 파일도 DB상에 한게시물로 올라감..) Board updateFile
		 * = new Board();
		 * 
		 * Board fi = null;
		 * 
		 * // 새롭게 등록된 파일이 있는지 확인 if(!file.getOriginalFilename().equals("")) { String
		 * changeFileName = FileRename.rename(file.getOriginalFilename()); } }
		 */
		
		board.setBoardContent(board.getBoardContent().replace("\r\n", "<br>"));
		int result = streetDAO.updateSummer(board);
		
		return result;
		
	}



	
	/*====================3/26 미현 시작==================*/
	/** 사진첩 목록 조회용
	 * @return list
	 * @throws Exception
	 */
	@Override
	public List<String> selectPtList(int streetNo, PageInfo pInf) throws Exception {
		return streetDAO.selectPtList(streetNo,pInf);
	}

	
	/*==============================3/25 미현 코드추가 끝 ======================*/
	
	
	
	/*============================== 지원 활동보고서 시작 ======================*/
	/** 활동보고서 제출용 Service
	 * @param report
	 * @return result
	 * @throws Exception
	*/
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int sendReport(Report report) throws Exception {
		
		int result = 0;
		
		int reportNo = streetDAO.selectReportNextNo();
		
		if(reportNo > 0) {
			
			report.setReportNo(reportNo);
			
			report.setReportContent(report.getReportContent().replace("\r\n", "<br>"));
			
			result = streetDAO.sendReport(report);
			
		}
		
		return result;
	}
	/*============================== 지원 활동보고서 끝 ======================*/

	
	/** 사진첩 게시글 수 조회용 Service
	 * @param streetNo 
	 * @return listCount
	 */
	@Override
	public int getListCount(int streetNo) {
		return streetDAO.getListCount(streetNo);
	}
	
}
