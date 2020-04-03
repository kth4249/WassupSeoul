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
		<script src="${pageContext.request.contextPath}/resources/js/fullcalendar.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/daygrid.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/interaction.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fullcalendar.css" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/daygrid.css" type="text/css">
		
    
<title>일정</title>
	<!-- 캘린더 추가 시작 -->
    <script>
    // 현재 로그인 회원 회원번호
    var memberNo = "<c:out value='${loginMember.memberNo}'/>";
    var streetMasterNo = "<c:out value='${streetMasterNo}'/>";
    
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
          plugins: [ 'dayGrid','interaction' ],
          //locale : "ko", //한글설정,단 nanum설정 안됨
          dateClick: function (info) {
	          //alert('Clicked on: ' + info.dateStr); // 날짜 관련 데이터,년-월-일
	          
	          // 현재 로그인 회원이 골목대장(골목 개설 인원)인지 판별
	          if(memberNo == streetMasterNo) { // 골목대장일 경우 일정 추가 가능
	        	  // 일정 추가 모달창 띄우기 전에 모달창에 기존에 입력된 값 제거
	        	  $("#calendarTitle").val("");
	        	  $("#calendarContent").val("");
	        	  $("#calendarLocation").val("");
	        	  $("#insertAddress").val("");
	        	  $("#calStartDate").val("");
	        	  $("#calStartTime").val("");
	        	  $("#calEndDate").val("");
	        	  $("#calEndTime").val("");
	        	  $("#joinNumber").val("");
	        	  $("#joinDate").val("");
	          	  $("#notJoin").prop("checked",false);
	          	  $("#join").prop("checked",false);
	        	  // 모달창 출력
	        	  $('#calendarModal').modal();  
	          } else { // 골목대장이 아닐경우 일정 추가 불가
	        	  alert("골목대장만 일정을 추가할 수 있습니다.");
	          }
          
          },
            
          events: [
        	  {id: 1,title: '새해',textColor : "#000000",start: '2020-01-01',end: '2020-01-01'},
              {id: 2,title: '설날',textColor : "#000000",start: '2020-01-24',end: '2020-01-27'},
              {id: 3,title: '삼일절',textColor : "#000000",start: '2020-03-01',end: '2020-03-01'},
              {id: 4,title: '부처님오신날',textColor : "#000000",start: '2020-04-30',end: '2020-04-30'},
              {id: 5,title: '어린이날',textColor : "#000000",start: '2020-05-05',end: '2020-05-05'},
              {id: 6,title: '현충일',textColor : "#000000",start: '2020-06-06',end: '2020-06-06'},
              {id: 7,title: '광복절',textColor : "#000000",start: '2020-08-15',end: '2020-08-15'},
              {id: 8,title: '추석',textColor : "#000000",start: '2020-09-30',end: '2020-10-03'},
              {id: 9,title: '개천절',textColor : "#000000",start: '2020-10-03',end: '2020-10-03'},
              {id: 10,title: '한글날',textColor : "#000000",start: '2020-10-09',end: '2020-10-09'},
              {id: 11,title: '성탄절',textColor : "#000000",start: '2020-12-25',end: '2020-12-25'}
          ]
          /*----------------정승환 추가코드(20.03.30)-------------------*/
          //일정 클릭 이벤트
          ,eventClick:function(info) {
        	  var start = info.event.start.getFullYear()+"-"+(info.event.start.getMonth() + 1)+"-"+info.event.start.getDate(); // 년-월-일 형태로 문자열 구성
        	  if(info.event.end != null) {
        		  var end = info.event.end.getFullYear()+"-"+(info.event.end.getMonth() + 1)+"-"+info.event.end.getDate(); // 년-월-일 형태로 문자열 구성  
        	  } else {
        		  var end = start;
        	  }
        	  // 일정 정보 조회용 모달창 값 세팅
        	  $("#informScheduleTitle").val(info.event.title);
        	  $("#informScheduleStart").val(start);
        	  $("#informScheduleEnd").val(end);
        	  // 일정 정보 모달 출력
        	  $("#informSchedule").modal();
          }
          /*----------------정승환 추가코드(20.03.30)-------------------*/
          
        });
        
        // 일정 달력에 추가
        var calStartDate = new Array();
        var calEndDate = new Array();
        var calTitle = new Array();
        <c:forEach var="calendar" items="${allCalList}">
        	calTitle.push("${calendar.calTitle}");
        	calStartDate.push("${calendar.calStartDate}");
        	calEndDate.push("${calendar.calEndDate}");
        </c:forEach>
        
        
        $.each(calTitle,function(index,item){
   			var tempTitle = calTitle[index];
   			var tempStartDate = calStartDate[index];
   			var tempEndDate = calEndDate[index];
        	calendar.addEvent({'title': tempTitle,textColor : "#000000", 'start':tempStartDate, 'end':tempEndDate});
        });
   		
       	//var abc = calTitle[0];
        //calendar.addEvent({'title':abc, 'start':'2020-03-24', 'end':'2020-03-25'});
		
        calendar.render();

      });
    </script>
    <!-- 캘린더 추가 끝 -->
    <style>
    	
    </style>
</head>
<body style="background-color : rgb(255, 255, 255);">
	<!-- 골목 네비바 여백 -->
	<div class="container-fluid" style="margin-top: 57px;">
		<div class="row"  style="padding: 0px; height:44px"></div>
	</div>
	
	<!-- 고정된 골목 네비바  -->
	<%-- <%@ include file="../street/streetDetail/streetNav.jsp"%> --%>
	<jsp:include page="../street/streetDetail/streetNav.jsp"/>

	<!-- 고정된 헤더 -->
	<%-- <%@include file="../common/header.jsp"%> --%>
	<jsp:include page="../common/header.jsp"/>

	<!-- 컨텐츠영역-->
	<div class="container-fluid" style="margin-top: 10px;">
		<div class="row">
			
			<%-- <%@ include file="../street/streetDetail/streetSide.jsp"%> --%>
			<jsp:include page="../street/streetDetail/streetSide.jsp"/>
			
			<!-- 사이드1 여백 -->
			<div class="col-md-4" id="devideArea"></div>
			<!-- 사이드1 여백 -->

			<!-- 본문내용-->
			<div class="col-md-4" id="devideArea" style="margin-top: 10px;">
			
				<div class="row">
                    <div class="col-md-12">
                      <div id='calendar'>
                    </div>
                      <!-- 모달창 시작 -->
                      <div class="modal fade" id="calendarModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h2 class="modal-title nanum" id="calendarModalLabel">일정 만들기</h2>
                            </div>
                            <div class="modal-body">
                              <!-- 내용 시작 -->
                            <form action="${contextPath}/street/addSCSC" method="POST" role="form" onsubmit="return validate();">
                              <div class="form-group row">
                                <div class="col-md-12">
                                  <input type="text" class="form-control nanum" id="calendarTitle" name="calendarTitle" placeholder="일정 제목 입력">
                                </div>
                              </div>
                              <div class="form-group row">
                                <div class="col-md-12">
                                  <textarea rows="2" cols="65" style="resize: none;" id="calendarContent" name="calendarContent" class="form-control nanum" placeholder="일정 설명 입력"></textarea>
                                </div>
                              </div>
                              <!-- 정승환 추가코드 (20.03.30) -->
                              <!-- 지도 변경 시작 -->
                              <div class="form-group row">
		                       <label class="col-sm-3 col-form-label nanum" style="font-weight: bold;">위치검색</label>
		                       <div class="col-sm-9">
		                         <div id="insert-floating-panel" style="width:100%; margin-left: 1px;" class="row" >
									<input id="insertAddress" type="textbox" style="width:83%" class="form-control">
								    <input id="insertMapSubmit" type="button" value="검색" class="btn btn-primary">
								</div>
							    <div class="map_wrap">
									<div id="insertMap" style="width:100%;height:200px;position:relative;overflow:hidden;"></div>
								</div>
		                         
			                     <script>
			                  	  // 추가 시작
		                  		  // 기존 마커를 제거하기 위한 변수
						          var clickMarker; // 클릭시 생성되는 마커
						          var searchMarker; // 검색시 생성되는 마커
							        
							      function initMap() {
							    	var geocoder = new google.maps.Geocoder;
							        var map = new google.maps.Map(document.getElementById('insertMap'), {
							          zoom: 15,
							          center: {lat: 37.5724723, lng: 126.9737442}
							        });
							
							        document.getElementById('insertMapSubmit').addEventListener('click', function() {
							        	if($("#insertAddress").val().length < 2) {
							        		alert("2글자 이상 입력해주세요.");
							        	} else {
									          geocodeAddress(geocoder, map);							        		
							        	}

							        });
							        
							     	// 추가 시작
							        
							        // 지도 클릭시 해당하는 주소, 좌표 얻기
							        map.addListener('click',function(e){
							        	
							        	// 기존 마커 제거
							        	if(clickMarker != null) {
								        	clickMarker.setMap(null);	
							        	}
							        	if(searchMarker != null) {
							        		searchMarker.setMap(null);
							        	}
							        	
							        	var latlng = {
							        		lat : e.latLng.lat(),
							        		lng : e.latLng.lng()
							        	}
							        	
							        	console.log(latlng);
							        	
							        	geocoder.geocode({'location': latlng}, function(results, status) {
							        		var storeAddress = document.getElementById('calendarLocation'); // 일정 위치
							        		if (status === 'OK') {
							        			var realAddr = results[0].formatted_address;
									        	// results[0].formatted_address -> 검색된 주소의 상세주소
									        	console.log(results);
									        	console.log(realAddr);
									        	// 대한민국 서울특별시 제거
									        	realAddr = realAddr.substring(11);
									        	storeAddress.value = realAddr;
							        			var coords = results[0].geometry.location;
								            	map.setCenter(coords);
									           	var marker = new google.maps.Marker({
									           		   map: map,
									             	   position: coords
									            });
									           	clickMarker = marker; // 클릭시 생성한 마커 지정
							        		} else {
							        			alert('Geocode was not successful for the following reason: ' + status);
							        		}
							        	});
							        });
							        
							        // 추가 끝
							        
							      }
							
							      function geocodeAddress(geocoder, resultsMap) { 
							    	// 기존 마커 제거
						        	if(clickMarker != null) {
							        	clickMarker.setMap(null);	
						        	}
						        	if(searchMarker != null) {
						        		searchMarker.setMap(null);
						        	}
							        	
							        var address = document.getElementById('insertAddress').value;
							        var storeAddress = document.getElementById('calendarLocation');
							        // form태그로 전달할 주소 input
							        geocoder.geocode({'address': address}, function(results, status) {
							        	console.log(address);
							        	if(Object.keys(results).length == 0){
							        		storeAddress.value = "일정 위치가 지정 안됨";
							        	} else {
							        		var realAddr = results[0].formatted_address;
								        	console.log(results);
								        	console.log(realAddr);
								        	// results[0].formatted_address -> 검색된 주소의 상세주소
								        	// 대한민국 서울특별시 제거
										    realAddr = realAddr.substring(11);
								        	storeAddress.value = realAddr;
								        	// 검색된 상세주소를 아래 입력칸에 넣는다.
							        	}
							        	if (status === 'OK') {
								        	var coords = results[0].geometry.location;
								           	resultsMap.setCenter(coords);
								           	var marker = new google.maps.Marker({
								           		   map: resultsMap,
								             	   position: coords
								            });
								           	  searchMarker = marker; // 검색시 발생한 마커 지정
									    } else {
									        alert('위치검색이 되지 않습니다: ' + status);
									    }
							        });
							     
							        
							      }
							      
							     </script>
		                         <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3B2jMzpJSy5YG5-T11FaB4SCKPkjQ3Sc&callback=initMap"></script>
		                         
		                       </div>
		                       <div class="col-sm-3"></div>
		                       <div class="col-sm-9"><p class="nanum" style="color: darksalmon;">*위치 검색 또는 지도 클릭시 상세한 주소를 지정할 수 있습니다.</p></div>
		                     </div>
			                     
		                     <div class="form-group row">
		                       <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;">위치</label>
		                       <div class="col-md-10">
		                         <input type="text" required class="form-control nanum" id="calendarLocation" name="calendarLocation" placeholder="지정된 모임 장소">
		                       </div>
		                     </div>
                              <!-- 지도 변경끝 -->
                              <!-- 정승환 추가코드 (20.03.30) -->
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;">시작</label>
                                <div class="col-sm-5"><input type="date" class="form-control" name="calStartDate" id="calStartDate"></div>
                                <div class="col-sm-5"><input type="time" class="form-control" name="calStartTime" id="calStartTime"></div>
								<div class="col-sm-12 nanum" style="font-weight: bold;color: darksalmon">*일정 시작일은 현재 시간보다 1일 후 날짜부터 지정할 수 있습니다.</div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;">종료</label>
                                <div class="col-sm-5"><input type="date" class="form-control" name="calEndDate" id="calEndDate"></div>
                                <div class="col-sm-5"><input type="time" class="form-control" name="calEndTime" id="calEndTime"></div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;">참석설정</label>
                                <div class="col-md-4">
                                  <div class="form-check">
                                    <label class="form-check-label nanum">
                                      <input type="radio" class="form-check-input" name="joinCalendar" id="notJoin" value="N">
                                      	미참석 일정
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-4">
                                  <div class="form-check">
                                    <label class="form-check-label nanum">
                                      <input type="radio" class="form-check-input" name="joinCalendar" id="join" value="Y">
                                     	 참석 일정
                                    </label>
                                  </div>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-3 col-form-label nanum" style="font-weight: bold;">참석제한인원</label>
                                <div class="col-sm-5"><input type="number" class="form-control" name="cJoinLimit" id="joinNumber" placeholder="참석인원 입력"></div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-3 col-form-label nanum" style="font-weight: bold;">참가종료일</label>
                                <div class="col-sm-5"><input type="date" class="form-control" name="cJoinEndDate" id="joinDate"></div>
                                <div class="col-sm-4"></div>
                              </div>
                              <!-- 코드수정 정승환(20.03.30) -->
                              <div class="form-group row">
                              	<div class="col-sm-12">
                              		<div class="custom-control custom-checkbox"><br>
                                  		<input type="checkbox" class="custom-control-input" id="customCheck123" checked="" value="Y" name="openBoard">
                                  		<label class="custom-control-label nanum" for="customCheck123">게시글 공유</label>
                                	</div>
                              	</div>
                              </div>
                              <!-- 코드수정 정승환(20.03.30) -->
                              <br><br>
                              <div class="form-group row">
                                <div class="col-md-2"></div>
                                <div class="col-md-4"><button type="submit" class="btn btn-success btn-block nanum" style="font-weight: bold;">완료</button></div>
                                <div class="col-md-4"><button type="button" class="btn btn-warning btn-block nanum" data-dismiss="modal" style="font-weight: bold;">나가기</button></div>
                                <div class="col-md-2"></div>
                              </div>
                            </form>
                              <!-- 내용  끝 -->
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- 모달창 끝 -->
                    </div>
                  </div>
                  <br>

                  <div class="row">
                    <div class="col-md-12">
                      <ul class="list-group list-group-flush" id="rightHere">
                      
                      	<c:if test="${empty setCalList}">
                      		<li class="list-group-item">
                      			<h4 class="nanum">예정된 일정이 없습니다.</h4>
                      		</li>
                      	</c:if>
                      	
                      	<c:if test="${!empty setCalList}">
                      		<c:forEach var="calendar" items="${setCalList}" varStatus="vs">
	                      		<li class="list-group-item">
		                          <div class="row">
		                            <div class="col-md-2">
		                              <h4 class="nanum">${calendar.calStartDay}</h4>
		                              <h6 class="nanum">${calendar.calStartDayOfWeek}</h6>
		                            </div>
		                            <div class="col-md-10">
		                              <p class="nanum">${calendar.calTitle}</p>
		                              <p class="nanum">${calendar.calStartHour}</p>
		                              <p class="nanum">${calendar.calLocation}</p>
		                              <div class="row">
		                                <label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold; padding: 0px; margin-left: 5px;">참여 가능수</label> <!-- 정승환 코드수정(20.04.01) -->
		                                <c:if test="${calendar.calendarJoin == 'N'.charAt(0)}">
		                                	<div class="col-sm-7"><input type="text" readonly class="form-control-plaintext nanum" value="참여인원이 없는 일정입니다." style="font-weight: bold;"></div>
		                                </c:if>
		                                <c:if test="${calendar.calendarJoin == 'Y'.charAt(0)}">
		                                	<div class="col-sm-7"><input type="text" readonly class="form-control-plaintext nanum" value="${calendar.calJoinLimit}" style="font-weight: bold; padding: 0px;"></div>
		                                </c:if>
		                                <!-- 골목 대장인 경우에만 수정,삭제 가능 -->
		                                <c:if test="${loginMember.memberNo == streetMasterNo}">
		                                	<div class="col-sm-1" style="padding-left:5px;padding-right:5px">
		                                	<!-- 마감일이 현재시간을 보다 더 미래인 경우에만 수정버튼 출력 -->
	                                		<c:if test="${calendar.calEndDate > compareNowDate }">
	                                			<img alt="수정버튼" class="scheduleUpdate" src="${contextPath}/resources/img/streetChange.svg" style="cursor:pointer;width: 30px; height: 20px;"><!-- 정승환 코드 수정(20.03.31) -->
	                                			수정
	                                			<input type="hidden" value="${calendar.boardNo}">
	                                		</c:if>
	                                		</div>
		                                	<div class="col-sm-1" style="padding-left:5px;padding-right:5px">
		                                		<img alt="삭제버튼" class="scheduleDelete" src="${contextPath}/resources/img/iconmonstr-trash-can-1.svg" style="cursor:pointer;width: 30px; height: 20px;"><!-- 정승환 코드 수정(20.03.31) -->
		                                		삭제
		                                		<input type="hidden" value="${calendar.boardNo}">
		                                	</div>
		                                </c:if>
		                              </div>
		                            </div>
		                          </div>
		                        </li>
                      		</c:forEach>
                      	</c:if>
                      	
                      </ul>
                    </div>
                  </div>
                  
			</div>
			<!-- 본문내용-->
			
			<!-- 사이드2 여백 -->
			<div class="col-md-4" id="devideArea"></div>
			<!-- 사이드2 여백 -->
			
			<!-- 수정용 모달창 시작-->
             <div class="modal fade" id="updateCalendarModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
               <div class="modal-dialog" role="document">
                 <div class="modal-content">
                   <div class="modal-header">
                     <h2 class="modal-title nanum" id="updateCalendarModalLabel">일정 수정</h2>
                   </div>
                   <div class="modal-body">
                     <!-- 내용 시작 -->
                   <form action="${contextPath}/street/updateSchedule" method="post" onsubmit="return updateValidate();">
                     <div class="form-group row">
                       <div class="col-md-12">
                         <input type="text" class="form-control nanum" id="updateCalendarTitle" name="updateCalendarTitle" placeholder="일정 제목 입력">
                         <input type="hidden" id="updateCalendarBoardNo" name="updateCalendarBoardNo">
                       </div>
                     </div>
                     <div class="form-group row">
                       <div class="col-md-12">
                         <textarea rows="2" cols="65" style="resize: none;" id="updateCalendarContent" name="updateCalendarContent" class="form-control nanum" placeholder="일정 설명 입력"></textarea>
                       </div>
                     </div>
                     <!-- 정승환 추가코드 (20.03.30) -->
                    <!-- 카카오 지도 -->
                    <div class="form-group row">
                    	<label class="col-sm-3 col-form-label nanum" style="font-weight: bold;">위치검색</label>
                    	<!-- 검색창 시작 -->
                    	<div class="col-sm-6"><input type="text" class="form-control nanum" id="updateSearchLocation"></div>
                    	<div class="col-sm-3"><button type=button class="btn btn-primary btn-block nanum" id="updateSearchLocationBtn">검색</button></div>
                    	<!-- 검색창끝  -->
                    	<div class="col-sm-3"></div>
		                <div class="col-sm-9">
		                	<div id="map" style="width:100%;height:250px;"></div>
		                </div>
		                <div class="col-sm-3"></div>
		                <div class="col-sm-9"><p class="nanum" style="color: darksalmon;">*위치 검색을 통해 생성된 마크중 원하는 장소를 <br>클릭시 수정된 장소가 지정됩니다.</p></div>
                    </div>
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=77161504cfbcd21ef34a3ed0de04dad4&libraries=services"></script>
                    <!-- 카카오 지도 -->
                    <!-- 정승환 추가코드 (20.03.30) -->
                    <div class="form-group row">
                       <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;">위치</label>
                       <div class="col-md-10">
                         <input type="text" class="form-control nanum" id="updateCalendarLocation" name="updateCalendarLocation" placeholder="지정된 모임 장소" readonly>
                       </div>
                     </div>
                     <div class="form-group row">
                       <div class="col-md-2"></div>
                       <div class="col-md-4"><button type="submit" class="btn btn-secondary btn-block nanum" style="font-weight: bold;">완료</button></div>
                       <div class="col-md-4"><button type="button" class="btn btn-secondary btn-block nanum" data-dismiss="modal" style="font-weight: bold;">나가기</button></div>
                       <div class="col-md-2"></div>
                     </div>
                   </form>
                     <!-- 내용  끝 -->
                   </div>
                 </div>
               </div>
             </div>
			<!-- 수정용 모달창 끝 -->
			
			<!-- 정승환 추가코드 (20.03.30) -->
			<!-- 일정 설명용 모달창 시작 -->
			<div class="modal" tabindex="-1" role="dialog" id="informSchedule">
			  <div class="modal-dialog" role="document" style="width:400px;">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title">일정</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <div class="form-group row">
			        	<label class="col-sm-3 col-form-label nanum" style="font-weight: bold;">일정제목</label>
			        	<div class="col-md-9"><input type="text" class="form-control-plaintext nanum" id="informScheduleTitle"></div>
			        	<label class="col-sm-3 col-form-label nanum" style="font-weight: bold;">시작일</label>
			        	<div class="col-md-9"><input type="text" class="form-control-plaintext nanum" id="informScheduleStart"></div>
			        	<label class="col-sm-3 col-form-label nanum" style="font-weight: bold;">종료일</label>
			        	<div class="col-md-9"><input type="text" class="form-control-plaintext nanum" id="informScheduleEnd"></div>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- 일정 설명용 모달창 끝 -->
			<!-- 정승환 추가코드 (20.03.30) -->
			
		</div>
	</div>
	<!-- 컨텐츠영역 종료 -->

	<script>
	// 일정 수정 유효성 검사를 위한 객체
	var updateCheck = {
		"upCalTitle":true,
   		"upCalContent":true,
		"upCalLocation":true
	}
	
	// 일정 등록 유효성 검사를 위한 객체
	var signUpCheck = { 
    		"calendarTitle":false,
    		"calendarContent":false,
			"calendarLocation":true, // 코드수정
			"calendarStartDate":false,
			"calendarStartTime":false,
			"calendarEndDate":false,
			"calendarEndTime":false,
			"calendarJoin":false,
			"calendarJoinDate":false
	};
	
	$(function(){
		
		// 참가신청 여부에 따라 참석인원,참석마감일 지정
        $("input[name=joinCalendar]").on("click",function(){
          if($("#notJoin").prop("checked")){
            $("#joinNumber").val("");
            $("#joinNumber").prop("readonly",true);
            $("#joinDate").val("");
            $("#joinDate").prop("readonly",true);
          } else {
            $("#joinNumber").prop("readonly",false);
            $("#joinDate").prop("readonly",false);
          }
        });
		
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		var $updateCalendarTitle = $("#updateCalendarTitle");
		var $updateCalendarContent = $("#updateCalendarContent");
		var $updateCalendarLocation = $("#updateCalendarLocation");
		
		// 수정 일정 제목 유효성 검사
		$updateCalendarTitle.on("input",function(){
			var regExp = /^.{1,14}$/;
			if(!regExp.test($updateCalendarTitle.val())) {
				updateCheck.upCalTitle = false;
			} else {
				updateCheck.upCalTitle = true;
			}
		});
		
		// 수정 일정 내용 유효성 검사
		$updateCalendarContent.on("input",function(){
			var regExp = /^.{1,}$/;
			if(!regExp.test($updateCalendarContent.val())) {
				updateCheck.upCalContent = false;
      	  } else {
      			updateCheck.upCalContent = true;
      	  }
		});
		
		// 수정 일정 위치 유효성 검사
		$updateCalendarLocation.on("input",function(){
			var regExp = /^.{1,90}$/;
			if(!regExp.test($updateCalendarLocation.val())) {
				updateCheck.upCalLocation = false;
      	  } else {
      			updateCheck.upCalLocation = true;
      	  }
		});
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		
		  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
          // 일정 등록 유효성 검사
          var $calendarTitle = $("#calendarTitle");
          var $calendarContent = $("#calendarContent");
          var $calendarLocation = $("#calendarLocation");
          var $calStartDate = $("#calStartDate");
          var $calStartTime = $("#calStartTime");
          var $calEndDate = $("#calEndDate");
          var $calEndTime = $("#calEndTime");
          var $joinNumber = $("#joinNumber");
          var $joinDate = $("#joinDate");
          
          // 일정제목 유효성검사
          $calendarTitle.on("input",function(){
        	  var regExp = /^.{1,14}$/;
        	  if(!regExp.test($calendarTitle.val())) {
        		  signUpCheck.calendarTitle = false;
        	  } else {
        		  signUpCheck.calendarTitle = true;
        	  }
          });
          
          // 일정내용 유효성검사
          $calendarContent.on("input",function(){
        	  var regExp = /^.{1,}$/;
        	  if(!regExp.test($calendarContent.val())) {
        		  signUpCheck.calendarContent = false;
        	  } else {
        		  signUpCheck.calendarContent = true;
        	  }
          });
          
          // 일정장소 유효성검사
          $calendarLocation.on("input",function(){
        	  var regExp = /^.{1,90}$/;
        	  if(!regExp.test($calendarLocation.val())) {
        		  signUpCheck.calendarLocation = false;
        	  } else {
        		  signUpCheck.calendarLocation = true;
        	  }
          });
          
       	// 현재 날짜 가져오기
      	var d = new Date();
      	
      	// ---일정 시작일---  
        // 일정시작일 최소값 지정 : 현재시간으로 부터 최소 1일 뒤부터 지정가능
      	d.setDate(d.getDate()+1); // 일정 시작일은 최소 내일부터 지정가능
      	var calMonth = new String(d.getMonth() + 1); // 월
      	var calDay = new String(d.getDate()); // 일
      	if(calMonth.length == 1){  // 월이 1자리수 이면 0붙이기 -> 0M 형태
      	  calMonth = "0" + calMonth; 
      	}
      	if(calDay.length == 1){ // 일이 1자리수 이면 0붙이기 -> 0d 형태
      	  calDay = "0" + calDay; 
      	}
      	var nowDate = d.getFullYear()+"-"+calMonth+"-"+calDay; // 년-월-일 형태로 문자열 구성, yyyy-MM-dd 형태 
        $("#calStartDate").prop("min",nowDate); // 일정 시작일의 최소값이 현재 시간으로 지정, 현재 시간보다 이전 시간으로 시작일 지정 불가
        
        // 일정시작일 유효성검사
        $calStartDate.on("input",function(){
        	if($calStartDate.val() == "" || $calStartDate.val() == null) {
        		// 일정 시작일이 제거된 경우 시작시간,종료일,종료시간,참가마감일 모두 제거, 유효성도 모두 false로 변환
        		$calStartTime.val("");
        		signUpCheck.calendarStartTime = false;
        		$calEndDate.val("");
        		signUpCheck.calendarEndDate = false;
        		$calEndTime.val("");
        		signUpCheck.calendarEndTime = false;
        		$joinDate.val("");
        		signUpCheck.calendarJoinDate = false;
        		
        		signUpCheck.calendarStartDate = false;
        	} else {
        		signUpCheck.calendarStartDate = true;
        	}
        });
        // ---일정 시작일---  
        
     	// 일정시작시간 유효성검사 
        $calStartTime.on("input",function(){
        	if($calStartTime.val() == "" || $calStartTime.val() == null) {
        		signUpCheck.calendarStartTime = false;
        	} else {
        		signUpCheck.calendarStartTime = true;
        	}
        });
        
     	// ---일정 종료일---  
     	// 일정종료일 최소값 지정
     	$calEndDate.on("focus",function(){
     		// 1)만약 일정 시작일이 지정되지 않은 경우
     		if($calStartDate.val() == "" || $calStartDate.val() == null) {
    			alert("일정 시작일을 우선 지정하세요.");
    			$calEndDate.val("");
    			$calEndDate.blur(); // 일정종료일 지정해제함 , focusout()은 안먹힘
    			signUpCheck.calendarEndDate = false;
     		}
     		// 2) 일정 시작일이 지정된 경우 -> 일정 종료일 최소값 지정(일정 시작일+1,일정 시작일 내일)
     		else {
	     			var minDate = $calStartDate.val();
	 				var parts = minDate.split('-');
	 				var changeDate = new Date(parts[0],parts[1]-1,parts[2]); // 시작일을 Date형으로 변환
	 				changeDate.setDate(changeDate.getDate()+1); // 시작일 보다 1일 더함
	 				
	 				// Date -> 문자열로 변환
	 				var tempMonth = new String(changeDate.getMonth() + 1); // 월
	 		      	var tempDay = new String(changeDate.getDate()); // 일
	 		      	if(tempMonth.length == 1){  // 월이 1자리수 이면 0붙이기 -> 0M 형태
	 		      	  tempMonth = "0" + tempMonth; 
	 		      	}
	 		      	if(tempDay.length == 1){ // 일이 1자리수 이면 0붙이기 -> 0d 형태
	 		      	  tempDay = "0" + tempDay; 
	 		      	}
	 		      	var minDate = changeDate.getFullYear()+"-"+tempMonth+"-"+tempDay; // 년-월-일 형태로 문자열 구성, yyyy-MM-dd 형태 
	 				//
	 				
	     			$calEndDate.prop("min",minDate);

     		}
     			
     	});
     	
     	// 일정 종료일 유효성 검사
     	$calEndDate.on("input",function(){
     		// 2_1) 일정 종료일이 지정안된 경우	
 			if($calEndDate.val() == "" || $calEndDate.val() == null) { 
     			// 종료시간, 일정마감일 제거
     			$calEndTime.val("");
    			$joinDate.val("");
     			
         		signUpCheck.calendarEndDate = false;
 			} else { // 2_2) 일정 종료일이 지정된 경우
         		signUpCheck.calendarEndDate = true;
 			}
     	});
     	
       	// 일정종료시간 유효성검사		
        $calEndTime.on("input",function(){
        	if($calEndTime.val() == "" || $calEndTime.val() == null) { 
        		signUpCheck.calendarEndTime = false;
        	} else {
        		signUpCheck.calendarEndTime = true;
        	}
        });
          
        // 일정참여제한인원 유효성검사
        $joinNumber.on("input",function(){ 
       		var tempCitizenCount = "<c:out value='${citizenCount}'/>";
           	var citizenCount = parseInt(tempCitizenCount); // 현재 골목 주민수
           	var joinVal = parseInt($joinNumber.val());
           	if($joinNumber.val() == "" || $joinNumber.val() == null) {
           		signUpCheck.calendarJoin = false;
           	} else if(citizenCount < joinVal){
           		alert("현재 골목 주민수 보다 많은 인원을 참여인원으로 지정할 수 없습니다.");      
           		$joinNumber.val("");
           		signUpCheck.calendarJoin = false;
           	} else {
           		signUpCheck.calendarJoin = true;
           	}
        });
        
        $("input[name=joinCalendar]").on("input",function(){
        	var noneJoinCheck = $("#notJoin").prop("checked");
        	if(noneJoinCheck) {
        		signUpCheck.calendarJoin = true;
        		signUpCheck.calendarJoinDate = true;
        	} else {
        		$joinNumber.val("");
        		$joinDate.val("");
        		signUpCheck.calendarJoin = false;
        		signUpCheck.calendarJoinDate = false;
        	}
        	
        });
        
        
        // 일정 참여 마감일 최소일 지정 : 오늘
        // 일정 참여 마감일 최대일 지정 : 일정 시작일
        $joinDate.on("focus",function() {
       		signUpCheck.calendarJoinDate = false;
       		var tempDate = new Date();
           	var minCalMonth = new String(tempDate.getMonth() + 1); // 월
            var minCalDay = new String(tempDate.getDate()); // 일
            if(minCalMonth.length == 1){  // 월이 1자리수 이면 0붙이기 -> 0M 형태
            	minCalMonth = "0" + minCalMonth; 
            }
            if(minCalDay.length == 1){ // 일이 1자리수 이면 0붙이기 -> 0d 형태
            	minCalDay = "0" + minCalDay; 
            }
            var minJoinDate = tempDate.getFullYear()+"-"+minCalMonth+"-"+minCalDay; // 년-월-일
            $joinDate.prop("min",minJoinDate);
            	
            // 일정 시작일이 지정되지 않은 경우
            if($calStartDate.val() == "" || $calStartDate.val() == null) {
            	alert("일정 시작일을 우선 지정하세요.");
            	$joinDate.blur();
            	var noneJoinCheck = $("#notJoin").prop("checked");
            	if(noneJoinCheck) {
            		$joinDate.val("");
            		signUpCheck.calendarJoinDate = true;
            		console.log("참가마감:" + signUpCheck.calendarJoinDate);
            	} else {
            		$joinDate.val("");
            		signUpCheck.calendarJoinDate = false;	
            		console.log("참가마감:" + signUpCheck.calendarJoinDate);
            	}
            }
            // 1)일정 시작일이 지정된 경우 -> 일정 시작일을 최대값으로 지정 
            else {
            	var maxJoinDate = $calStartDate.val();
        		$joinDate.prop("max",maxJoinDate);
        		var noneJoinCheck = $("#notJoin").prop("checked");
            	if(noneJoinCheck) {
            		signUpCheck.calendarJoinDate = true;
            		console.log("참가마감:" + signUpCheck.calendarJoinDate);
            	}
            }
        });
        
        // 참가 마감일 유효성 검사
        $joinDate.on("input",function() {
        	if($joinDate.val() == "" || $joinDate.val() == null) {
        		signUpCheck.calendarJoinDate = false;
    		} else { // 1_2) 일정 마감일이 지정된 경우
        		signUpCheck.calendarJoinDate = true;
    		}
        });
        
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
        // 주말에 색상적용
        $(".fc-day-top.fc-sat").css("color","#0000FF"); // 토
        $(".fc-day-top.fc-sun").css("color","#FF0000"); // 일
        
        ////////////////////////////////////////////// 정승환 코드 추가(20.03.31, 04.01)
        
        // 월 변경 버튼에 따른 아래 일정 출력 
        // nowMonth가 현재 달력에 출력되는 월
        
        // 현재 월을 지정함
        var d = new Date(); // 현재시간
        var nowMonth = d.getMonth() + 1 // 현재 월
        var nowYear = d.getFullYear(); // 현재 년도
        // 전월버튼 클릭시
        $(document).on("click",".fc-prev-button",function(){
        	
        	// 주말에 색상 지정
        	$(".fc-day-top.fc-sat").css("color","#0000FF"); // 토
            $(".fc-day-top.fc-sun").css("color","#FF0000"); // 일
        	
        	if(nowMonth == 1) { // 작년이므로 해당 년도에서 1감소
        		nowMonth = 13;
        		nowYear--;
        	}
        	nowMonth--; // 바로 전월값 반환
        	
        	// 현재 지정된 월에 해당하는 일정을 출력(이전 달)
        	$.ajax({
     			url : "${contextPath}/street/changeCalendar",
     			data : {nowMonth : nowMonth, nowYear : nowYear},
     			type : "post",
     			dataType : "json",
     			success : function(prevCalendar) {
     				
     				// 해당 일정이 존재하는 경우 -> null체크, length이용
     				if(prevCalendar.length > 0) { 
     					$("#rightHere").html("");
     					
     					// 해당하는 일정 수 만큼 일정 추가 
     					for(var i=0; i<prevCalendar.length; i++) {
     						var $liPlus = $("<li>").addClass("list-group-item");
         					var $divPlus = $("<div>").addClass("row");
         					var $divPlus1 = $("<div>").addClass("col-md-2");
         					var $divPlus2 = $("<div>").addClass("col-md-10");
         					
         					// 일,요일
         					var $hPlus1 = $("<h4>").addClass("nanum");
         					var $hPlus2 = $("<h6>").addClass("nanum");
         					$hPlus1.html(prevCalendar[i].calStartDay);
         					$hPlus2.html(prevCalendar[i].calStartDayOfWeek);
         					$divPlus1.append($hPlus1).append($hPlus2);
         					
         					// 일정 정보
							var $pPlus1 = $("<p>").addClass("nanum");
							var $pPlus2 = $("<p>").addClass("nanum");
							var $pPlus3 = $("<p>").addClass("nanum");
							$pPlus1.html(prevCalendar[i].calTitle);
							$pPlus2.html(prevCalendar[i].calStartHour);
							$pPlus3.html(prevCalendar[i].calLocation);
							$divPlus2.append($pPlus1).append($pPlus2).append($pPlus3);
							
							var $divPlus3 = $("<div>").addClass("row");
							var $labelPlus = $("<label>").addClass("col-sm-2 col-form-label text-center nanum")
								.css({"font-weight": "bold", "padding": "0px", "margin-left": "5px"}).html("참여 가능수");
         					$divPlus3.append($labelPlus);
         					
         					var $divPlus4 = $("<div>").addClass("col-sm-7");
         					if(prevCalendar[i].calendarJoin == 'N'.charAt(0)) {
         						var $inputPlus1 = $("<input>").addClass("form-control-plaintext nanum").prop({"type":"text","readonly":true})
         											.css("font-weight","bold").val("참여인원이 없는 일정입니다.");
         					} else {
         						var $inputPlus1 = $("<input>").addClass("form-control-plaintext nanum").prop({"type":"text","readonly":true})
													.css("font-weight","bold").val(prevCalendar[i].calJoinLimit);
         					}
         					$divPlus4.append($inputPlus1);
         					$divPlus3.append($divPlus4);
         					
         					//1. 로그인 회원이 골목대장인지 구분
         					var memberNo = "<c:out value='${loginMember.memberNo}'/>";
    						var streetMasterNo = "<c:out value='${streetMasterNo}'/>";
    						// 로그인 회원이 골목대장(골목 생성 회원)인 경우
    						if(memberNo == streetMasterNo) {
    							var calEndDate = prevCalendar[i].calEndDate;
    							var compareNowDate = "<c:out value='${compareNowDate}'/>";
    							
    							//2. 현재일보다 종료일이 미래인 경우 수정가능
    							if(calEndDate > compareNowDate) {
    								// 수정
        							var $divPlus5 = $("<div>").addClass("col-sm-1").css({"padding-left":"5px","padding-right":"5px"});
        							var $imgPlus1 = $("<img>").addClass("scheduleUpdate").css({"cursor":"pointer","width":"30px","height":"20px"})
        											.prop({"alt":"수정버튼","src":"${contextPath}/resources/img/streetChange.svg"});
        							var $inputPlus2 = $("<input>").prop("type","hidden").val(prevCalendar[i].boardNo);
        							var $pPlus4 = $("<p>").addClass("nanum").html("수정").css("margin-bottom","0px");
        							$divPlus5.append($imgPlus1).append($inputPlus2).append($pPlus4);
        							$divPlus3.append($divPlus5);
    							} else { // 수정이 불가능한 경우 여백만 추가할 것
    								var $divPlus5 = $("<div>").addClass("col-sm-1").css({"padding-left":"5px","padding-right":"5px"});
    								$divPlus3.append($divPlus5);
    							}
    							
    							// 삭제
    							var $divPlus6 = $("<div>").addClass("col-sm-1").css({"padding-left":"5px","padding-right":"5px"});
    							var $imgPlus2 = $("<img>").addClass("scheduleDelete").css({"cursor":"pointer","width":"30px","height":"20px"})
    											.prop({"alt":"삭제버튼","src":"${contextPath}/resources/img/iconmonstr-trash-can-1.svg"});
								var $inputPlus3 = $("<input>").prop("type","hidden").val(prevCalendar[i].boardNo);
								var $pPlus5 = $("<p>").addClass("nanum").html("삭제").css("margin-bottom","0px");
								$divPlus6.append($imgPlus2).append($inputPlus3).append($pPlus5);
								$divPlus3.append($divPlus6);
    						}
         					
    						$divPlus2.append($divPlus3);
    						
    						// 통합
    						$divPlus.append($divPlus1).append($divPlus2);
    						$liPlus.append($divPlus);
    						$("#rightHere").append($liPlus);
     					}
     					
     				}
     				// 해당 일정이 존재하지 않는 경우
     				else {
     					var $liPlus = $("<li>").addClass("list-group-item");
     					var $hPlus = $("<h4>").addClass("nanum").html("예정된 일정이 없습니다.");
     					$liPlus.append($hPlus);
     					$("#rightHere").html("");
     					$("#rightHere").append($liPlus);
     				}
     			},
     			error : function(e) {
     				console.log("ajax 통신 실패");
           			console.log(e);
     			}
     		});
        	
        });
        
     	// 익월버튼 클릭시 
        $(document).on("click",".fc-next-button",function(){
        	
        	// 주말에 색상 지정
        	$(".fc-day-top.fc-sat").css("color","#0000FF"); // 토
            $(".fc-day-top.fc-sun").css("color","#FF0000"); // 일
        	
        	if(nowMonth == 12) { // 다음해이므로 해당년도에서 1증가
        		nowMonth = 0;
        		nowYear++;
        	}
        	nowMonth++; // 바로 익월값 반환
        	
        	// 현재 지정된 월에 해당하는 일정을 출력(다음 달)
        	$.ajax({
     			url : "${contextPath}/street/changeCalendar",
     			data : {nowMonth : nowMonth, nowYear : nowYear},
     			type : "post",
     			dataType : "json",
     			success : function(nextCalendar) {
     				
     				// 해당 일정이 존재하는 경우 -> null체크, length이용
     				if(nextCalendar.length > 0) { 
     					$("#rightHere").html("");
     					
     					// 해당하는 일정 수 만큼 일정 추가 
     					for(var i=0; i<nextCalendar.length; i++) {
     						var $liPlus = $("<li>").addClass("list-group-item");
         					var $divPlus = $("<div>").addClass("row");
         					var $divPlus1 = $("<div>").addClass("col-md-2");
         					var $divPlus2 = $("<div>").addClass("col-md-10");
         					
         					// 일,요일
         					var $hPlus1 = $("<h4>").addClass("nanum");
         					var $hPlus2 = $("<h6>").addClass("nanum");
         					$hPlus1.html(nextCalendar[i].calStartDay);
         					$hPlus2.html(nextCalendar[i].calStartDayOfWeek);
         					$divPlus1.append($hPlus1).append($hPlus2);
         					
         					// 일정 정보
							var $pPlus1 = $("<p>").addClass("nanum");
							var $pPlus2 = $("<p>").addClass("nanum");
							var $pPlus3 = $("<p>").addClass("nanum");
							$pPlus1.html(nextCalendar[i].calTitle);
							$pPlus2.html(nextCalendar[i].calStartHour);
							$pPlus3.html(nextCalendar[i].calLocation);
							$divPlus2.append($pPlus1).append($pPlus2).append($pPlus3);
							
							var $divPlus3 = $("<div>").addClass("row");
							var $labelPlus = $("<label>").addClass("col-sm-2 col-form-label text-center nanum")
								.css({"font-weight": "bold", "padding": "0px", "margin-left": "5px"}).html("참여 가능수");
         					$divPlus3.append($labelPlus);
         					
         					var $divPlus4 = $("<div>").addClass("col-sm-7");
         					if(nextCalendar[i].calendarJoin == 'N'.charAt(0)) {
         						var $inputPlus1 = $("<input>").addClass("form-control-plaintext nanum").prop({"type":"text","readonly":true})
         											.css("font-weight","bold").val("참여인원이 없는 일정입니다.");
         					} else {
         						var $inputPlus1 = $("<input>").addClass("form-control-plaintext nanum").prop({"type":"text","readonly":true})
													.css("font-weight","bold").val(nextCalendar[i].calJoinLimit);
         					}
         					$divPlus4.append($inputPlus1);
         					$divPlus3.append($divPlus4);
         					
         					//1. 로그인 회원이 골목대장인지 구분
         					var memberNo = "<c:out value='${loginMember.memberNo}'/>";
    						var streetMasterNo = "<c:out value='${streetMasterNo}'/>";
    						// 로그인 회원이 골목대장(골목 생성 회원)인 경우
    						if(memberNo == streetMasterNo) {
    							var calEndDate = nextCalendar[i].calEndDate;
    							var compareNowDate = "<c:out value='${compareNowDate}'/>";
    							
    							//2. 현재일보다 종료일이 미래인 경우 수정가능
    							if(calEndDate > compareNowDate) {
    								// 수정
        							var $divPlus5 = $("<div>").addClass("col-sm-1").css({"padding-left":"5px","padding-right":"5px"});
        							var $imgPlus1 = $("<img>").addClass("scheduleUpdate").css({"cursor":"pointer","width":"30px","height":"20px"})
        											.prop({"alt":"수정버튼","src":"${contextPath}/resources/img/streetChange.svg"});
        							var $inputPlus2 = $("<input>").prop("type","hidden").val(nextCalendar[i].boardNo);
        							var $pPlus4 = $("<p>").addClass("nanum").html("수정").css("margin-bottom","0px");
        							$divPlus5.append($imgPlus1).append($inputPlus2).append($pPlus4);
        							$divPlus3.append($divPlus5);
    							} else { // 수정이 불가능한 경우 여백만 추가할 것
    								var $divPlus5 = $("<div>").addClass("col-sm-1").css({"padding-left":"5px","padding-right":"5px"});
    								$divPlus3.append($divPlus5);
    							}
    							
    							// 삭제
    							var $divPlus6 = $("<div>").addClass("col-sm-1").css({"padding-left":"5px","padding-right":"5px"});
    							var $imgPlus2 = $("<img>").addClass("scheduleDelete").css({"cursor":"pointer","width":"30px","height":"20px"})
    											.prop({"alt":"삭제버튼","src":"${contextPath}/resources/img/iconmonstr-trash-can-1.svg"});
								var $inputPlus3 = $("<input>").prop("type","hidden").val(nextCalendar[i].boardNo);
								var $pPlus5 = $("<p>").addClass("nanum").html("삭제").css("margin-bottom","0px");
								$divPlus6.append($imgPlus2).append($inputPlus3).append($pPlus5);
								$divPlus3.append($divPlus6);
    						}
         					
    						$divPlus2.append($divPlus3);
    						
    						// 통합
    						$divPlus.append($divPlus1).append($divPlus2);
    						$liPlus.append($divPlus);
    						$("#rightHere").append($liPlus);
     					}
     					
     				}
     				// 해당 일정이 존재하지 않는 경우
     				else {
     					var $liPlus = $("<li>").addClass("list-group-item");
     					var $hPlus = $("<h4>").addClass("nanum").html("예정된 일정이 없습니다.");
     					$liPlus.append($hPlus);
     					$("#rightHere").html("");
     					$("#rightHere").append($liPlus);
     				}
     				
     				
     			},
     			error : function(e) {
     				console.log("ajax 통신 실패");
           			console.log(e);
     			}
     		});
        	
        });
     	
     	// today버튼 클릭시
    	$(".fc-today-button").click(function() {
    		
    		// 주말에 색상 지정
        	$(".fc-day-top.fc-sat").css("color","#0000FF"); // 토
            $(".fc-day-top.fc-sun").css("color","#FF0000"); // 일
    		
    		nowMonth = d.getMonth() + 1; // 현재 월 가져오기
    		nowYear = d.getFullYear(); // 현재 년도 가져오기
			
    		// 현재 지정된 월에 해당하는 일정을 출력(지금 현재 달)
        	$.ajax({
     			url : "${contextPath}/street/changeCalendar",
     			data : {nowMonth : nowMonth, nowYear : nowYear},
     			type : "post",
     			dataType : "json",
     			success : function(todayCalendar) {
     				
     				// 해당 일정이 존재하는 경우 -> null체크, length이용
     				if(todayCalendar.length > 0) {
     					$("#rightHere").html("");
     					
     					// 해당하는 일정 수 만큼 일정 추가 
     					for(var i=0; i<todayCalendar.length; i++) {
     						var $liPlus = $("<li>").addClass("list-group-item");
         					var $divPlus = $("<div>").addClass("row");
         					var $divPlus1 = $("<div>").addClass("col-md-2");
         					var $divPlus2 = $("<div>").addClass("col-md-10");
         					
         					// 일,요일
         					var $hPlus1 = $("<h4>").addClass("nanum");
         					var $hPlus2 = $("<h6>").addClass("nanum");
         					$hPlus1.html(todayCalendar[i].calStartDay);
         					$hPlus2.html(todayCalendar[i].calStartDayOfWeek);
         					$divPlus1.append($hPlus1).append($hPlus2);
         					
         					// 일정 정보
							var $pPlus1 = $("<p>").addClass("nanum");
							var $pPlus2 = $("<p>").addClass("nanum");
							var $pPlus3 = $("<p>").addClass("nanum");
							$pPlus1.html(todayCalendar[i].calTitle);
							$pPlus2.html(todayCalendar[i].calStartHour);
							$pPlus3.html(todayCalendar[i].calLocation);
							$divPlus2.append($pPlus1).append($pPlus2).append($pPlus3);
							
							var $divPlus3 = $("<div>").addClass("row");
							var $labelPlus = $("<label>").addClass("col-sm-2 col-form-label text-center nanum")
								.css({"font-weight": "bold", "padding": "0px", "margin-left": "5px"}).html("참여 가능수");
         					$divPlus3.append($labelPlus);
         					
         					var $divPlus4 = $("<div>").addClass("col-sm-7");
         					if(todayCalendar[i].calendarJoin == 'N'.charAt(0)) {
         						var $inputPlus1 = $("<input>").addClass("form-control-plaintext nanum").prop({"type":"text","readonly":true})
         											.css("font-weight","bold").val("참여인원이 없는 일정입니다.");
         					} else {
         						var $inputPlus1 = $("<input>").addClass("form-control-plaintext nanum").prop({"type":"text","readonly":true})
													.css("font-weight","bold").val(todayCalendar[i].calJoinLimit);
         					}
         					$divPlus4.append($inputPlus1);
         					$divPlus3.append($divPlus4);
         					
         					//1. 로그인 회원이 골목대장인지 구분
         					var memberNo = "<c:out value='${loginMember.memberNo}'/>";
    						var streetMasterNo = "<c:out value='${streetMasterNo}'/>";
    						// 로그인 회원이 골목대장(골목 생성 회원)인 경우
    						if(memberNo == streetMasterNo) {
    							var calEndDate = todayCalendar[i].calEndDate;
    							var compareNowDate = "<c:out value='${compareNowDate}'/>";
    							
    							//2. 현재일보다 종료일이 미래인 경우 수정가능
    							if(calEndDate > compareNowDate) {
    								// 수정
        							var $divPlus5 = $("<div>").addClass("col-sm-1").css({"padding-left":"5px","padding-right":"5px"});
        							var $imgPlus1 = $("<img>").addClass("scheduleUpdate").css({"cursor":"pointer","width":"30px","height":"20px"})
        											.prop({"alt":"수정버튼","src":"${contextPath}/resources/img/streetChange.svg"});
        							var $inputPlus2 = $("<input>").prop("type","hidden").val(todayCalendar[i].boardNo);
        							var $pPlus4 = $("<p>").addClass("nanum").html("수정").css("margin-bottom","0px");
        							$divPlus5.append($imgPlus1).append($inputPlus2).append($pPlus4);
        							$divPlus3.append($divPlus5);
    							} else { // 수정이 불가능한 경우 여백만 추가할 것
    								var $divPlus5 = $("<div>").addClass("col-sm-1").css({"padding-left":"5px","padding-right":"5px"});
    								$divPlus3.append($divPlus5);
    							}
    							
    							// 삭제
    							var $divPlus6 = $("<div>").addClass("col-sm-1").css({"padding-left":"5px","padding-right":"5px"});
    							var $imgPlus2 = $("<img>").addClass("scheduleDelete").css({"cursor":"pointer","width":"30px","height":"20px"})
    											.prop({"alt":"삭제버튼","src":"${contextPath}/resources/img/iconmonstr-trash-can-1.svg"});
								var $inputPlus3 = $("<input>").prop("type","hidden").val(todayCalendar[i].boardNo);
								var $pPlus5 = $("<p>").addClass("nanum").html("삭제").css("margin-bottom","0px");
								$divPlus6.append($imgPlus2).append($inputPlus3).append($pPlus5);
								$divPlus3.append($divPlus6);
    						}
         					
    						$divPlus2.append($divPlus3);
    						
    						// 통합
    						$divPlus.append($divPlus1).append($divPlus2);
    						$liPlus.append($divPlus);
    						$("#rightHere").append($liPlus);
     					}
     					
     				}
     				// 해당 일정이 존재하지 않는 경우
     				else {
     					var $liPlus = $("<li>").addClass("list-group-item");
     					var $hPlus = $("<h4>").addClass("nanum").html("예정된 일정이 없습니다.");
     					$liPlus.append($hPlus);
     					$("#rightHere").html("");
     					$("#rightHere").append($liPlus);
     				}
     				
     			},
     			error : function(e) {
     				console.log("ajax 통신 실패");
           			console.log(e);
     			}
     		});
            
        });
        
		//////////////////////////////////////////////정승환 코드 추가(20.03.31, 04.01)
		
     	// 일정 수정 버튼 클릭시 일정 수정
     	$(document).on("click",".scheduleUpdate",function(){
     		var updateBoardNo = $(this).next().val();
     		$.ajax({
     			url : "${contextPath}/street/updateModalInfo",
     			data : {boardNo : updateBoardNo },
     			type : "post",
     			dataType : "json",
     			success : function(mInfo) {
     				var $updateCalendarTitle = $("#updateCalendarTitle");
     				var $updateCalendarContent = $("#updateCalendarContent");
     				var $updateCalendarLocation = $("#updateCalendarLocation");
     				var $updateCalendarBoardNo = $("#updateCalendarBoardNo");
     				
     				// DB에 저장된 일정제목 지정
     				$updateCalendarTitle.val(mInfo.calendarTitle);
     				// DB에 저장된 일정내용 지정
     				$updateCalendarContent.val(mInfo.calendarContent);
     				// DB에 저장된 일정장소 지정
     				$updateCalendarLocation.val(mInfo.calendarLocation);
     				// 현재 게시글 번호 지정
     				$updateCalendarBoardNo.val(mInfo.boardNo);
     			},
     			error : function(e) {
     				console.log("ajax 통신 실패");
           			console.log(e);
     			}
     		});
     		
     		$('#updateCalendarModal').modal(); // 값이 세팅되어 모달창 출력

     	});
     	
     	// 일정 삭제 버튼 클릭시 일정 삭제
     	$(document).on("click",".scheduleDelete",function(){
     		var result = confirm("정말로 일정을 삭제하시겠습니까?");
     		var deleteBoardNo = $(this).next().val();
     		if(result) {
     			location.href="${contextPath}/street/deleteSchedule?boardNo=" + deleteBoardNo;	
     		}
     	});
     	
     	
      });
      
    /* ---------------정승환 추가코드 (20.03.30)-----------------------*/
    // 카카오 지도 검색시 해당하는 화면 출력
    $("#updateSearchLocationBtn").on("click",function(){
    	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(); 
		
		// 검색할 장소 키워드
		var searchVal = $("#updateSearchLocation").val();
		
		// 키워드로 장소를 검색합니다
		ps.keywordSearch(searchVal, placesSearchCB); 
		
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();
		
		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       
		
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}
		
		// 카카오 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
		    
		    // 마커를 생성하고 지도에 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: new kakao.maps.LatLng(place.y, place.x) 
		    });
		    
		    var $insertLocation = $("#updateCalendarLocation");
		
		    // 마커에 클릭이벤트를 등록합니다
		    kakao.maps.event.addListener(marker, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		        infowindow.open(map, marker);
		        console.log(place.place_name);
		        $insertLocation.val(place.place_name);
		    });
		}
    });
    
    // 카카오 지도 초기 화면(modal에 띄우기 위해서 기본 설정)
    $("#updateCalendarModal").on('shown.bs.modal', function (e) { 
    	var container = document.getElementById('map');
        var options = {
          center: new kakao.maps.LatLng(33.450701, 126.570667),
          level: 3
        };

        var map = new kakao.maps.Map(container, options);
  	});
    /* ---------------정승환 추가코드 (20.03.30)-----------------------*/
	
	// 일정 수정 submit 동작
	function updateValidate(){
		
		for(var key in updateCheck){
			if(!updateCheck[key]){
				alert("일부 입력값이 잘못되었습니다.");
				var id = "#"+key;
				$(id).focus();
				return false;
			}
		}

	}
	
	// 일정 추가 submit 동작
	function validate(){
		
		var noneJoinCheck = $("#notJoin").prop("checked");
		var joinCheck = $("#join").prop("checked");
		if (!noneJoinCheck && !joinCheck) {
			alert("일정의 참석여부를 결정하십시요");
			return false;
		}
		
		for(var key in signUpCheck){
			if(!signUpCheck[key]){
				alert("일부 입력값이 잘못되었습니다.");
				var id = "#"+key;
				$(id).focus();
				return false;
			}
		}

	}
	
	</script>


</body>
</html>