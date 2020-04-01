<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/timeline.css" type="text/css">

<title>투표 모달</title>
</head>
<style>

	.addBtn:hover{
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
									<textarea class="nanum" id="writePostArea" rows="6" placeholder="게시글내용을 입력하세요."	
									  style="color: black; font-size: 17px;"></textarea>	
									<input type="text" class="form-control" id="voteTitle" placeholder="투표 제목(필수 입력)" style=""><br>	
								
									<div style="width:100%" id="optionArea">
										<div class="col-md-12 row">
											<label class="col-md-2" style="text-align:center; margin-left: 10%; margin-top: 5px;">1</label>
											<input type="text" id="voteOption1" class="voteOption col-md-8 form-control" placeholder="항목 입력" style="margin-bottom: 10px;"><br>	
										</div>
										<div class="col-md-12 row">
											<label class="col-md-2" style="text-align:center; margin-left: 10%; margin-top: 5px;">2</label>
											<input type="text" id="voteOption2" class="voteOption col-md-8 form-control" placeholder="항목 입력" style="margin-bottom: 10px;"><br>
										</div>
									</div>	
	
									<div class="container">
										<div class="form-control mb-3" style="text-align: center; margin: auto; font-size: 20px; background-color:#c7dbaf">
											<img src="${contextPath}/resources/img/plus.png" alt="학습노트 추가 버튼" class="addBtn"
												style="width: 10px; height: 10px;">
											<span class="addBtn" id="addOptionBtn"style="color:black;">추가하기</span> 
											<span style="font-size:15px; color:red;">(최대 10개까지 가능)</span>
										</div>
									</div>	
		
	
	    							<label style="width: 130px;" ><input type='checkbox' id="anonymity " style="margin-left: 10px;" />무기명 투표</label><br>
									<label style="width: 340px;" ><input type='checkbox' id="plurality" class='check2' style="margin-left: 10px; display: inline-block;" />복수 선택 허용</label>
									
									<span  id="repeatVote" style="width: 10%; margin-left: 400px; display: none; float:right; ">
									<label for="vote" style="width: 110px;">복수 선택 개수:</label>
	
									<select id="voteLimit" style="display: inline-block; " >
										<option value="Y">제한없음</option>
										<option value="2">2개</option>
										<option value="3">3개</option>
										<option value="4">4개</option>
										<option value="5">5개</option>
									</select>
									</span><br>
	
									<label style="width: 340px;" ><input type='checkbox' id='endDate' style="margin-left: 10px; display: inline-block;" />종료일 설정</label>
									
									<span  id="setDate" style="width: 300px; display: inline-block; float:right; visibility:hidden">
									<input id="date" type='date'  style="width: 140px;"/>
									</span>
									<!-- onclick="return validate2();" -->	
									<button type="button" id="voteSubmitBtn" class="mt-3 form-control btn btn-primary">작성</button>
 
									<!-- content end -->
								</div>
							 </div>
							<!-- content end -->
						</div>
					</div>
					<!-- end -->
					
<script>
	/* $(document).ready(function(){
	  	 	var today = new Date();
	  	 	var dd = today.getDate();
	  	 	var mm = today.getMonth()+1; 
	  	 	var yyyy = today.getFullYear();
	  	 	 if(dd<10){
	  	 	        dd='0'+dd
	  	 	    } 
	  	 	    if(mm<10){
	  	 	        mm='0'+mm
	  	 	    } 
	  	 	today = yyyy+'-'+mm+'-'+dd;
	  	  	moment(today).format('YYYY-MM-DD');
	  	  
	  	 	document.getElementById("date").setAttribute("min", today);	 	
	}); */
		

	 //document.getElementById('date').value= new Date().toISOString().slice(0, 7);


	//선택지 공백 우효성 검사
	/* function validate2() {
		    var optionCount = $(".voteOption").length
		
			for( var i = 1; i<optionCount+1; i++){
				var str = $("#voteOption"+i).val();
				
				if( str == '' || str == null ){
				    alert( '투표 선택지를 입력해 주세요' );
				    return false;
				}
				var blank_pattern = /^\s+|\s+$/g;
				if( str.replace( blank_pattern, '' ) == "" ){
				    alert('투표 선택지를 입력해 주세요');
				    return false;
				}
			} 
			
		    // 날짜 유효성 검사 필요 
			
			// 투표제목 공백시 
			var str = $("#voteTitle").val();
			if( str == '' || str == null ){
			    alert( '투표제목을 입력해 주세요' );
			    return false;
			}

			var blank_pattern = /^\s+|\s+$/g;
			if( str.replace( blank_pattern, '' ) == "" ){
			    alert('투표제목을 입력해 주세요');
			    return false;
			}
	} */
	
	// 투표 게시글작성
	document.getElementById('voteSubmitBtn').addEventListener('click', function(){
		
		// 투표 게시글 내용
		var votePostContent = $("#writePostArea").val(); 
		// 투표 제목
		var votePostTitle = $("#voteTitle").val(); 
		// 무기명 투표여부
		var anonymity = "N";  
		// 중복투표 여부
		var voteLimit = "N";
		
		 //무기명 투표 여부
		 if( $("#anonymity").is(":checked") == true ){
			 anonymity = "Y";
		 }
		
		//복수 선태 개수 받기 
		 if ($("#plurality").is(":checked") == true ){
			 var voteLimit = $("#voteLimit option:selected").attr('value');
		 }
		
		// 종료일 선택  
		if( $('input:checkbox[id="endDate"]').is(":checked") == true ){
			 var today = new Date();
			   
		  	 moment(today).format('YYYY-MM-DD');
		  	 
		  	var endDate = $('#date').val(); 
		  	 
		  	 if( endDate.getTime() <= today.getTime() ){
		  		alert("종료일은 오늘 날짜 이후 선택가능 ");
		  	 }
			
		// 종료일 선택안했을 때 
		}else{
			 var endDate = new Date();
				 endDate.setFullYear(2200) ;
				 endDate.setMonth(10);
				 endDate.setDate(12);
		   
		  	 	 moment(endDate).format('YYYY-MM-DD');
		}
		
		// 투표 옵션 
		var optionCount = $(".voteOption").length
		
		var voteOptionList = "";
		
		for (var i = 0; i < optionCount ; i++ ){
			voteOptionList += $(".voteOption").eq(i).val();
			
			if(i < optionCount -2){
				voteOptionList += ",";
			}
			//alert($(".voteOption").eq(i).val());
		}
		
		//alert(votePostTitle);
		//alert(voteLimit);
		alert("다음이 무기명 여부");
		alert(anonymity);
		alert(endDate);
		//alert(voteOptionList);
		
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
		$("#addOptionBtn").on("click",function(){
						
			var optionCount = $(".voteOption").length  // 옵션창 개수 
			
   		 		optionCount +1;
			
			var html = '<div class="col-md-12 row"><label class="col-md-2" style="text-align:center; margin-left: 10%; margin-top: 5px;">'
					 + optionCount
					 + '</label><input type="text" id="voteOption'
					 + optionCount
					 + '"class="voteOption col-md-8 form-control" placeholder="항목 입력" style="margin-bottom: 10px"></div>'
			
   	        if ( optionCount < 11) {
   	        	$("#optionArea").append(html);
   	        }else {
   	        	alert("투표 옵션은 10개까지만 추가 가능합니다.");
   	        } 
	    });
	
	// 투표 모달 중복투표 허용 옵션 보이기 
    $("#plurality").change(function(){
        if($("#plurality").is(":checked")){
        	$("#repeatVote").attr("style", "visibility:visible");
        }else{
        	$("#repeatVote").attr("style", "visibility:hidden");
        }
    });
     
	// 투표 종료일 선택창  보이기 
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