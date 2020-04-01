<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

  <!-- calendarJoin Modal -->
  <div class="modal fade" id="calendarJoinModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="calendarJoinModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" style="width:496px;">
      <div class="modal-content">

        <div class="modal-header">
          <h3 class="modal-title nanum" id="staticBackdropLabel">일정 참가</h3>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
		
        <div class="modal-body">
            <div class="card mb-3">
              <div class="card-header">
                  <div class="row">
                      <div class="col-md-2"> 
                      	  <!-- 일 -->
                          <h4 class="nanum" style="padding-top: 10px;" id="joinCalDay"></h4> <!-- 추가코드 -->
                          <!-- 요일 -->
                          <h6 class="nanum" id="joinCalDayOfWeek"></h6> <!-- 추가코드 -->
                      </div>
                      <div class="col-md-10"> 
                     	  <input type="text" class="form-control-plaintext nanum" id="joinCalTitle" readonly style="font-weight: bold; font-size: 16px;"> <!-- 추가코드 -->
                          <input type="text" class="form-control-plaintext nanum" id="joinCalDate"  readonly style="font-weight: bold;"> <!-- 추가코드 -->
                          <input type="hidden" id="thisJoinBoardNo">
                      </div>
                  </div>
                  
              </div>
              <div class="card-body">
             	  <!-- 추가코드 시작(20.03.26) -->
	              <div class="row">
                      <label class="col-sm-4 col-form-label nanum" style="font-weight: bold;font-size: 20px;">참가 마감일</label><!--정승환 코드 변경(20.04.01) -->
                      <div class="col-sm-8"> 
                      	<input type="text" class="form-control-plaintext nanum" id="joinCalLimitDate" readonly style="font-weight:bolder;font-size:17px;">	    
                      </div>
	              </div>
	              <!-- 추가코드 끝(20.03.26)-->
                  <div class="row">
                      <label class="col-sm-4 col-form-label nanum" style="font-weight: bold;font-size: 20px;">현재 참석인원</label>
                      <input type="hidden" id="indexCheckInput">
                      <div class="col-sm-8" id="nachoGood" style="padding-top : 8px; overflow: auto; max-height: 150px;"> <!-- 추가코드 -->
                          <!-- 참가인원 목록 영역 -->
                      </div>
                  </div>
                  <br>
                  <div class="row">
                    <div class="col-md-12" id="joinButtonArea">
					<!-- 버튼영역 -->
                    </div>
                  </div>
              </div>
            </div>
        </div>

      </div>
    </div>
  </div>
  <!-- end -->
  
  <script>
  	
  	// 참가신청 버튼 클릭시 참가
  	$(document).on("click",".inJoinSchedule",function(){
  		var boardNo = $("#thisJoinBoardNo").val(); // 현재 게시글 번호
  		var inCalJoinLimit = new Array(); // 현재 모든 일정의 참여제한 인원수를 저장한 배열
  		var joinIndex = $("#indexCheckInput").val(); // 현재 참여할려는 일정 게시글을 지정할 인덱스,참가신청 모달출력시 세팅됨
  		<c:forEach var="calendar" items="${allCalList}">
  			inCalJoinLimit.push("${calendar.calJoinLimit}")
  		</c:forEach>
  		location.href="${contextPath}/street/insertCalendarMember?boardNo=" + boardNo + "&inCalJoinLimit=" + inCalJoinLimit[joinIndex];
  	});
  	
	// 참가탈퇴 버튼 클릭시 탈퇴
  	$(document).on("click",".outJoinSchedule",function(){
  		var boardNo = $("#thisJoinBoardNo").val(); // 현재 게시글 번호
  		location.href="${contextPath}/street/deleteCalendarMember?boardNo=" + boardNo;
  	});
  	
 	// 정승환 추가 코드(20.03.25 ,26) 
	$(document).on("click",".joinBtn",function(){
		var joinBoardNo = $(this).next().val();
		
		$("#thisJoinBoardNo").val(joinBoardNo);
		
		var calBoardNo = new Array(); // 일정 게시글 번호
		var calJoinDay = new Array(); // 몇일
		var calJoinDayOfWeek = new Array(); // 요일
		var calJoinTitle = new Array(); // 일정제목
		var calJoinDate = new Array(); // 일정 시작 날짜 , 년-월-일
		var calJoinHour = new Array(); // 오전오후 시:분
		var cJoinLimit = new Array(); // 일정의 참여 제한수
		var calendarLimitDates = new Array(); // 일정의 참여 제한 날짜,  년-월-일
		<c:forEach var="calendar" items="${allCalList}">
			calBoardNo.push("${calendar.boardNo}");
			calJoinDay.push("${calendar.calStartDay}");
			calJoinDayOfWeek.push("${calendar.calStartDayOfWeek}");
			calJoinTitle.push("${calendar.calTitle}");
			calJoinDate.push("${calendar.calStartDate}");
			calJoinHour.push("${calendar.calStartHour}");
			cJoinLimit.push("${calendar.calJoinLimit}");
			calendarLimitDates.push("${calendar.calJoinEndDate}");
		</c:forEach>
		
		var indexCheck; // 지정된 게시글번호에 해당하는 인덱스 저장 -> 이것을 이용하여 값들이 일정정보가 저장된 배열에서 값을 가져옴
		$.each(calJoinDayOfWeek,function(index,item){
			if(calBoardNo[index] == joinBoardNo) { // 현재 선택된 게시글번호에 해당하는 인덱스를 얻는다.
				indexCheck = index;
			}
		});
		
		$("#indexCheckInput").val(indexCheck); // 현재 게시글에 해당하는 인덱스 저장 -> 일정 리스트에서 현재 게시글에 해당하는 일정 객체위치를 지정할수있다
		
		// 일정 정보 세팅
		$("#joinCalDay").html(calJoinDay[indexCheck]); // 일
		$("#joinCalDayOfWeek").html(calJoinDayOfWeek[indexCheck]); // 요일
		$("#joinCalTitle").val(calJoinTitle[indexCheck]); // 일정제목
		var totalDate = calJoinDate[indexCheck] + " " + calJoinHour[indexCheck];
		$("#joinCalDate").val(totalDate); // 년-월-일 오전,오후 시:분
		
		$("#joinCalLimitDate").val(calendarLimitDates[indexCheck]); // 일정 마감일 지정 년-월-일
		
		
		// 참가신청 모달창 출력시 모달창 구성
		$.ajax({
			url : "${contextPath}/street/selectJoinModal",
			data : {boardNo : joinBoardNo},
			type : "post",
   			dataType : "json",
   			success : function(joinModalInfo){
   				// 현재 로그인한 회원번호 
				var tempV = "<c:out value='${loginMember.memberNo}'/>";
				
				// 기존에 모달창에 추가된 이전 일정 참여인원 목록 제거
				$("#nachoGood").html("");
				// 기존 모달창에 추가된 이전 일정 참여버튼 제거
				$("#joinButtonArea").html("");
				
   				// 1. 일정 참여인원 목록 정보
   				var count = 0;
   				if( (joinModalInfo.sendJoinMemberList).length == 0 ) {
   					var $hPlus = $("<h4 class='nanum'>").html("참여한 인원이 없습니다.");
   					$("#nachoGood").append($hPlus);
   				} else {
   					for(var i=0;i<(joinModalInfo.sendJoinMemberList).length;i++){
   						if((joinModalInfo.sendJoinMemberList[i]).memberNo == tempV) {
   							count++;
   						}
   	   					var $divPlus = $("<div class='row'>");
   	   	   				var $divPlus1 = $("<div class='col-md-9'>");
   	   	   				var $divPlus2 = $("<div class='col-md-9' style='background-color: black;height: 2px;'>");
   	   	   				var $inputPlus = $("<input class='form-control-plaintext nanum'>").prop({"type":"text","readonly":true})
   	   	   								.css({"font-weight":"bolder","font-size":"17px"}).val((joinModalInfo.sendJoinMemberList[i]).memberNickname);
   	   	   				var $inputPlus1 = $("<input>").prop("type","hidden").val((joinModalInfo.sendJoinMemberList[i]).memberNo);
   	   	   				
   	   	   				$divPlus1.append($inputPlus).append($inputPlus1);
   	   	   				$("#nachoGood").append($divPlus1).append($divPlus2);
   	   				}
   				}
   				
   				// 현재시간을 date형태로 저장
   				var d = new Date();
        		var nowDate = d.getFullYear()+"-"+(d.getMonth() + 1)+"-"+d.getDate(); // 년-월-일 형태로 문자열 구성
        		var tempNowDate = Date.parse(nowDate); // 현재 시간을 date형태로 변환
   				// 참여 마감시간을 date형태로 저장
   				var tempJoinLimitDate = Date.parse(calendarLimitDates[indexCheck]);
   				
        		if(tempNowDate < tempJoinLimitDate) { // 아직 참가 마감시간이 남아있음
        			
        			if(count > 0) { // 현재 일정에 참여한 경우
       					var $buttonPlus = $("<button class='btn btn-warning btn-block nanum outJoinSchedule'>").prop("type","button")
       										.css({"font-size":"20px","font-weight":"bolder"}).html("참 가 탈 퇴");
       					$("#joinButtonArea").append($buttonPlus);
       				} else { // 현재 일정에 참여하지 않은 경우
       					if(joinModalInfo.nowJoinMemberCount < cJoinLimit[indexCheck] ) { // 현재 참가인원이 제한 인원보다 작은 경우
       						var $buttonPlus = $("<button class='btn btn-success btn-block nanum inJoinSchedule'>").prop("type","button")
    							.css({"font-size":"20px","font-weight":"bolder"}).html("참 가 신 청");
    						$("#joinButtonArea").append($buttonPlus);	
       					} else { // 현재 참가인원이 제한 인원과 같거나 큰 경우
       						var $buttonPlus = $("<button class='btn btn-secondary btn-block nanum'>").prop({"type":"button","disabled":true})
    						.css({"font-size":"20px","font-weight":"bolder"}).html("참 가 인 원 만 원");
    						$("#joinButtonArea").append($buttonPlus);	
       					}
       					
       				}
        		
        		} else { // 지금 참가 마감시간 지남
        			var $buttonPlus = $("<button class='btn btn-secondary btn-block nanum'>").prop({"type":"button","disabled":true})
					.css({"font-size":"20px","font-weight":"bolder"}).html("참 가 시 간 만 료");
					$("#joinButtonArea").append($buttonPlus);
        		}
   				
   					
   			},
   			error : function(e){
       			console.log("참가모달창 ajax 통신 실패");
       			console.log(e);
       		}
		});
		
	});
  </script>
  
</body>
</html>