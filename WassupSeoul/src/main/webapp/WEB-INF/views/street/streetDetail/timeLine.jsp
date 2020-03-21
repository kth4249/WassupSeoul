<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/timeline.css" type="text/css">
<script type="text/javascript" src="${contextPath}/resources/js/timeLine.js"></script>  


<title>타임라인 게시글 영역</title>
</head>

<style>

	#writerImg:hover{
		cursor : pointer;
	}
	
	#writerNickName:hover{
		cursor : pointer;
	}

</style>
<body>

<c:if test="${empty board }">

						<!-- 게시글 없을때-->
						<div class="container box111" id="postArea">
							<div class="postLayoutView"
								style="padding: 0%; height: 500px; border: solid black 1px">

								<div class="nanum " style="font-size: 20px; text-align: center;">
									<div style="height: 200px"></div>
									<div class="noPostSignArea container" style="width: 50%;">
										<p class="noPostSign">
											게시물이 없습니다. <br> 첫 게시물을 작성해 보세요.
										</p>
									</div>

								</div>

							</div>
						</div>
						<!-- 게시물 없을때 끝-->
					</c:if>

					<c:if test="${!empty board}">
						<c:forEach var="board" items="${board}" varStatus="vs">

							<!-- 게시글1-->
							<div class="container box111" id="postArea"
								style="margin-bottom: 0px">
								<div class="postLayoutView" style="padding: 0%;">

									<!-- 프로필사진, 작성자명, 날짜 -->
									<div class="post MainWrap"
										style="border: 1px solid black; border-bottom: 0px">
										<div class="profileImgArea" id="profileImgArea"
											style="display: inline-block; width: 12%; margin-bottom: 0px; height: 50px; padding-left: 10px;">
											
											
											<img src="${contextPath}/resources/profileImage/${board.memberProfile}" data-toggle="modal" data-target="#writerModal" id="writerImg"
											style="width: 80%; height: 80%; position: relative; top: 3px; border-radius: 50%;" name="${board.memberNo}"> 
											<%-- <img src="${contextPath}/resources/img/account.png" >  --%>
																						
											
										</div>
										<div class="profileNameArea  nanum" id="profileNameArea"
											style="display: inline-block; width: 81%; margin-bottom: 0px; height: 100%; position: relative; top: 14px">
											<div  >
												<p id="writerNickName" style="margin-bottom: 0;" >${board.boardWriter}</p>
											</div>
											<div style="margin-bottom: 0;">
												<p style="margin-bottom: 0;">
													<fmt:formatDate value="${board.boardWriteDt}" pattern="yyyy년 MM월 dd일 aa hh:mm" />
												</p>
											</div>
										</div>

										<c:if test="${loginMember.memberNickname ne board.boardWriter}">

										</c:if>
										
										<c:if test="${loginMember.memberNickname eq board.boardWriter}">
										<div style="display: inline-block; width: 5%; margin-bottom: 0px; height: 50px; float: right;">
											<div>
												<div class="optionChevron">
													<img src="${contextPath}/resources/img/download.png"
														style="width: 17px; height: 15px; position: relative; bottom: 2px;"
														id="chev">
													<div id="postMenu" class="hide nanum"
														style="width: 100px; height: 60px; border: black 2px solid; background-color: white; float: right; position: relative; right: 18px; bottom: 12px;">
														<ul>
															<li><a href="#" class="deletePost" id="${board.boardNo}"
																style="color: black;  text-decoration: none;">글 삭제</a></li>
															<li><a href="#" class="updatePost" id="${board.boardNo}"
																style="color: black;  text-decoration: none;">글 수정</a></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										</c:if>

									</div>
									<!-- 프로필사진, 작성자명, 날짜 -->
									
								<!-- 프로필모달 -->
							    <div class="modal fade" id="writerModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="writerModalLabel" aria-hidden="true">
							        <div class="modal-dialog" role="document" style="width:496px;">
							        <div class="modal-content">
							            <div class="modal-header">
							            <h2 class="modal-title nanum" id="writerModalLabel" style="font-weight: bold;">작성자 회원 정보</h2>
							            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          	<span aria-hidden="true">&times;</span>
							        	</button>
							            </div>
							            <div class="modal-body">
							            <!-- content start -->
							                <!-- profile image start -->
							                <div class="row">
							                <div class="col-md-4"></div>
							                <div class="col-md-4">
							                    <div class="profileBox">
							                    <img class="profileImage" src="" alt="이미지" id="writerProfileUrl">
							                    </div>
							                </div>
							                <div class="col-md-4"></div>
							                </div>
							                <!-- profile image end-->
							                <div class="row">
							                <div class="col-md-3"></div>
							                <div class="col-md-6">
							                    <input type="text" id="writerNickName" class="nanum form-control-plaintext text-center" style="font-size: 35px;font-weight: bold;" readonly>
							                </div>
							                <div class="col-md-3"></div>
							                </div>
							                <!-- <div class="row">   회원정보 이메일 
							                <div class="col-md-2"></div>
							                <div class="col-md-8"><input type="text" id="memberEmail" class="nanum form-control-plaintext text-center" style="font-size: 25px;font-weight: bold;" readonly></div>
							                <div class="col-md-2"></div>
							                </div> -->
							                <div class="row">
							                <label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold; font-size: 16px;">이름</label>
							                <div class="col-sm-4">
							                    <input type="text" readonly id="writerName" class="nanum form-control-plaintext text-center"  style="font-size: 25px;">
							                </div>
							                <label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold; font-size: 16px;">나이</label>
							                <div class="col-sm-4">
							                    <input type="text" readonly id="writerAge" class="nanum form-control-plaintext text-center" style="font-size: 25px;">
							                </div>
							                </div>
							
							                <div class="row">
							                <label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold; font-size: 16px;">성별</label>
							                <div class="col-sm-4">
							                	<input type="text" readonly id="writerGender" class="nanum form-control-plaintext text-center" style="font-size: 25px;">
							                </div>
							                <label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold; font-size: 16px;">전화번호</label>
							                <div class="col-sm-4">
							                    <input type="text" readonly id="writerPhone" class="nanum form-control-plaintext text-center" style="font-size: 22px;">
							                </div>
							                </div>
							
							                <div class="row" id="writerProfileHobby">
							              	<!-- 관심사 영역 -->
							                </div>
							            
							                
							                <!-- content end -->
							                </div>
							            </div>
							            </div>
							        </div>
							        <!-- end -->
									

									<!-- 게시글내용 -->
									<div class="postMainWrap  nanum"
										style="border: 1px solid black; border-top: 0; border-bottom: 0; width: 100%">
										<div style="padding-left: 10px; padding-right: 10px; width: 100%">

											<p>${board.boardContent}</p>

										</div>
									</div>
									<!-- 게시글내용 -->

									<!-- 댓글수, 좋아요버튼 -->
									<div class="postCountView" style="border: 1px solid black; border-top: 0; height: 30%; padding-top: 5px;">
										<div class="commentArea nanum"  style="display: inline-block; width: 82%; margin-bottom: 0px; padding-left: 10px;">
											<c:choose>
												<c:when test="${board.replyCount eq '0'}">  <!-- 댓글 개수 0 일때 공백처리 -->
												  <p class="commentCount" style="margin-bottom: 0;">댓글</p>
												</c:when> 
												<c:otherwise >  
												  <p class="commentCount" style="margin-bottom: 0;">댓글${board.replyCount}</p>
												</c:otherwise> 
											</c:choose>
										</div>
										
										<div style="width: 14%; margin-bottom: 0px; height: 100%; float: right;">
											<button type="submit" class="btn nanum" style="padding: 0px; position: relative; bottom: 4px;" >
											<c:choose>
												<c:when test="${board.thumbStatus eq 'Y'}"> <!-- 내가 좋아요 누른 게시글 활성화로 표시 -->
												  <img class="likeBtn shake" name="${board.boardNo}" src="${contextPath}/resources/img/like2.png" 	style="display: inline-block; width: 20px; height: 20px; float: right;">
												</c:when> 
												<c:otherwise >  
												  <img class="likeBtn shake" name="${board.boardNo}" src="${contextPath}/resources/img/like.png" 	style="display: inline-block; width: 20px; height: 20px; float: right;">
												</c:otherwise> 
											</c:choose>
											
											</button>
											<c:choose>
												<c:when test="${board.thumbCount eq '0'}">  <!-- 좋아요 개수 0 일때 공백처리 -->
												  <p class="likeCount" style="margin-bottom: 0; display: inline-block;"></p>
												</c:when> 
												<c:otherwise >  
												  <p class="likeCount" style="margin-bottom: 0; display: inline-block;">${board.thumbCount}</p>
												</c:otherwise> 
											</c:choose>
										</div>
									</div>
									<!-- 댓글수, 좋아요버튼 -->



									<!-- 댓글영역 -->
									<div class="CommentWrap " style="display: none;">

										 <!-- 댓글작성 -->
										<div class="inputCommentWrap" style="border: 1px solid black;">

											<div class="writePost" style="width: 80%; display: inline-block; margin-left: 3px;">
												<textarea class="writeCommentArea nanum autosize" id="writeCommentAreaStyle" rows="1"
													style="font-size: 15px;" placeholder="댓글을 작성해 보세요"></textarea>

											</div>
											<div style="width: 20%; display: inline-block; position: absolute;">
												<button type="submit" class="btn nanum" id="commentBtn" name="${board.boardNo}" style="width: 100%; font-size: 18px; font-weight: bolder; position: relative; left: 10px; bottom: 7px;">작성</button>
											</div>
										</div>
										<!-- 댓글작성 -->
										
										

										<!-- 댓글보기 -->
										<div style="border: 1px solid black;">

											<div style="position: relative; left: 14px; border: 0px white; width: 98%;">
												<div class="postMainWrap" style="border-bottom: 0px; height: 80%;">
													<div class="profile${contextPath}/resources/img/Area" id="profileImgArea"
														style="display: inline-block; width: 10%; margin-bottom: 0px; height: 50px; padding-left: 10px;">
													<img src="${contextPath}/resources/img/ogong.jpg" style="width: 90%; height: 70%; position: relative; left: px; top: 3px; border-radius: 50%;">
													</div>
													<div class="profileNameArea  nanum" id="profileNameArea" style="display: inline-block; width: 81%; margin-bottom: 0px; height: 100%; position: relative; top: 14px; font-weight: bolder; font-size: 17px;">
														<div>
															<p style="margin-bottom: 0;">손오공</p>
														</div>
														<div style="margin-bottom: 0; display: inline-block;">
															<p style="margin-bottom: 0;">2020. 2. 20 pm 3:45</p>
														</div>
														<div class="doubleCommentArea" style="display: inline-block; width: 14%; margin-bottom: 0px; padding-left: 2%;">
															<p style="margin-bottom: 0; font-size: 13px;">댓글2</p>
														</div>
														<div style="display: inline-block; width: 5%; margin-bottom: 0px; height: 100%;">
															<img class="likeBtn shake"	src="${contextPath}/resources/img/like.png" style="width: 16px; height: 16px; position: relative; bottom: 3px;">
														</div>
														<p style="margin-bottom: 0; font-size: 13px; display: inline-block;">5</p>
													</div>
													<div style="display: inline-block; width: 5%; margin-bottom: 0px; height: 50px; float: right;">

														<div>
															<div class="optionChevron">
																<img src="${contextPath}/resources/img/download.png" style="width: 17px; height: 15px; position: relative; bottom: 2px; right: 7px;">
																<div class="hide nanum" id="postMenu2" style="width: 100px; height: 80px; border: black 2px solid; background-color: white; float: right; position: relative; right: 25px; bottom: 12px;">
																	<ul>
																		<li><a href="#" name="deletePost"
																			style="color: black;">댓글 삭제</a></li>
																		<li><a href="#" name="deletePost"
																			style="color: black;">댓글 수정</a></li>
																	</ul>
																</div>
															</div>
														</div>

													</div>
												</div>

												<div class="commentContentWrap nanum">
													<div style="padding-left: 10px; font-weight: bolder;">
														<p>Wassup Seoul 댓글 테스트중</p>
													</div>
												</div>
											</div>
											<!-- 댓글 1 -->

											<!-- 대댓글 -->
											<div class="doubleCommentWrap" style="display: none;">

												<!-- 대댓글보기1 -->
												<div style="border: px solid black; border-top: 2px solid black;">
													<div style="position: relative; left: 40px; border: 0px white; width: 92%;">
														<div class="postMainWrap" style="border-bottom: 0px">
															<div class="profileImgArea" id="profileImgArea" style="display: inline-block; width: 10%; margin-bottom: 0px; height: 50px; padding-left: 10px;">
															<img src="${contextPath}/resources/img/account.png" style="width: 90%; height: 70%; position: relative; left: px; top: 3px; border-radius: 50%;">
															</div>
															<div class="profileNameArea  nanum" id="profileNameArea" style="display: inline-block; width: 81%; margin-bottom: 0px; height: 100%; position: relative; top: 14px; font-weight: bolder; font-size: 17px;">
																<div>
																	<p style="margin-bottom: 0;">삼장법사</p>
																</div>
																<div style="margin-bottom: 0; display: inline-block;">
																	<p style="margin-bottom: 0;">2020. 2. 20 pm 3:47</p>
																</div>
																<div style="display: inline-block; width: 8%; margin-bottom: 0px; height: 100%;">
																	<img class="likeBtn shake" src="${contextPath}/resources/img/like.png" 	style="width: 15px; height: 15px; position: relative; float: right; top: 1px;">
																</div>
																<p style="margin-bottom: 0; font-size: 13px; display: inline-block;">2</p>

															</div>
															<div style="display: inline-block; width: 5%; margin-bottom: 0px; height: 50px; float: right;">

																<div>
																	<div class="optionChevron">
																		<img src="${contextPath}/resources/img/download.png"
																			style="width: 17px; height: 15px; position: relative; bottom: 2px; right: 3px;">
																		<div class="hide nanum" id="postMenu2"
																			style="width: 100px; height: 80px; border: black 2px solid; background-color: white; float: right; position: relative; right: 21px; bottom: 12px;">
																			<ul>
																				<li><a href="#" name="deletePost"
																					style="color: black;">댓글 삭제</a></li>
																				<li><a href="#" name="deletePost"
																					style="color: black;">댓글 수정</a></li>
																			</ul>
																		</div>
																	</div>
																</div>

															</div>
														</div>

														<div class="commentContentWrap nanum" 	sytle="font-weight: bolder;">
															<p>Wassup Seoul 대댓글 테스트중</p>
														</div>
													</div>
												 </div>
												 <!-- 대댓글보기1 -->
												</div>
												<!-- 대댓글 -->
												

												<!-- 대댓글작성 -->
												<div class="inputCommentWrap"
													style="border: 1px solid black;">

													<div class="writePost"
														style="width: 80%; display: inline-block; margin-left: 3px;">
														<textarea class="writeCommentArea2 nanum"
															id="writeCommentAreaStyle" rows="1"
															style="border-left: none;" placeholder="댓글을 작성해 보세요"></textarea>
													</div>
													<div
														style="width: 20%; display: inline-block; position: absolute;">
														<button type="submit" class="btn nanum"	style="width: 100%; font-size: 18px; font-weight: bolder; position: relative; left: 10px; bottom: 7px">
															작성</button>
													</div>
												</div>
												<!-- 대댓글작성 -->
											</div>
											<!-- 댓글보기 --> 

										</div>
										<!-- 댓글영역 -->
										
									</div>
								</div><!-- 게시글1 끝-->
							
							<div class="row"style="height: 20px; background-color: rgb(221, 233, 218);"></div>
							<!-- 게시글1 후 여백-->
							
						</c:forEach>
					</c:if>

<script>
$(document).ready(function() {
	
	
	
});

</script>
</body>
</html>