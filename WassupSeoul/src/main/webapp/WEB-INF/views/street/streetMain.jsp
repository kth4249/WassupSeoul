<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

		<script src="https://code.jquery.com/jquery-3.4.1.min.js" 
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/timeline.css" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fullcalendar.css" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/daygrid.css" type="text/css">
   <%--  <script type="text/javascript" src="${contextPath}/resources/js/painter.js"></script>
    	<script type="text/javascript" src="${contextPath}/resources/js/drawengine.js"></script> --%>
		 <script type="text/javascript" src="${contextPath}/resources/js/timeLine.js"></script>  
		
    
<title>타임라인</title>

</head>

<style>
	.drawColor:hover{
         cursor: pointer;
      }
      #canvas {
        border: 1px solid black;
      }

      .jb_table {
        display: table;
      }

      .drawing {
        border-radius: 10px;
        display: table-row;
      }

      #draw {
        display: table-cell;
        vertical-align: top;
      }

      .drawColor{
          width:32px;
          height: 32px;
          margin-left: 10px;
      }
      

</style>
<body style="background-color : rgb(221, 233, 218);">
	<!-- 골목 네비바 여백 -->
	<div class="container-fluid" style="margin-top: 57px;">
		<div class="row"  style="padding: 0px; height:44px"></div>
	</div>

	<!-- 고정된 골목 네비바  -->
	<%@ include file="../street/streetDetail/streetNav.jsp"%>
	<%-- <jsp:include page="../street/streetDetail/streetNav.jsp"/> --%>

	<!-- 고정된 헤더 -->
	<%@include file="../common/header.jsp"%>
	<%-- <jsp:include page="../common/header.jsp"/> --%>

	<!-- 컨텐츠영역-->
	<div class="container" style="margin-top: 10px;">
		<div class="row">
			
			<%@ include file="../street/streetDetail/streetSide.jsp"%>
			<%-- <jsp:include page="../street/streetDetail/streetSide.jsp"/> --%>
			
			<!-- 사이드1 여백 -->
			<div class="col-md-3" id="devideArea"></div>
			<!-- 사이드1 여백 -->

			<!-- 타임라인-->
			<div class="col-md-6" id="devideArea" style="margin-top: 10px;">

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
								<textarea class="postArea nanum" id="writePostArea" name="boardContent" rows="3" placeholder="새로운 게시글을 작성해보세요"></textarea>
							</div>

							<div class="postCountView" style="border: 1px solid black; height: 45px;">

								<div class="writeOptionArea shake">
									<img class="writeOption img1" src="${contextPath}/resources/img/imageIcon.png">
									<p class="arrow_box">사진</p>
								</div>

								<div class="writeOptionArea shake">
									<img class="writeOption" src="${contextPath}/resources/img/film.png">
									<p class="arrow_box">동영상</p>
								</div>

								<!-- 파일첨부 -->
								<div class="writeOptionArea shake">
									<img class="writeOption summerOption" src='${contextPath}/resources/img/paperclip.png'>
									<p class="arrow_box">파일첨부</p>
								</div>
								

								<div class="writeOptionArea shake">
									<img class="writeOption voteOption" src="${contextPath}/resources/img/vote.png">
									<p class="arrow_box">투표</p>
								</div>
								
									<!-- 투표 모달  -->
									<div id="modal" class="nanum voteModal">
						
										<div class="modal_content" style="padding: 3px;">
											<button type="button" id="modal_close_btn3"
												style="width: 20px; height: 20px; font-size: 5px; float: right;">X</button>
											<textarea class=" nanum" id="writePostArea" rows="6" placeholder="게시글내용을 입력하세요."	
											  style="border: 1px solid black; color: black; font-size: 17px; height: 100px; padding-bottom: 20px; "></textarea>	
											<input type="text" id="voteTitle" placeholder="투표 제목" style="width:80%;"><br>	
			
											<label>1</label><input type="text" id="voteOption1" placeholder="항목 입력" style="width:80%;"><br>	
											<label>2</label><input type="text" id="voteOption2" placeholder="항목 입력" style="width:80%;"><br>
											<label>3</label><input type="text" id="voteOption3" placeholder="항목 입력" style="width:80%;">	
			
											<button type="button" style="width: 110px; height: 30px; font-size: 16px; margin-left: 37%;">+항목추가</button><br>
			
			    							<label style="width: 130px;" ><input type='checkbox' class='check1' style="margin-left: 20%;" />무기명 투표</label><br>
											<label style="width: 130px;" ><input type='checkbox' class='check2' style="margin-left: 20%; display: inline-block;" />복수 선택 허용</label>
											
											<div style="width: 200px; margin: 0; display: inline-block; float:right;">
											<label for="vote" style="width: 90px;">복수 선택 개수:</label>
			
											<select id="vote" style="display: inline-block; margin-top: 10px;" >
											<option value="unlimit">제한없음</option>
											<option value="two">2개</option>
											<option value="three">3개</option>
											<option value="four">4개</option>
											<option value="five">5개</option>
											</select>
											</div><br>
			
											<label style="width: 25%;" ><input type='checkbox' class='check3' style="margin-left: 20%;" />종료일 설정</label><br>
			
											<button type="button" style="width: 15%; height: 30px; font-size: 17px; float: right; margin: 0px">작성</button>
										</div>
						
										<div class="modal_layer"></div>
									</div>
									<!-- 투표 모달  -->	
									
									
										
								<div class="writeOptionArea shake">
									<img class="writeOption" src="${contextPath}/resources/img/pie-chart.png">
									<p class="arrow_box">N빵</p>
								</div>

								<div class="writeOptionArea shake">
									<img class="writeOption mapOption" src="${contextPath}/resources/img/map.png">
									<p class="arrow_box">지도</p>
								</div>

								<!-- 지도 모달  -->
								<div id="modal" class="nanum mapModal">

									<div class="modal_content" style="padding: 3px;">
										<button type="button" id="modal_close_btn" style="width: 20px; height: 20px; font-size: 5px; float: right;">X</button>

										<textarea class=" nanum" id="writePostArea1" rows="6" placeholder="게시글내용을 입력하세요."
											style="border: 1px solid black; color: black; font-size: 17px; height: 280px"></textarea>
										<input type="text" id="sample5_address" placeholder="주소를 입력하세요." style="width:80%;">
										<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
										<div id="map"style="width: 100%; height: 300px; margin-top: 10px; border:2px black solid;"></div>
										<button type="button" style="width: 10%; height: 25px; font-size: 17px; float: right; margin-top:10px">작성</button>
									</div>

									<div class="modal_layer"></div>
								</div>

							<!-- 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a32d3d818847c093a324db2e8ffc840"></script>
								<script>
									var container = document.getElementById('map');
									var options = {
										center: new kakao.maps.LatLng(33.450701, 126.570667),
										level: 3
										
									};
								</script> -->
								
								<div class="writeOptionArea shake">
									<img class="writeOption sketchOption"
										src="${contextPath}/resources/img/sketch.png">
									<p class="arrow_box">스케치</p>
								</div>
								
							<!-- 스케치 모달  -->
								<div id="modal" class="nanum mapModal">
					
									<div class="modal_content" style="padding: 3px;">
										<button type="button" id="modal_close_btn2" style="width: 20px; height: 20px; font-size: 5px; float: right;">X</button>
										<textarea class=" nanum" id="writePostArea2" rows="6" placeholder="게시글내용을 입력하세요." style="border: 1px solid black; color: black; font-size: 17px; height: 100px"></textarea>
										<div class="jb_table">
											<div class="row drawing">
												<span class="cell">
													<div>
														<canvas id="canvas" width="420" height="485"></canvas>
													</div>
												</span> <span class="cell" id="draw">
													<div>
														<div class="jb_table">
															<div class="row drawing">
																<span class="cell" id="draw"> <img src="${contextPath}/resources/img/red.png"
																	class="drawColor" onclick="selectColor('red')" />
																</span>
															</div>
															<div class="row drawing">
																<span class="cell" id="draw"> <img src="${contextPath}/resources/img/orange.png"
																	class="drawColor" onclick="selectColor('orange')" />
																</span>
															</div>
															<div class="row drawing">
																<span class="cell" id="draw"> <img src="${contextPath}/resources/img/yellow.png"
																	class="drawColor" onclick="selectColor('yellow')" />
																</span>
															</div>
															<div class="row drawing">
																<span class="cell" id="draw"> <img src="${contextPath}/resources/img/green.png"
																	class="drawColor" onclick="selectColor('green')" />
																</span>
															</div>
															<div class="row drawing">
																<span class="cell" id="draw"> <img src="${contextPath}/resources/img/blue.png"
																	class="drawColor" onclick="selectColor('blue')" />
																</span>
															</div>
															<div class="row drawing">
																<span class="cell" id="draw"> <img src="${contextPath}/resources/img/lightblue.png"
																	class="drawColor" onclick="selectColor('lightblue')" />
																</span>
															</div>
															<div class="row drawing">
																<span class="cell" id="draw"> <img src="${contextPath}/resources/img/brown.png"
																	class="drawColor" onclick="selectColor('brown')" />
																</span>
															</div>
															<div class="row drawing">
																<span class="cell" id="draw"> <img src="${contextPath}/resources/img/lightgreen.png"
																	class="drawColor" onclick="selectColor('lightgreen')" />
																</span>
															</div>
															<div class="row drawing">
																<span class="cell" id="draw"> <img src="${contextPath}/resources/img/pink.png"
																	class="drawColor" onclick="selectColor('pink')" />
																</span>
															</div>
															<div class="row drawing">
																<span class="cell" id="draw"> <img src="${contextPath}/resources/img/purple.png"
																	class="drawColor" onclick="selectColor('purple')" />
																</span>
															</div>
															<div class="row drawing">
																<span class="cell" id="draw"> <img src="${contextPath}/resources/img/gray.png"
																	class="drawColor" onclick="selectColor('gray')" />
																</span>
															</div>
															<div class="row drawing">
																<span class="cell" id="draw"> <img src="${contextPath}/resources/img/lightgray.png"
																	class="drawColor" onclick="selectColor('lightgray')" />
																</span>
															</div>
															<div class="row drawing">
																<span class="cell" id="draw"> <img src="${contextPath}/resources/img/white.png"
																	class="drawColor" onclick="selectColor('white')" />
																</span>
															</div>
															<div class="row drawing">
																<span class="cell" id="draw"> <img src="${contextPath}/resources/img/pencil.png"
																	class="drawColor" onclick="selectTool('pencil')"
																	style="margin-bottom: 5px;" />
																</span>
															</div>
														</div>
													</div>
													<div>
														<div>
															<textarea id="history" cols="40" rows="37"
																style="display: none;"></textarea>
					
														</div>
													</div>
					
												</span>
											</div>
										</div>
										<div> Title<input id="title" size="15" style="display: inline-block;" /> 
										<a id="saveImage" download="image.png" style="display: inline-block;">
										<INPUT type="button" value="Save" onClick="saveImage()" />
										</a> <INPUT type="button" value="Clear" onClick="initPage()" />
										<button type="button" style="width: 10%; height: 25px; font-size: 17px; float: right; margin-top: 10px">작성</button>
										</div>
					
									</div>
					
									<div class="modal_layer"></div>
								</div>
								<!-- 스케치 모달  -->


								<div id="writePostBtn" style="display: inline-block; width: 18%; margin-bottom: 0px; height: 100%; float: right;">
									<button type="submit" class="btn nanum" style="height: 40px; font-size: 18px; font-weight: bolder; position: relative; bottom: 1px; right: 7px; float: right;">작성</button>
								</div>
							</div>
							
						</form>
					</div>
				</div>
				<!-- 글작성 영역 -->

				<div class="row" style="height: 20px; background-color: rgb(221, 233, 218);"></div>

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
											
											<img src="${contextPath}/resources/img/account.png" style="width: 80%; height: 80%;"> 
																						
											<%-- <c:if test="${empty loginMember.memberProfileUrl}">
												<!-- 프로필 사진 없을때 사진  -->
												<img src="${contextPath}/resources/img/account.png" style="width: 80%; height: 80%;">
											</c:if>
											<c:if test="${!empty loginMember.memberProfileUrl}">
												<!-- 프로필 사진 있을때 사진  -->
												<img src="${contextPath}/resources/profileImage/${loginMember.memberProfileUrl}" style="width: 90%; height: 70%; position: relative; left: px; top: 3px; border-radius: 50%;">
											</c:if>  --%> 
											
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
																style="color: black;">글 삭제</a></li>
															<li><a href="#" class="updatePost" id="${board.boardNo}"
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
										<div style="padding-left: 10px; padding-right: 10px; width: 100%">

											<p>${board.boardContent}</p>

										</div>
									</div>
									<!-- 게시글내용 -->

									<!-- 댓글수, 좋아요버튼 -->
									<div class="postCountView" style="border: 1px solid black; border-top: 0; height: 30%; padding-top: 5px;">
										<div class="commentArea nanum" name="${board.boardNo}" style="display: inline-block; width: 82%; margin-bottom: 0px; padding-left: 10px;">
											<p class="commentCount${board.boardNo}" style="margin-bottom: 0;">댓글2</p>
										</div>
										
										<div style="width: 14%; margin-bottom: 0px; height: 100%; float: right;">
											<button type="submit" class="btn nanum" style="padding: 0px; position: relative; bottom: 4px;" onclick="'javascript: like_func();'">
											<img class="likeBtn shake" name="${board.boardNo}" src="${contextPath}/resources/img/like.png" 	style="display: inline-block; width: 20px; height: 20px; float: right;">
											</button>
											<p class="likeCount" style="margin-bottom: 0; display: inline-block;">10</p>
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
										
										

									<%--	<!-- 댓글보기 -->
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
											<!-- 댓글보기 --> --%>

										</div>
										<!-- 댓글영역 -->
										
										
									</div>
								</div>
							
							<div class="row"style="height: 20px; background-color: rgb(221, 233, 218);"></div>
							<!-- 게시글1 끝-->
						</c:forEach>
					</c:if>
				</div>
				<!-- 게시글영역 끝-->
		
			</div>
			<!-- 타임라인-->
			
			<!-- 사이드2 여백 -->
			<div class="col-md-3" id="devideArea"></div>
			<!-- 사이드2 여백 -->
			
			
		</div>
	</div>
	<!-- 컨텐츠영역 종료 -->


	<script>
		$(document).ready(function() {
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
										data : {postNo : postNo},
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
								
								
								// 댓글작성
								$("#commentBtn").click(function() {
									var postNo = $(this).attr("name");
									//var divBox = $(this).parent(".box111");
									var commentContent = $(this).parent().prev().find("textarea").val();
									
									console.log("댓글입력내용:"+commentContent);
									console.log("댓글 입력 게시글 번호 :"+postNo);
																	
									$.ajax({
										url : "writeComment",
										data : {"postNo" : postNo, "commentContent" : commentContent },
										type : "post",
										success : function(result) {
											
											if (result == "true") {
												
												console.log("댓글 작성 성공");
												system.out.println("댓글 작성 성공")
												//divBox.remove();
												$(this).parent().prev().find("textarea").val= "";
												console.log("댓글 입력 후 내용:"+commentContent);
												
											} else {
												console.log("댓글 작성 실패");
												system.out.println("댓글 작성 실패")
												$(this).parent().prev().find("textarea").val= "";
												console.log("댓글 입력 후 내용:"+commentContent);
											}
										},
										error : function(e) {
											console.log("ajax 통신 실패");
											$(this).parent().prev().find("textarea").val= "";
											console.log("댓글 입력 후 내용:"+commentContent);
											console.log(e);
											
										}
									});
									// refreshList()
								});
								

								// 글수정
			/* 					$(".updatePost").click(function() {
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
								}); */

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
												data : {postNo : postNo},
												type : "post",
												success : function(result) {
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
		});
		
		
		// 지도 모달 창 열기 
		$(".mapOption").click(function(){
			$(this).parent().next("div").attr("style", "display:block");
	    });
	   
	    $("#modal_close_btn").click(function(){
			$(this).parent().parent("div").attr("style", "display:none");
	    });     
	    
	 	// 스케치 모달 창 열기 
		$(".sketchOption").click(function(){
			$(this).parent().next("div").attr("style", "display:block");
	    });
	   
    	$("#modal_close_btn2").click(function(){
			$(this).parent().parent("div").attr("style", "display:none");
	    }); 
    	
    	 // 투표  모달 창 열기 
		$(".voteOption").click(function(){
			$(this).parent().next("div").attr("style", "display:block");
	    });
	   
	     $("#modal_close_btn3").click(function(){
			$(this).parent().parent("div").attr("style", "display:none");
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
   		$(".doubleCommentArea").click(function() {
   			$(this).parent().parent().parent().next("div").toggle(100);
   			// $(".inputCommentWrap").toggle(500);
   			$('.writeCommentArea2').focus();
   		});

   		// 게시글 작성 영역 높이 자동증가
   		$('.writePost').on('keyup', 'textarea', function(e) {
   			$(this).css('height', 'auto');
   			$(this).height(this.scrollHeight);
   		});
   		$('.writePost').find('textarea').keyup();

   		// 댓글 작성 영역 높이 자동증가
   		$('.inputCommentWrap').on('keyup', 'textarea', function(e) {
   			$(this).css('height', 'auto');
   			$(this).height(this.scrollHeight);
   		});
   		$('.inputCommentWrap').find('textarea').keyup();

   		// 댓글 출력 영역 높이 자동증가
   		$('.commentContentWrap').on('keyup', 'textarea', function(e) {
   			$(this).css('height', 'auto');
   			$(this).height(this.scrollHeight);
   		});
   		$('.commentContentWrap').find('textarea').keyup();

   		// 게시글 출력 영역 높이 자동증가
   		$('.postMainWrap').on('keyup', 'textarea', function(e) {
   			$(this).css('height', 'auto');
   			$(this).height(this.scrollHeight);
   		});
   		$('.postMainWrap').find('textarea').keyup();

   		// 게시물 없을때 게시글 작성 클릭시 커서 이동
   		$(".noPostSignArea").click(function() {
   			$('.postArea').focus();
   		});
    	     
	</script>


</body>
</html>