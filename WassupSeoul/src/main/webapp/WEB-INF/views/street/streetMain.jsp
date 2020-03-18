<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/timeline.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/fullcalendar.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/daygrid.css"
	type="text/css">

<title>타임라인</title>
</head>

<style>
#modal {
	display: none;
	position: absolute;
	width: 200px;
	height: 700px;
	z-index: 1;
}

/* .mapModal{
  display: none;
  position:relative;
  width:300px;
  height:100%;
  z-index:1;

} */
#modal button {
	display: inline-block;
	width: 60px;
	margin-left: calc(100% - 100px - 10px);
}

#modal .modal_content {
	height: 700px;
	width: 700px;
	margin: 100px auto;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

#modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}
</style>
<body>
	<%--  <%@include file="../common/header.jsp"%>  --%>
	<!-- <script>
$(document).ready(function(){
	  var modalLink = $(".img1");
	  var modalCont = $(".modalContent");
	  var marginLeft = modalCont.outerWidth()/2;
	  var marginTop = modalCont.outerHeight()/2; 

	  modalLink.click(function(){
		$(this).parent().next("div").fadeIn(0.1);
	    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
	    $(this).blur();
	    $(".modalContent > a").focus(); 
	    return false;
	  });

	  $(".modalContent > button").click(function(){
		$(this).parent().parent("div").fadeOut(0.1);
	  });		
	});
</script> -->

	<div class="container-fluid" style="margin-top: 57px;">
		<div class="row">

			<div class="col-md-12" style="padding: 0px;">
				<nav class="navbar navbar-dark bg-dark py-1" disabled>
					<div class="container" disabled>
						<a class="py-1" href="#" aria-label="Product"></a> <a
							class="py-1 d-none d-md-inline-block nanum" href="#">게시판</a> <a
							class="py-1 d-none d-md-inline-block nanum" href="#">사진첩</a> <a
							class="py-1 d-none d-md-inline-block nanum" href="#">일정</a> <a
							class="py-1 d-none d-md-inline-block nanum" href="#">주민목록</a> <a
							class="py-1" href="#" aria-label="Product"></a>
					</div>
				</nav>
			</div>

		</div>
	</div>

	<!-- 이미지 Modal -->
	<div id="myModal" class="modal"
		style="position: absolute; left: 10%; top: 10%;">
		<span class="close">×</span> <img class="modal-content" id="img01">
		<div id="caption"></div>
	</div>

	<!-- 컨텐츠영역-->
	<div class="container" style="margin-top: 10px;">

		<div class="row">
			<div class="col-md-3" id="devideArea">

				<!-- 사이드 1 시작 -->
				<div class="row" style="background-color: rgb(221, 233, 218);">
					<div class="card mb-3">
						<img style="height: 200px; width: 100%; display: block;"
							src="${contextPath}/resources/img/골목.jpg" alt="Card image">
						<div class="card-body">
							<input type="text" class="form-control-plaintext nanum"
								value="${street.streetNm}"
								style="font-size: 25px; font-weight: bold;">
							<div class="form-group row">
								<label class="col-sm-4 col-form-label nanum"
									style="font-weight: bold; font-size: 15px;">${street.streetMaxMember}</label>
								<div class="col-sm-8">
									<input type="text" readonly
										class="form-control-plaintext nanum" value="150"
										style="font-size: 15px;">
								</div>
								<label class="col-sm-4 col-form-label nanum"
									style="font-weight: bold; font-size: 15px;">골목대장</label>
								<div class="col-sm-8">
									<input type="text" readonly
										class="form-control-plaintext nanum" value="남궁민수"
										style="font-size: 15px;">
								</div>
							</div>
							<div class="col-sm-12">
								<textarea class="form-control nanum" rows="2" readonly
									style="resize: none;">${street.streetIntro}</textarea>
							</div>
							<br>
							<div class="col-md-12 golmokKeywordBox"
								style="background-color: #36be81; border-radius: 20px; margin-bottom: 5px;">
								<input type="text" readonly class="form-control-plaintext nanum"
									value="#우리골목의 키워드1입니다" style="color: white;">
							</div>
							<div class="col-md-12 golmokKeywordBox"
								style="background-color: #36be81; border-radius: 20px; margin-bottom: 5px;">
								<input type="text" readonly class="form-control-plaintext nanum"
									value="#우리골목의 키워드2입니다" style="color: white;">
							</div>
							<div class="col-md-12 golmokKeywordBox"
								style="background-color: #36be81; border-radius: 20px; margin-bottom: 5px;">
								<input type="text" readonly class="form-control-plaintext nanum"
									value="#우리골목의 키워드3입니다" style="color: white;">
							</div>
						</div>
						<div class="card-body">
							<button type="button"
								class="btn btn-secondary btn-lg btn-block nanum"
								style="font-size: 20px; font-weight: bold;"
								onclick="streetJoin()">골목 가입하기</button>
							<br>
							<script>
								function streetJoin() {
									if (confirm("가입을 신청하시겠습니까?")) {
										$
												.ajax({
													url : "${contextPath}/street/streetJoin",
													success : function(result) {
														if (result == -1) {
															alert("더 이상 골목에 가입할 수 없습니다");
														}
														alert("골목 가입 신청 완료");
													},
													error : function() {
														alert("골목 가입 신청 과정 중 오류 발생");
													}
												})
									}
								}
							</script>
							<a href="#" class="card-link nanum">골목 탈퇴하기</a><br> <a
								href="#" class="card-link nanum">골목 변경하기</a> <a href="#"
								class="card-link nanum">활동보고서 작성</a>
						</div>
						<div class="card-footer text-muted nanum">
							누구나 골목을 검색해 찾을 수 있고, <br>게시물을 볼 수 있습니다.
						</div>
						<div class="card-footer text-muted nanum">이 골목은 누구나 검색해 찾을 수
							있지만, 게시물은 주민만 볼 수 있습니다.</div>
					</div>
				</div>
				<!-- 사이드 1 끝 -->

			</div>

			<!-- 타임라인-->
			<div class="col-md-6" id="devideArea">

				<!-- 검색Bar-->
				<div class="row" id="searchArea"
					style="width: 99%; margin-left: 1px;">
					<div class="container" id="searchBox"
						style="padding: 0; width: 100%; background-color: rgb(221, 233, 218)">
						<div id="searchWrap">

							<form method="GET" id="login-form-input">
								<div
									style="margin: 0px; width: 100%; background-color: rgb(221, 233, 218);">
									<input type="text" class="form-control nanum"
										placeholder=" 내용, @작성자 검색" id="searchBox"
										style="width: 90%; margin-right: 10px; border-right: black 2px solid;">
									<button type="submit" class="btn " id="searchBtn">
										<img src="${contextPath}/resources/img/searchButton.png"
											style="width: 90%; height: 90%; border-left: black 2px solid;">
									</button>
								</div>
							</form>

						</div>
					</div>
				</div>
				<!-- 검색Bar -->



				<!-- 글작성 영역 -->
				<div class="container box111" id="postArea">
					<div class="postLayoutView " style="padding: 0%;">
						<form action="insert" method="post" enctype="multipart/form-data"
							role="form" onsubmit="return validate();">


							<div class="writePost">
								<textarea class="postArea nanum" id="writePostArea"
									name="boardContent" rows="3" placeholder="새로운 게시글을 작성해보세요"></textarea>
							</div>

							<div class="postCountView"
								style="border: 1px solid black; height: 45px;">

								<div class="writeOptionArea shake">
									<img class="writeOption img1"
										src="${contextPath}/resources/img/imageIcon.png">
									<p class="arrow_box">사진</p>
								</div>


								<div class="writeOptionArea shake">
									<img class="writeOption"
										src="${contextPath}/resources/img/film.png">
									<p class="arrow_box">동영상</p>
								</div>

								<!-- 파일첨부 -->
								<div class="writeOptionArea shake">
									<img class="writeOption mapOption"
										src='${contextPath}/resources/img/paperclip.png'>
									<p class="arrow_box">파일첨부</p>
								</div>

								<script>
									// file 업로드 이미지 미리보기

									function readURL(input) {
										if (input.files && input.files[0]) {
											var reader = new FileReader();
											reader
													.readAsDataURL(input.files[0]);

											reader.onload = function(e) {

												var tempImage = new Image();
												tempImage.src = reader.result;
												console.log(tempImage);
												tempImage.onload = function() {
													var canvas = document
															.createElement('canvas');
													var canvasContext = canvas
															.getContext("2d");

													var img = new Image();
													img.src = e.target.result;

													canvas.width = img.width * 0.5;
													canvas.height = img.height * 0.5;

													canvasContext.drawImage(
															this, 0, 0,
															canvas.width,
															canvas.height);

													var dataURI = canvas
															.toDataURL("image/png");

													document
															.querySelector("#thumbnail").src = dataURI;

												}
											};

										}
								</script>



								<div class="writeOptionArea shake">
									<img class="writeOption"
										src="${contextPath}/resources/img/vote.png">
									<p class="arrow_box">투표</p>
								</div>
								<div class="writeOptionArea shake">
									<img class="writeOption"
										src="${contextPath}/resources/img/pie-chart.png">
									<p class="arrow_box">N빵</p>
								</div>


								<div class="writeOptionArea shake">
									<img class="writeOption mapOption"
										src="${contextPath}/resources/img/map.png">
									<p class="arrow_box">지도</p>
								</div>

								<!-- 지도 모달  -->
								<div id="modal" class="nanum mapModal">

									<div class="modal_content" style="padding: 3px;">
										<button type="button" id="modal_close_btn"
											style="width: 20px; height: 20px; font-size: 5px; float: right;">X</button>

										<textarea class=" nanum" id="writePostArea" rows="6"
											placeholder="게시글내용을 입력하세요."
											style="border: 1px solid black; color: black; font-size: 17px; height: 200px"></textarea>
										<input type="text" id="sample5_address" placeholder="주소">
										<input type="button" onclick="sample5_execDaumPostcode()"
											value="주소 검색"><br>
										<div id="map"
											style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
									</div>

									<div class="modal_layer"></div>
								</div>


								<!-- <div id="modal" class="nanum mapModal">
								   
								    <div class="modal_content" style="padding: 3px;">
								        <button type="button" id="modal_close_btn" style="width: 20px; height: 20px; font-size: 5px; 
																							float: right; ">X</button>

										<textarea class=" nanum" id="writePostArea"
										 rows="6" placeholder="게시글내용을 입력하세요."
										style="border: 1px solid black; color: black; font-size: 17px; height:200px"></textarea>													
										<input type="text" placeholder="주소 입력 " style="width: 420px; display: inline-block;">
										<button type="button" style="inline-block; font-size: 15px; width:60px; margin: 0px;">검색 </button>
								   		 <div id="map" style="width: 600px; height: 400px;"></div>
								       
								    </div>
								   
								  	  <div class="modal_layer"></div>
								</div> -->

								<!-- <script type="text/javascript"
											src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a32d3d818847c093a324db2e8ffc840">
											
										</script>
						
										<script>
											var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
						
											var options = { //지도를 생성할 때 필요한 기본 옵션
						
												center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
						
												level : 3
											//지도의 레벨(확대, 축소 정도)
						
											};
						
											var map = new kakao.maps.Map(container, options);
										</script>  -->

								<div class="writeOptionArea shake">
									<img class="writeOption"
										src="${contextPath}/resources/img/sketch.png">
									<p class="arrow_box">스케치</p>
								</div>

								<div id="writePostBtn"
									style="display: inline-block; width: 18%; margin-bottom: 0px; height: 100%; float: right;">
									<button type="submit" class="btn nanum"
										style="height: 40px; font-size: 18px; font-weight: bolder; position: relative; bottom: 1px; right: 7px; float: right;">작성</button>
								</div>

							</div>

						</form>
					</div>
				</div>
				<!-- 글작성 영역 -->

				<div class="row"
					style="height: 20px; background-color: rgb(221, 233, 218);"></div>

				<!-- 게시글영역-->
				<div class="postWrapView">

					<c:if test="${empty board }">

						<!-- 게시글 없을때-->
						<div class="container box111" id="postArea">
							<div class="postLayoutView"
								style="padding: 0%; height: 500px; border: solid black 1px">

								<div class="nanum " style="font-size: 20px; text-align: center;">
									<div style="height: 200px"></div>
									<div class="noPostSignArea container" style="width: 50%;">
										<p class=" noPostSign">
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

											<!-- 프로필 사진 있을시 넣기 -->
											<img src="${contextPath}/resources/img/account.png"
												style="width: 80%; height: 80%;">

										</div>
										<div class="profileNameArea  nanum" id="profileNameArea"
											style="display: inline-block; width: 81%; margin-bottom: 0px; height: 100%; position: relative; top: 14px">
											<div>
												<p style="margin-bottom: 0;">${board.boardWriter}</p>
											</div>
											<div style="margin-bottom: 0;">
												<p style="margin-bottom: 0;">
													<fmt:formatDate value="${board.boardWriteDt}"
														pattern="yyyy년 MM월 dd일 aa hh:mm" />
												</p>
											</div>

										</div>

										<c:if
											test="${loginMember.memberNickname ne board.boardWriter}">

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
																style="color: black;">글 삭제</a></li>
															<li><a href="#" class="updatePost" id="${board.boardNo}
																style="color: black;">글 수정</a></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										</c:if>





									</div>
									<!-- 프로필사진, 작성자명, 날짜 -->

									<!-- 게시글내용 -->
									<div class="postMainWrap  nanum"
										style="border: 1px solid black; border-top: 0; border-bottom: 0; width: 100%">
										<div
											style="padding-left: 10px; padding-right: 10px; width: 100%">

											<p>${board.boardContent}</p>

										</div>
									</div>
									<!-- 게시글내용 -->

									<!-- 댓글수, 좋아요버튼 -->
									<div class="postCountView"
										style="border: 1px solid black; border-top: 0; height: 30%; padding-top: 5px;">
										<div class="commentArea nanum"
											style="display: inline-block; width: 82%; margin-bottom: 0px; padding-left: 10px;">
											<p class="commentCount${board.boardNo}"
												style="margin-bottom: 0;">댓글2</p>
										</div>
										<div
											style="width: 14%; margin-bottom: 0px; height: 100%; float: right;">



											<button type="submit" class="btn nanum"
												style="padding: 0px; position: relative; bottom: 4px;"
												onclick="'javascript: like_func();'">

												<img class="likeBtn shake" name="${board.boardNo}"
													src="${contextPath}/resources/img/like.png"
													style="display: inline-block; width: 20px; height: 20px; float: right;">

											</button>

											<p class="likeCount"
												style="margin-bottom: 0; display: inline-block;">10</p>

											<div class="hide nanum" id="postMenu2"
												style="width: 120px; height: 150px; border: black 2px solid; background-color: white; float: right; position: absolute; right: 20px; bottom: 40px; z-index: 10;">
												<ul style="padding-left: 5%;">


													<li>
														<div style="width: 20%; display: inline-block;">
															<img src="${contextPath}/resources/img/account.png"
																style="width: 100%; height: 100%;">
														</div>
														<div style="width: 75%; display: inline-block;">
															<p style="margin-bottom: 0;">홍길동</p>
														</div>
													</li>

													<li>
														<div style="width: 20%; display: inline-block;">
															<img src="${contextPath}/resources/img/account.png"
																style="width: 100%; height: 100%;">
														</div>
														<div style="width: 75%; display: inline-block;">
															<p style="margin-bottom: 0;">홍길동</p>
														</div>
													</li>

												</ul>
											</div>
										</div>
									</div>
									<!-- 댓글수, 좋아요버튼 -->

									<!-- 댓글영역 -->
									<div class="CommentWrap " style="display: none;">

										<!-- 댓글작성 -->

										<div class="inputCommentWrap" style="border: 1px solid black;"
											onkeydown="resize2(this)" onkeyup="resize2(this)">

											<div class="writePost"
												style="width: 80%; display: inline-block; margin-left: 3px;">
												<textarea class="writeCommentArea nanum autosize"
													onkeydown="resize(this)" onkeyup="resize(this)"
													id="writeCommentAreaStyle" rows="1"
													style="font-size: 15px;" placeholder="댓글을 작성해 보세요"></textarea>

											</div>
											<div
												style="width: 20%; display: inline-block; position: absolute;">
												<button type="submit" class="btn nanum"
													style="width: 100%; font-size: 18px; font-weight: bolder; position: relative; left: 10px; bottom: 7px">작성</button>
											</div>
										</div>
										<!-- 댓글작성 -->

										<!-- 댓글보기 -->
										<div style="border: 1px solid black;">

											<div
												style="position: relative; left: 14px; border: 0px white; width: 98%;">
												<div class="postMainWrap"
													style="border-bottom: 0px; height: 80%;">
													<div class="profile${contextPath}/resources/img/Area"
														id="profileImgArea"
														style="display: inline-block; width: 10%; margin-bottom: 0px; height: 50px; padding-left: 10px;">
														<img src="${contextPath}/resources/img/ogong.jpg"
															style="width: 90%; height: 70%; position: relative; left: px; top: 3px; border-radius: 50%;">
													</div>
													<div class="profileNameArea  nanum" id="profileNameArea"
														style="display: inline-block; width: 81%; margin-bottom: 0px; height: 100%; position: relative; top: 14px; font-weight: bolder; font-size: 17px;">
														<div>
															<p style="margin-bottom: 0;">손오공</p>
														</div>
														<div style="margin-bottom: 0; display: inline-block;">
															<p style="margin-bottom: 0;">2020. 2. 20 pm 3:45</p>
														</div>
														<div class="doubleCommentArea"
															style="display: inline-block; width: 14%; margin-bottom: 0px; padding-left: 2%;">
															<p style="margin-bottom: 0; font-size: 13px;">댓글2</p>
														</div>
														<div
															style="display: inline-block; width: 5%; margin-bottom: 0px; height: 100%;">

															<img class="likeBtn shake"
																src="${contextPath}/resources/img/like.png"
																style="width: 16px; height: 16px; position: relative; bottom: 3px;">
														</div>

														<p
															style="margin-bottom: 0; font-size: 13px; display: inline-block;">5</p>

													</div>
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
																		<li><a href="#" name="deletePost"
																			style="color: black;">댓글 신고</a></li>
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
												<div
													style="border: px solid black; border-top: 2px solid black;">
													<div
														style="position: relative; left: 40px; border: 0px white; width: 92%;">
														<div class="postMainWrap" style="border-bottom: 0px">
															<div class="profileImgArea" id="profileImgArea"
																style="display: inline-block; width: 10%; margin-bottom: 0px; height: 50px; padding-left: 10px;">
																<img src="${contextPath}/resources/img/account.png"
																	style="width: 90%; height: 70%; position: relative; left: px; top: 3px; border-radius: 50%;">
															</div>
															<div class="profileNameArea  nanum" id="profileNameArea"
																style="display: inline-block; width: 81%; margin-bottom: 0px; height: 100%; position: relative; top: 14px; font-weight: bolder; font-size: 17px;">
																<div>
																	<p style="margin-bottom: 0;">삼장법사</p>
																</div>
																<div style="margin-bottom: 0; display: inline-block;">
																	<p style="margin-bottom: 0;">2020. 2. 20 pm 3:47</p>
																</div>
																<div
																	style="display: inline-block; width: 8%; margin-bottom: 0px; height: 100%;">

																	<img class="likeBtn shake"
																		src="${contextPath}/resources/img/like.png"
																		style="width: 15px; height: 15px; position: relative; float: right; top: 1px;">
																</div>

																<p
																	style="margin-bottom: 0; font-size: 13px; display: inline-block;">2</p>

															</div>
															<div
																style="display: inline-block; width: 5%; margin-bottom: 0px; height: 50px; float: right;">

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
																				<li><a href="#" name="deletePost"
																					style="color: black;">댓글 신고</a></li>
																			</ul>
																		</div>
																	</div>
																</div>

															</div>
														</div>

														<div class="commentContentWrap nanum"
															sytle="font-weight: bolder;">

															<p>Wassup Seoul 대댓글 테스트중</p>
														</div>
													</div>
												</div>
												<!-- 대댓글 -->

												<!-- 대댓글보기2 -->
												<div
													style="border: px solid black; border-top: 2px solid black;">
													<!-- display: none; class="CommentWrap" -->
													<div
														style="position: relative; left: 40px; border: 0px white; width: 92%;">
														<div class="postMainWrap" style="border-bottom: 0px">
															<div class="profileImgArea" id="profileImgArea"
																style="display: inline-block; width: 10%; margin-bottom: 0px; height: 50px; padding-left: 10px;">
																<img src="${contextPath}/resources/img/account.png"
																	style="width: 90%; height: 70%; position: relative; left: px; top: 3px; border-radius: 50%;">
															</div>
															<div class="profileNameArea  nanum" id="profileNameArea"
																style="display: inline-block; width: 70%; margin-bottom: 0px; height: 100%; position: relative; top: 14px; font-weight: bolder; font-size: 17px;">
																<div>
																	<p style="margin-bottom: 0;">사오정</p>
																</div>
																<div style="margin-bottom: 0; display: inline-block;">
																	<p style="margin-bottom: 0;">2020. 2. 20 pm 3:48</p>
																</div>
																<div
																	style="display: inline-block; width: 8%; margin-bottom: 0px; height: 100%;">

																	<img class="likeBtn shake"
																		src="${contextPath}/resources/img/like.png"
																		style="width: 15px; height: 15px; position: relative; float: right; top: 1px;">
																</div>

																<p
																	style="margin-bottom: 0; font-size: 13px; display: inline-block;">2</p>

															</div>
															<div
																style="display: inline-block; width: 5%; margin-bottom: 0px; height: 50px; float: right;">

																<div>
																	<div class="optionChevron">
																		<img src="${contextPath}/resources/img/download.png"
																			style="width: 17px; height: 15px; position: relative; bottom: 2px; right: 3px;">
																		<div class="hide nanum" id="postMenu2"
																			style="width: 100px; height: 80px; border: black 2px solid; background-color: white; float: right; position: relative; right: 20px; bottom: 12px;">
																			<ul>
																				<li><a href="#" name="deletePost"
																					style="color: black;">댓글 삭제</a></li>
																				<li><a href="#" name="deletePost"
																					style="color: black;">댓글 수정</a></li>
																				<li><a href="#" name="deletePost"
																					style="color: black;">댓글 신고</a></li>
																			</ul>
																		</div>
																	</div>
																</div>

															</div>
														</div>

														<div class="commentContentWrap nanum"
															sytle="font-weight: bolder;">

															<p>Wassup Seoul 대댓글 테스트중</p>

														</div>


													</div>
												</div>
												<!-- 대댓글2 -->

												<!-- 대댓글작성 -->
												<div class="inputCommentWrap"
													style="border: 1px solid black;">
													<!-- display: none; -->

													<div class="writePost"
														style="width: 80%; display: inline-block; margin-left: 3px;">
														<textarea class="writeCommentArea2 nanum"
															id="writeCommentAreaStyle" rows="1"
															style="border-left: none;" placeholder="댓글을 작성해 보세요"></textarea>
														<!--<input type="text" class="form-control" id="inputPostArea">-->
													</div>
													<div
														style="width: 20%; display: inline-block; position: absolute;">
														<button type="submit" class="btn nanum"
															style="width: 100%; font-size: 18px; font-weight: bolder; position: relative; left: 10px; bottom: 7px">
															작성</button>
													</div>
												</div>
												<!-- 대댓글작성 -->

											</div>
											<!-- 댓글보기 -->

											<!-- 댓글보기2 -->
											<div style="border: 1px solid black;">

												<div
													style="position: relative; left: 14px; border: 0px white; width: 98%;">
													<div class="postMainWrap"
														style="border-bottom: 0px; height: 80%;">
														<div class="profileImgArea" id="profileImgArea"
															style="display: inline-block; width: 10%; margin-bottom: 0px; height: 50px; padding-left: 10px;">
															<img src="${contextPath}/resources/img/ogong.jpg"
																style="width: 90%; height: 70%; position: relative; left: px; top: 3px; border-radius: 50%;">
														</div>
														<div class="profileNameArea  nanum" id="profileNameArea"
															style="display: inline-block; width: 81%; margin-bottom: 0px; height: 100%; position: relative; top: 14px; font-weight: bolder; font-size: 17px;">
															<div>
																<p style="margin-bottom: 0;">손오공동생</p>
															</div>
															<div style="margin-bottom: 0; display: inline-block;">
																<p style="margin-bottom: 0;">2020. 2. 20 pm 3:49</p>
															</div>
															<div class="doubleCommentArea"
																style="display: inline-block; width: 14%; margin-bottom: 0px; padding-left: 2%;">
																<p style="margin-bottom: 0; font-size: 13px;">댓글</p>
															</div>
															<div
																style="display: inline-block; width: 5%; margin-bottom: 0px; height: 100%;">

																<img class="likeBtn shake"
																	src="${contextPath}/resources/img/like.png"
																	style="width: 16px; height: 16px; position: relative; bottom: 3px;">
															</div>

															<p
																style="margin-bottom: 0px; font-size: 13px; display: inline-block;">2</p>

														</div>
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
																			<li><a href="#" name="deletePost"
																				style="color: black;">댓글 신고</a></li>
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
												<!-- 댓글2 -->

												<div class="doubleCommentWrap" style="display: none;">

													<!-- 대댓글작성 -->
													<div class="inputCommentWrap"
														style="border-top: 2px solid black;">

														<div class="writePost"
															style="width: 80%; display: inline-block; margin-left: 3px;">
															<textarea class="writeCommentArea3 nanum"
																id="writeCommentAreaStyle" rows="1"
																style="border-left: none;" placeholder="댓글을 작성해 보세요"></textarea>

														</div>
														<div
															style="width: 20%; display: inline-block; position: absolute;">
															<button type="submit" class="btn nanum"
																style="width: 100%; font-size: 18px; font-weight: bolder; position: relative; left: 10px; bottom: 7px">
																작성</button>
														</div>
													</div>
													<!-- 대댓글작성 -->

												</div>

											</div>
											<!-- 댓글2 -->

										</div>
										<!-- 댓글영역 -->

									</div>
								</div>
							</div>

							<div class="row"
								style="height: 20px; background-color: rgb(221, 233, 218);"></div>
							<!-- 게시글1 끝-->
						</c:forEach>
					</c:if>


				</div>
				<!-- 게시글영역 끝-->

			</div>
			<!-- 타임라인-->

			<div class="col-md-3" id="devideArea">

				<!-- 사이드 2 시작 -->
				<div class="row" style="background-color: rgb(221, 233, 218);">
					<div class="card border-primary mb-3" style="max-width: 20rem;">
						<div class="card-header nanum" style="font-size: 25px;">다가오는
							일정</div>
						<div class="card-body">
							<h4 class="card-title nanum" style="font-weight: bolder;">2월</h4>
							<p class="card-text nanum">13일 - 일정이 지정한 내용1</p>
							<p class="card-text nanum">17일 - 일정이 지정한 내용2</p>
						</div>
					</div>
					<!-- 친구목록 버튼 -->
					<div
						style="border-radius: 70%; background-color: gray; width: 100px; height: 100px; position: relative;">
						<div style="position: absolute; top: 15px; left: 20px;">
							<img src="${contextPath}/resources/img/iconmonstr-user-8-64.png"
								alt="이미지" style="cursor: pointer;">
						</div>
					</div>

					<!-- 탑버튼 -->
					<a
						style="display: scroll; position: fixed; bottom: 10px; right: 10px;"
						href="#" title="맨 위로"><img
						src="${contextPath}/resources/img/img_top.png" alt="탑버튼"
						style="width: 70px; height: 100px;"></a>

				</div>
				<!-- 사이드 2 끝 -->

			</div>
		</div>
	</div>
	<!-- 컨텐츠영역 종료 -->


	<script>
		$(document)
					.ready(
							function() {

								// 새로고침
								function refreshList() {
									location.reload();
								}

								// 글삭제
								$(".deletePost").click(function() {
									var postNo = $(this).attr("id");
									//var divBox = $(this).parent(".box111");

									$.ajax({
										url : "deletePost",
										data : {
											postNo : postNo
										},
										type : "post",
										success : function(result) {
											if (result == "true") {
												system.out.println("게시글 삭제 성공")
												//divBox.remove();
											} else {
												system.out.println("게시글 삭제 실패")
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

								// 글수정
								$(".updatePost").click(function() {
									var postNo = $(this).attr("id");
									//var divBox = $(this).parent(".box111");

									$.ajax({
										url : "updatePost",
										data : {
											postNo : postNo
										},
										type : "post",
										success : function(result) {
											if (result == "true") {
												system.out.println("게시글 삭제 성공")
												//divBox.remove();
											} else {
												system.out.println("게시글 삭제 실패")
											}
										},
										error : function(e) {
											console.log("ajax 통신 실패");
											console.log(e);
										}
									});
									refreshList()
								});

								// 좋아요 클릭시 버튼 이미지 변경, 좋아요 기록
								$(".likeBtn")
										.click(
												function() {
													var postNo = $(this).attr(
															"name");
													var img = $(this).attr(
															"src");
													var likeCount = $(this)
															.parent().next("p")
															.text()

													if (img == "${contextPath}/resources/img/like.png") {
														likeCount++;
														$(this)
																.attr('src',
																		'${contextPath}/resources/img/like2.png');
														$(this).parent().next(
																"p").text(
																likeCount);

													} else {
														likeCount--;
														$(this)
																.attr('src',
																		'${contextPath}/resources/img/like.png');
														$(this).parent().next(
																"p").text(
																likeCount);
													}

													$
															.ajax({
																url : "likeFunction",
																data : {
																	postNo : postNo
																},
																type : "post",
																success : function(
																		result) {
																	if (result == "true") {
																		system.out
																				.println("좋아요 등록 성공")
																	} else {
																		system.out
																				.println("좋아요 해제 성공")
																	}
																},
																error : function(
																		e) {
																	console
																			.log("ajax 통신 실패");
																	console
																			.log(e);
																}
															});
												});

								//  게시글, 댓글 수정/삭제 메뉴창 보이기, 숨기기
								$(".optionChevron>img").click(function() {
									$(this).next("div").toggleClass("hide");
								});

								$(".likeNum").click(function() {
									$(this).next("div").toggleClass("hide");
								});

								// 댓글 영역 숨기기
								$(".commentArea").click(function() {
									$(this).parent().next("div").toggle(100);
									$('.writeCommentArea').focus();
								});

								// 대댓글 영역 숨기기
								$(".doubleCommentArea").click(
										function() {
											$(this).parent().parent().parent()
													.next("div").toggle(100);
											// $(".inputCommentWrap").toggle(500);
											$('.writeCommentArea2').focus();
										});

								// 게시글 작성 영역 높이 자동증가
								$('.writePost').on('keyup', 'textarea',
										function(e) {
											$(this).css('height', 'auto');
											$(this).height(this.scrollHeight);
										});
								$('.writePost').find('textarea').keyup();

								// 댓글 작성 영역 높이 자동증가
								$('.inputCommentWrap').on('keyup', 'textarea',
										function(e) {
											$(this).css('height', 'auto');
											$(this).height(this.scrollHeight);
										});
								$('.inputCommentWrap').find('textarea').keyup();

								// 댓글 출력 영역 높이 자동증가
								$('.commentContentWrap').on('keyup',
										'textarea', function(e) {
											$(this).css('height', 'auto');
											$(this).height(this.scrollHeight);
										});
								$('.commentContentWrap').find('textarea')
										.keyup();

								// 게시글 출력 영역 높이 자동증가
								$('.postMainWrap').on('keyup', 'textarea',
										function(e) {
											$(this).css('height', 'auto');
											$(this).height(this.scrollHeight);
										});
								$('.postMainWrap').find('textarea').keyup();

								// 게시물 없을때 게시글 작성 클릭시 커서 이동
								$(".noPostSignArea").click(function() {
									$('.postArea').focus();
								});

								// 지도 모달 창 열기 
								$(".mapOption").click(
										function() {

											//var modal = $(this).parent().next("div");

											$(this).parent().next("div").attr(
													"style", "display:block");
										});

								$("#modal_close_btn").click(
										function() {
											$(this).parent().parent("div")
													.attr("style",
															"display:none");
										});

							});
						refreshList()
				});
			// 모달 창 열기 
			$(".mapOption").click(function() {
				$(this).parent().next("div").attr("style", "display:block");
			});

			$("#modal_close_btn").click(function() {
				$(this).parent().parent("div").attr("style", "display:none");
			});
		}
);

			// 좋아요 클릭시 버튼 이미지 변경, 좋아요 기록
			$(".likeBtn").click(function() {
						var postNo = $(this).attr("name");
						var img = $(this).attr("src");
						var likeCount = $(this).parent().next("p").text()

						if (img == "${contextPath}/resources/img/like.png") {
							likeCount++;
							$(this).attr('src','${contextPath}/resources/img/like2.png');
							$(this).parent().next("p").text(likeCount);

						} else {
							likeCount--;
							$(this).attr('src','${contextPath}/resources/img/like.png');
							$(this).parent().next("p").text(likeCount);
						}

						$.ajax({
							url : "likeFunction",
							data : {postNo : postNo	},
							type : "post",
							success : function(	result) {
								if (result == "true") {
									system.out.println("좋아요 등록 성공")
							} else {
									system.out.println("좋아요 해제 성공")
								}
							},
							error : function(e) {
								console.log("ajax 통신 실패");
								console.log(e);
							}							
							});
					});

				//  게시글, 댓글 수정/삭제 메뉴창 보이기, 숨기기
				$(".optionChevron>img").click(function() {
					$(this).next("div").toggleClass("hide");
				});

				$(".likeNum").click(function() {
					$(this).next("div").toggleClass("hide");
				});

				// 댓글 영역 숨기기
				$(".commentArea").click(function() {
					$(this).parent().next("div").toggle(100);
					$('.writeCommentArea').focus();
				});

				// 대댓글 영역 숨기기
				$(".doubleCommentArea").click(
						function() {
							$(this).parent().parent().parent()
									.next("div").toggle(100);
							// $(".inputCommentWrap").toggle(500);
							$('.writeCommentArea2').focus();
						});
				)

				// 게시글 작성 영역 높이 자동증가
				$('.writePost').on('keyup', 'textarea',
						function(e) {
							$(this).css('height', 'auto');
							$(this).height(this.scrollHeight);
						});
				$('.writePost').find('textarea').keyup();

				// 댓글 작성 영역 높이 자동증가
				$('.inputCommentWrap').on('keyup', 'textarea',
						function(e) {
							$(this).css('height', 'auto');
							$(this).height(this.scrollHeight);
						});
				$('.inputCommentWrap').find('textarea').keyup();

				// 댓글 출력 영역 높이 자동증가
				$('.commentContentWrap').on('keyup', 'textarea',
						function(e) {
							$(this).css('height', 'auto');
							$(this).height(this.scrollHeight);
						});
				$('.commentContentWrap').find('textarea').keyup();

				// 게시글 출력 영역 높이 자동증가
				$('.postMainWrap').on('keyup', 'textarea',
						function(e) {
							$(this).css('height', 'auto');
							$(this).height(this.scrollHeight);
						});
				$('.postMainWrap').find('textarea').keyup();

				// 게시물 없을때 게시글 작성 클릭시 커서 이동
				$(".noPostSignArea").click(function() {
					$('.postArea').focus();
				});
				
				
				// 지도 모달 창 열기 
				$(".mapOption").click(function(){

					//var modal = $(this).parent().next("div");
					
					$(this).parent().next("div").attr("style", "display:block");
			    });
			   
			     $("#modal_close_btn").click(function(){
					$(this).parent().parent("div").attr("style", "display:none");
			    }); 
			     
		});
		// 모달 창 열기 
		$(".mapOption").click(function(){
			$(this).parent().next("div").attr("style", "display:block");
	    });
	   
	     $("#modal_close_btn").click(function(){
			$(this).parent().parent("div").attr("style", "display:none");
	    });     
	</script>


</body>
</html>