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
								<div class="writeOptionArea shake">
									<form class="form-signin">
										<a href="#" data-toggle="modal" data-target="#summerModal"> 
											<img class="writeOption" src="${contextPath}/resources/img/imageIcon.png" alt="">
											<p class="arrow_box">사진</p>
										</a>
									</form>
								</div>

								<!-- 동영상 첨부 -->
								<div class="writeOptionArea shake">
									<form class="form-signin">
										<a href="#" data-toggle="modal" data-target="#summerModal"> 
											<img class="writeOption" src="${contextPath}/resources/img/film.png" alt="">
											<p class="arrow_box">동영상</p>
										</a>
									</form>
								</div>

								<!-- 파일첨부 -->
								<div class="writeOptionArea shake">
									<form class="form-signin">
										<a href="#" data-toggle="modal" data-target="#summerModal"> 
											<img class="writeOption" src="${contextPath}/resources/img/paperclip.png" alt="">
											<p class="arrow_box">파일첨부</p>
										</a>
									</form>
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
									<img class="writeOption mapOption" src="${contextPath}/resources/img/map.png"
												data-toggle="modal" data-target="#mapModal">

									<p class="arrow_box">지도</p>
								</div>
								
								
								<!-- Modal -->
								<!-- <div class="modal fade" id="mapModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
								        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
								      </div>
								      <div class="modal-body">
								        ...
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								        <button type="button" class="btn btn-primary">Save changes</button>
								      </div>
								    </div>
								  </div>
								</div> -->


								
								 <!-- 지도 모달  -->
								<!--<div id="modal" class="nanum mapModal">

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
								</div> -->

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


</body>
</html>