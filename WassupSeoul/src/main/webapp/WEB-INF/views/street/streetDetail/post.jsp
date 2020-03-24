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

<title>타임라인 글작성 영역</title>
</head>
<style>

 </style>
<body>

		<div class="postLayoutView " style="padding: 0%;">
				<form action="insert" method="post" enctype="multipart/form-data"
					role="form" onsubmit="return validate();">

					<div class="writePost">
						<textarea class="postArea nanum" id="writePostArea" name="boardContent" rows="3" placeholder="새로운 게시글을 작성해보세요"></textarea>
					</div>

					<div class="postCountView" style="border: 1px solid black; height: 45px;">

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
										
				                <div id="writePostBtn" style="display: inline-block; width: 18%; margin-bottom: 0px; height: 100%; float: right;">
				                  <button type="submit" class="btn nanum" style="height: 40px; font-size: 18px; font-weight: bolder; position: relative; bottom: 1px; right: 7px; float: right;">작성</button>
				                </div>
									</div>
								</form>
							</div>
			
</body>
</html>