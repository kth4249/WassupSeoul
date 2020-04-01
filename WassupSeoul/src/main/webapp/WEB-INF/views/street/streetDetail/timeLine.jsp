<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/timeline.css" type="text/css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a32d3d818847c093a324db2e8ffc840"></script>

<title>타임라인  영역</title>
</head>

<style>
.writerImg:hover{
	cursor : pointer;
}
.writerNickName:hover{
	cursor : pointer;
}

.optionChevron:hover{
	cursor : pointer;
}
	
 .mapShowAddress:hover{
   cursor:pointer;
 }
 
 .mapShowImg:hover{
    cursor:pointer;
 }
 
 .mapShowArea:hover{
    cursor:pointer;
 }
	
	
	a{
	style="color: black; text-decoration: none;"
	}
	.profileBox{
	  width: 100%;
	  height: 160px; 
	  border-radius: 70%;
	  overflow: hidden;
	}
	.profileImage{
	width: 100%;
	height: 100%;
	object-fit: cover;
	}
	/* (3/24)미현수정  */
	.postMainWrap{
		position: relative; 
		/* overflow: auto; */
	}
	.postMainWrap iframe,
	.postMainWrap object,
	.postMainWrap embed {
		/* position: absolute;
	    top: 0;
	    left: 0; */
	    width: 100% !important;
	}
	.postMainWrap img{
		/* position: absolute; 
		top:0; 
		left: 0; */
		width: 100% !important;
	}
	/* (3/24)미현수정 끝  */
	
	/* (3/28)미현수정 시작*/
	.reCommentCount:hover{
		cursor : pointer;
		color : darkcyan;
	}
	
	lihover:hover{
		cursor : pointer;
		color : white;
		
	}
	
	.commentCount:hover{
		cursor : pointer;getElementsByClassName
		color : darkcyan;
	}
	/*수정 끝*/
	
     	
</style>
<body>
	
	<c:if test="${empty board }">

		<!-- 게시글 없을때-->
		<div class="container box111" id="postArea">
			<div class="postLayoutView" style="height: 500px;">

				<div class="nanum " style="font-size: 20px; text-align: center;">
					<div style="height: 200px"></div>
					<div class="noPostSignArea container" style="width: 50%;">
						<p class="noPostSign">
							작성된 게시물이 없습니다. <br>
						</p>
					</div>

				</div>

			</div>
		</div>
		<!-- 게시물 없을때 끝-->
		
	</c:if>

	<script>
	/* 미현 고침!!  */
		$(document).on("click",".updateSummer",function(){
			$("#summernote2").summernote('code',  $(this).parents(".MainWrap").parents().children(".postMainWrap").children("div").html());
			$("#summernote2").siblings("input[type=hidden]") .val( $(this).next().val() );
		});
		/* 미현 고침!!  */
	</script>
	<!-- 게시물 있을때 -->
	<c:if test="${!empty board}">
		<c:forEach var="board" items="${board}" varStatus="vs">
		
			<c:choose>
				<c:when test="${board.boardNo eq '0'}">  
					<!-- 게시물 검색결과 없을때  -->
						<div class="container box111" id="postArea">
						<div class="postLayoutView" style="height: 500px;">
							<div class="nanum " style="font-size: 20px; text-align: center;">
								<div style="height: 200px"></div>
								<div class="noPostSignArea container" style="width: 50%;">
									<p class="noPostSign">
									
										게시물 검색결과가 없습니다. <br>
										
									</p>
								</div>
							</div>
						</div>
					</div>
					<!-- 게시물 검색결과 없을때  -->	
				</c:when>
				<%-- <c:when test="${board.boardLevel eq '0'}">   --%>
				
				<c:otherwise>
			<!-- 게시글1-->
			<div class="container box111" id="postArea">
				<div class="postLayoutView" style="padding: 0%; border: solid #ced4da 1px ">

					<!-- 프로필사진, 작성자명, 날짜 -->
					<div class="post MainWrap mb-3" style="margin-top: 10px; margin-left: 10px; margin-bottom: 20px">
						<div class="profileImgArea" id="profileImgArea" style="display: inline-block; width: 40px; height: 40px; border-radius: 70%; overflow: hidden;">

							 <img src="${contextPath}/resources/profileImage/${board.memberProfile}" 
									data-toggle="modal" data-target="#writerModal" id="writerImg" class="writerImg"
									style="width: 100%; height: 100%; object-fit: cover; position: relative;" name="${board.memberNo}"> 
							<%-- <img src="${contextPath}/resources/img/account.png" >  --%>

						</div>
						<div class="profileNameArea  nanum" id="profileNameArea" style="display: inline-block; width: 70%; height: 100%; position: relative;">
							<div style="width: 50% !important;">
								<p class="writerNickName" name="${board.memberNo}" style="width: 50% !important;"
									data-toggle="modal" data-target="#writerModal" >${board.boardWriter}</p>
							</div>
							<div style="width: 60% !important;">
								<p style="width:100%">
									<fmt:formatDate value="${board.boardWriteDt}" pattern="yyyy년 MM월 dd일 aa hh:mm" />
								</p>
							</div>
						</div>

						<c:if test="${loginMember.memberNickname ne board.boardWriter}">
							<c:if test="${memGradeInSt.citizenGrade eq 'M'}">
							
							
								<!-- 공지사항 등록되어 있을때, 해제버튼 보이기 -->
								<c:if test="${board.boardLevel eq '1'}">
								<div style="display: inline-block; width: 5%; margin-bottom: 0px; height: 50px; float: right;">
									<div>
										<div class="optionChevron">
											<img src="${contextPath}/resources/img/download.png"
												style="width: 17px; height: 15px; position: relative; bottom: 2px;"
												id="chev">
											<div id="postMenu" class="hide nanum form-control" style="width: 130px; height: auto; 
													 float: right; right: 25px; bottom: 12px; font-size: 14px; margin-right: 15px; position: relative">
												<ul>
													<li><a class="PinPost" name="${board.boardNo}" style="color: #5a5a5a;" class="lihover">공지사항 해제</a></li>
													<li><a class="deletePost" name="${board.boardNo}" style="color: #5a5a5a;" class="lihover">글 삭제</a></li>
													 
												</ul>
												
											</div>
										</div>
									</div>
								</div>
								 </c:if>
								 
								 <!-- 공지사항 등록안되어 있을때, 등록버튼 보이기 -->
								 <c:if test="${board.boardLevel eq '0'}">
								<div style="display: inline-block; width: 5%; margin-bottom: 0px; height: 50px; float: right;">
									<div>
										<div class="optionChevron">
											<img src="${contextPath}/resources/img/download.png"
												style="width: 17px; height: 15px; position: relative; bottom: 2px;"
												id="chev">
											<div id="postMenu" class="hide nanum form-control" style="width: 130px; height: auto; 
													 float: right; right: 25px; bottom: 12px; font-size: 14px; margin-right: 15px; position: relative">
												<ul>
													<li><a class="PinPost" name="${board.boardNo}" style="color: #5a5a5a;" class="lihover">공지사항 등록</a></li>
													<li><a class="deletePost" name="${board.boardNo}" style="color: #5a5a5a;" class="lihover">글 삭제</a></li>
													 
												</ul>
												
											</div>
										</div>
									</div>
								</div>
								 </c:if>
								 
						  </c:if>
						  
						  <c:if test="${memGradeInSt.citizenGrade eq 'G'}">
						  </c:if>
							
						</c:if>

						<c:if test="${loginMember.memberNickname eq board.boardWriter}">
						  <!--  로그인회원이 골목 대장 일때 -->
						  <c:if test="${memGradeInSt.citizenGrade eq 'M'}">
						  
						  
								<!-- 공지사항 등록되어 있을때, 해제버튼 보이기 -->
								<c:if test="${board.boardLevel eq '1'}">
								<div style="display: inline-block; width: 5%; margin-bottom: 0px; height: 50px; float: right;">
									<div>
										<div class="optionChevron">
											<img src="${contextPath}/resources/img/download.png"
												style="width: 17px; height: 15px; position: relative; bottom: 2px;"
												id="chev">
											<div id="postMenu" class="hide nanum form-control" style="width: 130px; height: auto; 
													 float: right; right: 25px; bottom: 12px; font-size: 14px; margin-right: 15px; position: relative">
												<ul>
													<li><a class="PinPost" name="${board.boardNo}" style="color: #5a5a5a;" class="lihover">공지사항 해제</a></li>
													<li><a class="deletePost" name="${board.boardNo}" style="color: #5a5a5a;" class="lihover">글 삭제</a></li>
													 
												</ul>
												
											</div>
										</div>
									</div>
								</div>
								 </c:if>
								 
								 <!-- 공지사항 등록안되어 있을때, 등록버튼 보이기 -->
								 <c:if test="${board.boardLevel eq '0'}">
								<div style="display: inline-block; width: 5%; margin-bottom: 0px; height: 50px; float: right;">
									<div>
										<div class="optionChevron">
											<img src="${contextPath}/resources/img/download.png"
												style="width: 17px; height: 15px; position: relative; bottom: 2px;"
												id="chev">
											<div id="postMenu" class="hide nanum form-control" style="width: 130px; height: auto; 
													 float: right; right: 25px; bottom: 12px; font-size: 14px; margin-right: 15px; position: relative">
												<ul>
													<li><a class="PinPost" name="${board.boardNo}" style="color: #5a5a5a;" class="lihover">공지사항 등록</a></li>
													<li><a class="deletePost" name="${board.boardNo}" style="color: #5a5a5a;" class="lihover">글 삭제</a></li>
													 
												</ul>
												
											</div>
										</div>
									</div>
								</div>
								 </c:if>
							
							
							
						  </c:if>
						   <!--  로그인회원이 골목 일반 회원일때 -->
					      <c:if test="${memGradeInSt.citizenGrade eq 'G'}">
							<div style="display: inline-block; width: 5%; margin-bottom: 0px; height: 50px; float: right;">
								<div>
									<div class="optionChevron">
										<img src="${contextPath}/resources/img/download.png"
											style="width: 17px; height: 15px; position: relative; bottom: 2px;"
											id="chev">
										<div id="postMenu" class="hide nanum form-control" style="width: 100px; height: auto; 
												 float: right; right: 25px; bottom: 12px; font-size: 14px; margin-right: 15px; position: relative">
											<ul>
												<li><a class="deletePost" id="${board.boardNo}" style="color: #5a5a5a;" class="lihover">글 삭제</a></li>
												<li><a data-toggle="modal" data-target="#updateSummerModal" class="updateSummer" style="color: #5a5a5a;" class="lihover">글 수정</a>
												<input type="hidden" value="${board.boardNo}">
												</li>
												 
											</ul>
											
										</div>
									</div>
								</div>
							</div>
						  </c:if>
						  
						</c:if>

					</div>
					<!-- 프로필사진, 작성자명, 날짜 -->
										
										
					<jsp:include page="../streetDetail/profileModal.jsp"/> 
					<jsp:include page="../streetDetail/mapShowModal.jsp"/> 

					<!-- 게시글내용 -->
					<div class="postMainWrap nanum" style="width: 100%">
						<div style="padding-left: 10px; padding-right: 10px; width: 100%">


							<c:choose>
								<c:when test="${board.typeNo eq '6'}">  <!-- 지도 출력 양식 -->	 
								
										${board.boardContent}    
									 	<div class="mapShowArea" name="${board.sketchUrl}" style="height: 100px; width:100%; margin-bottom: 10px;" data-toggle="modal" data-target="#mapShowModal">
											<div class="profileImgArea"  id="profileImgArea" style="display: inline-block; width: 12%; margin-bottom: 0px; height: 50px;
																								padding-left: 10px;">
												<img src="${contextPath}/resources/img/mapIcon.png" style="width: 40px; height: 30px; margin-top: 30px;" class="mapShowImg"
															data-toggle="modal" data-target="#mapShowModal" name="${board.mapAddress}" >
											</div>
											
											<div class="profileNameArea nanum" id="profileNameArea" style="display: inline-block; width: 81%; margin-bottom: 0px; height: 100%;
																											position: relative; top: 14px">
												<div style="margin-left: 30px;">
													<p class="mapShowAddress" name="${board.mapAddress}" style="margin-top: 20px; font-size:17px;  color:black;" data-toggle="modal" data-target="#mapShowModal">${board.mapAddress}</p>
												</div>
											</div>	
										</div>
								</c:when>
								<c:when test="${board.typeNo eq '5'}">  <!-- 스케치 출력 양식 -->	
								
									${board.boardContent}  
									<img src="${contextPath}/resources/sketchImage/${board.sketchUrl}">
									
								</c:when>
								<c:when test="${board.typeNo eq '3'}">  <!-- 투표 출력 양식 -->	
								
								 	 ${board.boardContent}  <!-- 투표 게시글 내용 -->	
								 	 
								 <c:set var="doneLoop" value="false"/>	   <!-- 반복 제어를 위한 변수 선언 -->	
							 	  <c:forEach var="vote" items="${vote}" varStatus="vs">
							 	 	 <c:if test="${not doneLoop}">			  
							 		  <c:if test="${vote.boardNo eq board.boardNo}">
										<c:set var="doneLoop" value="true"/>  <!-- 반복 제어.  break와 같음 -->	
									   <!-- 투표 출력 양식 -->	 
										<div class="voteMainWrap nanum" style="border: 1px solid #ced4da;  height: auto; width:100%; margin-top:20px;">
											<!-- 투표 상단 제목 영역 -->	
											<div style="height: 60px; width:100%; margin-bottom: 45px;">
												
												<div class="profileImgArea" id="profileImgArea" style="display: inline-block; width: 12%; margin-bottom: 0px; height: 50px;
																									padding-left: 10px;">
													<img src="${contextPath}/resources/img/politics.png" style="width: 30px; height: 30px; margin-bottom: 45px;">
										
												</div>
												<!-- 투표 제목, 투표참여 인원 수  양식 -->	
												<div class="profileNameArea nanum" id="profileNameArea" style="display: inline-block; width: 81%; margin-bottom: 0px; height: 100%;
																												position: relative; top: 14px">
													
													<!-- 날짜 비교를 위한 현재 날짜 출력 -->															
													<c:set var="today" value="<%=new java.util.Date()%>"/>
													<fmt:formatDate type="date" value="${today}" pattern="yyyy-MM-dd" var="today" />
													<fmt:formatDate type="date" value="${vote.voteEndDt }" pattern="yyyy-MM-dd" var="voteEndDt"/>
																												
													<div>
														<!-- 현재 날짜와 비교 후 투표 종료 여부 출력-->
														<c:choose>
															<c:when test="${today < voteEndDt }">  	 
																<p style="margin-bottom: 0; display: inline-block; color:blue; font-size:14px;">투표중</p>
															</c:when>
															<c:otherwise>
																<p style="margin-bottom: 0; display: inline-block; color:red; font-size:14px;">투표종료</p>
															</c:otherwise>
														</c:choose>
														<!-- 현재 날짜와 비교 후 투표 종료 여부 출력-->
														
														<p style="margin-bottom: 0; display: inline-block; margin-left: 20px; font-size:14px; font-weight:bold; color:black;">  투표 종료일  :  <fmt:formatDate value="${vote.voteEndDt}" pattern="yyyy년 MM월 dd일 " /></p>
													</div>
													<div style="margin-bottom: 0;">
														<p style="margin-bottom: 0; font-size:20px; font-weigh: bold; color:black;">${vote.voteTitle}</p>
													</div>
													<div style="margin-bottom: 40px;">
													
													<c:choose>
															<c:when test="${vote.voteDup eq 'N'}">  	 
																<p style="font-size:14px;" class="voteDup" name="${vote.voteDup}" style="font-weight:bold; color:black;">복수선택 불가  </p>
															</c:when>
															<c:otherwise>
																<p style="font-size:14px;" class="voteDup" name="${vote.voteDup}" style="font-weight:bold; color:black;">복수선택 가능 (최대 ${vote.voteDup}표)</p>
															</c:otherwise>
													</c:choose>
												  </div>	
												</div>	
												<!-- 투표 제목, 투표참여 인원 수  양식 -->	
											</div>
										
											<!-- 투표  컨텐츠 영역 영역 -->
											<div style=" height: auto; width:100%; border: 1px solid #ced4da; border-bottom: 0; border-left: 0; border-right: 0;">
										
											 <c:forEach var="voteOption" items="${voteOption}" varStatus="vs">
							 				 	<c:if test="${voteOption.boardNo eq board.boardNo}">
												<!-- 선택지 1 -->
												<div style="margin-top: 10px;  margin-bottom: 30px;">
												
													
													<c:choose>
															<c:when test="${today < voteEndDt }">  	 
																<!-- 투표 진행시 -->
																<c:choose>
																<c:when test="${voteOption.voteStatus eq 'Y'}">  	 
																	<label style="width: 300px; margin-left: 20px; color:black; font-weight:bold"> 
																	<input type='checkbox' style="margin-right: 10px; width:30px; height:30px; position: relative; top: 37px;" 
																	       name="${voteOption.voteNo}" class="voteCheckBox" checked />${voteOption.voteOtion}</label>
																</c:when>
																<c:otherwise>
																	<label style="width: 300px; margin-left: 20px; color:black; font-weight:bold"> 
																	<input type='checkbox' style="margin-right: 10px; width:30px; height:30px; position: relative; top: 37px;" 
																	       name="${voteOption.voteNo}" class="voteCheckBox" />${voteOption.voteOtion}</label>
																</c:otherwise>
																</c:choose>
																<!-- 투표 진행시 -->
															</c:when>
															<c:otherwise>
																<!-- 투표 종료시 -->
																<c:choose>
																	<c:when test="${voteOption.voteStatus eq 'Y'}">  	 
																		<label style="width: 130px; margin-left: 20px; color:black; font-weight:bold"> 
																		<input type='checkbox' style="margin-right: 10px; width:30px; height:30px; position: relative; top: 37px;" 
																		       name="${voteOption.voteNo}" class="voteCheckBox" checked onclick="return false;"/>${voteOption.voteOtion}</label>
																	</c:when>
																	<c:otherwise>
																		<label style="width: 130px; margin-left: 20px; color:black; font-weight:bold"> 
																		<input type='checkbox' style="margin-right: 10px; width:30px; height:30px; position: relative; top: 37px;" 
																		       name="${voteOption.voteNo}" class="voteCheckBox" onclick="return false;" />${voteOption.voteOtion}</label>
																	</c:otherwise>
																</c:choose>
																<!-- 투표 종료시 -->
															</c:otherwise>
														</c:choose>
												
													
													<fmt:formatNumber var="barWidth" type="percent" minFractionDigits="0" maxFractionDigits="3" value="${ voteOption.voteCount/voteOption.voteWholeVoteCount }"/>
													
													<!-- 득표수 -->
													<div style="margin-right: 100px; font-size: 13px; display: inline-block; 
													            float: right; position: relative; top: 41px; left:10px; color:blue; font-weight:bold"><p class="voteCountArea">${voteOption.voteCount} </p></div> 
													
													<c:choose>
															<c:when test="${barWidth == 'NaN'}">  	 
																<div class="progress"  style="width:70%; margin-left: 60px;" >
																	<!-- 진행바 -->
																	<div class="progress-bar" style="width:0%; display: inline-block;"></div>
																</div>
															</c:when>
															<c:otherwise>
																<div class="progress"  style="width:70%; margin-left: 60px;" >
																	<!-- 진행바 -->
																	<div class="progress-bar" style="width:${barWidth}; display: inline-block;"></div>
																</div>
															</c:otherwise>
													</c:choose>
													
													
													<!-- 투표자 -->
													<div style="width:80%; margin-left: 60px;" >
														<!-- 무기명 투표 체크 안했을 시 -->
														<c:if test="${vote.anonymity eq 'N'}">
														 	<p style="font-size:13px;" name="${vote.anonymity}">남과여남1</p>
														 </c:if>	
														 <!-- 무기명 투표 체크  시 -->
														 <c:if test="${vote.anonymity eq 'Y'}">
														 	<p style="font-size:13px;" name="${vote.anonymity}"></p>
														 </c:if>	
													</div>
												</div>
												<!-- 선택지 1 -->
											 	 </c:if>
								 		     </c:forEach> 
										
											</div>
											<!-- 투표  컨텐츠 영역 영역 -->	
										
										 </div>
										<!-- 투표 출력 양식 -->			
										</c:if>
									  </c:if>
					 		        </c:forEach> 
									
								 </c:when>
								 
							 
							 <c:otherwise>
									${board.boardContent}    
							  </c:otherwise>
							</c:choose>

						</div>
					</div>
					<!-- 게시글내용 -->
					
					<!-- 댓글 출력  코드 순서  -->
						<%-- <c:if test="${!empty reply}">
									<c:forEach var="reply" items="${reply}" varStatus="vs">
										<c:if test="${reply.boardNo eq board.boardNo}">
											<c:if test="${reply.replyLevel eq '1'}">
												<c:if test="${!empty reReply}">
													<c:forEach var="reReply" items="${reReply}" varStatus="vs">
													
														<c:if test="${reReply.replyLevel eq '2'}">
															<c:if test="${reply.boardNo eq reReply.reReplyNo}">
															   
															
															</c:if>
														</c:if>
														
													</c:forEach>
												</c:if>
												<c:if test="${empty reReply}">
												</c:if>
											</c:if>
										</c:if>
									</c:forEach>
								</c:if> --%>

					<!-- 댓글수, 좋아요버튼 -->
					<div class="postCountView mt-3"
						style="height: 30%; padding-top: 5px;">
						<div class="commentArea nanum"
							style="display: inline-block; width: 82%; margin-bottom: 0px; padding-left: 10px;">
							<c:choose>
								<c:when test="${board.replyCount eq '0'}">
									<!-- 댓글 개수 0 일때 공백처리 -->
									<p class="commentCount mb-3" style="margin-bottom: 20px;">댓글</p>
								</c:when>
								<c:otherwise>
									<p class="commentCount mb-3" style="margin-bottom: 0;">댓글${board.replyCount}</p>
								</c:otherwise>
							</c:choose>
						</div>

						<!-- 회원 골목 가입 안되어있을때 좋아요 버튼 -->
						<c:if test="${memGradeInSt.citizenStatus eq 'N'}">
						</c:if>
						
						<!-- 회원 골목 가입 되어있을때 좋아요 버튼 -->
						<c:if test="${memGradeInSt.citizenStatus eq 'Y'}">
							<div style="height: 100%; float: right;" class="mr-2">
							<button type="submit" class="btn nanum"
								style="padding: 0px; position: relative; bottom: 4px; right:5px;">
								<c:choose>
									<c:when test="${board.thumbStatus eq 'Y'}">
										<!-- 내가 좋아요 누른 게시글 활성화로 표시 -->
										<img class="likeBtn shake" name="${board.boardNo}" 
											src="${contextPath}/resources/img/like2.png"
											style="display: inline-block; width: 20px; height: 20px; float: right;">
									</c:when>
									<c:otherwise>
										<img class="likeBtn shake" name="${board.boardNo}"
											src="${contextPath}/resources/img/like.png"
											style="display: inline-block; width: 20px; height: 20px; float: right;">
									</c:otherwise>
								</c:choose>

							</button>
							<c:choose>
								<c:when test="${board.thumbCount eq '0'}">
									<!-- 좋아요 개수 0 일때 공백처리 -->
									<p class="likeCount"
										style="margin-bottom: 0; display: inline-block;"></p>
								</c:when>
								<c:otherwise>
									<p class="likeCount"
										style="margin-bottom: 0; display: inline-block;">${board.thumbCount}</p>
								</c:otherwise>
							</c:choose>
							</div>
						</c:if>

						
					</div>
					<!-- 댓글수, 좋아요버튼 -->

					<!-- 댓글영역 -->
					<div class="CommentWrap" style="display: none;">

						<!-- 골목 가입 안되어있을때 댓글 작성 못함  -->
						<c:if test="${memGradeInSt.citizenStatus eq 'N'}">
						</c:if>
						
						<!-- 골목 가입 되어있을때 댓글 작성  -->
						<c:if test="${memGradeInSt.citizenStatus eq 'Y'}">
							<!-- 댓글작성 -->
							<div class="inputCommentWrap" style="border: 1px solid #ced4da;">
	
								<div class="writePost" style="width: 80%; display: inline-block; margin-left: 3px;  height: 60px;" >
								
									<textarea class="writeCommentArea nanum"
										id="writeCommentAreaStyle" rows="3" style="font-size: 15px;"
										placeholder="댓글을 작성해 보세요"></textarea>
								</div>
								
								<div style="width: 20%; display: inline-block; position: absolute;">
									<button type="submit" class="btn btn-secondary nanum commentBtn" id="commentBtn" name="${board.boardNo}"
										style="width: 50%; font-size: 15px; font-weight: bolder; 
										left: 10px; margin-top: 14px; float:right; margin-right:20px">작성</button>
								</div>
								
							</div>
							<!-- 댓글작성 -->
						</c:if>
						<!-- 골목 가입 되어있을때 댓글 작성  -->
						
						<c:if test="${empty reply}">
						</c:if>


						<c:if test="${!empty reply}">
							<c:forEach var="reply" items="${reply}" varStatus="vs">
								<c:if test="${reply.boardNo eq board.boardNo}">
									<c:if test="${reply.replyLevel eq '1'}">
										<!-- 댓글보기 -->
										<div style="border: 1px solid #ced4da;">

											<div style="left: 14px; width: 100%;">
												<div class="postMainWrap" style="height: 80%; margin-top: 10px; margin-left: 10px; margin-bottom: 20px">
												
													<div class="profile${contextPath}/resources/img/Area" id="profileImgArea"
														style="display: inline-block; width: 40px; height: 40px; border-radius: 70%; overflow: hidden;">
														<img src="${contextPath}/resources/profileImage/${reply.memberProfile}" class="writerImg" name="${reply.memberNo}"
															style="width: 100%; height: 100%; object-fit: cover; position: relative;" data-toggle="modal" data-target="#writerModal">
													</div>
													
													<div class="profileNameArea nanum" id="profileNameArea"
														style="display: inline-block; width: 81%; margin-bottom: 0px; height: 100%; font-weight: bolder; font-size: 17px;">
														<div style="width: 50% !important;">
															<p style="margin-bottom: 0;" class="writerNickName" style="width: 50% !important;" 
															name="${reply.memberNo}" data-toggle="modal" data-target="#writerModal" >${reply.replyWriter}</p>
														</div>
														<div style="margin-bottom: 0; display: inline-block;">
															<p style="margin-bottom: 0;">
																<fmt:formatDate value="${reply.replyDt}"
																	pattern="yyyy년 MM월 dd일 aa hh:mm" />
															</p>
														</div>
														<div class="doubleCommentArea"
															style="display: inline-block; width: 14%; margin-bottom: 0px; padding-left: 2%;">

															<c:choose>
																<c:when test="${reply.reReplyCount eq '0'}">
																	<!-- 대댓글 개수 0 일때 공백처리 -->
																	<p class="reCommentCount" style="margin-bottom: 0; font-size: 13px;">댓글</p>
																</c:when>
																<c:otherwise>
																	<p class="reCommentCount" style="margin-bottom: 0; font-size: 13px;">댓글${reply.reReplyCount}</p>
																</c:otherwise>
															</c:choose>

														</div>
															<!-- 골목 가입 안되어있을때 좋아요 버튼 -->
															<c:if test="${memGradeInSt.citizenStatus eq 'N'}">
															</c:if>
															
															<!-- 골목 가입 되어있을때 좋아요 버튼 -->
															<c:if test="${memGradeInSt.citizenStatus eq 'Y'}">
																<div style="display: inline-block; width: 5%; margin-bottom: 0px; height: 100%;">
																	<c:choose>
																		<c:when test="${reply.thumbStatus eq 'Y'}">
																			<!-- 내가 좋아요 누른 게시글 활성화로 표시 -->
																			<img class="likeBtn2 shake"
																				src="${contextPath}/resources/img/like2.png" name="${reply.replyNo}" id="${board.boardNo}"
																				style="bottom: 3px; right:10px;">
																		</c:when>
																		<c:otherwise>
																			<img class="likeBtn2 shake"
																				src="${contextPath}/resources/img/like.png" name="${reply.replyNo}" id="${board.boardNo}"
																				style="bottom: 3px; right:10px;">
																		</c:otherwise>
																	</c:choose>
																</div>
																	<c:choose>
																		<c:when test="${reply.replyThumbCount eq '0'}">
																			<!-- 좋아요 개수 0 일때 공백처리 -->
																			<p style="margin-bottom: 0; font-size: 13px; display: inline-block;"></p>
																		</c:when>
																		<c:otherwise>
																			<p style="margin-bottom: 0; font-size: 13px; display: inline-block;">${reply.replyThumbCount}</p>
																		</c:otherwise>
																	</c:choose>
															</c:if>	
															<!-- 골목 가입 되어있을때 좋아요 버튼 -->
													</div>
													
													<!-- 로그인 사용자가 댓글 작성자와 다를때 삭제메뉴 안보임 -->
													<c:if test="${loginMember.memberNickname ne reply.replyWriter}">

													</c:if>

													<c:if test="${loginMember.memberNickname eq reply.replyWriter}">
														<div style="display: inline-block; width: 4%; height: 50px; float: right; margin-right: 10px;">

															<div>
																<div class="optionChevron">
																	<img src="${contextPath}/resources/img/download.png"
																		style="width: 17px; height: 15px; position: relative; bottom: 2px; right: 7px;">
																	<div class="hide nanum form-control" id="postMenu2"
																		style="width: 100px; height:auto;
																		float: right; right: 25px; bottom: 12px; font-size: 14px; margin-right: 15px;">
																		<ul>
																			<li><a href="#" name="deletePost" style="color: #5a5a5a;" class="lihover">댓글 삭제</a></li>
																			<li><a href="#" name="deletePost" style="color: #5a5a5a;" class="lihover">댓글 수정</a></li>
																		</ul>
																	</div>
																</div>
															</div>

														</div>
													</c:if>

												</div>


												<div class="commentContentWrap nanum mt-3">
													<div style="padding-left: 47px; padding-right: 50px; font-weight: bolder; margin-bottom : 1rem;">
														<p>${reply.replyContent}</p>
													</div>
												</div>
											</div>
											<!-- 댓글 1 -->

											<!-- 대댓글 -->
											<div class="doubleCommentWrap" style="display: none;">
												<c:if test="${!empty reReply}">
													<c:forEach var="reReply" items="${reReply}" varStatus="vs">
														<c:if test="${reReply.replyLevel eq '2'}">
															<c:if test="${reply.replyNo eq reReply.reReplyNo}">
																<!-- 대댓글보기1 -->
																<div style="border-top: 2px dashed #ced4da;">
																	<img src="${contextPath}/resources/img/replyIcon.png" style="width:5%; float: left;
																		margin-top: 1rem; margin-left: 5px;">
																
																	<div style="left: 40px; border: 0px white; width: 100%;">
																		<div class="postMainWrap"  style="margin-top: 10px; margin-left: 10px;">
																		
																			<div class="profileImgArea" id="profileImgArea"
																				style="display: inline-block; width: 40px; height: 40px; border-radius: 70%; overflow: hidden;">
																				<img src="${contextPath}/resources/profileImage/${reReply.memberProfile}" class="writerImg" name="${reReply.memberNo}"
																					style="width: 100%; height: 100%; object-fit: cover; position: relative; data-toggle="modal" data-target="#writerModal">
																			</div>
																			<div class="profileNameArea nanum" id="profileNameArea"
																				style="display: inline-block; width: 81%; margin-bottom: 0px; height: 100%; position: relative; font-weight: bolder; font-size: 17px;">
																				<div style="width: 50% !important;">
																					<p class="writerNickName" name="${reReply.memberNo}" style="width: 50% !important;"
																						data-toggle="modal" data-target="#writerModal">${reReply.replyWriter}</p>
																				</div>
																				<div style="display: inline-block;">
																					<p style="margin-bottom: 0;">
																					<fmt:formatDate value="${reReply.replyDt}" pattern="yyyy년 MM월 dd일 aa hh:mm" /></p>
																					<%-- <p style="margin-bottom: 0; font-size: 13px;">댓글${reReply.rereplyCount}</p> --%>
																				</div>
																				
																				<!-- 골목 가입 안되어있을때 좋아요 버튼 -->
																				<c:if test="${memGradeInSt.citizenStatus eq 'N'}">
																				</c:if>
																				
																				<!-- 골목 가입되어있을때 좋아요 버튼 -->
																				<c:if test="${memGradeInSt.citizenStatus eq 'Y'}">
																					<div style="display: inline-block; width: 8%; margin-bottom: 0px; height: 100%;">
																					
																					<c:choose>
																						<c:when test="${reReply.thumbStatus eq 'Y'}">
																							<!-- 내가 좋아요 누른 게시글 활성화로 표시 -->
																							<img class="likeBtn3 shake"
																								src="${contextPath}/resources/img/like2.png" name="${reReply.replyNo}" id="${board.boardNo}"
																								style="width: 25px !important; height: auto; margin-left: 2rem; bottom: 3px; left:10px;">
																						</c:when>
																						<c:otherwise>
																							<img class="likeBtn3 shake"
																								src="${contextPath}/resources/img/like.png" name="${reReply.replyNo}" id="${board.boardNo}"
																								style="width: 25px !important; height: auto; margin-left: 2rem; bottom: 3px; left:10px;">
																						</c:otherwise>
																					</c:choose>
																				</div>
																					<c:choose>
																						<c:when test="${reReply.reReplyThumbCount eq '0'}">
																							<!-- 좋아요 개수 0 일때 공백처리 -->
																							<p style="margin-left: 1.5rem; margin-bottom: 0; font-size: 13px; display: inline-block;"></p>
																						</c:when>
																						<c:otherwise>
																							<p style="margin-left: 1.5rem; margin-bottom: 0; font-size: 13px; display: inline-block;">${reReply.reReplyThumbCount}</p>
																						</c:otherwise>
																					</c:choose>
																				</c:if>
																					<!-- 골목 가입되어있을때 좋아요 버튼 -->
																					

																			</div>
																				<!-- 3/28  미현 위치바꿈 -->
																				<c:if test="${loginMember.memberNickname eq reReply.replyWriter}">
																					<div style="display: inline-block; width: 4%; height: 50px; float: right; margin-right: 13px">
																						<div class="optionChevron">
																							<img src="${contextPath}/resources/img/download.png" style="width: 15px; height: 15px;">
																							<div class="hide nanum form-control" id="postMenu2"
																								style="width: 100px; height:auto; 
																								float: right; right: 25px; bottom: 12px; font-size: 14px; margin-right: 15px;">
																								<ul>
																									<li><a href="#" name="deletePost" style="color: #5a5a5a;" class="lihover">댓글 삭제</a></li>
																									<li><a href="#" style="color: #5a5a5a;" class="lihover">댓글 수정</a></li>
																								</ul>
																							</div>
																						</div>
																					</div>
																				</c:if>
																					<!-- 끝 -->

																			<c:if
																				test="${loginMember.memberNickname ne reReply.replyWriter}">

																			</c:if>

																			
																		</div>

																		<div class="commentContentWrap nanum" 
																			style="font-weight: bolder; padding-left: 47px; padding-right: 50px; margin-bottom : 1rem; margin-top: 15px;">
																			<p>${reReply.replyContent}</p>
																		</div>
																	</div>
																</div>
																<!-- 대댓글보기1 -->
															</c:if>
														</c:if>
													</c:forEach>
												</c:if>

												<c:if test="${empty reReply}">
												</c:if>
												
												
												<!-- 회원 골목 가입 안되어있을때 대댓글 작성 영역 -->
												<c:if test="${memGradeInSt.citizenStatus eq 'N'}">
												</c:if>
												
												<!-- 회원 골목 가입 되어있을때 대댓글 작성 영역 -->
												<c:if test="${memGradeInSt.citizenStatus eq 'Y'}">
													<!-- 대댓글작성 -->
													<div class="inputCommentWrap" style="border-top: 1px solid #ced4da;">
														<div class="writePost" style="width: 80%; display: inline-block; margin-left: 3px;">
															<textarea class="writeCommentArea2 nanum" id="writeCommentAreaStyle" rows="2"
																style="border-left: none;" placeholder="댓글을 작성해 보세요"></textarea>
														</div>
														<div style="width: 20%; display: inline-block; position: absolute;">
															<button type="submit" class="btn btn-secondary nanum reCommentBtn" id="${board.boardNo}" name="${reply.replyNo}" 
															style="width: 50%; font-size: 15px; font-weight: bolder; left: 10px;
															margin-top: 11px; float:right; margin-right:20px">작성</button>
														</div>
													</div>
													<!-- 대댓글작성 -->
												</c:if>
												<!-- 회원 골목 가입 되어있을때 대댓글 작성 영역 -->
												
												
											</div>
											<!-- 대댓글 -->

										</div>
										<!-- 댓글보기 -->
									</c:if>
								</c:if>
							</c:forEach>
						</c:if>


					</div>
					<!-- 댓글영역 -->

				</div>
			</div>
			<!-- 게시글1 끝-->

			<div style="height: 20px; z-index: -5;"></div>
			<!-- 게시글1 후 여백-->
				<%-- 	</c:when>
		  		<c:otherwise> --%>
			
				</c:otherwise>
			</c:choose>
		
		</c:forEach>
	</c:if>
	
	
	
	<script>
	/* 투표 참여 반영용 Ajax */
	$(document).ready(function(){
	    $(".voteCheckBox").change(function(){
	    	// 선택지 번호
	    	var voteNo = $(this).attr("name");  
	    	
	    	// 복수 선택 여부, 개수
	    	var voteDup = $(this).parent().parent().parent().prev("div" > ".voteDup" ).attr("name");
	    	alert(voteDup);
	       
	    	// 무기명 여부
	    	var anonymity = $(this).next().next().next().find("p").attr("name");
	    	// 무기명시 Y   무기명 아닐시 N
	    	
	    	var checkStatus = "Y";
	    	
	       	var voteCount = $(this).parent().next("div").first("p").text();
	    	
	        if( $(".voteCheckBox").is(":checked")==true){   // 체크박스 체크시
	        	voteCount++;
	        }else{ // 체크박스 체크해제시 
	        	voteCount--;
	        	checkStatus = "N";
	        }
	        
	        // 체크박스 일정개수 제한 
	/*         if(count <= 2) {
	            return true;
	        } else {
	            count--;
	            return false;
	        } */
	        
	       /*  if ( voteCount == 0 ) {
	        	voteCount="";
	        	$(this).$(this).parent().next("div").first("p").text(voteCount);
	        }else{
	        	$(this).$(this).parent().next("div").first("p").text(voteCount);
	        } */
	        
	        // 투표 기록용 Ajax
	        $.ajax({
    			url : "recordVote",
    			data : {"voteNo" : voteNo, "checkStatus" : checkStatus },
    			type : "post",
    			success : function(result) {
    				
    				if (result == "true") {
    					alert("투표 기록 성공  투표 감사합니다");
    				} else {
    					alert("투표 기록 실패");
    				}
    			},
    			error : function(e) {
    			console.log("ajax 통신 실패");
    			console.log(e);
    			}
    		});
	        refreshList()
	    });
	});
	/* 투표 참여 반영용 Ajax */
	
	$(document).ready(function(){
		 $.ajax({
 			url : "recordVote",
 			data : {"voteNo" : voteNo, "checkStatus" : checkStatus },
 			type : "post",
 			success : function(result) {
 				
 				if (result == "true") {
 					alert("투표 기록 성공  투표 감사합니다");
 				} else {
 					alert("투표 기록 실패");
 				}
 			},
 			error : function(e) {
 			console.log("ajax 통신 실패");
 			console.log(e);
 			}
 		});
		 
		 
	});

	
	
	</script>
</body>
</html>