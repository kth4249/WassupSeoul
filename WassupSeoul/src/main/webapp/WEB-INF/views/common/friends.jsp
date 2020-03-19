<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.tab-content {
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

/* .back {
      height: 1500px;
    } */
.myTabContent {
	z-index: 1;
	position: absolute;
	top: 0;
	right: 0;
}
</style>

<script>
	var iconStatus = true;
	$(function() {

		$('button.iconImg').click(function() {
			if (iconStatus == true) {
				$('.container2').hide(200);
				iconStatus = false;
			} else {
				$('.container2').show(200);
				iconStatus = true;
			}
			console.log(iconStatus)
		});
	});

	var chatclick = false;

	$(function() {
		$(".chatCt").dblclick(function() {
			if (chatclick == false) {
				$(".chat").show();
				$("#profile").hide();
				chatclick = true;
			}
		})
	});

	$(document).ready(function() {
		$(".xBtn").click(function() {
			$("#profile").show();
			$(".chat").hide();
			chatclick = false;
		});

	});
</script>





<div class="back">


	<button type="button" class="iconImg">
		<img src="${contextPath}/resources/img/msgicon2.png" alt=""
			width="50px">
	</button>

	<div class="container2">

		<div class="messengerbox">

			<div class="tabBox">
				<ul class="nav nav-tabs nanum">
					<li class="nav-item col-md-4"><a class="nav-link active"
						data-toggle="tab" href="#home">친구목록</a></li>
					<li class="nav-item col-md-4"><a class="nav-link"
						data-toggle="tab" href="#profile">친구대화</a></li>
					<li class="nav-item col-md-4"><a class="nav-link"
						data-toggle="tab" href="#dropdown1">친구요청</a></li>
				</ul>
			</div>


			<div id="myTabContent" class="tab-content"
				style="overflow: auto; height: 500px;">
				<div class="tab-pane fade show active" id="home">

					<div class="nanum">
						<br> <img src="${contextPath}/resources/img/usericon.png"
							width="40px" height="40px" class="ml-3" data-toggle="modal"
							data-target="#profilePicture" style="cursor: pointer">
						&nbsp; <span class="" style="font-size: 20px;">안중하</span> &nbsp;
						<button type="button"
							class="btn btn-outline-danger btn-sm nanum float-right mr-3"
							data-toggle="modal" data-target="#blockBtn">차단</button>
						<button type="button"
							class="btn btn-outline-info btn-sm nanum float-right mr-3"
							id="chatBtn">대화</button>
					</div>
					<hr>

				</div>

				<div class="tab-pane fade" id="profile">

					<div class="nanum mt-3 ml-3">

						<div class="chatPf" style="display: inline-block;">
							<img src="${contextPath}/resources/img/usericon.png" width="40px"
								height="40px" class="chatProfile" data-toggle="modal"
								data-target="#profilePicture" style="cursor: pointer">
							&nbsp;
						</div>

						<div class="chatCt" style="display: inline-block;">
							<span>김지원</span> <span class="mr-0">: 마뭐하노 뭐하는데 연락이
								안되는데...</span>
						</div>
						<span class="badge badge-pill badge-danger float-right mr-3 mt-2">5</span>

					</div>

					<hr>

					<div class="nanum ml-3">
						<div class="chatPf" style="display: inline-block;">
							<img src="${contextPath}/resources/img/usericon.png" width="40px"
								height="40px" class="chatProfile" data-toggle="modal"
								data-target="#profilePicture" style="cursor: pointer">
							&nbsp;
						</div>
						<div class="chatCt" style="display: inline-block;">
							<span>김태훈</span> <span>: 병 형신이야?</span>
						</div>
						<span class="badge badge-pill badge-danger float-right mr-3 mt-2">3</span>
					</div>
					<hr>
				</div>



				<!-- 친구요청 div -->
				<div class="tab-pane fade" id="dropdown1">
					<div class="nanum mt-3 ml-3" id="friendRequestArea">
						<img src="${contextPath}/resources/img/usericon.png" width="40px"
							height="40px" data-toggle="modal" data-target="#profilePicture"
							style="cursor: pointer"> &nbsp; +
							<span>조미현님이 친구요청을 하셨습니다.</span>&nbsp;
						<button class="btn btn-info btn-sm nanum">수락</button>
						<button class="btn btn-danger btn-sm nanum" data-toggle="modal"
							data-target="#nopeBtn">거절</button>
					</div>
					<hr>
				</div>
				


				<!-- 친구요청 : 거절버튼 -->
				<div class="modal fade" id="nopeBtn">
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
									<span class="nanum">친구 요청 메세지를 거절하셨습니다.</span> 
									<span class="nanum" style="color: red;">차단</span> 
									<span class="nanum">목록에 추가하시겠습니까?</span>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger nanum">차단하기</button>
								<button type="button" class="btn btn-primary nanum"	data-dismiss="modal">삭제하기</button>
							</div>
						</div>
					</div>
				</div>












				<!-- 대화창 -->
				<div class="tab-pane chat nanum" id="chat">
					<div id="div_chat">
						<button type="button" class="close xBtn">&times;</button>
						<br>
						<div class="nanum ml-3">
							<img src="${contextPath}/resources/img/usericon.png" width="30px"
								height="30px" data-toggle="modal" data-target="#profilePicture"
								style="cursor: pointer"> &nbsp; <span>김태훈</span> <br>
							<span style="margin-left: 50px;">테스트중입니다.</span>
						</div>

						<table id="table_chat">
							<colgroup>
								<col style="width: 300px;">
								<col style="width: 600px;">
							</colgroup>
							<thead></thead>
							<tbody></tbody>
						</table>
						<div id="menu_scroll_down">
							<button id="btn_scroll_down">↓</button>
						</div>
						<div id="menu_hide"></div>
					</div>

					<table id="append_table">
						<thead></thead>
						<tbody>
							<tr>
								<td><input type="text" id="add_msg" class="nanum"></td>
								<td><button type="button" class="btn btn-warning nanum"
										id="btn_append_row">전송</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>



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
				<form action="">
					<span class="nanum" style="color: olivedrab;">안중하</span> <span
						class="nanum">님을 차단하셨습니다.</span>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger nanum">차단목록</button>
				<button type="button" class="btn btn-primary nanum"
					data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

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
	$(function() {
		var isScrollUp = false;
		var lastScrollTop;
		var unreadCnt = 0;

		var divChat = document.getElementById('div_chat');

		/* 추가 버튼 클릭 시 */
		$('#btn_append_row').on(
				"click",
				function() {
					// 라인 추가
					$('#table_chat').append(
							$('<tr>').append(
									$('<td>').append($('#add_name').val()),
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
	
	
	
	
	
	/* 친구 요청 목록 조회 함수 */
	function friendRequest(){
		var myNum = "${loginMember.memberNo}";
		console.log = $myNum;
		$.ajax({
			url : "friendRequest",
			type : "POST",
			data : {"myNum" : myNum},
			datatype : "json",
			success : function(fList){
				
				var $fArea = $("#friendRequestArea");
				
			},
			error : function(){
				console.log("ajax 댓글 목록 조회 실패")
			
			
			
		});
	};
	
	$(function(){
		friendRequest();
		
		setInterval(function(){
			friendRequest();
		}, 10000);
	});
	
	
	
	
	
	
	
	
</script>




