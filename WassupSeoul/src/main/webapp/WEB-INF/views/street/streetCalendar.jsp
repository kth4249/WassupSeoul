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
            {
            id: 1,
            title: 'Test1',
            start: '2020-03-20',
            end: '2020-03-24'
            },
            {
            id: 2,
            title: 'Test2',
            start: '2020-02-21',
            end: '2020-02-23'
            }
          ]
                      
        });
		
        calendar.render();

      });
    </script>
    <!-- 캘린더 추가 끝 -->
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
                              <!-- <div class="form-group row">
                                <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;">미리알림</label>
                                <div class="col-sm-7">
                                  <select class="form-control">
                                    <option>알림 없음</option>
                                    <option>10분 전</option>
                                    <option>30분 전</option>
                                    <option>1시간 전</option>
                                    <option>1시간30분 전</option>
                                    <option>2시간 전</option>
                                  </select>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;">반복등록</label>
                                <div class="col-sm-7">
                                  <select class="form-control">
                                    <option>반복 없음</option>
                                    <option>매일</option>
                                    <option>매주</option>
                                    <option>2주 마다</option>
                                    <option>매달 1일</option>
                                  </select>
                                </div>
                              </div> -->
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
                        <li class="list-group-item">
                          <div class="row">
                            <div class="col-md-2">
                              <h4 class="nanum">3일</h4>
                              <h6 class="nanum">월요일</h6>
                            </div>
                            <div class="col-md-10">
                              <p class="nanum">오프라인 모임명</p>
                              <p class="nanum">오후 1:00</p>
                              <p class="nanum">오프라인 모임에서 지정된 모임장소</p>
                              <div class="row">
                                <label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold;">참여인원</label>
                                <div class="col-sm-10"><input type="text" readonly class="form-control-plaintext" value="10" style="font-weight: bold;"></div>
                              </div>
                            </div>
                          </div>
                        </li>
                        <li class="list-group-item">
                          <div class="row">
                            <div class="col-md-2">
                              <h4 class="nanum">6일</h4>
                              <h6 class="nanum">목요일</h6>
                            </div>
                            <div class="col-md-10">
                              <p class="nanum">오프라인 모임명</p>
                              <p class="nanum">오전 9:00</p>
                              <p class="nanum">오프라인 모임에서 지정된 모임장소</p>
                              <div class="row">
                                <label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold;">참여인원</label>
                                <div class="col-sm-10"><input type="text" readonly class="form-control-plaintext" value="50" style="font-weight: bold;"></div>
                              </div>
                            </div>
                          </div>
                        </li>
                        <li class="list-group-item">
                          <div class="row">
                            <div class="col-md-2">
                              <h4 class="nanum">13일</h4>
                              <h6 class="nanum">목요일</h6>
                            </div>
                            <div class="col-md-10">
                              <p class="nanum">오프라인 모임명</p>
                              <p class="nanum">오전 11:00</p>
                              <p class="nanum">오프라인 모임에서 지정된 모임장소</p>
                              <div class="row">
                                <label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold;">참여인원</label>
                                <div class="col-sm-10"><input type="text" readonly class="form-control-plaintext" value="25" style="font-weight: bold;"></div>
                              </div>
                            </div>
                          </div>           
                        </li>
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
	// 추가코드(20.03.24)
	function convertDate(date) {
        var date = new Date(date);
        alert(date.yyyymmdd());
    }
	
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
        
        
     	// 추가코드(20.03.24)
     	// 왼쪽 버튼을 클릭하였을 경우
        $("button.fc-prev-button").click(function() {
            var date = $("#calendar").fullCalendar("getDate");
            convertDate(date);
        });

        // 오른쪽 버튼을 클릭하였을 경우
        $("button.fc-next-button").click(function() {
            var date = $("#calendar").fullCalendar("getDate");
            convertDate(date);
        });
        
      });
	
	// 추가코드(20.03.23)
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