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
									<img class="writeOption voteOption" data-toggle="modal" data-target="#voteModal"
										src="${contextPath}/resources/img/vote.png">
									<p class="arrow_box">투표</p>
								</div>
						
								<div class="writeOptionArea shake">
									<img class="writeOption" src="${contextPath}/resources/img/pie-chart.png">
									<p class="arrow_box">N빵</p>
								</div>

								<div class="writeOptionArea shake">
									<img class="writeOption mapOption" src="${contextPath}/resources/img/map.png"
												data-toggle="modal" data-target="#mapModal">
									<p class="arrow_box">지도</p>
								</div>
								
								<div class="writeOptionArea shake">
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


					<!-- 지도 모달 -->
					<div class="modal fade" id="mapModal" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="writerModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document" style="width: 700px; height:1000px">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- content start -->
									
									<div class="modal_content" style="padding: 3px;">

									<textarea class=" nanum" id="writePostArea1" rows="6" placeholder="게시글내용을 입력하세요."
											style="border: 1px solid black; color: black; font-size: 17px; height: 280px; width:100%"></textarea>
										<!-- <input type="text" placeholder="주소검색 버튼 클릭" style="width:80%;" name="address1" id="address1" class="postcodify_address"> -->
										<!-- <input type="button" value="주소 검색" id="postcodify_search_button"><br> -->
										<!-- <div id="map"style="width: 100%; height: 300px; margin-top: 10px; border:2px black solid;"></div> -->
										
										<div class="map_wrap">
											    <div id="map" style="width:100%;height:600px;position:relative;overflow:hidden;"></div>
											
											    <div id="menu_wrap" class="bg_white">
											        <div class="option">
											            <div>
											                <form onsubmit="searchPlaces(); return false;">
										                   			 키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
											                    <button type="submit">검색하기</button> 
											                </form>
											            </div>
											        </div>
											        <hr>
											        <ul id="placesList"></ul>
											        <div id="pagination"></div>
											    </div>
										</div>
											
										<button type="button" style="width: 14%; height: 25px; font-size: 17px; float: right; margin-top:10px">작성</button>

									<div class="modal_layer"></div>
									</div>
									
								 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a32d3d818847c093a324db2e8ffc840"></script>
								 	
								 	<script>
									// 마커를 담을 배열입니다
									var markers = [];
									
									var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
									    mapOption = {
									        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
									        level: 3 // 지도의 확대 레벨
									    };  
									
									// 지도를 생성합니다    
									var map = new kakao.maps.Map(mapContainer, mapOption); 
									
									// 장소 검색 객체를 생성합니다
									var ps = new kakao.maps.services.Places();  
									
									// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
									var infowindow = new kakao.maps.InfoWindow({zIndex:1});
									
									// 키워드로 장소를 검색합니다
									searchPlaces();
									
									// 키워드 검색을 요청하는 함수입니다
									function searchPlaces() {
									
									    var keyword = document.getElementById('keyword').value;
									
									    if (!keyword.replace(/^\s+|\s+$/g, '')) {
									        alert('키워드를 입력해주세요!');
									        return false;
									    }
									
									    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
									    ps.keywordSearch( keyword, placesSearchCB); 
									}
									
									// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
									function placesSearchCB(data, status, pagination) {
									    if (status === kakao.maps.services.Status.OK) {
									
									        // 정상적으로 검색이 완료됐으면
									        // 검색 목록과 마커를 표출합니다
									        displayPlaces(data);
									
									        // 페이지 번호를 표출합니다
									        displayPagination(pagination);
									
									    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
									
									        alert('검색 결과가 존재하지 않습니다.');
									        return;
									
									    } else if (status === kakao.maps.services.Status.ERROR) {
									
									        alert('검색 결과 중 오류가 발생했습니다.');
									        return;
									
									    }
									}
									
									// 검색 결과 목록과 마커를 표출하는 함수입니다
									function displayPlaces(places) {
									
									    var listEl = document.getElementById('placesList'), 
									    menuEl = document.getElementById('menu_wrap'),
									    fragment = document.createDocumentFragment(), 
									    bounds = new kakao.maps.LatLngBounds(), 
									    listStr = '';
									    
									    // 검색 결과 목록에 추가된 항목들을 제거합니다
									    removeAllChildNods(listEl);
									
									    // 지도에 표시되고 있는 마커를 제거합니다
									    removeMarker();
									    
									    for ( var i=0; i<places.length; i++ ) {
									
									        // 마커를 생성하고 지도에 표시합니다
									        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
									            marker = addMarker(placePosition, i), 
									            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
									
									        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
									        // LatLngBounds 객체에 좌표를 추가합니다
									        bounds.extend(placePosition);
									
									        // 마커와 검색결과 항목에 mouseover 했을때
									        // 해당 장소에 인포윈도우에 장소명을 표시합니다
									        // mouseout 했을 때는 인포윈도우를 닫습니다
									        (function(marker, title) {
									            kakao.maps.event.addListener(marker, 'mouseover', function() {
									                displayInfowindow(marker, title);
									            });
									
									            kakao.maps.event.addListener(marker, 'mouseout', function() {
									                infowindow.close();
									            });
									
									            itemEl.onmouseover =  function () {
									                displayInfowindow(marker, title);
									            };
									
									            itemEl.onmouseout =  function () {
									                infowindow.close();
									            };
									        })(marker, places[i].place_name);
									
									        fragment.appendChild(itemEl);
									    }
									
									    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
									    listEl.appendChild(fragment);
									    menuEl.scrollTop = 0;
									
									    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
									    map.setBounds(bounds);
									}
									
									// 검색결과 항목을 Element로 반환하는 함수입니다
									function getListItem(index, places) {
									
									    var el = document.createElement('li'),
									    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
									                '<div class="info">' +
									                '   <h5>' + places.place_name + '</h5>';
									
									    if (places.road_address_name) {
									        itemStr += '    <span>' + places.road_address_name + '</span>' +
									                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
									    } else {
									        itemStr += '    <span>' +  places.address_name  + '</span>'; 
									    }
									                 
									      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
									                '</div>';           
									
									    el.innerHTML = itemStr;
									    el.className = 'item';
									
									    return el;
									}
									
									// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
									function addMarker(position, idx, title) {
									    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
									        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
									        imgOptions =  {
									            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
									            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
									            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
									        },
									        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
									            marker = new kakao.maps.Marker({
									            position: position, // 마커의 위치
									            image: markerImage 
									        });
									
									    marker.setMap(map); // 지도 위에 마커를 표출합니다
									    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
									
									    return marker;
									}
									
									// 지도 위에 표시되고 있는 마커를 모두 제거합니다
									function removeMarker() {
									    for ( var i = 0; i < markers.length; i++ ) {
									        markers[i].setMap(null);
									    }   
									    markers = [];
									}
									
									// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
									function displayPagination(pagination) {
									    var paginationEl = document.getElementById('pagination'),
									        fragment = document.createDocumentFragment(),
									        i; 
									
									    // 기존에 추가된 페이지번호를 삭제합니다
									    while (paginationEl.hasChildNodes()) {
									        paginationEl.removeChild (paginationEl.lastChild);
									    }
									
									    for (i=1; i<=pagination.last; i++) {
									        var el = document.createElement('a');
									        el.href = "#";
									        el.innerHTML = i;
									
									        if (i===pagination.current) {
									            el.className = 'on';
									        } else {
									            el.onclick = (function(i) {
									                return function() {
									                    pagination.gotoPage(i);
									                }
									            })(i);
									        }
									
									        fragment.appendChild(el);
									    }
									    paginationEl.appendChild(fragment);
									}
									
									// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
									// 인포윈도우에 장소명을 표시합니다
									function displayInfowindow(marker, title) {
									    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
									
									    infowindow.setContent(content);
									    infowindow.open(map, marker);
									}
									
									 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
									function removeAllChildNods(el) {   
									    while (el.hasChildNodes()) {
									        el.removeChild (el.lastChild);
									    }
									}
								 	
								 	
								 	
								 	</script>
								 	
									<!-- content end -->
								</div>
							</div>
						</div>
					</div>
					<!-- end -->
					
					<!-- jQuery와 postcodify 를 로딩한다. -->
                    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
                    
					
					<!-- 투표 모달 -->
					<div class="modal fade" id="voteModal" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="writerModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document" style="width: 496px;">
							<div class="modal-content">
								<div class="modal-header">
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
									
									<button type="button" it="voteSubmitBtn"
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
						<div class="modal-dialog" role="document" style="width: 496px;">
							<div class="modal-content">
								<div class="modal-header">
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