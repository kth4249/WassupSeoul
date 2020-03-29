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
	#selectMember:hover{
		cursor : pointer;
	}


</style>
<body>

				<!-- 1/N 나누기 모달 -->
					<div class="modal fade" id="devideModal" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="devideModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document" style="width: 500px;">
							<div class="modal-content">
								<div class="modal-header">
									<h2 class="modal-title nanum" id="devideModalLabel"
										style="font-weight: bold; color:black;">1 / N 나누기 </h2>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- content start -->
									<textarea class=" nanum" id="writePostArea" rows="6" placeholder="게시글내용을 입력하세요."	
									  style="border: 1px solid black; color: black; font-size: 17px; height: 100px; padding-bottom: 20px; width:100%"></textarea><br>	
									<select id="vote" style="display: inline-block; height: 30px; " >
									<option value="KOR">KOR ₩</option>
									<option value="USD">USD $</option>
									<option value="USD">EUR €</option>
									<option value="CNY">CNY ¥</option>
									</select>
									<input type="text" id="originMoney" placeholder="총 금액을 입력해 주세요" style="width:81%;  height: 30px; margin-left: 12px; margin-bottom:10px;"><br>	
	
									<div>
									<span>
									</span>
										 <img src="${contextPath}/resources/img/team.png" style="width: 30px; height: 30px; "> 
									<span>
										<span id="selectMember" style="margin-left: 15px;" data-toggle="modal" data-target="#selectMemberModal" >멤버선택 ></span>	
									</span>
									</div>	
										
									<button type="button" id="devideSubmitBtn" style="width: 15%; height: 30px; font-size: 17px; float: right; margin: 0px">작성</button>
 
									<!-- content end -->
								</div>
							</div>

							<!-- content end -->
						</div>
					</div>
					<!-- end -->
					
					<!-- 멤버 선택 모달 -->
					<div class="modal fade" id="selectMemberModal" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="selectMemberModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document" style="width: 400px; heigth: 700px;">
							<div class="modal-content">
								<div class="modal-body">
									<!-- content start -->
									<input type="text" id="searchMember" placeholder="회원 검색" style="width:80%;  margin-bottom:10px;">	
									<button type="button" id="selectMemberSearchBtn" style="width: 50px; height: 30px; font-size: 17px; float: right;  margin-left: 10px">검색</button>
									<div id="divideMemberList" >
										
									</div>	
										
									<button type="button"  id="selectMemberSubmitBtn" style="width: 50px; height: 30px; font-size: 17px; float: right; margin-top: 10px;  margin-left: 10px">확인</button>
 									<button type="button"  data-dismiss="modal" aria-label="Close" style="width: 50px; heigth:20px; font-size: 17px; float: right; margin-top: 10px;  margin-left: 10px">
										<span aria-hidden="true">취소</span>
									</button>
									<!-- content end -->
								</div>
							</div>

							<!-- content end -->
						</div>
					</div>
					<!-- end -->
					
					
	<script>
	
	//멤버선택시 멤버 보기 
 	$("#selectMember").on("click",function(){
 		$.ajax({
 			url : "selectDevideMember",
 			type : "post",
 			dataType : "json",
 			success : function(selectDevideMember){
 				
      			// 골목 회원 리스트 
 				/* var $divPlus = $("#divideMemberList"); */
      		
 				for(var i=1; i<selectDevideMember.size(); i++){
 					alert(selectDevideMember.get(i).memberNickName);
 					
 					/* var $divPlus1 = $("<div class='col-sm-10'>");
 					
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
 					
 					
					var html = "<div style=\"border: 1px solid #ced4da; height: 45px;\">"
							 + "<img src=\"${contextPath}/resources/img/"+selectDevideMember.get(i).memberProfileUrl+"\" style=\"width: 30px; height: 30px; margin-left: 3px; margin-bottom: 1px;\">"		
						     + "<label style=\"width: 300px; margin-left: 20px; margin-top: 6px;   font-size:17px;\">"+selectDevideMember.get(i).memberNickName+
 							 + "<input type='checkbox' style=\"margin-top: 6px; width:20px; height:20px; float:right;\" name=\"\" class=\"\" /></label>"
 							 + "</div>";
						     
 					$("#divideMemberList").append(html); */
 					
 				}
 			},
 			error : function(e){
     			console.log("ajax 통신 실패");
     			console.log(e);
     		}
 		});
 	});
	
 	/* 관심사 검색 버튼 클릭시 검색결과 출력*/
    $("#selectMember").on("click",function(){
	    var $searchHobbyNm = $("#searchHobbyNm");
	    if($searchHobbyNm.val() == ""){
	    	alert("검색할 관심사를 입력하세요.");
	    }
	    else{
	    	$.ajax({
           		url : "searchHobby",
           		data : {searchHobbyContent: $searchHobbyNm.val() },
           		type : "post",
           		dataType : "json",
           		success : function(list){
           			
   					var $searchHobbyList = $("#searchHobbyList");
           			$searchHobbyList.html("");
     					
           			if(list.length > 0) {
           			    $searchHobbyNm.val("");
           				$.each(list,function(i){
           					var liPlus = $("<li></li>").addClass("list-group-item");
                   			var divPlus = $("<div></div>").addClass("form-group row").css("margin-bottom","0px");
                   			var divPlus1 = $("<div></div>").addClass("col-sm-7");
                   			var divPlus2 = $("<div></div>").addClass("col-sm-2");
                   			var divPlus3 = $("<div></div>").addClass("col-sm-3");
               				var inputPlus1 = $("<input></input>")
       						 			 .prop({"type":"text", "readonly":"true"})
         						 			 .addClass("form-control-plaintext nanum")
         									 .css("color","black").val("#" + list[i].hobbyNm);
       						var inputPlus2 = $("<input></input>")
       		 							 .prop({"type":"text", "readonly":"true"})
       									 .addClass("form-control-plaintext nanum").val(list[i].hobbyCount + "명");
       						var buttonPlus = $("<button></button>").prop("type","button")
   										 .addClass("btn btn-primary nanum insertSearchHobby").html("선택")
   							var hobbyNoPlus = $("<input>").prop("type","hidden").val(list[i].hobbyNo);
       						
       						divPlus1 = divPlus1.append(inputPlus1);
       						divPlus2 = divPlus2.append(inputPlus2);
       						divPlus3 = divPlus3.append(buttonPlus);
       						divPlus = divPlus.append(divPlus1).append(divPlus2).append(divPlus3);
       						liPlus = liPlus.append(divPlus).append(hobbyNoPlus);
       						$searchHobbyList.append(liPlus);
               			});
           				
           			} else {
           				var liPlus = $("<li></li>").addClass("list-group-item");
           				var hPlus = "<h5 class='nanum'>검색결과가 없습니다</h5>";
           				liPlus = liPlus.append(hPlus);
           				$searchHobbyList.append(liPlus);
           				
           			}
       				
           		},
           		
           		error : function(e){
           			console.log("ajax 통신 실패");
           			console.log(e);
           		}
           	});
	    }
        		
    });
				
	// 1/N 게시글작성
	 $("#devideSubmitBtn").click(function() {
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
	}); 
	
	
</script>		
			
</body>
</html>