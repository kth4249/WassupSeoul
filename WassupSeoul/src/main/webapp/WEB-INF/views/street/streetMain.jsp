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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/timeline.css" type="text/css">
		
<title>타임라인 메인 화면</title>
</head>
<style>
      a:hover {
		   color: #0d0d0d;
		   text-decoration: none;
	 }
	 .navHover:hover{
	 	color: rgb(214, 141, 150) !important;
	 }
	 
</style>

<!-- 3/27 미현 css 대부분 건듦 -->

<body style="background-color : rgb(255, 255, 255);">

	<!-- 골목 네비바 여백 -->
	<div class="container-fluid" style="margin-top: 57px;">
		<div class="row"  style="padding: 0px; height:44px"></div>
	</div>

	<c:if test="${memGradeInSt.citizenStatus eq 'N'}">
	
	</c:if>
	
	<c:if test="${memGradeInSt.citizenStatus eq 'Y'}">
		<!-- 고정된 골목 네비바  -->
		<jsp:include page="../street/streetDetail/streetNav.jsp"/> 
	</c:if>
	
	<!-- 고정된 헤더 -->
	 <jsp:include page="../common/header.jsp"/> 

	<!-- 컨텐츠영역-->
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="../street/streetDetail/streetSide.jsp"/>
			<!-- 사이드1 여백 -->
			<div class="col-md-4" id="devideArea"></div>
			<!-- 사이드1 여백 -->

			<!-- 타임라인-->
			<div class="col-md-4" id="devideArea" style="margin-top: 10px;">
				<c:choose>
					<c:when test="${street.streetPublic eq 'Y'.charAt(0)}"> 
					<!--공개 골목 일떄 -->
					
						<!-- 검색Bar-->
						<div class="row" id="searchArea" style="width: 99%; margin-left: 1px;">
							<jsp:include page="../street/streetDetail/searchBar.jsp"/> 
						</div>
						<!-- 검색Bar -->
		
					  <!-- 글작성 영역 -->
			          <div class="container box111" id="postArea">
                 		<jsp:include page="../street/streetDetail/summernote.jsp"/>
			           <jsp:include page="../street/streetDetail/mapModal.jsp"/> 
			           <jsp:include page="../street/streetDetail/voteModal.jsp"/> 
			           <jsp:include page="../street/streetDetail/sketchModal.jsp"/> 
			           <jsp:include page="../street/streetDetail/divideModal.jsp"/> 
                		<jsp:include page="../street/streetDetail/post.jsp"/>
			          </div>
            		  <!-- 글작성 영역 -->
																			
						<!-- 중간여백 --><div style="height: 20px;"></div>
		
						<!-- 게시글영역-->
						<div class="postWrapView">
						<jsp:include page="../street/streetDetail/timeLine.jsp"/> 
						</div>
						<!-- 게시글영역 끝-->
						
					<!--공개 골목 일떄 -->
					</c:when>
					<c:when test="${memGradeInSt.citizenStatus eq 'Y'}">
					<!--회원 골목 가입 되어 있을때 -->
					
						<!-- 검색Bar-->
						<div class="row" id="searchArea" style="width: 99%; margin-left: 1px;">
							<jsp:include page="../street/streetDetail/searchBar.jsp"/> 
						</div>
						<!-- 검색Bar -->
		
					  <!-- 글작성 영역 -->
			          <div class="container box111" id="postArea">
                 		<jsp:include page="../street/streetDetail/summernote.jsp"/>
			           <jsp:include page="../street/streetDetail/mapModal.jsp"/> 
			           <jsp:include page="../street/streetDetail/voteModal.jsp"/> 
			           <jsp:include page="../street/streetDetail/sketchModal.jsp"/> 
			           <jsp:include page="../street/streetDetail/divideModal.jsp"/> 
                		<jsp:include page="../street/streetDetail/post.jsp"/>
			          </div>
            		  <!-- 글작성 영역 -->
		
						<!-- 중간여백 --><div class="row" style="height: 20px; background-color: rgb(221, 233, 218);"></div>
		
						<!-- 게시글영역-->
						<div class="postWrapView">
						<jsp:include page="../street/streetDetail/timeLine.jsp"/> 
						</div>
						<!-- 게시글영역 끝-->
						
					<!--회원 골목 가입 되어 있을때 -->			
					</c:when>
					<c:otherwise>  
					<!-- 회원 골목 가입 안되어 있고, 비공개 골목 일떄-->
							<div class="container box111" id="postArea">
								<div class="postLayoutView" style="padding: 0%; height: 500px; border: solid black 1px">
									<div class="nanum " style="font-size: 20px; text-align: center;">
										<div style="height: 200px"></div>
										<div class="noPostSignArea container" style="width: 60%;">
											<p class="noPostSign">멤버만 게시글을 볼 수 있습니다. <br> 골목에 가입해 보세요!</p>
										</div>
									</div>
								</div>
							</div>
					<!-- 회원 골목 가입 안되어 있고, 비공개 골목 일떄-->
					</c:otherwise>
				</c:choose>
			</div>
			<!-- 타임라인-->
			
			<!-- 사이드2 여백 -->
			<div class="col-md-4" id="devideArea"></div>
			<!-- 사이드2 여백 -->
			
			<!-- ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ정승환 코드 추가 시작(20.03.25) ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ -->
			<!-- 일정 참석 모달창 -->
			<jsp:include page="../street/streetDetail/joinCalendarModal.jsp"/>
			<!-- ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ정승환 코드 추가 끝(20.03.25) ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ -->
			
			
			
			
			
		</div>
		
		<!-- 3/27 미현 뮤직플레이어  -->
		<!-- <div id="cp_widget_d585b800-05f5-422f-8105-1123e2322535">...</div>
		<script type="text/javascript">
			var cpo = []; cpo["_object"] ="cp_widget_d585b800-05f5-422f-8105-1123e2322535"; 
			cpo["_fid"] = "AQAAfqOAdxxo";
			var _cpmp = _cpmp || []; 
			_cpmp.push(cpo);
				(function() { 
					var cp = document.createElement("script"); 
					cp.type = "text/javascript";
					cp.async = true; 
					cp.src = "//www.cincopa.com/media-platform/runtime/libasync.js";
			var c = document.getElementsByTagName("script")[0];
			c.parentNode.insertBefore(cp, c); })(); 
			</script> -->
			
	
	</div>
	<!-- 컨텐츠영역 종료 -->

	<script>
			// 새로고침
			function refreshList() {
				location.reload();
			}
			// 글삭제
			$(".deletePost").click(function() {
				var postNo = $(this).attr("id");
				//var divBox = $(this).parent(".box111");

				$.ajax({
					url : "deletePost",
					data : {postNo : postNo},
					type : "post",
					success : function(result) {
						if (result == "true") {
							system.out.println("게시글 삭제 성공")
							//divBox.remove();
						} else {
							system.out.println("게시글 삭제 실패")
						}
					},
					error : function(e) {
						console.log("ajax 통신 실패");
						console.log(e);
					}
				});
				refreshList()
			}); 
			
			// 댓글작성
			$(".commentBtn").click(function() {
				var postNo = $(this).attr("name");
				//var divBox = $(this).parent(".box111");
				var commentContent = $(this).parent().prev().find("textarea").val();
				var replyCount = $(this).parent().parent().parent().prev("div" > ".commentCount").text().substring( 2 );
				
				if(replyCount==""){
					replyCount=0;
				}
				console.log("replyCount:"+replyCount);
				console.log("댓글입력내용:"+commentContent);
				console.log("댓글 입력 게시글 번호 :"+postNo);
												
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
			
			// 대댓글작성
			$(".reCommentBtn").click(function() {
				var replyNo = $(this).attr("name");
				var boardNo = $(this).attr("id");
				var commentContent = $(this).parent().prev().find("textarea").val();
				var reReplyCount = $(this).parent().parent().parent().prev("div" > ".reCommentCount").text().substring( 2 );
				
				if(reReplyCount==""){
					reReplyCount=0;
				}
				console.log("reReplyCount:"+reReplyCount);
				console.log("댓글입력내용:"+commentContent);
				console.log("대댓글 달린 댓글 번호 :"+replyNo);
												
				$.ajax({
					url : "writeReComment",
					data : {"replyNo" : replyNo, "commentContent" : commentContent, "boardNo" : boardNo },
					type : "post",
					success : function(result) {
						
						if (result == "true") {
							reReplyCount++;
							$(this).parent().parent().parent().prev("div" > ".commentCount").text("댓글"+replyCount);
							console.log("대댓글 작성 성공");
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
			

			// 글수정
			/* $(".updatePost").click(function() {
				var postNo = $(this).attr("id");
				//var divBox = $(this).parent(".box111");

				$.ajax({
					url : "updatePost",
					data : {
						postNo : postNo
					},
					type : "post",
					success : function(result) {
						if (result == "true") {
							system.out.println("게시글 삭제 성공")
							//divBox.remove();
						} else {
							system.out.println("게시글 삭제 실패")
						}
					},
					error : function(e) {
						console.log("ajax 통신 실패");
						console.log(e);
					}
				});
				refreshList()
			}); */

			// 게시글 좋아요 클릭시 버튼 이미지 변경, 좋아요 기록
			$(".likeBtn").click(function() {
				var postNo = $(this).attr("name");
				var img = $(this).attr("src");
				var likeCount = $(this).parent().next("p").text()

				if (img == "${contextPath}/resources/img/like.png") {
					likeCount++;
					$(this).attr('src','${contextPath}/resources/img/like2.png');
				} else {
					likeCount--;
					$(this).attr('src','${contextPath}/resources/img/like.png');
				}
				
				if ( likeCount==0){
					likeCount=""
					$(this).parent().next("p").text(likeCount);
				}else{
					$(this).parent().next("p").text(likeCount);
				}

				$.ajax({
					url : "likeFunction",
					data : {"postNo" : postNo},
					type : "post",
					success : function(result) {
						if (result == "true") {
							console.log("좋아요 등록 성공");
						} else {
							console.log("좋아요 해제 성공");
						}
					},
					error : function(e) {
						console.log("ajax 통신 실패");
						console.log(e);
					}
				});
			}); 
			
			// 댓글 좋아요 클릭시 버튼 이미지 변경, 좋아요 기록
			$(".likeBtn2").click(function() {
				var replyNo = $(this).attr("name");
				var boardNo = $(this).attr("id");
				var img = $(this).attr("src");
				var likeCount = $(this).parent().next("p").text()

				if (img == "${contextPath}/resources/img/like.png") {
					likeCount++;
					$(this).attr('src','${contextPath}/resources/img/like2.png');
				} else {
					likeCount--;
					$(this).attr('src','${contextPath}/resources/img/like.png');
				}
				
				if ( likeCount==0){
					likeCount=""
					$(this).parent().next("p").text(likeCount);
				}else{
					$(this).parent().next("p").text(likeCount);
				}

				$.ajax({
					url : "replyLikeFunction",
					data : {replyNo : replyNo, boardNo : boardNo},
					type : "post",
					success : function(result) {
						if (result == "true") {
							console.log("좋아요 등록 성공");
						} else {
							console.log("좋아요 해제 성공");
						}
					},
					error : function(e) {
						console.log("ajax 통신 실패");
						console.log(e);
					}
				});
			}); 
			
			// 대댓글 좋아요 클릭시 버튼 이미지 변경, 좋아요 기록
			$(".likeBtn3").click(function() {
				var replyNo = $(this).attr("name");
				var boardNo = $(this).attr("id");
				var img = $(this).attr("src");
				var likeCount = $(this).parent().next("p").text()

				if (img == "${contextPath}/resources/img/like.png") {
					likeCount++;
					$(this).attr('src','${contextPath}/resources/img/like2.png');
				} else {
					likeCount--;
					$(this).attr('src','${contextPath}/resources/img/like.png');
				}
				
				if ( likeCount==0){
					likeCount=""
					$(this).parent().next("p").text(likeCount);
				}else{
					$(this).parent().next("p").text(likeCount);
				}

				$.ajax({
					url : "reReplyLikeFunction",
					data : {replyNo : replyNo, boardNo : boardNo},
					type : "post",
					success : function(result) {
						if (result == "true") {
							console.log("좋아요 등록 성공");
						} else {
							console.log("좋아요 해제 성공");
						}
					},
					error : function(e) {
						console.log("ajax 통신 실패");
						console.log(e);
					}
				});
			}); 
			
			// 작성자 프로필 조회
			$(".writerImg, .writerNickName" ).on("click",function(){
				var memberNo = $(this).attr("name");
				
				$.ajax({
					url : "checkProfile",
					data : { memberNo : memberNo },
					type : "post",
					dataType : "json",
					success : function(mList){
						
						// 회원정보
						$(".checkMemProfileUrl").prop("src","${contextPath}/resources/profileImage/"+mList[0].memberProfileUrl);
						$(".checkMemNickName").val(mList[0].memberNickname);
						/* $("#memberEmail").val(-); */
						$(".checkMemName").val(mList[0].memberNm);
						$(".checkMemAge").val(mList[0].memberAge);
						$(".checkMemPhone").val("-");
						if(mList[0].memberGender == "M") {
							$(".checkMemGender").val("남성");	
						}else {
							$(".checkMemGender").val("여성");
						}
						// 회원정보 끝
						
		    			// 회원 관심사
						var $divPlus = $(".checkMemProfileHobby");
		    		
						for(var i=1;i<Object.keys(mList).length;i++){
							if(i == 1) { // 제일 처음 관심사
								var $divPlus1 = $("<div class='col-sm-10'>");
			       				var $labelPlus = $("<label>");
			       				var $inputPlus = $("<input>");
								$labelPlus.addClass("col-sm-2 col-form-label text-center nanum").css({"font-weight" : "bold","font-size": "16px"}).html("관심분야");
								$inputPlus.prop({"type":"text","readonly":"true"}).css({"color" : "blue","font-size": "25px"})
										  .addClass("nanum form-control-plaintext").val("." + mList[1].hobbyName);
								$divPlus1.append($inputPlus);
								if(document.getElementByName("writerProfileHobby").childElementCount < (Object.keys(mList).length-1)*2) {
									$divPlus.append($labelPlus);
		   						$divPlus.append($divPlus1);	
								}
							} else { // 그 다음 관심사
								var $divPlus1 = $("<div class='col-sm-10'>");
			       				var $labelPlus = $("<label>");
			       				var $inputPlus = $("<input>");
								$labelPlus.addClass("col-sm-2 col-form-label text-center nanum").css({"font-weight" : "bold","font-size": "16px"});
								$inputPlus.prop({"type":"text","readonly":"true"}).css({"color" : "blue","font-size": "25px"})
										  .addClass("nanum form-control-plaintext").val("." + mList[i].hobbyName);
								$divPlus1.append($inputPlus);
								if(document.getElementByName("writerProfileHobby").childElementCount < (Object.keys(mList).length-1)*2) {
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
			/* 회원 프로필 정보 조회용  */
		
	  	 // 댓글 영역 숨기기
  		$(".commentArea").click(function() {
  			$(this).parent().next("div").toggle(100);
  			$('.writeCommentArea').focus();
  		}); 

  		// 대댓글 영역 숨기기
  		$(".doubleCommentArea").click(function() {
  			$(this).parent().parent().parent().next("div").toggle(100);
  			// $(".inputCommentWrap").toggle(500);
  			$('.writeCommentArea2').focus();
  		});
    	
   		//  게시글, 댓글 수정/삭제 메뉴창 보이기, 숨기기
   		$(".optionChevron>img").click(function() {
   			$(this).next("div").toggleClass("hide");
   		});

   		// 좋아요 숫자 눌렀을때 좋아요 누른사람 보이기   --작업중  
   		$(".likeNum").click(function() {
   			$(this).next("div").toggleClass("hide");
   		});

   		// 게시글 작성 영역 높이 자동증가
   		$('.writePost').on('keyup', 'textarea', function(e) {
   			$(this).css('height', 'auto');
   			$(this).height(this.scrollHeight);
   		});
   		$('.writePost').find('textarea').keyup();

   		// 댓글 작성 영역 높이 자동증가
   		$('.inputCommentWrap').on('keyup', 'textarea', function(e) {
   			$(this).css('height', 'auto');
   			$(this).height(this.scrollHeight);
   		});
   		$('.inputCommentWrap').find('textarea').keyup();

   		// 댓글 출력 영역 높이 자동증가
   		$('.commentContentWrap').on('keyup', 'textarea', function(e) {
   			$(this).css('height', 'auto');
   			$(this).height(this.scrollHeight);
   		});
   		$('.commentContentWrap').find('textarea').keyup();

   		// 게시글 출력 영역 높이 자동증가
   		$('.postMainWrap').on('keyup', 'textarea', function(e) {
   			$(this).css('height', 'auto');
   			$(this).height(this.scrollHeight);
   		});
   		$('.postMainWrap').find('textarea').keyup();

   		// 게시물 없을때 게시글 작성 클릭시 커서 이동
   		$(".noPostSignArea").click(function() {
   			$('.postArea').focus();
   		});
 		
 		// 정승환 코드 삭제(20.03.25)
    	     
	</script>
</body>
</html>