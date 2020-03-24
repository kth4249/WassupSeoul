<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/timeline.css" type="text/css">

<title>타임라인 글작성 영역</title>
</head>
<style>

 </style>
<body>
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
			
</body>
</html>