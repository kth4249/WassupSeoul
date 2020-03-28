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
	border: 2px solid black;
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
				<ul class="nav nav-tabs nanum">
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
				style="overflow: auto; height: 500px; background-color: #FFFFFF;">
				
<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
				<!-- 친구 목록 -->	
				<div class="tab-pane fade active show tgl" id="friendsList">
					<div class="nanum" id="friendInfo">
						<br> 
						<img src="${contextPath}/resources/img/usericon.png"
							width="40px" height="40px" class="ml-3 fImg" data-toggle="modal"
							data-target="#profilePicture" style="cursor: pointer"> &nbsp;
						<span class="fUser" style="font-size: 20px;">안중하</span> &nbsp;
						<button type="button"
							class="btn btn-outline-danger btn-sm nanum float-right mr-3"
							data-toggle="modal" data-target="#">차단</button>
						<button type="button"
							class="btn btn-outline-info btn-sm nanum float-right mr-3 talkFriend" 
							id="chatBtn">대화</button>
					</div>
					<hr>
				</div>

<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
				<!-- 대화방 목록 -->		
				<div class="tab-pane fade tgl" id="chatList">
					<div id="roomOne" class="nanum mt-3 ml-3 chatRoom">
						<div class="roomImg" style="display: inline-block;">
							<img class="cImg" src="${contextPath}/resources/img/usericon.png" width="40px"
								height="40px" class="chatProfile" data-toggle="modal"
								data-target="#profilePicture" style="cursor: pointer">&nbsp;
						</div>
						<div class="roomTitle" style="display: inline-block;">
							<span>천사</span> <span class="mr-0">: 밥먹어 </span>
						</div>
						<span class="badge badge-pill badge-danger float-right mr-3 mt-2">5</span>
					</div>
					<hr>

					<div class="nanum ml-3 chatRoom">
						<div class="chatPf" style="display: inline-block;">
							<img src="${contextPath}/resources/img/usericon.png" width="40px"
								height="40px" class="chatProfile" data-toggle="modal"
								data-target="#profilePicture" style="cursor: pointer">&nbsp;
						</div>
						<div style="display: inline-block;">
							<span>악마</span> <span>: 돼지새끼</span>
						</div>
						<span class="badge badge-pill badge-danger float-right mr-3 mt-2">3</span>
					</div>
					<hr>
				</div> 
				<!-- 대화방 목록 끝 -->


<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
				<!-- 친구요청 div -->
				<div class="tab-pane fade tgl" id="friendReq">
					<div class="nanum mt-3 ml-3" id="friendRequestArea">
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
				                    <!-- 채티창 div 시작 -->
                    <div class="tab-pane chat nanum" id="chat">
                        <!-- 닫기 버튼 -->
                        <div id="div_chat">
                        	<button type="button" class="close xBtn">&times;</button>
                        </div>
                        <!-- 스크롤 다운 버튼 -->
                        <div id="menu_scroll_down mr-5">
                            <button id="btn_scroll_down" style="float: right;">↓</button>
                        </div>

                        <br>

                        <!-- 하나의 msg 객체 -->
                        <div class="row">
                            <div class="col-md-12 nanum">
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
                            </div>
                        </div>
                        <br>
                        <!-- 하나의 msg 객체 -->
                        <div class="row">
                            <div class="col-md-12 nanum">
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
                            </div>
                        </div>
                        <br>
                        <!-- 하나의 msg 객체 -->
                        <div class="row">
                            <div class="col-md-12 nanum">
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
				
\<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->			
				
				
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
									<div>
										<img src="${contextPath}/resources/img/usericon.png" width="200px"
											height="200px" class="ml-5 mr-5 mt-5 mb-3">
									</div>
									<div class="nanum text-center" style="font-size: 35px;">
										<span class="">안중하</span>
									</div>
									<div class="nanum text-center"
										style="font-size: 20px; color: darkblue;">
										<span class="">남성</span> <span class="">31세</span>
									</div>
									<br>
									<div class="nanum text-center"
										style="font-size: 20px; color: brown;">
										<span class="">#축구</span> <span class="">#영화</span> <span class="">#자전거</span>
									</div>
									<br>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary nanum"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>

<script>

////////////////////////////////////////////////쓰지 않지만 혹시 모르는 코드들/////////////////////////////////////////////////////////////

/* 	// JS 최상위 주소 구하기
function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

// 프로필 이미지 따올 주소

$(document).ready(function(){
	$("#profileRoot").val( getContextPath() );
}); */

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
	
	
	
	// 대화목록에서 대화방으로 들어가는 함수
	//var chatclick = false;
		$(function() {
			$(".chatRoom").dblclick(function() {
				//if (chatclick == false) {
					$("#chat").show();
					$("#chatList").hide();
					//chatclick = true;
				//}
			});
		});
		
		// 대화방에서 대화목록으로 나오는 함수
		$(function() {
			$(".xBtn").click(function() {
				$("#chatList").show();
				$("#chat").hide();
				//chatclick = false;
			});
		}); 


	// 채팅방 내부 작동 레디함수
	$(function() {
		var isScrollUp = false;
		var lastScrollTop;
		var unreadCnt = 0;
		
		var divChat = document.getElementById('chat');
											//채팅방
		/* 전송 버튼 클릭 시 */
		$('#btn_append_row').on("click",function() {
					// 라인 추가
					$('#table_chat').append($('<tr>').append($('<td>').append($('#add_name').val()),
									$('<td>').append($('#add_msg').val())));

					if (isScrollUp) {
						// 메뉴가 보이는 상태에서 새로운 라인 추가 시 안 읽은 수 표시
						unreadCnt++;
						$('#btn_scroll_down').html('↓ ' + unreadCnt);
					}

					// 기본적으로 스크롤 최하단으로 이동 (애니메이션 적용)
					if (!isScrollUp) {
						$('#div_chat').animate(
								{
									scrollTop : divChat.scrollHeight
											- divChat.clientHeight
								}, 100);
					}
		});

												
												
		/* 메뉴 스크롤 ↓ 버튼 클릭 시 */
		$('#btn_scroll_down').on('click', function() {
			// 마지막으로 보고 있었던 (스크롤을 올리기 시작했던) 위치로 이동
			$('#div_chat').animate({
				scrollTop : lastScrollTop
			}, 100);

			if (lastScrollTop == divChat.scrollHeight - divChat.clientHeight) {
				// 마지막 위치와 스크롤 최하단이 같다면 (새로 추가된 라인이 없다면) 메뉴 숨김
				$("#menu_scroll_down").css("top", "200px");
				isScrollUp = false;
				unreadCnt = 0;
				$('#btn_scroll_down').html('↓');
			} else {
				// 마지막 위치와 스크롤 최하단이 다르다면 (새로 추가된 라인이 있다면) 마지막 위치를 최하단으로 변경
				lastScrollTop = divChat.scrollHeight - divChat.clientHeight;
			}
		})
		
		
		
		

		/* 스크롤 이벤트 */
		$("#div_chat").on(
				'mousewheel DOMMouseScroll',
				function(e) {
					var E = e.originalEvent, delta = E.wheelDelta || -E.detail;

					// 메뉴를 숨겼을 때만 마지막 위치 저장
					if (!isScrollUp) {
						lastScrollTop = $(this).scrollTop();
					}

					// 스크롤이 생겼을 때
					if ($(this).scrollTop() > 0) {
						if (delta < 0) {
							// 스크롤 내리는 이벤트 중 최하단 도달 시 메뉴 숨김 (-1은 오차 제어)
							if ($(this).scrollTop() > divChat.scrollHeight
									- divChat.clientHeight - 1) {
								$("#menu_scroll_down").css("top", "200px");
								isScrollUp = false;
								unreadCnt = 0;
								$('#btn_scroll_down').html('↓');
							}
						} else {
							// 스크롤 올리는 이벤트 발생 시 메뉴 보임
							$("#menu_scroll_down").css("top", "150px");
							isScrollUp = true;
						}
					}
				});
	});
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////        		여기부터 친구요청 기능           ///////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	

	/* 친구 요청 목록 조회 함수 */
 	 function friendRequest(){
		$.ajax({
			url : "friends/friendRequest",
			type : "POST",
			data : {},
			datatype : "json",
			success : function(result){
				console.log("친구요청 Ajax : " + result);
				var $friendReq = $("#friendReq");
				var $friendRequestArea = $("#friendRequestArea");
				//var root = $("#profileRoot").val();
				var root = "${contextPath}";
				var $savePath = root +"/resources/profileImage/";
				if(result == null){
					$msg = $("<span>").html("지금은 친구요청이 없네요.");
					$friendRequestArea.css("text-align","center")
					$friendRequestArea.html($msg);
					
				}else {
					$friendRequestArea.html("") // 기존 html 내용 삭제
					
					$.each(result, function(i){
						
						var $finalPath = $savePath + result[i].memberProfileUrl;
						//console.log("요청root : " + root);
						//console.log("요청savePath : " + $savePath);
						//console.log("요청finalPath : " + $finalPath);
						var $rImg = $("<img>").prop("class", "rImg").prop("src", $finalPath).css({"width":"40px","height":"40px"});
						var $rUser = $("<span>").prop("class", "rUser").html(result[i].memberNickname + "님이 친구요청을 하셨습니다.");
						var $rOk = $("<button>").prop("class", "btn btn-info btn-sm nanum addFriend").attr('data-toggle', "modal").attr('data-target', "#yesBtn").
						html("수락").val(result[i].memberNo);
						var $rNo = $("<button>").prop("class", "btn btn-danger btn-sm nanum rejectFriend").attr('data-toggle', "modal").attr('data-target', "#noBtn").
						html("거절").val(result[i].memberNo);
						var $block = $("<button>").prop("class", "btn btn-danger nanum blockFriend").attr('data-toggle', "modal").attr('data-target', "#blockBtn").
						html("차단").val(result[i].memberNo);
						var $hr = $("<hr>");
						
						$friendRequestArea.append($rImg).append($rUser).append($rOk).append($rNo).append($hr);
						$friendReq.append($friendRequestArea)
						
										
					}); //$.each 끝
					
				} //else 끝
				
			},
			error : function(){
				console.log("친구 요청 목록을 불러오는 aJax 실패");
			}
		});
	};   // 친구 요청 목록 Ajax 완료
	
	
	// 수락 버튼을 누르면 Controller로 값 넘기기
	$(document).on("click", ".addFriend", function(){
		//console.log(this.value);
		var yourNo = this.value
		
		$.ajax({
			url : "friends/addFriend",
			type : "POST",
			data : {"yourNo" : yourNo },
			success : function(){
				//console.log("친구 수락 성공")			
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
			url : "friends/rejectFriend",
			type : "POST",
			data : {"yourNo" : yourNo },
			success : function(){
				$(".blockFriend").val(yourNo)
			},
			error : function(){
				console.log("친구 거절하는 aJax 실패");
			}
		});
		
	}); // 친구 요청 거절 기능 완료
	
	
	// 차단 버튼을 누르면 Controller로 값 넘기기
	$(document).on("click", ".blockFriend", function(){
		//console.log(this.value);
		var yourNo = this.value
		
		$.ajax({
			url : "friends/blockFriend",
			type : "POST",
			data : {"yourNo" : yourNo },
			success : function(){
				console.log("친구 차단 성공")			
			},
			error : function(){
				console.log("친구 차단하는 aJax 실패");
			}
		});
		
	}); // 친구 차단 기능 완료
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////        		 여기부터 친구 목록 스크립트           /////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	function friendsList(){
		$.ajax({
			url : "friends/friendsList",
			type : "POST",
			data : {},
			datatype : "json",
			success : function(result){
				console.log("친구목록 Ajax : " + result);
				var $friendList = $("#friendList");
				var $friendInfo = $("#friendInfo");
				//var root = $("#profileRoot").val();
				var root = "${contextPath}";
				var $savePath = root + "/resources/profileImage/";
				if(result == null){
					$msg = $("<span>").html("빨리 친구 만들러 가죠! 관심사와 맞는 골목부터 찾아볼까요?");
					$friendInfo.css("text-align","center")
					$friendInfo.html($msg);
					
				}else {
					
					$friendInfo.html("") // 기존 html 내용 삭제
					
					$.each(result, function(i){
					
						var $finalPath = $savePath + result[i].memberProfileUrl;
						//console.log("목록root : " + root);
						//console.log("목록savePath : " + $savePath);
						//console.log("목록finalPath : " + $finalPath);
						var $fImg = $("<img>").prop("class", "fImg").prop("src", $finalPath).css({"width":"40px","height":"40px"});
						var $fUser = $("<span>").prop("class", "fUser").html(result[i].memberNickname);
						var $fTalk = $("<button>").prop("class", "btn btn-info btn-sm nanum friendTalk").html("대화").val(result[i].memberNo);
						var $fbye = $("<button>").prop("class", "btn btn-warning btn-sm nanum friendBye").attr('data-toggle', "modal").attr('data-target', "#byeBtn").
						html("삭제").val(result[i].memberNo);
						var $block = $("<button>").prop("class", "btn btn-danger btn-sm nanum blockFriendInList").attr('data-toggle', "modal").attr('data-target', "#blockBtn").
						html("차단").val(result[i].memberNo);
						var $hr = $("<hr>");
						
						$friendInfo.append($fImg).append($fUser).append($fTalk).append($fbye).append($block).append($hr);
						$friendList.append($friendInfo)
						
									
					}); //$.each 끝
					
				} //else 끝
				
			},
			error : function(){
				console.log("친구 목록을 불러오는 aJax 실패");
			}
		});
	};   // 친구 목록 Ajax 완료
	
	
	// 친구 목록에서 대화방 개설
	$(document).on("click", ".friendTalk", function(){
		//console.log(this.value);
		var yourNo = this.value
		
		$.ajax({
			url : "friends/friendTalk",
			type : "POST",
			data : {"yourNo" : yourNo },
			success : function(){
				console.log("대화방 진입 성공")			
			},
			error : function(){
				console.log("대화방 진입 aJax 실패");
			}
		});
		
	}); // 친구 목록에서 대화방 개설
	
	
	// 친구목록에서 친구삭제
	$(document).on("click", ".friendBye", function(){
		//console.log(this.value);
		var yourNo = this.value
		
		$.ajax({
			url : "friends/friendBye",
			type : "POST",
			data : {"yourNo" : yourNo },
			success : function(){
				console.log("친구 삭제 ajax 성공")			
			},
			error : function(){
				console.log("친구 삭제 aJax 실패");
			}
		});
		
	}); // 친구 삭제 기능 완료
	
	
	// 친구목록에서 차단하기
	$(document).on("click", ".blockFriendInList", function(){
		//console.log(this.value);
		var yourNo = this.value
		
		$.ajax({
			url : "friends/blockFriendInList",
			type : "POST",
			data : {"yourNo" : yourNo },
			success : function(){
				console.log("친구 차단 성공")			
			},
			error : function(){
				console.log("친구 차단하는 aJax 실패");
			}
		});
		
	}); // 친구 차단 기능 완료
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////        		여기부터 친구대화 기능           ///////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	

	function friendtalk(){
		$.ajax({
			url : "friends/friendtalk",
			type : "POST",
			data : {},
			datatype : "json",
			success : function(result){
				console.log("친구대화 Ajax : " + result);
				var $chatList = $("#chatList");
				var $roomOne = $("#roomOne");
				var root = "${contextPath}";
				var $savePath = root + "/resources/profileImage/";
				
				if(result == null){
					$msg = $("<span>").html("아직 채팅이 개설된 방이 없어요!");
					$roomOne.css("text-align","center")
					$roomOne.html($msg);
					
				}else {
					
					$roomOne.html("") // 기존 html 내용 삭제
					
					$.each(result, function(i){
						//var $finalPath = $savePath + cList[i].memberProfileUrl;
						
						var $div1 = $("<div>").prop("class","roomImg").prop("style","display: inline-block");
						//var $img = $("<img>").prop("class", "cImg").prop("src", $finalPath).css({"width":"40px","height":"40px"});
						var $div2 = $("<div>").prop("class","roomTitle").prop("style","display: inline-block");
						var $span1 = $("<span>");//말하는이 //스팬// 라스트메시지
						var $span2 = $("<span>").prop("class", "badge badge-pill badge-danger float-right mr-3 mt-2");
						var $noRead = result[i].noReadCount;
						var $lastMessage = result[i].lastMessage;
						var $hr = $("hr");
						
						$span1.append($lastMessage);
						$span2.append($noRead);
						$div2.append($span1).append($span2)
						$roomOne.append($div2)
						//$roomOne.append($div1).append($div2).append($span1).append($lastMessage).append($span2).append($noRead).append($hr);
						$chatList.append(roomOne);
						
						
									
					}); //$.each 끝
					
				} //else 끝
				
			},
			error : function(){
				console.log("친구 대화 목록을 불러오는 aJax 실패");
			}
		});
	};   // 친구 대화 목록 Ajax 완료
	
	
	
	
	
	 ////////////////////////////////  메신저 소켓 시작해보는중.... ////////////////////////////////////
		/* SockJS객체생성 보낼 url경로를 매개변수로 등록 */
	 /* var sock=new SockJS("<c:url value='/echo'/>"); // 영준아 알람과 메신저 변수 이름 다르게
	sock.onmessage=onAlarm;
	sock.onclose=onClose;
	var today=null; 

	function sendAlarm(memberNo){
		// 맵핑된 핸들러 객채의 handleTextMessage매소드가 실행 
		//console.log(memberNo);
		sock.send(memberNo);
	
	};
	function onAlarm(evt){
		var data=evt.data;//new text객체로 보내준 값을 받아옴.
		var host=null;//메세지를 보낸 사용자 ip저장
		//var strArray=data.split("|");//데이터 파싱처리하기
		var userName=null;//대화명 저장
		

		//전송된 데이터 출력해보기
		// for(var i=0;i<strArray.length;i++)
		//{
		//	console.log('str['+i+'] :' + strArray[i]);	 		
		//} 
		console.log('제대로 잘 전달받았는지 확인 : ' + data)
		$("#alarmButton>img").prop("src", "${contextPath}/resources/img/alarmActive.png")
		

	};

	function onClose(evt){
		location.href='${pageContext.request.contextPath};';
	};  */
	
	
	
	
	
	
	
	
	
	/* 에이잭스 실행 함수 */
	 $(function(){
		friendRequest(); 	// 친구 요청 목록
		friendsList(); 		// 친구 목록 불러오기
		friendtalk();		// 대화 목록 불러오기
		/* setInterval(function(){ // 갱신 주기
			friendRequest(); 
		}, 10000); */
	}); 
</script>




