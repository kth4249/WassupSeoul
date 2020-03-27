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

	#addBtn, #addBtn2:hover{
		cursor:pointer;
	}
 </style>
<body>

				<!-- 투표 모달 -->
					<div class="modal fade" id="voteModal" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="voteModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document" style="width: 600px;">
							<div class="modal-content">
								<div class="modal-header">
									<h2 class="modal-title nanum" id="voteModalLabel"
										style="font-weight: bold;">투표 게시글 작성</h2>
									<button type="button" id="voteCloseBtn" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- content start -->
									<textarea class=" nanum" id="writePostArea" rows="6" placeholder="게시글내용을 입력하세요."	
									  style="border: 1px solid black; color: black; font-size: 17px; height: 100px; padding-bottom: 20px; width:100%"></textarea>	
									<input type="text" id="voteTitle" placeholder="투표 제목" style="width:80%; margin-left: 10px; margin-bottom:10px;"><br>	
								
									<div style="width:100%" id="optionArea">
									<label>1</label><input type="text" id="voteOption1" class="voteOption" placeholder="항목 입력" style="width:80%; margin-left: 5px"><br>	
									<label>2</label><input type="text" id="voteOption2" class="voteOption" placeholder="항목 입력" style="width:80%; margin-left: 5px"><br>
									
									</div>	
	
									<div class="container">
										<div class="row">
											<div style="text-align: center; margin: auto; font-size: 20px;">
												<img src="${contextPath}/resources/img/plus.png" alt="학습노트 추가 버튼" class="addBtn"
													style="width: 10px; height: 10px;">
												<span class="addBtn" >추가하기</span> <span style="size:7px; color:gray;">(최대 10개까지 가능)</span>
											</div>
										</div>
									</div>	
		
	
	    							<label style="width: 130px;" ><input type='checkbox' id="anonymity " style="margin-left: 10px;" />무기명 투표</label><br>
									<label style="width: 370px;" ><input type='checkbox' id="plurality" class='check2' style="margin-left: 10px; display: inline-block;" />복수 선택 허용</label>
									
									<span  id="repeatVote" style="width: 10%; margin-left: 400px; display: none; float:right; ">
									<label for="vote" style="width: 90px;">복수 선택 개수:</label>
	
									<select id="voteLimit" style="display: inline-block; " >
									<option value="Y">제한없음</option>
									<option value="2">2개</option>
									<option value="3">3개</option>
									<option value="4">4개</option>
									<option value="5">5개</option>
									</select>
									</span><br>
	
									<label style="width: 370px;" ><input type='checkbox' id='endDate' style="margin-left: 10px; display: inline-block;" />종료일 설정</label>
									
									<span  id="setDate" style="width: 300px; display: inline-block; float:right; visibility:hidden">
									<input id="date" type='date' style="width: 140px;"/>
									</span>
										
									<button type="button" id="voteSubmitBtn" style="width: 15%; height: 30px; font-size: 17px; float: right; margin-left: 200px">작성</button>
 
									<!-- content end -->
								</div>
							 </div>

							<!-- content end -->
						</div>
					</div>
					<!-- end -->
					
<script>
	
	// 투표 게시글작성
	document.getElementById('voteSubmitBtn').addEventListener('click', function(){
		var votePostContent = $("#writePostArea").val();
		var votePostTitle = $("#voteTitle").val();
		var anonymity = "N";
		
		 //무기명 투표 여부
		 var checked2 = $("#anonymity").prop('checked');
		 if(checked2){
			 var anonymity = "Y";
		 }
		
		// 복수 선태 개수 받기 
		 var checked = $("#plurality").prop('checked');
		 if(checked){
			 var voteLimit = $("#voteLimit option:selected").attr('value');
		 }
		
		// 종료일 선택  
		if( $('input:checkbox[id="endDate"]').is(":checked") == true ){
			var endDate = $('#date').val();    // 종료일
		}
		
		// 투표 옵션 
		var optionCount = $(".voteOption").length
		
		console.log("선택지 개수 : " + optionCount);
		
		//var voteOptionList = new Array();
		var voteOptionList = "";
		
		/*for (var i = 0; i < optionCount ; i++ ){
			voteOptionList.push($(".voteOption").eq(i).val());
			alert($(".voteOption").eq(i).val());
		}*/
		
		for (var i = 0; i < optionCount ; i++ ){
			voteOptionList += $(".voteOption").eq(i).val();
			if(i < optionCount -1){
				voteOptionList += ",";
			}
			//alert($(".voteOption").eq(i).val());
		}
		
		
		alert(voteOptionList);
		
		$.ajax({
			url : "votePost",
			data : {"anonymity" : anonymity, 
					"votePostContent" : votePostContent,
					"endDate" : endDate,
					"voteOptionList" : voteOptionList,
					"votePostTitle" : votePostTitle,
					"voteLimit" : voteLimit
					},
			type : "post",
			success : function(result) {
				
				if (result == "true") {
					alert("투표 업로드 성공");
					$("#voteCloseBtn").trigger("click");
				} else {
					alert("투표 업로드 실패");
				}
			},
			error : function(e) {
			console.log("ajax 통신 실패");
			console.log(e);
			}
		});
		 refreshList()
	});
	
	// 선택지창 추가 
	$(function () {
		
		$(".addbtn").click(function(){
			
			alert("투표 옵션은 10개까지만 추가 가능합니다.");
			
			var optionCount = $(".voteOption").length  // 옵션창 개수 
			
   		 	console.log(optionCount + 1);
   		 
   	        if ( optionCount < 11) {
   	        	var html = '<label>'+optionCount+'</label><input type="text" id="voteOption'+optionCount+'" class="voteOption" placeholder="항목 입력" style="width:80%; margin-left: 5px"><br>'
   	        	console.log("투표 모달 옵션창 추가");
   	        	$("#optionArea").append(html);
   	        }else {
   	        	alert("투표 옵션은 10개까지만 추가 가능합니다.");
   	        }
			
	    });
        
	})
	
	
	// 투표 모달 중복투표 허용 옵션 보이기 
    $("#plurality").change(function(){
        if($("#plurality").is(":checked")){
        	$("#repeatVote").attr("style", "visibility:visible");
        }else{
        	$("#repeatVote").attr("style", "visibility:hidden");
        }
    });
     
	// 투표 종료일 선택창  
    $("#endDate").change(function(){
        if($("#endDate").is(":checked")){
        	$("#setDate").attr("style", "visibility:visible");
        }else{
        	$("#setDate").attr("style", "visibility:hidden");
        }
    });
	
</script>		
			
</body>
</html>