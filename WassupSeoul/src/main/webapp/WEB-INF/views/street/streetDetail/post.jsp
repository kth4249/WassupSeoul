<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/timeline.css" type="text/css">

		 <script src="${pageContext.request.contextPath}/resources/js/drawengine.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/painter.js"></script> 
		<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3B2jMzpJSy5YG5-T11FaB4SCKPkjQ3Sc&callback=initMap"></script>
		<%-- <script src="${pageContext.request.contextPath}/resources/js/canvas.js"></script> --%>
		

<title>타임라인 글작성 영역</title>
</head>
<style>

 </style>
<body>

		<div class="postLayoutView " style="padding: 0%;">
				<form action="insert" method="post" enctype="multipart/form-data"
					role="form" onsubmit="return validate();">

					<div class="writePost">
						<textarea class="postArea nanum form-control" style="border-radius: 10px !important"
						 id="writePostArea" name="boardContent" rows="3" placeholder="새로운 게시글을 작성해보세요"></textarea>
					</div>

					<div class="postCountView" style="height: 45px;">

                				<!-- 사진 첨부 -->
								<div class="writeOptionArea shake" style="width: 7%">
									<form class="form-signin">
										<a href="#" data-toggle="modal" data-target="#insertSummer"> 
											<img class="writeOption" src="${contextPath}/resources/img/photoIcon.png" alt="">
											<p class="arrow_box">사진</p>
										</a>
									</form>
								</div>

				                <!-- 동영상 첨부 -->
				                <div class="writeOptionArea shake" style="width: 7%">
				                  <form class="form-signin">
				                    <a href="#" data-toggle="modal" data-target="#insertSummer"> 
				                      <img class="writeOption" src="${contextPath}/resources/img/videoIcon.png" alt="">
				                      <p class="arrow_box">동영상</p>
				                    </a>
				                  </form>
				                </div>
				
				                <!-- 파일첨부 -->
				                <div class="writeOptionArea shake" style="width: 7%">
				                  <form class="form-signin">
				                    <a href="#" data-toggle="modal" data-target="#insertSummer"> 
				                      <img class="writeOption" src="${contextPath}/resources/img/linkIcon.png" alt="">
				                      <p class="arrow_box">링크</p>
				                    </a>
				                  </form>
				                </div>
				
								<!-- 투표 -->
				                <div class="writeOptionArea shake" style="width: 7%">
				                  <img class="writeOption voteOption" data-toggle="modal" data-target="#voteModal"
				                    src="${contextPath}/resources/img/voteIcon.png">
				                  <p class="arrow_box">투표</p>
				                </div>
				                
								<!-- N빵 --> 
				                <div class="writeOptionArea shake" style="width: 7%">
				                  <img class="writeOption" src="${contextPath}/resources/img/dutchIcon.png"
				                  		data-toggle="modal" data-target="#devideModal">
				                  <p class="arrow_box">1/N</p>
				                </div>
				
								<!-- 지도 -->
				                <div class="writeOptionArea shake" style="width: 7%">
				                  <img class="writeOption mapOption" src="${contextPath}/resources/img/mapIcon.png"
				                        data-toggle="modal" data-target="#mapModal">
				                  <p class="arrow_box">지도</p>
				                </div>
				
								<!-- 스케치 -->	
				                <div class="writeOptionArea shake" style="width: 7%">
				                  <img class="writeOption sketchOption" data-toggle="modal" data-target="#sketchModal"
				                    src="${contextPath}/resources/img/sketchIcon.png">
				                  <p class="arrow_box">스케치</p>
				                </div>
										
				                <div id="writePostBtn" style="display: inline-block; width: 18%; margin-bottom: 0px; height: 100%; float: right;">
				                  <button type="submit" class="btn btn-secondary nanum mt-1" style="height: 40px; font-size: 15px; 
				                  	position: relative; bottom: 1px; right: 7px; float: right;">작성</button>
				                </div>
									</div>
								</form>
							</div>
			
</body>
</html>