<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Poor+Story&display=swap');
	
.container2 {
	/* margin-top: 300px;
      margin-right: 90px;
      padding-right: 15px;
      padding-left: 15px; */
	position: fixed;
	bottom: 70px;
	right: 10px;
	display : none;
	z-index : 100 !important;
}

.messengerbox {
	width: 400px;
	height: auto;
}

.nav-item {
	text-align: center;
}

.col-md-4 {
	padding-right: 0px;
	padding-left: 0px;
}

.tab-pane p {
	text-align: center;
}

.tab-content22 {
	overflow: auto;
}

.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
	max-width: 100%;
	width: auto;
}

.iconImg {
	width: 50px;
	height: 50px;
	padding: 0;
	border: none;
	/* margin-top: 840px;
      margin-right: 30px; */
	position: fixed;
	bottom: 10px;
	right: 10px;
	z-index: 2;
	box-sizing: border-box;
	background-color: transparent
}

#chat {
	display : none;
}

	/* .back {
      height: 1500px;
    } */
    
/* #myTabContent {
	z-index: 1;
	position: absolute;
	top: 0;
	right: 0;
} */


</style>


<div class="back">
	<button type="button" class="iconImg">
		<img src="${contextPath}/resources/img/msgicon2.png" alt=""
			width="50px">
	</button>
<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- 토글 메뉴 -->	
	<div class="container2">
		<div class="messengerbox">
			<div class="bs-component tabBox">
				<ul class="nav nav-tabs nanum" style="background-color:white; border:1px solid #ced4da">
					<li class="nav-item col-md-4"><a class="nav-link active"
						data-toggle="tab" href="#friendsList">친구목록</a></li>
					<li class="nav-item col-md-4"><a class="nav-link"
						data-toggle="tab" href="#chatList">친구대화</a></li>
					<li class="nav-item col-md-4"><a class="nav-link"
						data-toggle="tab" href="#friendReq">친구요청</a></li>
				</ul>
			</div>
			
			<script>
				$(".nav-item.col-md-4").on("click",function(){
					var index = $(".nav-item.col-md-4").index(this);
					
					for(var i=0 ; i<$(".nav-item.col-md-4").length ; i++){
						if(i == index){
							$(".tgl:eq("+i+")").show();
						}else{
							$(".tgl:eq("+i+")").hide();
						}
					}
					
					$("#chat").hide();
					
					/*if(index == 0){
						$(".tgl:eq(0)").show();
						$(".tgl:eq(1)").hide();
						$(".tgl:eq(2)").hide();
					}else if(index == 1){
						$(".tgl:eq(0)").hide();
						$(".tgl:eq(1)").show();
						$(".tgl:eq(2)").hide();
					}else if(index == 2){
						$(".tgl:eq(0)").hide();
						$(".tgl:eq(1)").hide();
						$(".tgl:eq(2)").show();
					}*/
				});
			
			</script>
			
			<div id="myTabContent" class="tab-content22"
				style="height: 500px; background-color: #FFFFFF; padding: 0; border:1px solid #ced4da">
				
<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
				<!-- 친구 목록 -->	
				<div class="tab-pane fade active show tgl" id="friendsList">
					<div class="nanum" id="friendInfo">
						<br> 
						<div style="width: 40px; height: 40px; border-radius: 70%; overflow: hidden;">
							<img src="${contextPath}/resources/img/usericon.png"
								style="width:100%; height:100%; object-fit: cover;" class="ml-3 fImg" data-toggle="modal"
								data-target="#profilePicture" style="cursor: pointer">
						</div>
							 &nbsp;
						<span class="fUser" style="font-size: 20px;">안중하</span> &nbsp;
						<button type="button"
							class="btn btn-outline-danger btn-sm nanum float-right mr-3"
							data-toggle="modal" data-target="#">차단</button>
						<button type="button"
							class="btn btn-outline-info btn-sm nanum float-right mr-3 talkFriend" 
							id="chatBtn">대화</button>
					</div>
				</div>

<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
				<!-- 대화방 목록 -->		
				<div class="tab-pane fade tgl" id="chatList">
					<div id="roomOne" class="nanum mt-3 ml-3 chatRoom">
						<div class="roomImg" style="display: inline-block; width:40px; height:40px; overflow:hidden; border-radius: 70%; ">
							<img class="cImg" src="${contextPath}/resources/img/usericon.png" width="40px"
								height="40px" class="chatProfile" data-toggle="modal"
								data-target="#profilePicture" style="cursor: pointer; width:100%; height:100%; object-fit: cover;">&nbsp;
						</div>
						<div class="roomTitle" style="display: inline-block;">
							<span class="cUser1">천사</span> <span class="mr-0 cUser2">: 밥먹어 </span>
						</div>
						<span class="badge badge-pill badge-danger float-right mr-3 mt-2 cUser3">5</span>
					</div>
					<hr>
				</div> 
				<!-- 대화방 목록 끝 -->


<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
				<!-- 친구요청 div -->
				<div class="tab-pane fade tgl" id="friendReq">
					<div class="nanum mt-3" id="friendRequestArea">
						<input type="hidden" id="profileRoot">
						<img class="rImg" src="${contextPath}/resources/img/usericon.png" width="40px"
							height="40px" data-toggle="modal" data-target="#profilePicture"
							style="cursor: pointer"> &nbsp;
							<span class="rUser">조미현님이 친구요청을 하셨습니다.</span>&nbsp;
						<button class="btn btn-info btn-sm nanum">수락</button>
						<button class="btn btn-danger btn-sm nanum" data-toggle="modal"
							data-target="#noBtn">거절</button>
					</div>
				</div>
				
				
				
<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->			
				                    <!-- 채팅창 div 시작 -->
                    <div class="tab-pane chat nanum" id="chat" style="height: 458px; overflow-y: auto; position: relative;">
                        <!-- 닫기 버튼 -->
                        <div id="div_chat">
                        	<button type="button" class="close xBtn">&times;</button>
                        </div>
                        <!-- 스크롤 다운 버튼 -->

                        <br>

                        <!-- 하나의 msg 객체 -->
                        
                        <div class="row">
                            <div class="col-md-2 nanum" style="padding-right: 0px;">
                                <img src="${contextPath}/resources/img/usericon.png" width="40px" height="40px" data-toggle="modal"
                                    data-target="#profilePicture" style="cursor: pointer"> &nbsp;
                            </div>
                            <div class="col-md-10 nanum">
                                <span>아빠</span>
                                <br>
                                <span>아들, 뭐해. 공부해? 밥은 먹었니?</span>
                            </div>
                        </div>
                          
                        <br>
                        <!-- 하나의 msg 객체 -->
                        <div class="row">
                            <div class="col-md-2 nanum" style="padding-right: 0px;">
                                <img src="${contextPath}/resources/img/usericon.png" width="40px" height="40px" data-toggle="modal"
                                    data-target="#profilePicture" style="cursor: pointer"> &nbsp;
                            </div>
                            <div class="col-md-10 nanum">
                                <span>아빠</span>
                                <br>
                                <span>아들, 뭐해. 공부해? 밥은 먹었니?</span>
                            </div>
                        </div>
                        
            			<br>
              			  <!-- 하나의 msg 객체 -->
                        <div class="row">
                            <div class="col-md-2 nanum" style="padding-right: 0px;">
                                <img src="${contextPath}/resources/img/usericon.png" width="40px" height="40px" data-toggle="modal"
                                    data-target="#profilePicture" style="cursor: pointer"> &nbsp;
                            </div>
                            <div class="col-md-10 nanum">
                                <span>아빠</span>
                                <br>
                                <span>아들, 뭐해. 공부해? 밥은 먹었니?</span>
                            </div>
                        </div>

                        <!-- 메시지 뜨는 공간 -->
                        <table id="table_chat" style="margin-top: 340px;">
                            <colgroup>
                                <col style="width: 300px;">
                                <col style="width: 600px;">
                            </colgroup>
                            <thead></thead>
                            <tbody></tbody>
                        </table>
                        
                        <!-- <div id="menu_hide"></div> -->
	                    <!-- 메시지 입력하고 전송하는 버튼 -->
	                    <table id="append_table">
	                        <thead></thead>
	                        <tbody>
	                            <tr>
	                                <td><input type="text" id="add_msg" class="nanum" style="width: 320px;"></td>
	                                <td><button type="button" class="btn btn-warning nanum" id="btn_append_row">전송</button>
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>
                    </div>

				
				
				
				
				
				
			</div> <!-- #myTabContent 종료   -->
		</div> <!-- .messengerbox 종료 -->
	</div> <!-- .container2 종료  -->
</div> <!-- .back 종료 -->
				
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
													<!-- 모달 시작 -->					
<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->			
				<!-- 친구요청 : 수락버튼 -->
				<div class="modal fade" id="yesBtn">
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
								<form method="POST" action="">
									<span class="nanum">친구가 됐어요!!!</span>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary nanum"	data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>				
				
<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->			
				<!-- 친구요청 : 거절버튼 -->
				<div class="modal fade" id="noBtn">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title nanum" style="font-size: 30px;">알림메세지</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="">
									<span class="nanum">친구 요청을 거절하셨습니다.</span> 
									<span class="nanum" style="color: red;">차단</span> 
									<span class="nanum">목록에 추가하시겠습니까?</span>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger nanum blockFriend" 
								data-toggle="modal" data-target="#blockBtn">차단하기</button>
								<button type="button" class="btn btn-primary nanum"	data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>

<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->			
				<!-- 친구목록 : 차단버튼 -->
				<div class="modal fade" id="blockBtn">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title nanum" style="font-size: 30px;">알림메세지</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" style="font-size: 20px;">
								<form action="friends/friends">
										<input type="hidden" name="">
									<span class="nanum" style="color: olivedrab;"><!-- 안중하 --></span> 
									<span class="nanum">성공적으로 차단하셨습니다.</span>
								</form>
							</div>
							<div class="modal-footer">
								<!-- <button type="button" class="btn btn-danger nanum">차단목록</button> -->
								<button type="button" class="btn btn-primary nanum"
									data-dismiss="modal">확인</button>
							</div>
						</div>
					</div>
				</div>
				
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->			
				
				
				<!-- 친구목록 : 제거버튼 -->
				<div class="modal fade" id="byeBtn">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title nanum" style="font-size: 30px;">알림메세지</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" style="font-size: 20px;">
								<form action="friends/friends">
										<input type="hidden" name="">
									<span class="nanum" style="color: olivedrab;"><!-- 안중하 --></span> 
									<span class="nanum">친구목록에서 제거되었습니다..</span>
								</form>
							</div>
							<div class="modal-footer">
								<!-- <button type="button" class="btn btn-danger nanum">차단목록</button> -->
								<button type="button" class="btn btn-primary nanum"
									data-dismiss="modal">확인</button>
							</div>
						</div>
					</div>
				</div>
				
<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->			
				<!-- 친구목록 : 프로필사진 -->
				<div class="modal fade" id="profilePicture">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title nanum" style="font-size: 30px;">미니 프로필</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" style="font-size: 20px;">
								<form action="">
									<div style="width:200px; height:200px; border-radius: 70%; overflow: hidden" class="mt-5 ml-5 mr-5 mb-3">
										<img id="wasspic" src="${contextPath}/resources/img/usericon.png" style="width:100%; height:100%; object-fit:cover" class="">
									</div>
									<div class="nanum text-center" style="font-size: 25px;">
										<span id="wassNick"class="">프로필</span>
									</div>
									<div class="nanum text-center"
										style="font-size: 20px; color: darksalmon;">
										<span id="wassGender"class="">중성</span> <span id="wassAge"class="">1세</span>
									</div>
									<br>
									<div class="nanum text-center"
										style="font-size: 20px; color: brown;">
										<!-- <span class="wassHobby">#축구</span> <span class="wassHobby">#영화</span> <span class="wassHobby">#자전거</span> -->
									</div>
									<br>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary nanum form-control"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>

<script>


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	// 말풍선 눌러서 목록 뜨게 하는 함수 (문제 없음)
	var iconStatus = true;
		$(function() {
	
		$('button.iconImg').click(function() {
			if (iconStatus == true) {
				$('.container2').show(200);
				iconStatus = false;
			} else {
				$('.container2').hide(200);
				iconStatus = true;
			}
			//console.log(iconStatus)
		});
	}); 
	
	// 사진 클릭시 프로필 모달 (넘버로)
	$(document).on("click", ".detect1", function(){
		//console.log(this.value);
		var yourNo = this.value
		
		$.ajax({
			url : "${contextPath}/friends/detect1",
			type : "POST",
			data : {"yourNo" : yourNo },
			success : function(result){
				var root = "${contextPath}";
				var $savePath = root +"/resources/profileImage/";
				$("#wassNick").text(result.memberNickname);
				$("#wassGender").text(result.memberGender);
				$("#wassAge").html(result.memberAge);
				$finalPath = $savePath + result.memberProfileUrl;
				//console.log($finalPath);
				$("#wasspic").prop("src",$finalPath);
				
				
				
				/*$(".wassHobby").val(result.[memberHobby); */
				
				
				
			},
			error : function(){
				//console.log("프로필 띄우는 aJax 실패");
			}
		});
		
	}); // 프로필 모달 기능 완료
	
	// 사진 클릭시 프로필 모달 (닉네임으로)
	$(document).on("click", ".detect2", function(){
		//console.log(this.value);
		var yourNick = this.value
		
		$.ajax({
			url : "${contextPath}/friends/detect2",
			type : "POST",
			data : {"yourNick" : yourNick },
			success : function(member){
				//console.log(member);
				var root = "${contextPath}";
				var $savePath = root +"/resources/profileImage/";
				$("#wassNick").text(member.memberNickname);
				$("#wassGender").text(member.memberGender);
				$("#wassAge").html(member.memberAge);
				$finalPath = $savePath + result.memberProfileUrl;
				$("#wasspic").prop("src",$finalPath);
				
				
				
				/* $(".wassHobby").val(result.memberHobby); */
				
				
				
			},
			error : function(){
				//console.log("프로필 띄우는 aJax 실패");
			}
		});
		
	}); // 프로필 모달 기능 완료


	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////        		여기부터 친구요청 기능           ///////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	

	
	
	/* 친구 요청 목록 조회 함수 */
 	 function friendRequest(){
		$.ajax({
			url : "${contextPath}/friends/friendRequest",
			type : "POST",
			data : {},
			datatype : "json",
			success : function(result){
 				console.log("친구요청목록");
				console.log(result);
				var $friendReq = $("#friendReq");
				var $friendRequestArea = $("#friendRequestArea");
				//var root = $("#profileRoot").val();
				var root = "${contextPath}";
				var $savePath = root +"/resources/profileImage/";
				if(result == ""){
					$msg = $("<span>").html("지금은 친구요청이 없네요.");
					$friendRequestArea.css("text-align","center");
					$friendRequestArea.html($msg);
					
				}else {
					$friendRequestArea.html("") // 기존 html 내용 삭제
					
					$.each(result, function(i){
						
						var $finalPath = $savePath + result[i].memberProfileUrl;
						var $div0 = $("<div>").prop("class", "row col-md-12").css({"margin-bottom":"5px"});
						
						var $div1 = $("<div>").css({"width":"40px","height":"40px","border-radius":"70%","overflow":"hidden","margin-left":"15px","margin-top":"15px"});
						var $rImg = $("<img>").prop("class", "rImg detect1").prop("src", $finalPath).css({"width":"100%","height":"100%","object-fit":"cover"}).attr('data-toggle', "modal").attr('data-target', "#profilePicture").val(result[i].memberNo);
						var $div2 = $("<div>").prop("class", "col-md-5").css({"margin-top":"20px"});
						var $rUser = $("<span>").prop("class", "rUser").html(result[i].memberNickname);
						var $div3 = $("<div>").prop("class", "btnClass").css({"margin-top":"20px","margin-left":"27px"});
						var $rOk = $("<button>").prop("class", "btn btn-info btn-sm nanum addFriend").attr('data-toggle', "modal").attr('data-target', "#yesBtn").
						html("수락").val(result[i].memberNo);
						var $rNo = $("<button>").prop("class", "btn btn-warning btn-sm nanum rejectFriend").attr('data-toggle', "modal").attr('data-target', "#noBtn").
						html("거절 ").val(result[i].memberNo);
						var $block = $("<button>").prop("class", "btn btn-danger btn-sm nanum blockFriend").attr('data-toggle', "modal").attr('data-target', "#blockBtn").
						html("차단").val(result[i].memberNo);
						var $hr = $("<hr>");
						
						$div1.append($rImg);
						$div2.append($rUser);
						$div3.append($rOk).append($rNo).append($block);
						
						$div0.append($div1).append($div2).append($div3);
						$friendRequestArea.append($div0);
						$friendReq.append($friendRequestArea); 
						
						
						/* $friendRequestArea.append($rImg).append($rUser).append($rOk).append($rNo).append($hr);
						$friendReq.append($friendRequestArea) */
						
										
					}); //$.each 끝
					
				} //else 끝
				
			},
			error : function(){
				//console.log("친구 요청 목록을 불러오는 aJax 실패");
			}
		});
	};   // 친구 요청 목록 Ajax 완료
	
	
	// 수락 버튼을 누르면 Controller로 값 넘기기
	$(document).on("click", ".addFriend", function(){
		//console.log(this.value);
		var yourNo = this.value
		
		$.ajax({
			url : "${contextPath}/friends/addFriend",
			type : "POST",
			data : {"yourNo" : yourNo },
			success : function(){
				//console.log("친구 수락 성공")
				/* aaaaaaaaaaaaaaaaa알람 관련 추가aaaaaaaaaaaaaaaaa */
				sendAlarm(yourNo);
				removeAlarm("3", yourNo);
				/* aaaaaaaaaaaaaaaaa알람 관련 추가aaaaaaaaaaaaaaaaa */
			},
			error : function(){
				//console.log("친구 수락하는 aJax 실패");
			}
		});
		
	}); // 친구 요청 수락 기능 완료
	
	
	// 거절 버튼을 누르면 Controller로 값 넘기기
	$(document).on("click", ".rejectFriend", function(){
		//console.log(this.value);
		var yourNo = this.value
		
		$.ajax({
			url : "${contextPath}/friends/rejectFriend",
			type : "POST",
			data : {"yourNo" : yourNo },
			success : function(){
				$(".blockFriend").val(yourNo)
			},
			error : function(){
				//console.log("친구 거절하는 aJax 실패");
			}
		});
		
	}); // 친구 요청 거절 기능 완료
	
	
	// 차단 버튼을 누르면 Controller로 값 넘기기
	$(document).on("click", ".blockFriend", function(){
		//console.log(this.value);
		var yourNo = this.value
		
		$.ajax({
			url : "${contextPath}/friends/blockFriend",
			type : "POST",
			data : {"yourNo" : yourNo },
			success : function(){
				//console.log("친구 차단 성공")			
			},
			error : function(){
				//console.log("친구 차단하는 aJax 실패");
			}
		});
		
	}); // 친구 차단 기능 완료
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////        		 여기부터 친구 목록 스크립트           /////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	function friendsList(){
		$.ajax({
			url : "${contextPath}/friends/friendsList",
			type : "POST",
			data : {},
			datatype : "json",
			success : function(result){
				console.log("친구목록불러오기");
				console.log(result);
				var $friendList = $("#friendList");
				var $friendInfo = $("#friendInfo");
				//var root = $("#profileRoot").val();
				var root = "${contextPath}";
				var $savePath = root + "/resources/profileImage/";
				if(result == null){
					$msg = $("<span>").html("지금은 친구가 없네요.");
					$friendInfo.css("text-align","center").css("margin-top","15px");
					$friendInfo.html($msg);
					
				}else {
					
					$friendInfo.html("") // 기존 html 내용 삭제
					
					$.each(result, function(i){
						var $div0 = $("<div>").prop("class", "row col-md-12").css({"margin":"0px","padding-bottom":"5px"});
						var $finalPath = $savePath + result[i].memberProfileUrl;
						var $div1 = $("<div>").prop("class", "col-md-6 row").css({"margin-left": "1px","margin-top": "10px","padding":"0px"});
						/* 미현수정 */
						var $imgDiv = $("<div>").css({"width":"40px","height":"40px","border-radius":"70%","overflow":"hidden"});
						/* 미현수정 */
						var $fImg = $("<img>").prop("class", "fImg detect1").prop("src", $finalPath).css({"width":"100%","height":"100%","object-fit":"cover"}).attr('data-toggle', "modal").attr('data-target', "#profilePicture").val(result[i].memberNo);
						var $fUser = $("<span>").prop("class", "fUser").css({"margin-top":"5px","margin-left":"10px"}).html(result[i].memberNickname);
						var $div2 = $("<div>").prop("class", "btnclass").css({"margin-top":"15px","padding":"0px","margin-left":"56px"});
						var $fTalk = $("<button>").prop("class", "btn btn-info btn-sm nanum friendTalk").html("대화").val(result[i].memberNo);
						var $fbye = $("<button>").prop("class", "btn btn-warning btn-sm nanum friendBye").attr('data-toggle', "modal").attr('data-target', "#byeBtn").
						html("삭제").val(result[i].memberNo);
						var $block = $("<button>").prop("class", "btn btn-danger btn-sm nanum blockFriendInList").attr('data-toggle', "modal").attr('data-target', "#blockBtn").
						html("차단").val(result[i].memberNo);
			/* 			var $hr = $("<hr>"); */
						var $br = $("<br>");
						
						$imgDiv.append($fImg);
						$div1.append($imgDiv).append($fUser);
						//$div1.append($imgDiv).append($fImg).append($fUser);
						$div2.append($fTalk).append($fbye).append($block);
						
						$div0.append($div1).append($div2);
						
						$friendInfo.append($div0);
						$friendList.append($friendInfo);/* .append($hr); */
						
									
					}); //$.each 끝
					
				} //else 끝
				
			},
			error : function(){
				//console.log("친구 목록을 불러오는 aJax 실패");
			}
		});
	};   // 친구 목록 Ajax 완료
	
	
	// 친구 목록에서 대화방 개설
	$(document).on("click", ".friendTalk", function(){
		//console.log(this.value);
		var yourNo = this.value
		
		$.ajax({
			url : "${contextPath}/friends/friendTalk",
			type : "POST",
			data : {"yourNo" : yourNo },
			success : function(){
				//console.log("대화방 진입 성공")			
			},
			error : function(){
				//console.log("대화방 진입 aJax 실패");
			}
		});
		
	}); // 친구 목록에서 대화방 개설
	
	
	// 친구목록에서 친구삭제
	$(document).on("click", ".friendBye", function(){
		//console.log(this.value);
		var yourNo = this.value
		
		$.ajax({
			url : "${contextPath}/friends/friendBye",
			type : "POST",
			data : {"yourNo" : yourNo },
			success : function(){
				//console.log("친구 삭제 ajax 성공")			
			},
			error : function(){
				//console.log("친구 삭제 aJax 실패");
			}
		});
		
	}); // 친구 삭제 기능 완료
	
	
	// 친구목록에서 차단하기
	$(document).on("click", ".blockFriendInList", function(){
		//console.log(this.value);
		var yourNo = this.value
		
		$.ajax({
			url : "${contextPath}/friends/blockFriendInList",
			type : "POST",
			data : {"yourNo" : yourNo },
			success : function(){
				//console.log("친구 차단 성공")			
			},
			error : function(){
				//console.log("친구 차단하는 aJax 실패");
			}
		});
		
	}); // 친구 차단 기능 완료
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////        		여기부터 친구대화 기능           ///////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	

	function friendtalk(){
		$.ajax({
			url : "${contextPath}/friends/friendtalk",
			type : "POST",
			data : {},
			datatype : "json",
			success : function(result){
				console.log("대화방 목록 출력");
				console.log(result);
				var $chatList = $("#chatList");
				var root = "${contextPath}";
				var $savePath = root + "/resources/profileImage/";
				
				if(result == null){
					$msg = $("<span>").html("아직 채팅이 개설된 방이 없어요!");
					$chatList.css("text-align","center").css("margin-top","15px");
					$chatList.html($msg);
					
				}else {
					
					$chatList.html("") // 기존 html 내용 삭제
					
					$.each(result, function(i){
						var $finalPath = $savePath + result[i].memberProfileUrl;
						var $nickname = result[i].memberNickname;
						var $noReadCount = result[i].noReadCount;
						var $lastMSG = result[i].lastMessage;
						var $div0 = $("<div>").prop("class","nanum mt-3 ml-3 chatRoom").css({"overflow":"hidden","height":"70px"}).val(result[i].roomNo);
						
						var $divrow1 = $("<div>").prop("class", "row col-md-12");
						var $div1 = $("<div>").prop("class","roomImg").css({"width":"40px","height":"40px","overflow":"hidden","border-radius": "70%"});
						var $img = $("<img>").prop("class", "cImg detect2").prop("src", $finalPath).css({"width":"100%","height":"100%","object-fit":"cover"}).attr('data-toggle', "modal").attr('data-target', "#profilePicture").val(result[i].memberNickname);
						var $div2 = $("<div>").prop("class","roomTitle col-md-10");
						var $span1 = $("<span>").prop("class", "cUser1");
						var $nick = $nickname;
						
						var $divrow2 = $("<div>").prop("class", "row");
						var $div3 = $("<div>").prop("class","roomImg col-md-8").css({"margin-left": "14%"});
						var $span2 = $("<span>").prop("class", "cUser2");
						var $lastMessage = $lastMSG;
						var $div4 = $("<div>").prop("class","roomImg");
						var $span3 = $("<span>").prop("class", "badge badge-pill badge-danger mr-3 mt-2 cUser3").css({"margin-left": "55%"});
						var $noRead = $noReadCount;
						
						var $hr = $("<hr>");
						
						$div1.append($img);
						$span1.append($nick);
						$div2.append($span1);
						$divrow1.append($div1).append($div2);
						
						$span2.append($lastMessage);
						$div3.append($span2);
						$span3.append($noRead);
						$div4.append($span3);
						$divrow2.append($div3).append($div4);
						
						$div0.append($divrow1).append($divrow2);
						
						$chatList.append($div0).append($hr);
						
									
					}); //$.each 끝
					
				} //else 끝
				
			},
			error : function(){
				//console.log("친구 대화 목록을 불러오는 aJax 실패");
			}
		});
	};   // 친구 대화 목록 Ajax 완료
	
	//////////////////////////태훈 수정 시작하는 시점(ctrl + z)용////////////////////////////////
	
	// 대화방 진입 Ajax
	$(document).on("dblclick", ".chatRoom", function(){
		//console.log(this.value);
		chatView(this.value)
	});
	
	function chatView(roomNo) {
		$("#chat").show();
		$("#chatList").hide();
		//console.log(roomNo);
		//console.log("챗뷰 콘솔")
		
		$.ajax({
			url : "${contextPath}/friends/inToRoom",
			type : "POST",
			data : {"roomNo" : roomNo},
			dataType : "json",
			success : function (result){
				console.log(result);
				console.log("대화방 진입 Ajax 성공");
				
				var $chat = $("#chat");
				var root = "${contextPath}";
				var $savePath = root + "/resources/profileImage/";
				
				if(result.length == 0){
					$msg = $("<span>").html("아직 채팅이 개설된 방이 없어요!");
					$chat.css("text-align","center");
					$chat.html($msg);
					
				}else {
					
					$chat.html("") // 기존 html 내용 삭제
					
					var $div1 = $("<div>").prop("id","div_chat");
					var $mNo = $("<input>").prop("id","mNoo").prop("type", "hidden").val(result[0].memberNo);
					var $rNo = $("<input>").prop("id","rNoo").prop("type", "hidden").val(result[0].roomNo);
					var $xBtn = $("<button>").prop("id","exitBtn").prop("class", "close xBtn mr-2").css({"position":"fixed","margin-left":"19%","z-index":"5"}).html("&times");
					var $div2 = $("<div>").prop("id","menu_scroll_down");
					var $dBtn = $("<button>").prop("id", "btn_scroll_down").css("float","right").html("↓");
					var $br1 = $("<br>");
					
					$div1.append($mNo).append($rNo).append($xBtn).append($br1);
					$chat.append($div1);
					
					
					
					$.each(result, function(i){
						var $finalPath = $savePath + result[i].memberProfileUrl;
						var $nickname = result[i].memberNickname;
						var $msgContent = result[i].msgContent;
						
						
						var $div3 = $("<div>").prop("class", "col-md-12 row").css({"padding-bottom":"10px","padding-left":"20px","margin":"0px"});
						var $div4 = $("<div>").prop("class", "nanum").css({"width":"40px","height":"40px","overflow":"hidden","border-radius":"70%"});
						var $img = $("<img>").prop("class", "cImg").prop("src", $finalPath).css({"width":"100%","height":"100%","object-fit":"cover"});
						var $div5 = $("<div>").prop("class", "col-md-10 nanum");
						var $span1 = $("<span>");
						var $nick = $nickname;
						var $br2 = $("<br>");
						var $span2 = $("<span>");
						var $msg = $msgContent;
						var $br3 = $("<br>");
						
						
						
						$div4.append($img);
						$span1.append($nick).append($br2);
						$span2.append($msg);
						$div5.append($span1).append($span2);
						$div3.append($div4).append($div5).append($br3);
						
						
						$chat.append($div3);
						
									
					}); //$.each 끝
					
					var $table1 = $("<table>").prop("id", "table_chat");
					var $colg = $("<colgroup>");
					var $col1 = $("<col>").css("width", "300px");
					var $col2 = $("<col>").css("width", "600px");
					var $thead1 = $("<thead>");
					var $tbody1 = $("<tbody>");
					
					var $table2 = $("<table>").prop("id","append_table");
					var $thead2 = $("<thead>");
					var $tbody2 = $("<tbody>").css({"position":"fixed","top": "826px"});
					var $tr1 = $("<tr>");
					var $td1 = $("<td>");
					var $input = $("<input>").prop("id","messageM").prop("class", "nanum form-control").css("width","320px");
					var $td2 = $("<td>");
					var $sBtn = $("<button>").prop("id","sendBtn").prop("class", "btn btn-success nanum").html("전송");
					
					
					
					$colg.append($col1).append($col2);
					$table1.append($colg).append($thead1).append($tbody1);
					
					$td1.append($input);
					$td2.append($sBtn);
					$tr1.append($td1).append($td2);
					$tbody2.append($tr1);
					$table2.append($thead2).append($tbody2);
					
					
					$chat.append($table1).append($table2);
					$("#chat").scrollTop($("#chat")[0].scrollHeight);
					
					//모든 페이지가 요청이 되었을 때
	                 $(document).ready(function() {
	                     // ID를 alpreah_input로 가지는 곳에서 키를 누를 경우
	                     $("#messageM").keydown(function(key) {
	                         //키의 코드가 13번일 경우 (13번은 엔터키)
	                         if (key.keyCode == 13) {
	                             $("#sendBtn").click();
	                         }
	                     });
	                    
	                 });
					
				} //else 끝
				
			},
			error : function(){
				//console.log("대화방 진입 Ajax 실패");
			}
		});
	}
	
	
	// 대화방 나가기
	 $(document).on("click", ".xBtn", function(){
		//console.log(this.value);
		$("#chatList").show();
		$("#chat").hide();
		var yourNo = this.value
		
		$.ajax({
			url : "${contextPath}/friends/outRoom",
			type : "POST",
			data : {"yourNo" : yourNo },
			success : function(){
				//console.log("대화방 나가기 Ajax 성공")			
			},
			error : function(){
				//console.log("대화방 나가기 Ajax 실패");
			}
		});
		
	});
	
	
	
	 ////////////////////////////////  메신저 소켓 시작해보는중.... ////////////////////////////////////
	/* SockJS객체생성 보낼 url경로를 매개변수로 등록 */
	
	var chat = new SockJS("<c:url value='/chat'/>");
	chat.onmessage = onMessage;
	//chat.onclose = onClose;
	var today = null;
	
	$(function(){
		$(document).on("click", "#sendBtn", function(){
			
			var rNo = $("#rNoo").val();
			var mNo = $("#mNoo").val();
			var message = $("#messageM").val();
			
			// 에이잭스로 컨트롤러 ㄱㄱ 저장
			$.ajax({
			url : "${contextPath}/friends/saveMessage",
			type : "POST",
			data : {"rNo" : rNo , "mNo" : mNo , "message" : message},
			success : function(result){
				chatView(rNo);
			},error : {
				
			}
			
			});
			
			sendMessage(rNo + "," + mNo + "," + message);
			$("#messageM").val('');
		});
		
		$(document).on("click", "#exitBtn", function(){
			//console.log("exit message.....");
			/* 채팅창에 작성한 메세지 전송 */
			//sock.onclose();
		});
		
	});
	//var message = $roomNo + "," + $memberNo + "," + $input;
	function sendMessage(message){
		/* 맵핑된 핸들러 객채의 handleTextMessage매소드가 실행 */
		chat.send(message);
	};
	
	function onMessage(evt){
		var data=evt.data;//new text객체로 보내준 값을 받아옴.
		var host=null;//메세지를 보낸 사용자 ip저장
		var strArray=data.split("|");//데이터 파싱처리하기
		var userName=null;//대화명 저장
		/* messagefunction(); */
		//console.log("소켓통신");
		//console.log(data);
		chatView(data);
	
	}
	
	/* function onClose(evt){
		location.href='${pageContext.request.contextPath};';
	}; */
	
// 	 에이잭스 실행 주기 함수 
	 $(function(){
		friendRequest(); 	// 친구 요청 목록
		friendsList(); 		// 친구 목록 불러오기
		friendtalk();		// 대화 목록 불러오기
		
 	 setInterval(function(){ // 갱신 주기
			friendRequest(); 
			friendsList();
			friendtalk();
		}, 1000);   
		
	});
	
	/* 대화방 스크롤 */
	/* $(document).ready(function(){
		$("#chat").scrollTop($("#chat")[0].scrollHeight);
	});
		 */
</script>




