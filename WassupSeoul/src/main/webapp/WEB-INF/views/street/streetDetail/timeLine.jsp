<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/timeline.css" type="text/css">
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3B2jMzpJSy5YG5-T11FaB4SCKPkjQ3Sc&callback=initMap"></script>

<title>타임라인 게시글 영역</title>
</head>

<style>
	.writerImg:hover{
		cursor : pointer;
	}
	.writerNickName:hover{
		cursor : pointer;
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
		overflow: auto;
	}
	.postMainWrap iframe,
	.postMainWrap object,
	.postMainWrap embed {
		position: absolute;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	}
	.postMainWrap img{
		position: absolute; 
		top:0; 
		left: 0;
		width: auto;
		height: 100%;
	}
	/* (3/24)미현수정 끝  */
	
	
</style>
<body>
	 <!-- <script>
      function initMap() {
    	 var geocoder = new google.maps.Geocoder;  
        var map2 = new google.maps.Map(document.getElementByClassName('map'), {
          zoom: 15,
          center: {lat: 37.5724723, lng: 126.9737442}
        });
          geocodeAddress(geocoder, map2);
          
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 15,
            center: {lat: 37.5724723, lng: 126.9737442}
         });

          document.getElementById('mapSubmit').addEventListener('click', function() {
            geocodeAddress(geocoder, map);
          });  
      }

      function geocodeAddress(geocoder, resultsMap) {
    	var address =  $(".map").attr("name");
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === 'OK') {
        	  var coords = results[0].geometry.location;
            	resultsMap.setCenter(coords);
           	 var marker2 = new google.maps.Marker({
           		   map: resultsMap,
             	   position: coords
            });
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      }
    </script>   -->

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

		<!-- 게시물 있을때 -->
	<c:if test="${!empty board}">
		<c:forEach var="board" items="${board}" varStatus="vs">

			<!-- 게시글1-->
			<div class="container box111" id="postArea" style="margin-bottom: 0px">
				<div class="postLayoutView" style="padding: 0%;">

					<!-- 프로필사진, 작성자명, 날짜 -->
					<div class="post MainWrap" style="border: 1px solid black; border-bottom: 0px">
						<div class="profileImgArea" id="profileImgArea" style="display: inline-block; width: 12%; margin-bottom: 0px; height: 50px; padding-left: 10px;">

							 <img src="${contextPath}/resources/profileImage/${board.memberProfile}" 
									data-toggle="modal" data-target="#writerModal" id="writerImg" class="writerImg"
									style="width: 80%; height: 80%; position: relative; top: 3px; border-radius: 50%;" name="${board.memberNo}"> 
							<%-- <img src="${contextPath}/resources/img/account.png" >  --%>

						</div>
						<div class="profileNameArea  nanum" id="profileNameArea" style="display: inline-block; width: 81%; margin-bottom: 0px; height: 100%; position: relative; top: 14px">
							<div>
								<p class="writerNickName" name="${board.memberNo}"  style="margin-bottom: 0;"
										data-toggle="modal" data-target="#writerModal" >${board.boardWriter}</p>
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
												<li><a href="#" class="deletePost" id="${board.boardNo}">글 삭제</a></li>
												<li><a href="#" class="updatePost" id="${board.boardNo}">글 수정</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</c:if>

					</div>
					<!-- 프로필사진, 작성자명, 날짜 -->

					<!-- 프로필모달 -->
					<div class="modal fade" id="writerModal" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="checkMemModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document" style="width: 496px;">
							<div class="modal-content">
								<div class="modal-header">
									<h2 class="modal-title nanum" id="checkMemModalLabel"
										style="font-weight: bold;">작성자 회원 정보</h2>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
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
												<img class="profileImage" src="" alt="이미지"
													class="checkMemProfileUrl">
											</div>
										</div>
										<div class="col-md-4"></div>
									</div>
									<!-- profile image end-->
									<div class="row">
					                <div class="col-md-3"></div>
					                <div class="col-md-6">
					                    <input type="text" class="checkMemNickName" class="nanum form-control-plaintext text-center" 
					                    					style="font-size: 35px;font-weight: bold;" readonly>
					                </div>
										<div class="col-md-3"></div>
									</div>
									<!-- <div class="row">   회원정보 이메일 
							                <div class="col-md-2"></div>
							                <div class="col-md-8"><input type="text" id="memberEmail" class="nanum form-control-plaintext text-center" style="font-size: 25px;font-weight: bold;" readonly></div>
							                <div class="col-md-2"></div>
							              </div> -->
									<div class="row">
										<label class="col-sm-2 col-form-label text-center nanum"
											style="font-weight: bold; font-size: 16px;">이름</label>
										<div class="col-sm-4">
											<input type="text" readonly class="checkMemName"
												class="nanum form-control-plaintext text-center"
												style="font-size: 25px;">
										</div>
										<label class="col-sm-2 col-form-label text-center nanum"
											style="font-weight: bold; font-size: 16px;">나이</label>
										<div class="col-sm-4">
											<input type="text" readonly class="checkMemAge"
												class="nanum form-control-plaintext text-center"
												style="font-size: 25px;">
										</div>
									</div>

									<div class="row">
										<label class="col-sm-2 col-form-label text-center nanum"
											style="font-weight: bold; font-size: 16px;">성별</label>
										<div class="col-sm-4">
											<input type="text" readonly class="checkMemGender"
												class="nanum form-control-plaintext text-center"
												style="font-size: 25px;">
										</div>
										<label class="col-sm-2 col-form-label text-center nanum"
											style="font-weight: bold; font-size: 16px;">전화번호</label>
										<div class="col-sm-4">
											<input type="text" readonly class="checkMemPhone"
												class="nanum form-control-plaintext text-center"
												style="font-size: 22px;">
										</div>
									</div>

									<div class="row" class="checkMemProfileHobby" name="checkMemProfileHobby">
										<!-- 관심사 영역 -->
									</div>
									<!-- content end -->
									
								</div>
							</div>
						</div>
					</div>
					<!-- end -->
					
					<jsp:include page="../streetDetail/profileModal.jsp"/> 

					<!-- 게시글내용 -->
					<div class="postMainWrap  nanum"
						style="border: 1px solid black; border-top: 0; border-bottom: 0; width: 100%">
						<div style="padding-left: 10px; padding-right: 10px; width: 100%">


							<c:choose>
								<c:when test="${board.typeNo eq '6'}">
								
									<div class="map_wrap">
										<div class="map" name="${board.boardContent}" style="width:100%;height:200px;position:relative;overflow:hidden;"></div>
									</div>
									
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
					<div class="postCountView"
						style="border: 1px solid black; border-top: 0; height: 30%; padding-top: 5px;">
						<div class="commentArea nanum"
							style="display: inline-block; width: 82%; margin-bottom: 0px; padding-left: 10px;">
							<c:choose>
								<c:when test="${board.replyCount eq '0'}">
									<!-- 댓글 개수 0 일때 공백처리 -->
									<p class="commentCount" style="margin-bottom: 0;">댓글</p>
								</c:when>
								<c:otherwise>
									<p class="commentCount" style="margin-bottom: 0;">댓글${board.replyCount}</p>
								</c:otherwise>
							</c:choose>
						</div>

						<div style="width: 14%; margin-bottom: 0px; height: 100%; float: right;">
							<button type="submit" class="btn nanum"
								style="padding: 0px; position: relative; bottom: 4px;">
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
					</div>
					<!-- 댓글수, 좋아요버튼 -->

					<!-- 댓글영역 -->
					<div class="CommentWrap " style="display: none;">

						<!-- 댓글작성 -->
						<div class="inputCommentWrap" style="border: 1px solid black;">

							<div class="writePost"
								style="width: 80%; display: inline-block; margin-left: 3px;">
								<textarea class="writeCommentArea nanum autosize"
									id="writeCommentAreaStyle" rows="1" style="font-size: 15px;"
									placeholder="댓글을 작성해 보세요"></textarea>

							</div>
							<div style="width: 20%; display: inline-block; position: absolute;">
								<button type="submit" class="btn nanum commentBtn" id="commentBtn" name="${board.boardNo}"
									style="width: 100%; font-size: 18px; font-weight: bolder; position: relative; left: 10px; bottom: 7px;">작성</button>
							</div>
						</div>
						<!-- 댓글작성 -->
						<c:if test="${empty reply}">
						</c:if>


						<c:if test="${!empty reply}">
							<c:forEach var="reply" items="${reply}" varStatus="vs">
								<c:if test="${reply.boardNo eq board.boardNo}">
									<c:if test="${reply.replyLevel eq '1'}">
										<!-- 댓글보기 -->
										<div style="border: 1px solid black;">

											<div style="position: relative; left: 14px; border: 0px white; width: 98%;">
												<div class="postMainWrap" style="border-bottom: 0px; height: 80%;">
													<div class="profile${contextPath}/resources/img/Area"
														id="profileImgArea"
														style="display: inline-block; width: 10%; margin-bottom: 0px; height: 50px; padding-left: 10px;">
														<img src="${contextPath}/resources/profileImage/${reply.memberProfile}" class="writerImg" name="${reply.memberNo}"
															style="width: 90%; height: 70%; position: relative; left: px; top: 3px; border-radius: 50%;" data-toggle="modal" data-target="#writerModal">
													</div>
													<div class="profileNameArea  nanum" id="profileNameArea"
														style="display: inline-block; width: 81%; margin-bottom: 0px; height: 100%; position: relative; top: 14px; font-weight: bolder; font-size: 17px;">
														<div>
															<p style="margin-bottom: 0;" class="writerNickName" name="${reply.memberNo}" data-toggle="modal" data-target="#writerModal" >${reply.replyWriter}</p>
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
														<div style="display: inline-block; width: 5%; margin-bottom: 0px; height: 100%;">
															
															<c:choose>
																<c:when test="${reply.thumbStatus eq 'Y'}">
																	<!-- 내가 좋아요 누른 게시글 활성화로 표시 -->
																	<img class="likeBtn2 shake"
																		src="${contextPath}/resources/img/like2.png" name="${reply.replyNo}" id="${board.boardNo}"
																		style="width: 16px; height: 16px; position: relative; bottom: 3px; right:10px;">
																</c:when>
																<c:otherwise>
																	<img class="likeBtn2 shake"
																		src="${contextPath}/resources/img/like.png" name="${reply.replyNo}" id="${board.boardNo}"
																		style="width: 16px; height: 16px; position: relative; bottom: 3px; right:10px;">
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
													</div>
													
													<!-- 로그인 사용자가 댓글 작성자와 다를때 삭제메뉴 안보임 -->
													<c:if test="${loginMember.memberNickname ne reply.replyWriter}">

													</c:if>

													<c:if test="${loginMember.memberNickname eq reply.replyWriter}">
														<div
															style="display: inline-block; width: 5%; margin-bottom: 0px; height: 50px; float: right;">

															<div>
																<div class="optionChevron">
																	<img src="${contextPath}/resources/img/download.png"
																		style="width: 17px; height: 15px; position: relative; bottom: 2px; right: 7px;">
																	<div class="hide nanum" id="postMenu2"
																		style="width: 100px; height: 80px; border: black 2px solid; background-color: white; float: right; position: relative; right: 25px; bottom: 12px;">
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
													</c:if>

												</div>


												<div class="commentContentWrap nanum">
													<div style="padding-left: 10px; font-weight: bolder;">
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
																<div style="border: px solid black; border-top: 2px solid black;">
																	<div style="position: relative; left: 40px; border: 0px white; width: 92%;">
																		<div class="postMainWrap" style="border-bottom: 0px">
																			<div class="profileImgArea" id="profileImgArea"
																				style="display: inline-block; width: 10%; margin-bottom: 0px; height: 50px; padding-left: 10px;">
																				<img src="${contextPath}/resources/profileImage/${reReply.memberProfile}" class="writerImg" name="${reReply.memberNo}"
																					style="width: 90%; height: 70%; position: relative; left: px; top: 3px; border-radius: 50%;" data-toggle="modal" data-target="#writerModal">
																			</div>
																			<div class="profileNameArea  nanum" id="profileNameArea"
																				style="display: inline-block; width: 81%; margin-bottom: 0px; height: 100%; position: relative; top: 14px; font-weight: bolder; font-size: 17px;">
																				<div>
																					<p style="margin-bottom: 0;" class="writerNickName" name="${reReply.memberNo}" 
																						data-toggle="modal" data-target="#writerModal">${reReply.replyWriter}</p>
																				</div>
																				<div style="margin-bottom: 0; display: inline-block;">
																					<p style="margin-bottom: 0;">
																					<fmt:formatDate value="${reReply.replyDt}" pattern="yyyy년 MM월 dd일 aa hh:mm" /></p>
																					<%-- <p style="margin-bottom: 0; font-size: 13px;">댓글${reReply.rereplyCount}</p> --%>
																				</div>
																				<div style="display: inline-block; width: 8%; margin-bottom: 0px; height: 100%;">
																					
																					<c:choose>
																						<c:when test="${reReply.thumbStatus eq 'Y'}">
																							<!-- 내가 좋아요 누른 게시글 활성화로 표시 -->
																							<img class="likeBtn3 shake"
																								src="${contextPath}/resources/img/like2.png" name="${reReply.replyNo}" id="${board.boardNo}"
																								style="width: 16px; height: 16px; position: relative; bottom: 3px; left:10px;">
																						</c:when>
																						<c:otherwise>
																							<img class="likeBtn3 shake"
																								src="${contextPath}/resources/img/like.png" name="${reReply.replyNo}" id="${board.boardNo}"
																								style="width: 16px; height: 16px; position: relative; bottom: 3px; left:10px;">
																						</c:otherwise>
																					</c:choose>
																				</div>
																				<c:choose>
																					<c:when test="${reReply.reReplyThumbCount eq '0'}">
																						<!-- 좋아요 개수 0 일때 공백처리 -->
																						<p style="margin-bottom: 0; font-size: 13px; display: inline-block;"></p>
																					</c:when>
																					<c:otherwise>
																						<p style="margin-bottom: 0; font-size: 13px; display: inline-block;">${reReply.reReplyThumbCount}</p>
																					</c:otherwise>
																				</c:choose>

																			</div>

																			<c:if
																				test="${loginMember.memberNickname ne reReply.replyWriter}">

																			</c:if>

																			<c:if
																				test="${loginMember.memberNickname eq reReply.replyWriter}">
																				<div
																					style="display: inline-block; width: 5%; margin-bottom: 0px; height: 50px; float: right;">

																					<div>
																						<div class="optionChevron">
																							<img
																								src="${contextPath}/resources/img/download.png"
																								style="width: 17px; height: 15px; position: relative; bottom: 2px; right: 3px;">
																							<div class="hide nanum" id="postMenu2"
																								style="width: 100px; height: 80px; border: black 2px solid; background-color: white; float: right; position: relative; right: 21px; bottom: 12px;">
																								<ul>
																									<li><a href="#" name="deletePost"
																										style="color: black;">댓글 삭제</a></li>
																									<li><a href="#" 
																										style="color: black;">댓글 수정</a></li>
																								</ul>
																							</div>
																						</div>
																					</div>

																				</div>
																			</c:if>
																		</div>

																		<div class="commentContentWrap nanum" style="font-weight: bolder;">
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
												<!-- 대댓글작성 -->
												<div class="inputCommentWrap"
													style="border: 1px solid black;">

													<div class="writePost"
														style="width: 80%; display: inline-block; margin-left: 3px;">
														<textarea class="writeCommentArea2 nanum" id="writeCommentAreaStyle" rows="1"
															style="border-left: none;" placeholder="댓글을 작성해 보세요"></textarea>
													</div>
													<div style="width: 20%; display: inline-block; position: absolute;">
														<button type="submit" class="btn nanum reCommentBtn" id="${board.boardNo}" name="${reply.replyNo}" style="width: 100%; font-size: 18px; font-weight: 
																bolder; position: relative; left: 10px; bottom: 7px"  >작성</button>
													</div>
												</div>
												<!-- 대댓글작성 -->
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

			<div class="row"
				style="height: 20px; background-color: rgb(221, 233, 218); z-index: -5;"></div>
			<!-- 게시글1 후 여백-->

		</c:forEach>
	</c:if>


</body>
</html>