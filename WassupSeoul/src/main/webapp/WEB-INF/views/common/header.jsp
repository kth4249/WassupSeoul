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
			<a href="${contextPath}/square"><img src="${contextPath}/resources/img/emoji.png" style="width: 25px"/></a>
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
				<div class="dropdown-toggle headerImg" type="button"
					id="alarmButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">
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
				$("#alarmButton").on("click", function(){
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
							} else {
								$.each(alList, function(index, item){
									//console.log(alList[index])
									if(item.alarmType == 1){
										var $alDiv = $("<div>").prop("class", "dropdown-item nanum joinCheck");
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
				})
				
				$(document).on("click", ".joinCheck", function(){
					console.log(this.firstChild.value)
					var applyCheck = confirm("골목 가입 요청을 수락하시려면 확인, 거절하시려면 취소를 눌러주세요.")
					$.ajax({
						url : "${contextPath}/"+this.firstChild.value,
						data : {"applyCheck": applyCheck},
						success : function(result){
							if(result == 1){
								alert("골목 가입 수락 완료");
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
				})
				
				function checkAlarm(alarmNo) { // 알람 확인 체크용 function
					console.log(alarmNo);
					$.ajax({
						url : "${contextPath}/square/checkAlarm",
						data : {"alarmNo":alarmNo}
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
					<a class="dropdown-item nanum" data-toggle="modal" data-target="#blockFriends" id="blockFriendsList">차단친구 조회</a>
					<!-- <a class="dropdown-item nanum" data-toggle="modal">1:1 문의</a> --> 
					<!-- <a class="dropdown-item nanum" data-toggle="modal">공지사항</a> -->
					<hr>
					<a class="dropdown-item nanum" href="${contextPath}/member/logout">로그아웃</a>
				</div>
			</div>
		</div>
	</nav>
	
	
	
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
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <input type="text" id="memberNickName" class="nanum form-control-plaintext text-center" style="font-size: 35px;font-weight: bold;" readonly>
                </div>
                <div class="col-md-3"></div>
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
    <div class="modal fade" id="bblockFriends">
        <div class="modal-dialog" role="document" style="width:496px;">
        	<div class="modal-content">
            	<div class="modal-header">
          	  		<h2 class="modal-title nanum" style="font-weight: bold;">차단 친구 목록</h2>
		           		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          		<span aria-hidden="true">&times;</span>
		        		</button>
            	</div>
            	
            	<div class="modal-body" style="text-align:center">
	                <div class="row">
		                <div class="col-md-2"><span class="nanum">번호</span></div>
		                <div class="col-md-6"><span class="nanum">닉네임</span></div>
		                <div class="col-md-4"><button type="button" class="btn btn-info btn-sm nanum">차단해제</button></div>
	                </div> 
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
       				
       				
       				
       				
       				
       				
       			},
       			error : function(e){
           			console.log("ajax 통신 실패");
           			console.log(e);
           		}
       			
       		});
       		
       	});
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
           					var $divPlus1 = $("<div>").addClass("col-md-4").css({"position":"relative","height":"364px"});
           					var $divPlus2 = $("<div class='col-md-1'>");
           					var $divPlus3 = $("<div class='col-md-7'>");
           					
           					var $divPlus4 = $("<div class='col-md-9'>");
           					var $divPlus5 = $("<div class='col-md-3'>");
           					var $divPlus6 = $("<div class='col-md-12'>");
           					var $imgPlus = $("<img>").prop({"src":"${contextPath}/resources/streetCoverImage/"+((streetInfo.myStreet)[i]).imgUrl, "alt":"이미지"})
           									.css({"position":"absolute","z-index":"10","width":"100%","height":"100%"});
           					var $spanPlus = $("<span class='badge badge-pill badge-info'>").css({"position":"absolute", "z-index":"100", "font-size":"15px"})
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
							var $sector1 = $("<div class='col-md-9'>");
							var $sector2 = $("<div class='col-md-3'>");
           					var $sname = $("<input class='form-control-plaintext nanum'>").prop({"type":"text","readonly":true})
										.css({"font-weight":"bold","font-size":"25px"}).val(((streetInfo.myStreet)[i]).streetNm);
           					$sector1.append($sname);
           					var $sdistrict = $("<button class='btn btn-outline-success text-center'>").css({"font-weight":"bold","font-size":"13px"})
											.prop({"disabled":true,"type":"button"}).html(((streetInfo.myStreet)[i]).districtNm);
           					$sector2.append($sdistrict);
           					$divPlus31.append($sector1).append($sector2);
           					
           					$divPlus3.append($divPlus31);
           					
           					// 3_2
							var $divPlus32 = $("<div class='row'>"); 
           					var $sector3 = $("<div class='col-md-12'>");
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
               							var $divPlus7 = $("<div class='col-md-12 golmokKeywordBox mt-1 mb-1'>").css("background-color","#36be81");
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
           									.css({"font-weight":"bold","font-size":"16px"}).html("골목 총 인원");
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
		var sock=new SockJS("<c:url value='/echo'/>");
		sock.onmessage=onMessage;
		sock.onclose=onClose;
		var today=null;
		$(function(){
			$("#sendBtn").click(function(){
				console.log("send message.....");
				/* 채팅창에 작성한 메세지 전송 */
				sendMessage();
				/* 전송 후 작성창 초기화 */
				$("#message").val('');
			});
			$("#exitBtn").click(function(){
				console.log("exit message.....");
				/* 채팅창에 작성한 메세지 전송 */
				sock.onclose();
			});
		});
		function sendMessage(){
			/* 맵핑된 핸들러 객채의 handleTextMessage매소드가 실행 */
			sock.send($("#message").val());
		
		};
		function onMessage(evt){
			var data=evt.data;//new text객체로 보내준 값을 받아옴.
			var host=null;//메세지를 보낸 사용자 ip저장
			var strArray=data.split("|");//데이터 파싱처리하기
			var userName=null;//대화명 저장
			
	
			//전송된 데이터 출력해보기
			for(var i=0;i<strArray.length;i++)
			{
				console.log('str['+i+'] :' + strArray[i]);	 		
			}
			if(strArray.length>1)
			{
				sessionId=strArray[0];
				message=strArray[1];
				host=strArray[2].substr(1,strArray[2].indexOf(":")-1);
				userName=strArray[3];
				today=new Date();
				printDate=today.getFullYear()+"/"+today.getMonth()+"/"+today.getDate()+" "+today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
				
				console.log(today);
				var ck_host='${host}';
		
				console.log(sessionId);
				console.log(message);
				console.log('host : '+host);
				console.log('ck_host : '+ck_host);
				/* 서버에서 데이터를 전송할경우 분기 처리 */
				if(host==ck_host||(host==0&&ck_host.includes('0:0:')))
				{
					var printHTML="<div class='well' style='margin-left: 30%;'>";
					printHTML+="<div class='alert alert-info'>";
					printHTML+="<sub>"+printDate+"</sub><br/>";
					printHTML+="<strong>["+userName+"] : "+message+"</strong>";
					printHTML+="</div>";
					printHTML+="</div>";
					$('#chatdata').append(printHTML);
				}
				else{
					var printHTML="<div class='well'  style='margin-left: -5%;margin-right:30%;'>";
					printHTML+="<div class='alert alert-warning'>";
					printHTML+="<sub>"+printDate+"</sub><br/>";
					printHTML+="<strong>["+userName+"] : "+message+"</strong>";
					printHTML+="</div>";
					printHTML+="</div>";
					$('#chatdata').append(printHTML);
					
				}
				//console.log('chatting data : '+data);
				
				
			}
			else
			{
				today=new Date();
				printDate=today.getFullYear()+"/"+today.getMonth()+"/"+today.getDate()+" "+today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
				message=strArray[0];
				var printHTML="<div class='well'  style='margin-left30%:'>";
				printHTML+="<div class='alert alert-danger'>";
				printHTML+="<sub>"+printDate+"</sub><br/>";
				printHTML+="<strong>[서버관리자] : "+message+"</strong>";
				printHTML+="</div>";
				printHTML+="</div>";
				$('#chatdata').append(printHTML);	
				
			}
			
			$('.panel').scrollTop($('.panel')[0].scrollHeight);
	
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