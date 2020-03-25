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

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
          plugins: [ 'dayGrid','interaction' ],
          //locale : "ko", //한글설정,단 nanum설정 안됨
          dateClick: function (info) {
          //alert('Clicked on: ' + info.dateStr); // 날짜 관련 데이터,년-월-일
          $("#startDate").val(info.dateStr);
          $("#endDate").val(info.dateStr);
          
          $('#calendarModal').modal();
          },
          events: [
        	  {id: 1,title: '새해',start: '2020-01-01',end: '2020-01-01'},
              {id: 2,title: '설날',start: '2020-01-24',end: '2020-01-27'},
              {id: 3,title: '삼일절',start: '2020-03-01',end: '2020-03-01'},
              {id: 4,title: '부처님오신날',start: '2020-04-30',end: '2020-04-30'},
              {id: 5,title: '어린이날',start: '2020-05-05',end: '2020-05-05'},
              {id: 6,title: '현충일',start: '2020-06-06',end: '2020-06-06'},
              {id: 7,title: '광복절',start: '2020-08-15',end: '2020-08-15'},
              {id: 8,title: '추석',start: '2020-09-30',end: '2020-10-03'},
              {id: 9,title: '개천절',start: '2020-10-03',end: '2020-10-03'},
              {id: 10,title: '한글날',start: '2020-10-09',end: '2020-10-09'},
              {id: 11,title: '성탄절',start: '2020-12-25',end: '2020-12-25'}
          ]
                      
        });
        
        //for(var i=0;i<"${setCalList}")
        calendar.addEvent({'title':'evt4', 'start':'2020-03-24', 'end':'2020-03-25'});
        

        calendar.render();

      });
    </script>
    <!-- 캘린더 추가 끝 -->
    <style>
    	
    </style>
</head>
<body style="background-color : rgb(221, 233, 218);">
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
                                  <input type="text" class="form-control nanum" name="calendarTitle" placeholder="일정 제목 입력">
                                </div>
                              </div>
                              <div class="form-group row">
                                <div class="col-md-12">
                                  <textarea rows="2" cols="65" style="resize: none;" name="calendarContent" class="form-control nanum" placeholder="일정 설명 입력"></textarea>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;">위치</label>
                                <div class="col-sm-10" style="border: 1px solid black;">
                                  <!-- 지도 추가 -->
                                  <div id="map" style="width:350px;height:200px;"></div>
                                  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a32d3d818847c093a324db2e8ffc840"></script>
                                  <!-- 지도 추가 -->
                                </div>
                              </div>
                              <div class="form-group row">
                                <div class="col-md-2"></div>
                                <div class="col-md-10">
                                  <input type="text" class="form-control nanum" name="calendarLocation" placeholder="지정된 모임 장소">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;">시작</label>
                                <div class="col-sm-5"><input type="date" class="form-control" name="startDate" id="startDate"></div>
                                <div class="col-sm-5"><input type="time" class="form-control" name="startTime" id="startTime"></div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;">종료</label>
                                <div class="col-sm-5"><input type="date" class="form-control" name="endDate" id="endDate"></div>
                                <div class="col-sm-5"><input type="time" class="form-control" name="endTime" id="endTime"></div>
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
                              <div class="form-group row">
                                <div class="custom-control custom-checkbox">
                                  <input type="checkbox" class="custom-control-input" id="customCheck123" checked="" value="Y" name="openBoard">
                                  <label class="custom-control-label nanum" for="customCheck123">게시글 공유</label>
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
                      <!-- 모달창 끝 -->
                    </div>
                  </div>
                  <br>

                  <div class="row">
                    <div class="col-md-12">
                      <ul class="list-group list-group-flush">
                      
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
		                                <label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold;">참여인원</label>
		                                <c:if test="${calendar.calendarJoin == 'N'.charAt(0)}">
		                                	<div class="col-sm-8"><input type="text" readonly class="form-control-plaintext nanum" value="참여인원이 없는 일정입니다." style="font-weight: bold;"></div>
		                                </c:if>
		                                <c:if test="${calendar.calendarJoin == 'Y'.charAt(0)}">
		                                	<div class="col-sm-8"><input type="text" readonly class="form-control-plaintext nanum" value="${calendar.calJoinLimit}" style="font-weight: bold;"></div>
		                                </c:if>
	                                	<div class="col-sm-1" style="padding-left:5px;padding-right:5px">
	                                		<img alt="수정버튼" class="scheduleUpdate" src="${contextPath}/resources/img/streetChange.svg" style="cursor:pointer;width: 20px; height: 20px;">
	                                		수정
	                                		<input type="hidden" value="${calendar.boardNo}">
	                                	</div>
	                                	<div class="col-sm-1" style="padding-left:5px;padding-right:5px">
	                                		<img alt="삭제버튼" class="scheduleDelete" src="${contextPath}/resources/img/iconmonstr-trash-can-1.svg" style="cursor:pointer;width: 20px; height: 20px;">
	                                		삭제
	                                		<input type="hidden" value="${calendar.boardNo}">
	                                	</div>
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
			
			
		</div>
	</div>
	<!-- 컨텐츠영역 종료 -->

	<script>

	$(function(){
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
        
        // 주말에 색상적용
        $(".fc-day-top.fc-sat").css("color","#0000FF"); // 토
        $(".fc-day-top.fc-sun").css("color","#FF0000"); // 일
        
     	// 전월버튼 클릭시 주말에 색상적용
    	$(".fc-prev-button").click(function() {
    		$(".fc-day-top.fc-sat").css("color","#0000FF"); // 토
            $(".fc-day-top.fc-sun").css("color","#FF0000"); // 일
        });
        // 익월버튼 클릭시 주말에 색상적용
    	$(".fc-next-button").click(function() {
    		$(".fc-day-top.fc-sat").css("color","#0000FF"); // 토
            $(".fc-day-top.fc-sun").css("color","#FF0000"); // 일
        });
		
     	// 일정 수정 버튼 클릭시 일정 수정
     	$(".scheduleUpdate").on("click",function(){
     		var updateBoardNo = $(this).next().val();
     		var result = confirm("정말로 일정을 수정하시겠습니까?");
     		if(result) {
     			location.href="${contextPath}/street/updateSchedule?boardNo=" + updateBoardNo;	
     		}
     	});
     	
     	// 일정 삭제 버튼 클릭시 일정 삭제
     	$(".scheduleDelete").on("click",function(){
     		var result = confirm("정말로 일정을 삭제하시겠습니까?");
     		var deleteBoardNo = $(this).next().val();
     		if(result) {
     			location.href="${contextPath}/street/deleteSchedule?boardNo=" + deleteBoardNo;	
     		}
     	});
      });
	
	$("#calendarModal").on('shown.bs.modal', function (e) { 
		var container = document.getElementById('map');
        var options = {
          center: new kakao.maps.LatLng(33.450701, 126.570667),
          level: 3
        };

        var map = new kakao.maps.Map(container, options);
	});
	
	
	</script>


</body>
</html>