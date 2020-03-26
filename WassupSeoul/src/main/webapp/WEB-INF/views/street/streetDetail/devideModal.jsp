<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/timeline.css" type="text/css">

<title>타임라인 글작성 영역</title>
</head>
<style>

 </style>
<body>

				<!-- 투표 모달 -->
					<div class="modal fade" id="devideModal" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="devideModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document" style="width: 500px;">
							<div class="modal-content">
								<div class="modal-header">
									<h2 class="modal-title nanum" id="devideModalLabel"
										style="font-weight: bold;">1 / N 나누기 </h2>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- content start -->
									<textarea class=" nanum" id="writePostArea" rows="6" placeholder="게시글내용을 입력하세요."	
									  style="border: 1px solid black; color: black; font-size: 17px; height: 100px; padding-bottom: 20px; width:100%"></textarea><br>	
									<select id="vote" style="display: inline-block; " >
									<option value="KOR">KOR ₩</option>
									<option value="USD">USD $</option>
									<option value="USD">EUR €</option>
									<option value="CNY">CNY ¥</option>
									</select>
									<input type="text" id="originMoney" placeholder="총 금액을 입력해 주세요" style="width:80%; margin-left: 10px; margin-bottom:10px;"><br>	
	
									<label>1</label><input type="text" id="voteOption1" placeholder="항목 입력" style="width:80%; margin-left: 5px"><br>	
										
									<button type="button" id="devideSubmitBtn"
										style="width: 15%; height: 30px; font-size: 17px; float: right; margin: 0px">작성</button>
 
									<!-- content end -->
								</div>
							</div>

							<!-- content end -->
						</div>
					</div>
					<!-- end -->
					
				<script>
	
	// 투표 게시글작성
	/* $("#v").click(function() {
		var postContent = $(this).parent().find("textarea").val();
		//var divBox = $(this).parent(".box111");
		var voteOption1 = $("#voteOption1").val();
		var voteOption2 = $("#voteOption2").val();
		var voteOption3 = $("#voteOption3").val();
										
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
	}); */
	
	
	</script>		
			
</body>
</html>