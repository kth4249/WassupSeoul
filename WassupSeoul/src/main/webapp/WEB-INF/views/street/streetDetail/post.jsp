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


<title>타임라인 글작성 영역</title>
</head>
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>

<body>

				<div class="postLayoutView " style="padding: 0%;">
						<form action="insert" method="post" enctype="multipart/form-data"
							role="form" onsubmit="return validate();">

							<div class="writePost">
								<textarea class="postArea nanum" id="writePostArea" name="boardContent" rows="3" placeholder="새로운 게시글을 작성해보세요"></textarea>
							</div>

							<div class="postCountView" style="border: 1px solid black; height: 45px;">

								<%-- <div class="writeOptionArea shake">
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
								</div> --%>
								<!-- 사진 첨부 -->
								<div class="writeOptionArea shake" style="width: 7%">
									<form class="form-signin">
										<a href="#" data-toggle="modal" data-target="#summerModal"> 
											<img class="writeOption" src="${contextPath}/resources/img/imageIcon.png" alt="">
											<p class="arrow_box">사진</p>
										</a>
									</form>
								</div>

								<!-- 동영상 첨부 -->
								<div class="writeOptionArea shake" style="width: 7%">
									<form class="form-signin">
										<a href="#" data-toggle="modal" data-target="#summerModal"> 
											<img class="writeOption" src="${contextPath}/resources/img/film.png" alt="">
											<p class="arrow_box">동영상</p>
										</a>
									</form>
								</div>

								<!-- 파일첨부 -->
								<div class="writeOptionArea shake" style="width: 7%">
									<form class="form-signin">
										<a href="#" data-toggle="modal" data-target="#summerModal"> 
											<img class="writeOption" src="${contextPath}/resources/img/paperclip.png" alt="">
											<p class="arrow_box">파일첨부</p>
										</a>
									</form>
								</div>
								

								<div class="writeOptionArea shake" style="width: 7%">
									<img class="writeOption voteOption" data-toggle="modal" data-target="#voteModal"
										src="${contextPath}/resources/img/vote.png">
									<p class="arrow_box">투표</p>
								</div>
						
								<div class="writeOptionArea shake" style="width: 7%">
									<img class="writeOption" src="${contextPath}/resources/img/pie-chart.png">
									<p class="arrow_box">N빵</p>
								</div>

								<div class="writeOptionArea shake" style="width: 7%">
									<img class="writeOption mapOption" src="${contextPath}/resources/img/map.png"
												data-toggle="modal" data-target="#mapModal">
									<p class="arrow_box">지도</p>
								</div>
								
								<div class="writeOptionArea shake" style="width: 7%">
									<img class="writeOption sketchOption" data-toggle="modal" data-target="#sketchModal"
										src="${contextPath}/resources/img/sketch.png">
									<p class="arrow_box">스케치</p>
								</div>
								
								<div id="writePostBtn" style="display: inline-block; width: 10%; margin-bottom: 0px; height: 100%; float: right;">
									<button type="submit" class="btn nanum" style="height: 40px; width:100%; font-size: 18px; font-weight: bolder; position: relative; bottom: 1px; right: 7px; float: right;">작성</button>
								</div>
							</div>
							
						</form>
					</div>


					<!-- 지도 모달 -->
					<!-- 스케치 모달 -->
					<div class="modal fade" id="mapModal" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="writerModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document" style="width: 50%;">
							<div class="modal-content">
								<div class="modal-header">
									<h2 class="modal-title nanum" id="checkMemModalLabel"
										style="font-weight: bold;">지도 게시글 작성</h2>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- content start -->

									<textarea class=" nanum" id="writePostArea1" rows="6" placeholder="게시글내용을 입력하세요."
											style="border: 1px solid black; color: black; font-size: 17px; height: 150px; width:100%"></textarea>
										<!-- <input type="text" placeholder="주소검색 버튼 클릭" style="width:80%;" name="address1" id="address1" class="postcodify_address"> -->
										<!-- <input type="button" value="주소 검색" id="postcodify_search_button"><br> -->
										<!-- <div id="map"style="width: 100%; height: 300px; margin-top: 10px; border:2px black solid;"></div> -->
										<div class="map_wrap">
									<div id="map" style="width:100%;height:400px;position:relative;overflow:hidden;"></div>
										
										</div>
										<button type="button" id="mapSubmitBtn"
										style="width: 15%; height: 30px; font-size: 17px; float: right; margin: 0px">작성</button>

									<div class="modal_layer"></div>
								 	
									<!-- content end -->
								</div>
							</div>
						</div>
					</div>
					<!-- end -->
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a32d3d818847c093a324db2e8ffc840"></script>
					<script>
				 	// 모달 열고나서 지도 넣기 . 안그러면 지도 잘려서 나옴 
				 	$('#mapModal').on('shown.bs.modal', function (e) {
				 		
				 		var container = document.getElementById('map');
						var options = {
							center: new kakao.maps.LatLng(33.450701, 126.570667),
							level: 3
						};

						var map = new kakao.maps.Map(container, options);
				 	       
				 	 });    
				 	</script>
				 	
				 	
				 	
					<!-- jQuery와 postcodify 를 로딩한다. -->
                    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
					
					<!-- 투표 모달 -->
					<div class="modal fade" id="voteModal" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="writerModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document" style="width: 30%;">
							<div class="modal-content">
								<div class="modal-header">
									<h2 class="modal-title nanum" id="checkMemModalLabel"
										style="font-weight: bold;">투표 게시글 작성</h2>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- content start -->
									<textarea class=" nanum" id="writePostArea" rows="6" placeholder="게시글내용을 입력하세요."	
									  style="border: 1px solid black; color: black; font-size: 17px; height: 100px; padding-bottom: 20px; width:100%"></textarea>	
									<input type="text" id="voteTitle" placeholder="투표 제목" style="width:80%; margin-left: 10px; margin-bottom:10px;"><br>	
	
									<label>1</label><input type="text" id="voteOption1" placeholder="항목 입력" style="width:80%; margin-left: 5px"><br>	
									<label>2</label><input type="text" id="voteOption2" placeholder="항목 입력" style="width:80%; margin-left: 5px"><br>
									<label>3</label><input type="text" id="voteOption3" placeholder="항목 입력" style="width:80%; margin-left: 5px">	
	
									<button type="button" style="width: 110px; height: 30px; font-size: 16px; margin-left: 37%;">+항목추가</button><br>
	
	    							<label style="width: 130px;" ><input type='checkbox' class='check1' style="margin-left: 20%;" />무기명 투표</label><br>
									<label style="width: 130px;" ><input type='checkbox' id="check2" class='check2' style="margin-left: 20%; display: inline-block;" />복수 선택 허용</label>
									
									<div  id="repeatVote" style="width: 10%; margin: 0; display: inline-block; float:right; ">
									<label for="vote" style="width: 90px;">복수 선택 개수:</label>
	
									<select id="vote" style="display: inline-block; " >
									<option value="unlimit">제한없음</option>
									<option value="two">2개</option>
									<option value="three">3개</option>
									<option value="four">4개</option>
									<option value="five">5개</option>
									</select>
									</div><br>
	
									<label style="width: 25%;" ><input type='checkbox' id='check3' style="margin-left: 20%;" />종료일 설정</label><br>
									
									<div  id="repeatVote" style="width: 30%; margin: 0; display: inline-block; float:right; visibility:hidden">
									<label for="vote" style="width: 90px;">복수 선택 개수:</label>
	
									<select id="vote" style="display: inline-block; " >
									<option value="unlimit">제한없음</option>
									<option value="two">2개</option>
									<option value="three">3개</option>
									<option value="four">4개</option>
									<option value="five">5개</option>
									</select>
									</div><br>
									
									<div  id="setEndDate" style="width: 30%; display: inline-block; float:right; visibility:hidden">
									<label style="width: 130px;" >종료일 선택<input type='date' /><input type='time' /></label> 
									</div>
									
									<button type="button" id="voteSubmitBtn"
										style="width: 15%; height: 30px; font-size: 17px; float: right; margin: 0px">작성</button>
 
									<!-- content end -->
								</div>
							</div>
						</div>
					</div>
					<!-- end -->
					
					<!-- 스케치 모달 -->
					<div class="modal fade" id="sketchModal" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="writerModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document" style="width: 50%;">
							<div class="modal-content">
								<div class="modal-header">
									<h2 class="modal-title nanum" id="checkMemModalLabel"
										style="font-weight: bold;">스케치 게시글 작성</h2>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
								
									<!-- content start -->
										<textarea class=" nanum" id="writePostArea2" rows="6" placeholder="게시글내용을 입력하세요." 
													style="border: 1px solid black; color: black; font-size: 17px; height: 100px; width:100%;"></textarea>
										<div class="jb_table">
											<div class="row drawing">
												<span class="cell">
													<div>
														<canvas id="canvas" width="420" height="485"></canvas>
													</div>
												</span>
												 <span class="cell" id="draw">
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
															<textarea id="history" cols="40" rows="37"style="display: none;"></textarea>
														</div>
													</div>
												</span>
											</div>
										</div>
									<div> Title<input id="title" size="15" style="display: inline-block;" /> 
										<a id="saveImage" download="image.png" style="display: inline-block;">
										<INPUT type="button" value="Save" onClick="saveImage()" />
										</a> 
										<INPUT type="button" value="Clear" onClick="initPage()" />
										<button type="button" style="width: 10%; height: 25px; font-size: 17px; float: right; margin-top: 10px">작성</button>
									</div>	 
									<!-- content end -->
									
								</div>
							</div>
						</div>
					</div>
					<!-- end -->
					
	<script>
	
	// 투표 게시글작성
	$("#voteSubmitBtn").click(function() {
		var postContent = $(this).parent().find("textarea").val();
		//var divBox = $(this).parent(".box111");
		var voteOption1 = $("#voteOption1").val();
		var voteOption2 = $("#voteOption2").val();
		var voteOption3 = $("#voteOption3").val();

		
										
		$.ajax({
			url : "writeComment",
			data : {"postNo" : postNo, "commentContent" : commentContent },
			type : "post",
			success : function(result) {
				
				if (result == "true") {
					replyCount++;
					$(this).parent().parent().parent().prev("div" > ".commentCount").text("댓글"+replyCount);
					console.log("댓글 작성 성공");
					$(this).parent().prev("div" > ".writeCommentArea" ).text('');
					
				} else {
					$(this).parent().prev("div" > ".writeCommentArea" ).text('');
				}
			},
			error : function(e) {
				console.log("ajax 통신 실패");
				$(this).parent().prev().find("textarea").val= "";
				console.log("댓글 입력 후 내용:"+commentContent);
				console.log(e);
			}
		});
		 refreshList()
	});
	
	</script>				
</body>
</html>