<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
<link rel="stylesheet" href="${contextPath}/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/css/common.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
<!-- cdn방식으로 sockjs불러오기 -->
<script src="http://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<title>header</title>
<style>
.profileBox{
  width: 100%;
  height: 160px; 
  border-radius: 70%;
  overflow: hidden;
}
.profileImage{
width: 100%;
height: 100%;
object-fit: cover;
}
</style>
</head>
<body class="nanum">
	
	<c:if test="${!empty msg}">
		<script>alert("${msg}")</script>
		<c:remove var="msg"/>
	</c:if>
	
	<c:url var="detailUrl" value="square">
		<c:param name="currentPage" value="1" />
		<c:if test="${!empty param.districtNo}">
			<c:param name="districtNo" value="${param.districtNo}" />
		</c:if>
		<c:if test="${!empty param.streetSort}">
			<c:param name="streetSort" value="${param.streetSort}" />
		</c:if>
	</c:url>
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top 
		
		<c:if test="${streetNo == -1}">
		headerOpacity
		</c:if>
		
		">
			<a href="${contextPath}/square"><img src="${contextPath}/resources/img/seoul.png"/></a>&nbsp;&nbsp;
			<input class="form-control mr-sm-2" type="text"
				placeholder="검색할 골목 키워드" id="searchStreet" name="searchStreet"
				style="width: 300px">
			<button class="btn btn-secondary my-2 my-sm-0" type="button"
			 		onclick="searchValidate()">Search</button>
		<script>
			function searchValidate() {
				/* alert("${param.districtNo}")
				alert("${param.streetSort}") */
				var regExp = /^[\w가-힣]{2,}$/;
				var searchStreet = $("#searchStreet").val();
				console.log(searchStreet);
				if (!regExp.test(searchStreet)){
					alert("2글자 이상의 완성된 글자를 입력해주세요.");
				} else {
					location.href = "${detailUrl}&searchStreet=" + searchStreet;
				}
			}
		</script>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
			</ul>


			<div class="dropdown">
				<div class="dropdown-toggle headerImg" type="button" onclick="alarmView();"
					id="alarmButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false" style="margin-right:15px">
					<img src="${contextPath}/resources/img/alarm2.png">
				</div>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="alarmButton" id="alarmDrop">
					<!-- <div class="dropdown-item nanum">
						<div>'조미현'님이 친구요청을 수락하셨습니다.</div>
						<div style="color:lightsalmon">테스트</div>
						
					</div>
					<div class="dropdown-item nanum">
						<div>'20대 인싸들' 골목에서 추방당하셨습니다.</div>
						<div style="color:lightsalmon">테스트</div>
					</div> -->
				</div>
			</div>
			<!-- ------------------------------태훈 추가-------------------------------->
			<script>
				//$("#alarmButton").on("click", alarmView());
				$(function(){
					alarmView();
				})
				
				function alarmView(){
					$.ajax({
						url : "${contextPath}/square/selectAlarm",
						dataType : "json",
						success : function(alList) {
							console.log("ajax 통신 성공")
							console.log(alList);
							$("#alarmDrop").html("");
							if(alList == ""){
								var $alarm = $("<a>").prop("class", "dropdown-item nanum").text("조회된 알람이 없습니다.")
								$("#alarmDrop").append($alarm);
								$("#alarmButton>img").prop("src", "${contextPath}/resources/img/alarm2.png")
							} else {
								$("#alarmButton>img").prop("src", "${contextPath}/resources/img/alarmActive.png")
								$.each(alList, function(index, item){
									//console.log(alList[index])
/* 									if(item.alarmType == 1){
										var $alDiv = $("<div>").prop("class", "dropdown-item nanum joinCheck");
									} else if(item.alarmType == 2){
										var $alDiv = $("<div>").prop("class", "dropdown-item nanum goStreet");
									} else if(item.alarmType == 3){
										var $alDiv = $("<div>").prop("class", "dropdown-item nanum openMessenger");
									} else if(item.alarmType == 5){
										var $alDiv = $("<div>").prop("class", "dropdown-item nanum goStreet");
									} */
									switch(item.alarmType){
									case '1' : var $alDiv = $("<div>").prop("class", "dropdown-item nanum joinCheck"); break;
									case '2' : var $alDiv = $("<div>").prop("class", "dropdown-item nanum goStreet"); break;
									case '3' : var $alDiv = $("<div>").prop("class", "dropdown-item nanum openMessenger"); break;
									case '4' : var $alDiv = $("<div>").prop("class", "dropdown-item nanum openFriendList"); break;
									case '5' : var $alDiv = $("<div>").prop("class", "dropdown-item nanum goStreet"); break;
									default : 
									}
									var $alUrl = $("<input>").prop("type", "hidden").val(item.alarmAddr);
									var $alNo = $("<input>").prop("type", "hidden").val(item.alarmNo)
									var $alContent = $("<div>").text(item.alarmContent);
									var $alEventer = $("<div>").css("color", "lightsalmon").text(item.eventerNm)
									$alDiv.append($alUrl).append($alNo).append($alContent).append($alEventer);
									$("#alarmDrop").append($alDiv);
								})
							}
							
						},
						error : function() {
							console.log("ajax 통신 실패")
						}
						
					})
				}
				
				$(document).on("click", ".joinCheck", function(){ // 알람 클릭시 골목 가입 수락여부 선택할 수 있는 함수
					console.log(this.firstChild.value)
					var applyCheck = confirm("골목 가입 요청을 수락하시려면 확인, 거절하시려면 취소를 눌러주세요.")
					$.ajax({
						url : "${contextPath}/"+this.firstChild.value,
						data : {"applyCheck": applyCheck},
						success : function(result){
							if(result > 0){
								alert("골목 가입 수락 완료");
								sendAlarm(result);
							}
						}, 
						error : function(){
							console.log("ajax 통신 실패")
						}
					})
					console.log(this);
					this.remove();
					console.log(this.childNodes[1].value);
					checkAlarm(this.childNodes[1].value) // 알람 checkDt 수정하는 function 호출 및 매개변수로 alarmNo 전달
					alarmView();
				})
				
				$(document).on("click", ".goStreet", function(){ // 알람 클릭시 골목 이동 여부 선택할 수 있는 함수
					console.log(this.firstChild.value)
					if(confirm("가입된 골목으로 이동하시겠습니까?")){
						location.href="${contextPath}/"+this.firstChild.value;
					}
					this.remove();
					console.log(this.childNodes[1].value);
					checkAlarm(this.childNodes[1].value) // 알람 checkDt 수정하는 function 호출 및 매개변수로 alarmNo 전달
				})
				
				$(document).on("click", ".openMessenger", function(){
					$('.container2').show(200);
					iconStatus = false;
					$(".tabBox ul").children().last().children("a").click();
					checkAlarm(this.childNodes[1].value)
					alarmView();
					friendRequest();
					friendsList();
				})
				
				$(document).on("click", ".openFriendList", function(){
					$('.container2').show(200);
					iconStatus = false;
					$(".tabBox ul").children().first().children("a").click();
					checkAlarm(this.childNodes[1].value)
					alarmView();
					friendRequest();
					friendsList();
				})
				
				function checkAlarm(alarmNo) { // 알람 확인 체크용 function
					console.log(alarmNo);
					$.ajax({
						url : "${contextPath}/square/checkAlarm",
						data : {"alarmNo":alarmNo}
					})
					alarmView();
				}
				
				
				function removeAlarm(alarmType, eventer) { // 알람을 확인하지 않고 골목 가입신청을 하였을 때 알람 확인상태로 변경
					$.ajax({
						url : "${contextPath}/street/removeAlarm",
						data : {"eventer":eventer, "alarmType":alarmType},
						success : function() {
							console.log("알람 삭제 ajax");
							alarmView();
						},
						error : function() {
							console.log("알람 삭제 ajax 실패")
						}
					})
				}
			</script>
			<div class="dropdown">
				<div class="dropdown-toggle headerImg" type="button"
					id="mypageButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">
					<img src="${contextPath}/resources/profileImage/${loginMember.memberProfileUrl}">
				</div>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="mypageButton">
					<a class="dropdown-item nanum" data-toggle="modal" data-target="#profileModal" id="abcde">내정보 조회</a> 
					<a class="dropdown-item nanum" data-toggle="modal" data-target="#golmokModal" id="hoho">내골목 조회</a>
					<a class="dropdown-item nanum" data-toggle="modal" data-target="#blockModal" id="blockFriendsList">차단친구 조회</a>
					<a class="dropdown-item nanum" data-toggle="modal" data-target="#waitGolmokModal" id="waitGolmokModalList">가입대기 골목 조회</a> <!-- 정승환 추가코드(20.03.30) -->
					<!-- <a class="dropdown-item nanum" data-toggle="modal">1:1 문의</a> --> 
					<!-- <a class="dropdown-item nanum" data-toggle="modal">공지사항</a> -->
					<hr>
					<a class="dropdown-item nanum" href="${contextPath}/member/logout">로그아웃</a>
				</div>
			</div>
		</div>
	</nav>
	
	<!-- 정승환 코드 추가 시작(20.03.30) -->
	<!-- wait golmok Modal -->
    <div class="modal fade" id="waitGolmokModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="waitGolmokModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style="width:800px;">
        <div class="modal-content">
            <div class="modal-header">
            <h2 class="modal-title nanum" id="waitGolmokModalLabel" style="font-weight: bold;">가입대기 골목</h2>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
       	<span aria-hidden="true">&times;</span>
     	</button>
            </div>
            <div class="modal-body">
            <!-- content start -->
             <div class="container-fluid">
             	
             	<!-- 가입 대기 골목 시작 -->
				<div class="row">
	              	<div class="col-md-12"><h3 class="nanum">골목 가입 요청 목록</h3></div>
	              	<div class="col-md-12"><p class="nanum" style="color: blue;">*가입 취소는 해당 골목에서 가능합니다.</p></div>
            	</div>
            	
            	<div class="row">
            		<div class="col-md-12"  id="waitStreetInfomation">
            			<!-- 가입 대기 목록 -->
            		</div>
            	</div>
            	<!-- 가입 대기 골목 끝 -->
            	
            	<hr>
            	
            	<!-- 탈퇴 및 가입 실패 골목 시작 -->
            	<div class="row">
              		<div class="col-md-12"><h3 class="nanum">골목 가입 실패 및 탈퇴 목록</h3></div>
              		<div class="col-md-12"><p class="nanum" style="color: blue;">*골목 가입 실패시 재가입이 가능하며 가입 거부 사유는 알려드리지 않습니다.</p></div>
            	</div>
            	
            	<div class="row">
            		<div class="col-md-12" id="outStreetInfomation">
            			<!-- 탈퇴 및 가입 실패 목록 -->
            		</div>
            	</div>
            	<!-- 탈퇴 및 가입 실패 골목 끝	 -->
				
             </div>
            <!-- content end -->
             </div>
        </div>
        </div>
    </div>
   <!-- wait golmok Modal end -->
   <!-- 정승환 코드 추가 끝(20.03.30) -->
	
	<!-- profile Modal -->
    <div class="modal fade" id="profileModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="width:496px;">
        <div class="modal-content">
            <div class="modal-header">
            <h2 class="modal-title nanum" id="profileModalLabel" style="font-weight: bold;">내정보 조회</h2>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          	<span aria-hidden="true">&times;</span>
        	</button>
            </div>
            <div class="modal-body">
            <!-- content start -->
                <!-- profile image start -->
                <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="profileBox">
                    <img class="profileImage" src="" alt="이미지" id="memberProfileUrl">
                    </div>
                </div>
                <div class="col-md-4"></div>
                </div>
                <!-- profile image end-->
                <div class="row">
                <div class="col-md-2"></div> <!-- 정승환 코드수정(20.03.27) -->
                <div class="col-md-8">		<!-- 정승환 코드수정(20.03.27) -->
                    <input type="text" id="memberNickName" class="nanum form-control-plaintext text-center" style="font-size: 30px;font-weight: bold;" readonly>
                </div>
                <div class="col-md-2"></div> <!-- 정승환 코드수정(20.03.27) -->
                </div>
                <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8"><input type="text" id="memberEmail" class="nanum form-control-plaintext text-center" style="font-size: 25px;font-weight: bold;" readonly></div>
                <div class="col-md-2"></div>
                </div>
                <div class="row">
                <label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold; font-size: 16px;">이름</label>
                <div class="col-sm-4">
                    <input type="text" readonly id="memberName" class="nanum form-control-plaintext text-center"  style="font-size: 25px;">
                </div>
                <label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold; font-size: 16px;">나이</label>
                <div class="col-sm-4">
                    <input type="text" readonly id="memberAge" class="nanum form-control-plaintext text-center" style="font-size: 25px;">
                </div>
                </div>

                <div class="row">
                <label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold; font-size: 16px;">성별</label>
                <div class="col-sm-4">
                	<input type="text" readonly id="memberGender" class="nanum form-control-plaintext text-center" style="font-size: 25px;">
                </div>
                <label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold; font-size: 16px;">전화번호</label>
                <div class="col-sm-4">
                    <input type="text" readonly id="memberPhone" class="nanum form-control-plaintext text-center" style="font-size: 22px;">
                </div>
                </div>

                <div class="row" id="memberProfileHobby">
              	<!-- 관심사 영역 -->
                </div>
            
                <div class="row">
                <div class="col-md-6">
                    <a class="btn btn-primary btn-lg btn-block nanum" href="${contextPath}/member/MoveupdateForm?memberNo=${loginMember.memberNo}" role="button" style="font-weight: bold;">내정보 수정</a>
                </div>
                <div class="col-md-6">
                    <a class="btn btn-primary btn-lg btn-block nanum" href="${contextPath}/member/deleteForm" role="button" style="font-weight: bold;">회원 탈퇴</a>
                </div>
                </div>
                <!-- content end -->
                </div>
            </div>
            </div>
        </div>
        <!-- end -->
        
        <!--**************************** 영준이 건듦 (차단 친구 모달 틀)*********************************** -->
        <!-- blockFriends Modal -->
    <div class="modal fade" id="blockModal">
        <div class="modal-dialog" role="document" style="width:496px;">
        	<div class="modal-content">
            	<div class="modal-header">
          	  		<h2 class="modal-title nanum" style="font-weight: bold;">차단 친구 목록</h2>
		           		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          		<span aria-hidden="true">&times;</span>
		        		</button>
            	</div>
            	
            	<div id ="blockBody" class="modal-body" style="text-align:center">
	                <div class="row">
		                <div class="col-md-2"><span id=bNo class="nanum">번호</span></div>
		                <div class="col-md-6"><span id=bNick class="nanum">닉네임</span></div>
		                <div class="col-md-4"><span class="nanum">차단해제</span></div>
	                </div>
	                <hr>
	                <div id = blockAdd class="row">
		                <div class="col-md-2"><span class="nanum">번호</span></div>
		                <div class="col-md-6"><span class="nanum">닉네임</span></div>
		                <div class="col-md-4"><button type="button" class="btn btn-info btn-sm nanum">차단해제</button></div>
	                </div>  
            	</div>
        	</div>
      	</div>
    </div>
    
    <!-- 차단해제 모달창 -->
				<div class="modal fade" id="noBlockBtn">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title nanum" style="font-size: 30px;">알림메세지</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" style="text-align:center">
								<form method="POST" action="${pageContext.request.contextPath}/friends/friendGo">
									<input type="hidden" id="friendGo" name="memberNo" value="memberNo">
									<span class="nanum">차단을 풀었어요!</span>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary nanum"	data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>	    
    
    <script>
		///////////////////////////////////////////영준 작업 공간(차단 친구 목록)///////////////////////////////////////////////////////////
		//<a class="dropdown-item nanum" data-toggle="modal" data-target="#blockFriends" id="blockFriendsList">차단친구 조회</a>
		/* 차단친구목록  */
       	$("#blockFriendsList").on("click",function(){
       		$.ajax({
       			url : "friends/blockFriendsList",
       			data : {},
       			type : "post",
       			dataType : "json",
       			success : function(bList){
       			console.log(bList);
       			var $blockBody = $("#blockBody");
				var $blockAdd = $("#blockAdd");
				if(bList == null){
					$msg = $("<span>").html("지금은 차단하신 회원이 없네요.");
					$blockAdd.css("text-align","center")
					$blockAdd.html($msg);
					var count = 1;
				}else {
					$blockAdd.html("") // 기존 html 내용 삭제
					count = 1;
					$.each(bList, function(i){
						
						
		                var $divNo = $("<div>").prop("class","col-md-2");
		                var $divNick = $("<div>").prop("class","col-md-6");
		                var $divBtn = $("<div>").prop("class","col-md-4");
		                var $span = $("<span>").prop("class", "nanum");
		                
		                var $count = count;
						var $Nick = bList[i];
						var $bBtn = $("<button>").prop("class","btn btn-info btn-sm nanum noBlock").attr('data-toggle', "modal").attr('data-target', "#noBlockBtn").
						html("차단해제").val(bList[i]);
						var $hr = $("<hr>");
						
						$divNo.append($span).append($count)
						$divNick.append($span).append($Nick)
						$divBtn.append($span).append($bBtn).append($hr);
						
						$blockAdd.append($divNo).append($divNick).append($divBtn);
						count++;	
										
					}); //$.each 끝
					
				} //else 끝
       				
       			},
       			error : function(e){
           			console.log("ajax 통신 실패");
           			console.log(e);
           		}
       			
       		});
       		
       	});
		
     // 차단해제 버튼을 누르면 Controller로 값 넘기기
    	$(document).on("click", ".noBlock", function(){
    		console.log(this.value);
    		var yourNick = this.value
    		
    		$.ajax({
    			url : "friends/noBlock",
    			type : "POST",
    			data : {"yourNick" : yourNick },
    			success : function(){
    				console.log("차단 해제 aJax 성공")			
    			},
    			error : function(){
    				console.log("차단 해제 aJax 실패");
    			}
    		});
    		
    	}); // 차단 해제 기능 완료
		
		
		
		
		
		
	</script>
        
        
        
        
        
        <!-- golmok Modal -->
        <div class="modal fade" id="golmokModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="golmokModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document" style="width:800px;">
            <div class="modal-content">
                <div class="modal-header">
                <h2 class="modal-title nanum" id="golmokModalLabel" style="font-weight: bold;">내골목 조회</h2>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          	<span aria-hidden="true">&times;</span>
	        	</button>
                </div>
                <div class="modal-body">
                <!-- content start -->
	                <div class="container-fluid" id="myStreetInfomation">
						<!-- 내골목 정보 구역 -->
	                </div>
                <!-- content end -->
                 </div>
            </div>
            </div>
        </div>
        <!-- end -->

        
        <script>
        /*----------------정승환 추가코드(20.03.30)-------------------*/
     	// 추가용 시작
        // 가입 대기, 탈퇴(가입실패) 골목 목록 조회용 ajax
        $("#waitGolmokModalList").on("click",function(){
        	$.ajax({
        		url : "${contextPath}/member/selectWaitNOutStreet",
        		data : {memberNo : ${loginMember.memberNo} },
        		type : "post",
       			dataType : "json",
       			success : function(waitNOutList){
      				
       				// 가입 대기 골목이 없는 경우
       				if(Object.keys(waitNOutList.waitStreetList).length == 0) {
       					$("#waitStreetInfomation").html("");
       					var $brPlus = $("<br>");
       					var $hPlus = $("<h3 class='nanum'>").html("가입 요청 대기 중인 골목이 없습니다.");
       					$("#waitStreetInfomation").append($brPlus).append($hPlus);    					
       				} else {
       					$("#waitStreetInfomation").html("");
       					var $brPlus1 = $("<br>");
       					for(var i=0;i<Object.keys(waitNOutList.waitStreetList).length;i++){
       						var streetNo = ((waitNOutList.waitStreetList)[i]).streetNo;
       						var $divPlus = $("<div>").addClass("row");
           					var $divPlus1 = $("<div>").addClass("col-md-4").css({"position":"relative","height":"240px"});
           					var $divPlus2 = $("<div class='col-md-1'>");
           					var $divPlus3 = $("<div class='col-md-7'>");
           					
           					var $imgPlus = $("<img>").prop({"src":"${contextPath}/resources/streetCoverImage/"+((waitNOutList.waitStreetList)[i]).imgUrl, "alt":"이미지"})
							.css({"position":"absolute","width":"100%","height":"100%"});
           					
           					// 골목 이미지
           					$divPlus1.append($imgPlus);
           					
           					// 여백
           					
           					// 골목정보_1
           					var $divPlus31 = $("<div class='row'>").css("margin-bottom","5px"); 
							var $sector1 = $("<div class='col-md-9'>");
							var $sector2 = $("<div class='col-md-3'>");
           					var $sname = $("<input class='form-control-plaintext nanum'>").prop({"type":"text","readonly":true})
										.css({"font-weight":"bold","font-size":"25px"}).val(((waitNOutList.waitStreetList)[i]).streetNm);
           					$sector1.append($sname);
           					var $sdistrict = $("<button class='btn btn-outline-success text-center'>").css({"font-weight":"bold","font-size":"13px"})
											.prop({"disabled":true,"type":"button"}).html(((waitNOutList.waitStreetList)[i]).districtNm);
           					$sector2.append($sdistrict);
           					$divPlus31.append($sector1).append($sector2);
           					
           					$divPlus3.append($divPlus31);
           					
           					// 골목정보_2
							var $divPlus32 = $("<div class='row'>").css("margin-bottom","5px"); 
           					var $sector3 = $("<div class='col-md-12'>");
           					var $sinfo = $("<textarea class='form-control'>").prop({"rows":"2","cols":"65","readonly":true})
           								.css("resize","none").html(((waitNOutList.waitStreetList)[i]).streetIntro);
           					$sector3.append($sinfo);
           					$divPlus32.append($sector3)
           					
           					$divPlus3.append($divPlus32);
           					
           					// 골목정보_3
           					var $divPlus341 = $("<div class='row'>").css("margin-bottom","5px");
           					var $sector4 = $("<div class='col-md-3'>");
           					var $labelPlus = $("<label class='col-sm-3 col-form-label text-center nanum'>")
           									.css({"font-weight":"bold","font-size":"15px"}).html("골목대장");
							var $inputPlus3 = $("<input class='form-control-plaintext nanum'>").prop({"type":"text","readonly":true})
											.css({"font-weight":"bold","font-size":"20px"}).val(((waitNOutList.waitStreetList)[i]).memberNm);
							$sector4.append($inputPlus3);
							$divPlus341.append($labelPlus).append($sector4);
							
							var $sector5 = $("<div class='col-md-3'>");
							var $labelPlus2 = $("<label class='col-sm-3 col-form-label text-center nanum'>")
											.css({"font-weight":"bold","font-size":"15px"}).html("가입 대기수");
							var $inputPlus4 = $("<input class='form-control-plaintext nanum'>").prop({"type":"text","readonly":true})
											.css({"font-weight":"bold","font-size":"20px"}).val(((waitNOutList.waitStreetList)[i]).streetMaxMember);
							$sector5.append($inputPlus4);
							$divPlus341.append($labelPlus2).append($sector5);
							
							$divPlus3.append($divPlus341);
							
							// 골목정보_4
							var $divPlus35 = $("<div class='row'>");
           					var $sector6 = $("<div class='col-md-12'>");
           					var $mstreetbtn = $("<button class='btn btn-primary btn-lg btn-block nanum gogoStreet'>").prop("type","button")
           									.css("font-weight","bold").html("골목 이동");
           					var $goStreetNoInputPlus = $("<input>").prop("type","hidden").val(streetNo);
           					$sector6.append($mstreetbtn).append($goStreetNoInputPlus);
							$divPlus35.append($sector6);
							
							$divPlus3.append($divPlus35);
							
							// 통합
							$divPlus.append($divPlus1).append($divPlus2).append($divPlus3);
							$("#waitStreetInfomation").append($divPlus).append($brPlus1);
           					
       					}		
       					
       				}
       				
       				// 가입 실패 및 탈퇴 골목이 없는 경우
       				if(Object.keys(waitNOutList.outStreetList).length == 0){
       					$("#outStreetInfomation").html("");
       					var $hPlus = $("<h3 class='nanum'>").html("가입 실패 및 탈퇴 골목이 없습니다.");
       					var $brPlus2 = $("<br>");
       					$("#outStreetInfomation").append($brPlus2).append($hPlus);
       				} else {
       					$("#outStreetInfomation").html("");
       					var $brPlus3 = $("<br>");
       					for(var i=0;i<Object.keys(waitNOutList.outStreetList).length;i++){
       						var $divPlus = $("<div>").addClass("row");
           					var $divPlus1 = $("<div>").addClass("col-md-4").css({"position":"relative","height":"80px"});
           					var $divPlus2 = $("<div class='col-md-1'>");
           					var $divPlus3 = $("<div class='col-md-7'>");
           					
           					var $imgPlus = $("<img>").prop({"src":"${contextPath}/resources/streetCoverImage/"+((waitNOutList.outStreetList)[i]).imgUrl, "alt":"이미지"})
    						.css({"position":"absolute","width":"100%","height":"100%"});
           					
           					// 골목 이미지
           					$divPlus1.append($imgPlus);
           					
           					// 여백
           					
           					// 골목정보
           					var $divPlus31 = $("<div class='row'>"); 
							var $sector1 = $("<div class='col-md-9'>");
							var $sector2 = $("<div class='col-md-3'>");
           					var $sname = $("<input class='form-control-plaintext nanum'>").prop({"type":"text","readonly":true})
										.css({"font-weight":"bold","font-size":"25px"}).val(((waitNOutList.outStreetList)[i]).streetNm);
           					$sector1.append($sname);
           					var $sdistrict = $("<button class='btn btn-outline-success text-center'>").css({"font-weight":"bold","font-size":"13px"})
											.prop({"disabled":true,"type":"button"}).html(((waitNOutList.outStreetList)[i]).districtNm);
           					$sector2.append($sdistrict);
           					$divPlus31.append($sector1).append($sector2);
           					
           					$divPlus3.append($divPlus31);
           					
           					// 통합
							$divPlus.append($divPlus1).append($divPlus2).append($divPlus3);
							$("#outStreetInfomation").append($divPlus).append($brPlus3);
           					
       					}
       					
       				}
       				
       			},
       			error : function(e){
           			console.log("ajax 통신 실패");
           			console.log(e);
           		}
        	});
        });
        
        // 추가용 끝
        /*----------------정승환 추가코드(20.03.30)-------------------*/
        
		/* 내정보 조회용 회원정보,회원관심사 DB조회용 ajax */
       	$("#abcde").on("click",function(){
       		$.ajax({
       			url : "${contextPath}/member/selectProfileMember",
       			data : {memberEmail : "${loginMember.memberEmail}" , memberNo : ${loginMember.memberNo} },
       			type : "post",
       			dataType : "json",
       			success : function(mList){
       				
       				// 회원정보
       				$("#memberProfileUrl").prop("src","${contextPath}/resources/profileImage/"+mList[0].memberProfileUrl);
       				$("#memberNickName").val(mList[0].memberNickname);
       				$("#memberEmail").val(mList[0].memberEmail);
       				$("#memberName").val(mList[0].memberNm);
       				$("#memberAge").val(mList[0].memberAge);
       				$("#memberPhone").val(mList[0].memberPhone);
       				if(mList[0].memberGender == "M") {
       					$("#memberGender").val("남성");	
       				}else {
       					$("#memberGender").val("여성");
       				}
       				// 회원정보 끝
       				
            		// 회원 관심사
       				var $divPlus = $("#memberProfileHobby");
            		
       				for(var i=1;i<Object.keys(mList).length;i++){
       					if(i == 1) { // 제일 처음 관심사
       						var $divPlus1 = $("<div class='col-sm-10'>");
       	       				var $labelPlus = $("<label>");
       	       				var $inputPlus = $("<input>");
       						$labelPlus.addClass("col-sm-2 col-form-label text-center nanum").css({"font-weight" : "bold","font-size": "16px"}).html("관심분야");
       						$inputPlus.prop({"type":"text","readonly":"true"}).css({"color" : "blue","font-size": "25px"})
       								  .addClass("nanum form-control-plaintext").val("#" + mList[1].hobbyName);
       						$divPlus1.append($inputPlus);
       						if(document.getElementById("memberProfileHobby").childElementCount < (Object.keys(mList).length-1)*2) {
       							$divPlus.append($labelPlus);
           						$divPlus.append($divPlus1);	
       						}
       					} else { // 그 다음 관심사
       						var $divPlus1 = $("<div class='col-sm-10'>");
       	       				var $labelPlus = $("<label>");
       	       				var $inputPlus = $("<input>");
       						$labelPlus.addClass("col-sm-2 col-form-label text-center nanum").css({"font-weight" : "bold","font-size": "16px"});
       						$inputPlus.prop({"type":"text","readonly":"true"}).css({"color" : "blue","font-size": "25px"})
       								  .addClass("nanum form-control-plaintext").val("#" + mList[i].hobbyName);
       						$divPlus1.append($inputPlus);
       						if(document.getElementById("memberProfileHobby").childElementCount < (Object.keys(mList).length-1)*2) {
       							$divPlus.append($labelPlus);
           						$divPlus.append($divPlus1);	
       						}
       					}
       				}
       				// 회원 관심사 끝
       				
       			},
       			error : function(e){
           			console.log("ajax 통신 실패");
           			console.log(e);
           		}
       			
       		});
       		
       	});
		
       	// 내골목 조회용 골목정보,골목 키워드 DB조회용 ajax 
       	$("#hoho").on("click",function(){
       		$.ajax({
       			url : "${contextPath}/member/selectMyStreet",
       			data : {memberNo : ${loginMember.memberNo}},
       			type : "post",
       			dataType : "json",
       			success : function(streetInfo){
       				
       				if(Object.keys(streetInfo).length == 0) {
       					if(document.getElementById("myStreetInfomation").childElementCount < 1) {
       						$hPlus = $("<h4 class='nanum'>").html("가입한 골목이 없습니다.");
           					$("#myStreetInfomation").append($hPlus);	
       					}
       				} else {
       					// 내 골목 수 만큼 반복
           				for(var i=0;i<Object.keys(streetInfo.myStreet).length;i++){ 
           					var streetNo = ((streetInfo.myStreet)[i]).streetNo;
           					var $divPlus = $("<div class='row'>");
           					var $divPlus1 = $("<div>").addClass("col-md-4").css({"position":"relative","height":"364px","overflow":"hidden"});
           					var $divPlus2 = $("<div class='col-md-1'>");
           					var $divPlus3 = $("<div class='col-md-7'>");
           					
           					var $divPlus4 = $("<div class='col-md-9'>");
           					var $divPlus5 = $("<div class='col-md-3'>");
           					var $divPlus6 = $("<div class='col-md-12'>");
           					var $imgPlus = $("<img>").prop({"src":"${contextPath}/resources/streetCoverImage/"+((streetInfo.myStreet)[i]).imgUrl, "alt":"이미지"})
           									.css({"position":"absolute","z-index":"10","width":"100%","height":"100%","object-fit":"cover"});
           					var $spanPlus = $("<span class='badge badge-pill badge-info'>").css({"position":"absolute", "z-index":"100", "font-size":"15px","margin":"10px"})
           									.html("개설 골목");
           					
           					// 1
           					$divPlus1.append($imgPlus);
           					if( ((streetInfo.myStreet)[i]).citizenGrade == 'M'.charAt(0) ) {
           						// 개설한 골목일 경우
           						$divPlus1.append($spanPlus);
           					}
           					
           					// 2
           					
           					
           					// 3_1
           					var $divPlus31 = $("<div class='row'>"); 
							var $sector1 = $("<div class=''>");
							var $sector2 = $("<div class='col-md-3'>");
           					var $sname = $("<input class='form-control-plaintext nanum'>").prop({"type":"text","readonly":true})
										.css({"font-weight":"bold","font-size":"25px"}).val(((streetInfo.myStreet)[i]).streetNm);
           					$sector1.append($sname);
           					var $sdistrict = $("<button class='btn btn-warning text-center'>").css({"font-weight":"bold","font-size":"13px","color":"#5a5a5a"})
											.prop({"disabled":true,"type":"button"}).html(((streetInfo.myStreet)[i]).districtNm);
           					$sector2.append($sdistrict);
           					$divPlus31.append($sector1).append($sector2);
           					
           					$divPlus3.append($divPlus31);
           					
           					// 3_2
							var $divPlus32 = $("<div class='row'>"); 
           					var $sector3 = $("<div class=''>");
           					var $sinfo = $("<textarea class='form-control'>").prop({"rows":"2","cols":"65","readonly":true})
           								.css("resize","none").html(((streetInfo.myStreet)[i]).streetIntro);
           					$sector3.append($sinfo);
           					$divPlus32.append($sector3)
           					
           					$divPlus3.append($divPlus32);
           					
           					// 3_3
           					var $divPlus33 = $("<div class='row'>");
           					
           					// 해당 골목이 키워드를 가지고 있는지 파악
           					var count = 0;
           					for(var g=0;g<Object.keys(streetInfo.myStreetKeyword).length;g++){
           						if( (streetInfo.myStreetKeyword)[g].streetNo == streetNo ) {
           							count++;
           						} 
           					}
           					
           					// 키워드가 존재하는 경우
           					if(count > 0) { 
           						for(var g=0;g<Object.keys(streetInfo.myStreetKeyword).length;g++){
               						if( (streetInfo.myStreetKeyword)[g].streetNo == streetNo ) {
               							var $divPlus7 = $("<div class='col-md-12 golmokKeywordBox mt-1 mb-1'>").css("background-color","#F3969A");
               							var $inputPlus2 = $("<input class='form-control-plaintext nanum'>").prop({"type":"text","readonly":true})
       									.css("color","white").val("#" + (streetInfo.myStreetKeyword)[g].keywordContent);
       									$divPlus7.append($inputPlus2);
       									$divPlus33.append($divPlus7);       									
               							$divPlus3.append($divPlus33);
               						} 
               					}
           					} 
           					
           					// 3_4
           					var $divPlus341 = $("<div class='row'>");
           					var $sector4 = $("<div class='col-md-3'>");
           					var $labelPlus = $("<label class='col-sm-3 col-form-label text-center nanum'>")
           									.css({"font-weight":"bold","font-size":"20px"}).html("총 인원");
							var $inputPlus3 = $("<input class='form-control-plaintext nanum'>").prop({"type":"text","readonly":true})
											/* .css({"font-weight":"bold","font-size":"25px"}).val(((streetInfo.myStreet)[i]).streetMaxMember); */
											/* 정승환 추가코드 시작 */
											.css({"font-weight":"bold","font-size":"25px"}).val((streetInfo.citizenCounts)[i]);
											/* 정승환 추가코드 끝 */
							$sector4.append($inputPlus3);
							$divPlus341.append($labelPlus).append($sector4);
							
							var $sector5 = $("<div class='col-md-3'>");
							var $labelPlus2 = $("<label class='col-sm-3 col-form-label text-center nanum'>")
											.css({"font-weight":"bold","font-size":"20px"}).html("골목대장");
							var $inputPlus4 = $("<input class='form-control-plaintext nanum'>").prop({"type":"text","readonly":true})
											.css({"font-weight":"bold","font-size":"25px"}).val(((streetInfo.myStreet)[i]).memberNm);
							$sector5.append($inputPlus4);
							$divPlus341.append($labelPlus2).append($sector5);
							
							$divPlus3.append($divPlus341);
           					
           					// 3_5
           					var $divPlus35 = $("<div class='row'>");
           					var $sector6 = $("<div class='col-md-12'>");
           					var $mstreetbtn = $("<button class='btn btn-primary btn-lg btn-block nanum gogoStreet'>").prop("type","button")
           									.css("font-weight","bold").html("골목 이동");
           					var $goStreetNoInputPlus = $("<input>").prop("type","hidden").val(streetNo);
           					$sector6.append($mstreetbtn).append($goStreetNoInputPlus);
							$divPlus35.append($sector6);
							
							$divPlus3.append($divPlus35);
			           					
           					// 통합 구성
           					if(document.getElementById("myStreetInfomation").childElementCount < (Object.keys(streetInfo.myStreet).length)*2) {
           						var $divPlus10 = $("<div class='row'>");
               					var $hrPlus = $("<hr>");
               					$divPlus10.append($divPlus1).append($divPlus2).append($divPlus3);
               					$("#myStreetInfomation").append($divPlus10).append($hrPlus);
           					}
           					
           				}
       				}
       				
       			},
       			error : function(e){
           			console.log("ajax 통신 실패");
           			console.log(e);
           		}
       			
       		});
       		
       	});
		
       	
       	// 골목 이동 버튼 클릭시 해당 골목 이동
       	$(document).on("click",".gogoStreet",function(){
       		var tempStreetNo = $(this).next().val();
       		location.href="${contextPath}/street/streetMain?streetNo="+tempStreetNo;
       	});
       	
       	
       	//////////////////////////////// 알람 시작해보는중.... ////////////////////////////////////
   		/* SockJS객체생성 보낼 url경로를 매개변수로 등록 */
		var sock=new SockJS("<c:url value='/echo'/>"); // 영준아 알람과 메신저 변수 이름 다르게
		sock.onmessage=onAlarm;
		sock.onclose=onClose;
		var today=null;

		function sendAlarm(memberNo){
			/* 맵핑된 핸들러 객채의 handleTextMessage매소드가 실행 */
			//console.log(memberNo);
			sock.send(memberNo);
		};
		
		function onAlarm(evt){
			var data=evt.data;//new text객체로 보내준 값을 받아옴.
			var host=null;//메세지를 보낸 사용자 ip저장
			//var strArray=data.split("|");//데이터 파싱처리하기
			var userName=null;//대화명 저장
			
	
			//전송된 데이터 출력해보기
			/* for(var i=0;i<strArray.length;i++)
			{
				console.log('str['+i+'] :' + strArray[i]);	 		
			} */
			console.log('제대로 잘 전달받았는지 확인 : ' + data)
			$("#alarmButton>img").prop("src", "${contextPath}/resources/img/alarmActive.png")
			alarmView();
	
		};
	
		function onClose(evt){
			location.href='${pageContext.request.contextPath};';
		};
       	
    </script>
  
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
		
</body>
</html>