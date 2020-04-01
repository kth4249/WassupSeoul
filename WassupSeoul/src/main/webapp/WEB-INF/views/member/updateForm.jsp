<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>updateMember</title>
        <style>
        input[type="number"]::-webkit-outer-spin-button,
		input[type="number"]::-webkit-inner-spin-button {
		    -webkit-appearance: none;
		    margin: 0;
		}
        #profileBox{
            width: 100%;
            height: 200px; 
            border-radius: 70%;
            overflow: hidden;
            position: relative;
        }
        .profileImage{
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .uploadImage{
            position: absolute;
            top: 60%;
            right: 5%;
            border-radius: 70%;
            background-color: gray;
            width: 60px;
            height: 60px;
        }
        </style>
    </head>
    <body>
    <!-- 헤더 추가 시작-->
    <jsp:include page="../common/header.jsp"/>
    <div class="row" style="height : 86px;"></div>
    <!-- 헤더 추가  끝-->
    
        <!-- 컨텐츠 -->
        <div class="container-fluid">
        <br>
            <div class="row">
                <div class="col-md-3"></div>

                <!-- 실제 콘텐츠 내용 시작-->
                <div class="col-md-6">
                    <!-- 제목 시작 -->
                    <div class="row">
                        <div class="col-md-5"><h1 class="nanum">회원정보 수정하기</h1></div>
                        <div class="col-md-6"></div>
                    </div>
                    <!-- 제목끝 -->
                    <hr>

                    <form action="${contextPath}/member/update" method="POST" style="" 
                    enctype="multipart/form-data" role="form" onsubmit="return validate();">
                    <br>
                    <!-- 프로필변경 시작 -->
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label nanum" style="font-size: 20px;">*프로필 변경</label>
                        <div class="col-sm-3" style="margin-left: 5%;">
                            <div id="profileBox"><img class="profileImage" src="${contextPath}/resources/profileImage/${member.memberProfileUrl}" alt="이미지" id="updateProfile"></div>
                            <div class="uploadImage">
                                <label for="imgInp" style="width: 100%; height: 100%;text-align: center;"><img src="${contextPath}/resources/img/iconmonstr-photo-camera-4-64.png" style="cursor: pointer;margin: 8px 0px;" width="40px" height="40px"></label>
                                <input id="imgInp" type="file" name="memberProfileUrl" style="display : none">
                            </div>
                        </div>
                        <div class="col-sm-12 nanum mt-3" style="color: darksalmon; text-align: center;">(*사진 아이콘을 누르면 프로필사진을 변경할 수 있습니다.)</div>
                    </div>
                    <!-- 프로필 변경 끝 -->

                    <br>

                    <!-- 닉네임 변경 시작 -->
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label nanum" style="font-size: 20px;">*닉네임 변경</label>
                        <div class="col-sm-6">
                          <input type="text" class="form-control nanum" id="nickName" name="memberNickname" value="${member.memberNickname}" style="font-size: 20px;" placeholder="변경할 닉네임을 입력하세요">
                        </div>
                        <div class="col-sm-3"></div>
                    </div>
                    <!-- 닉네임 변경 끝 -->
                    <div class="form-group row">
                        <div class="col-sm-4"></div>
                        <div class="col-sm-5"><span class="nanum" id="nickNameCheck"></span></div>
                        <div class="col-sm-3"></div>
                    </div>

                    <br>
					
					<c:set var="phone" value="${fn:split(member.memberPhone, '-')}"/>
					
                    <!-- 전화번호 변경 시작 -->
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label nanum" style="font-size: 20px;">*전화번호 변경</label>
                        <div class="col-sm-2">
                            <select class="form-control nanum" name="phone1" style="font-size: 20px;">
                                <option <c:if test="${phone[0] == '010'}"> selected </c:if>>010</option>
								<option <c:if test="${phone[0] == '011'}"> selected </c:if>>011</option>
								<option <c:if test="${phone[0] == '016'}"> selected </c:if>>016</option>
								<option <c:if test="${phone[0] == '017'}"> selected </c:if>>017</option>
								<option <c:if test="${phone[0] == '019'}"> selected </c:if>>019</option>
                            </select>
                        </div>
                        <div class="col-sm-2">
                            <input type="number" class="form-control phone nanum" maxlength="4" value="${phone[1]}" id="phone2" name="phone2" style="font-size: 20px;">
                        </div>
                        <div class="col-sm-2">
                            <input type="number" class="form-control phone nanum" maxlength="4" value="${phone[2]}" id="phone3" name="phone3" style="font-size: 20px;">
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                    <!-- 전화번호 변경 끝 -->

                    <br>

                    <!-- 비밀번호 변경 시작 -->
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label nanum" style="font-size: 20px;">*현재 비밀번호</label>
                        <div class="col-sm-6">
                          <input type="password" class="form-control nanum" id="beforePwd" style="font-size: 20px;" placeholder="현재 비밀번호 입력">
                        </div>
                        <div class="col-sm-3">
                        	<label class="form-check-label nanum">
          						<input class="form-check-input" type="checkbox" id="maintainPwd" name="maintainPwd" value="mainCheck">
         						 현재 비밀번호 유지
        					</label>
                        </div> 
                    </div>
                    <!-- 현재 비밀번호 체크결과 출력 -->
                    <div class="form-group row">
                        <div class="col-sm-4"></div>
                        <div class="col-sm-5"><span class="nanum" id="beforePwdCheck"></span></div>
                        <div class="col-sm-3"></div>
                    </div>
                    <br>
                    <div class="form-group row">
                        <!-- 새로운 비밀번호1 -->
                        <label class="col-sm-3 col-form-label nanum" style="font-size: 20px;">*새 비밀번호</label>
                        <div class="col-sm-6">
                          <input type="password" class="form-control nanum" id="newPwd1" name="newPwd" readonly style="font-size: 20px;" placeholder="현재 비밀번호가 일치하여야 입력가능">
                        </div>
                        <div class="col-sm-3"></div>
                    </div> 
                    <!-- 새로운 비밀번호1 유효성 검사 결과 -->
                    <div class="form-group row">
                        <div class="col-sm-4"></div>
                        <div class="col-sm-5"><span class="nanum" id="newPwd1Check"></span></div>
                        <div class="col-sm-3"></div>
                    </div>   
                    <br>    
                    <div class="form-group row">
                        <!-- 새로운 비밀번호2 -->
                        <label class="col-sm-3 col-form-label nanum" style="font-size: 20px;">*새 비밀번호 확인</label>
                        <div class="col-sm-6">
                          <input type="password" class="form-control nanum" id="newPwd2" style="font-size: 20px;" readonly placeholder="현재 비밀번호가 일치하여야 입력가능">
                        </div>
                        <div class="col-sm-3"></div>
                    </div>
                    <!-- 새로운 비밀번호2 유효성 검사 결과 -->
                    <div class="form-group row">
                        <div class="col-sm-4"></div>
                        <div class="col-sm-5"><span class="nanum" id="newPwd2Check"></span></div>
                        <div class="col-sm-3"></div>
                    </div>  
                    <!-- 비밀번호 변경 끝 -->

                    <br>
                    <!-- 관심사 직접입력 시작 -->
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label nanum" style="font-size: 20px;">*관심사 변경(직접입력)</label>
                        <div class="col-sm-6">
	                        <div class="input-group mb-3">
		                      	<input type="text" class="form-control nanum" id="writeHobbyNm" style="font-size: 20px;" placeholder="관심사 직접 입력">
		                        <div class="input-group-append">
		                        	<button type="button" id="insertHobby" class="btn btn-primary nanum" style="font-size: 20px;">선택</button>
		                        </div>
	                        </div>
                        </div>
                        <div class="col-sm-3"></div>
                    </div>
                    <!-- 관심사 직접입력 끝 -->
                    
                    <!-- 관심사 검색창 시작 -->
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label nanum" style="font-size: 20px;">*관심사 변경(검색)</label>
                        <div class="col-sm-6">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control nanum" id="searchHobbyNm" style="font-size: 20px;" placeholder="관심사 검색">
                                <div class="input-group-append">
                                	<button type="button" class="btn btn-primary nanum" id="searchHobby" style="font-size: 20px;">검색</button>
                                </div>
                            </div>    
                        </div>
                        <div class="col-sm-3"></div>
                    </div>
                    <!-- 관심사 검색창 끝 -->

                    <!-- DB저장 관심사 출력 -->
                    <div class="form-group row">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-6" style="overflow: auto; height: 80px;">
                            <ul class="list-group list-group-flush" id="searchHobbyList">
                            	<li class="list-group-item">
                            		<h5 class="nanum">검색한 관심사가 조회됩니다.</h5>
                            	</li>
                            </ul>   
                        </div>
                        <div class="col-sm-3"></div>
                    </div>
                    <!-- 관심사 검색 끝 -->
                    
                    
                    <!-- 선택된 관심사 출력 -->
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label nanum" style="font-size: 20px;">*지정 관심사</label>
                        <div class="col-sm-6" id="selectHobby">
	                        <c:forEach var="hobby" items="${myHobby}" varStatus="vs">
		                       <div class="form-group row">
	                                <div class="col-sm-9">
	                                	<input type="text" class="form-control-plaintext nanum" name="hobbyNmArr" value="#${hobby.hobbyName}" style="font-size: 20px;color: darkslateblue;" readonly>
	                                </div>
	                                <div class="col-sm-3">
	                                	<button type="button" class="btn btn-danger nanum deleteHobby">제거</button>
	                                </div>
	                                <div class="col-sm-11" style="background-color: black;height: 2px;"></div>
	                                <input type="hidden" name="hobbyNoArr" value="${hobby.hobbyNo}">
	                            </div>	
	                     	</c:forEach>
                     	</div>
                        <div class="col-sm-3"></div>
                    </div>
                    <!-- 선택된 관심사 출력 끝 -->

                    <!-- 버튼 -->
                    <div class="form-group row">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-4"><a class="btn btn-warning btn-lg btn-block nanum" href="${contextPath}/square" role="button" style="font-size: 25px;">광장으로</a></div>
                        <div class="col-sm-4"><button type="submit" class="btn btn-primary btn-lg btn-block nanum" style="font-size: 25px;">수정하기</button></div>
                        <div class="col-sm-2"></div>
                    </div>
                    <!-- 버튼 끝 -->
                    <br>
                    </form>

                </div>
                <!-- 실제 콘텐츠 내용 끝 -->

                <div class="col-md-3"></div>
            </div>
        </div>
        <!-- 컨텐츠 -->
    <script>
 	// 각 유효성 검사 결과를 저장할 객체
    var signUpCheck = { 
    		"nickName":true,
    		"nickNameDup":true,
			"beforePwd":false,
			"newPwd1":false,
			"newPwd2":false,
			"phone":true
	};
 	
    
    	/* 관심사 제거 버튼 클릭시 관심사 제거 */
    	$(document).on("click",".deleteHobby",function(){
    		// 지정 관심사가 1개인 경우
    		if(document.getElementById("selectHobby").childElementCount < 2) { 
    			alert("지정관심사는 최소 1개는 지정이 되어야 합니다.");
    		} 
    		// 지정 관심사가 2개이상인 경우
    		else {
    			$(this).parent().parent().remove();	
    		}
    	});
    	
    	/* 관심사 직접 입력후 버튼 클릭시 관심사 추가 */
    	$(document).on("click","#insertHobby",function(){
    		// 지정관심사가 3개인 경우
    		if(document.getElementById("selectHobby").childElementCount > 2) { 
    			alert("지정관심사는 최대 3개만 지정할 수 있습니다.");
    			$("#writeHobbyNm").val("");
    		} 
    		else if($("#writeHobbyNm").val() == "") {
    			alert("관심사를 입력하세요.");
    		}
    		// 지정관심사가 3개미만인 경우
    		else {
    			var inputs = $("#selectHobby").find("input");
    			var insertVal = "#" + $("#writeHobbyNm").val();
    			var count = 0;
    			$.each(inputs,function(index,item){
                    if(insertVal == $(item).val()) {
                        count++;
                    } 
                });
    			// 중복값이 있는 경우
    			if(count > 0){
    				alert("중복된 관심사를 지정할 수 없습니다.");
        			$("#writeHobbyNm").val("");
    			}
    			// 중복값이 없는 경우
    			else {
    				// 중복값에 따라 취미번호 변경
    				var $hobbyNoPlus = $("<input>").prop({"type" : "hidden", "name" : "hobbyNoArr"});
    				
    				// ajax를 이용해서 중복값이 있으면 no가져오고 아니면 0으로 지정
    				$.ajax({
    					url : "hobbyDupCheck",
                		data : {hobbyName : $("#writeHobbyNm").val()},
                		type : "post",
                		success : function(result) {
                			console.log(result);
                			$hobbyNoPlus = $hobbyNoPlus.val(result);
                		},
                		error : function(e){
                			console.log("ajax 통신 실패");
                			console.log(e);
                		}
    				});
    				
    				var writeHobby = $("#writeHobbyNm").val();
    	       		var $divPlus = $("<div></div>").addClass("form-group row");
    	       		var $divPlus1 = $("<div></div>").addClass("col-sm-9");
    	       		var $divPlus2 = $("<div></div>").addClass("col-sm-3");
    	       		var $divPlus3 = $("<div></div>").addClass("col-sm-11").css({"background-color":"black","height":"2px"});
    	       		var inputPlus = $("<input></input>")
    	       						.prop({"type":"text", "readonly":"true", "name":"hobbyNmArr"})
    	       						.val("#" + writeHobby).addClass("form-control-plaintext nanum")
    	       						.css({"font-size":"20px","color":"darkslateblue"});
    	       		var buttonPlus = $("<button></button>").prop("type","button").addClass("btn btn-danger nanum deleteHobby").html("제거");
    	       		
    	            $divPlus1 = $divPlus1.append(inputPlus);
    	            $divPlus2 = $divPlus2.append(buttonPlus);
    	           	$divPlus = $divPlus.append($divPlus1).append($divPlus2).append($divPlus3).append($hobbyNoPlus);
    	      			
                   $("#selectHobby").append($divPlus);
                   $("#writeHobbyNm").val("");
                   
    			}
    		}
    		 
        });
    
    	/* 관심사 검색 버튼 클릭시 검색결과 출력*/
    	$("#searchHobby").on("click",function(){
    		var $searchHobbyNm = $("#searchHobbyNm");
    		if($searchHobbyNm.val() == ""){
		    	alert("검색할 관심사를 입력하세요.");
		    }
    		else {
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
          									 .css("color","blue").val("#" + list[i].hobbyNm);
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
    	
    	/* 검색된 관심사 선택 버튼 클릭 시 지정관심사 추가 */
    	$(document).on("click",".insertSearchHobby",function(){
    		// 지정관심사가 3개인 경우
    		if(document.getElementById("selectHobby").childElementCount > 2) { 
    			alert("지정관심사는 최대 3개만 지정할 수 있습니다.");
    		}
    		// 지정관심사가 3개미만인 경우
    		else {
    			var inputs = $("#selectHobby").find("input");
    			var searchHobbyVal = $(this).closest("li").find("input").first().val();
    			var searchHobbyNo = $(this).closest("li").find("input").eq(2).val();
    			var count = 0;
    			$.each(inputs,function(index,item){
                    if(searchHobbyVal == $(item).val()) {
                        count++;
                    } 
                });
    			// 중복값이 있는 경우
    			if(count > 0){
    				alert("중복된 관심사를 지정할 수 없습니다.");
    			}
    			// 중복값이 없는 경우
    			else{
    	       		var divPlus = $("<div></div>").addClass("form-group row");
    	       		var divPlus1 = $("<div></div>").addClass("col-sm-9");
    	       		var divPlus2 = $("<div></div>").addClass("col-sm-3");
    	       		var divPlus3 = $("<div></div>").addClass("col-sm-11").css({"background-color":"black","height":"2px"});
    	       		var inputPlus = $("<input></input>")
    	       						.prop({"type":"text", "readonly":"true", "name":"hobbyNmArr"})
    	       						.val(searchHobbyVal).addClass("form-control-plaintext nanum")
    	       						.css({"font-size":"20px","color":"blue"});
    	       		var buttonPlus = $("<button></button>").prop("type","button").addClass("btn btn-danger nanum deleteHobby").html("제거");
    	       		var hobbyNoPlus = $("<input>").prop({"type": "hidden","name" : "hobbyNoArr"}).val(searchHobbyNo);
    	       		
    	            divPlus1 = divPlus1.append(inputPlus);
    	            divPlus2 = divPlus2.append(buttonPlus);
    	           	divPlus = divPlus.append(divPlus1).append(divPlus2).append(divPlus3).append(hobbyNoPlus);
    	      			
                   $("#selectHobby").append(divPlus);
    			}
    		}
    	});

    
    	/* 유효성 검사 */
    	$(function(){
    		var $nickName = $("#nickName");
    		var $maintainPwd = $("#maintainPwd");
    		var $beforePwd = $("#beforePwd");
    		var $newPwd1 = $("#newPwd1");
    		var $newPwd2 = $("#newPwd2");
    		
    		// 닉네임 유효성 검사
    		$nickName.on("input",function(){
    			// 총 1~14글자,모든 문자 가능
    			var regExp = /^[a-zA-z0-9가-힣]{1,14}$/;
    			if(!regExp.test($nickName.val())) {
    				$nickName.addClass("is-invalid");
    				$("#nickNameCheck").text("닉네임 형식이 유효하지 않습니다.").css({"color":"red","font-weight":"bold"});
    				signUpCheck.nickName = false;
    			} else {
    				signUpCheck.nickNameDup = true;
    				$.ajax({
                		url : "nickNameDupCheck",
                		data : {memberNickname: $nickName.val() },
                		type : "post",
                		success : function(result){
                			
                			if(result == "true"){
                				$nickName.removeClass("is-invalid");
                				$nickName.addClass("is-valid");
                				$("#nickNameCheck").text("사용 가능한 닉네임 입니다.").css({"color":"green","font-weight":"bold"});
                				signUpCheck.nickName = true;
                				
                			}else{
                				$nickName.removeClass("is-valid");
                				$nickName.addClass("is-invalid");
                				$("#nickNameCheck").text("중복된 닉네임 입니다.").css({"color":"red","font-weight":"bold"});
                				signUpCheck.nickNameDup = false;
                			}
                		},
                		
                		error : function(e){
                			console.log("ajax 통신 실패");
                			console.log(e);
                		}
                	});
    			}
    		});
    		
    		// 현재 비밀번호 유지 여부
    		$maintainPwd.on("input",function(){
    			if($maintainPwd.prop("checked")) {
    				$("#beforePwd").prop("readonly",true);
    				$("#beforePwd").val("");
    				$beforePwd.removeClass("is-invalid");
    				$beforePwd.removeClass("is-valid");
    				$("#beforePwdCheck").text("현재 비밀번호 유지").css({"color":"blue","font-weight":"bold"});
    				$beforePwd.addClass("is-valid");
    								
    				$("#newPwd1").prop("readonly",true);
    				$("#newPwd1").val("");
    				$("#newPwd1").removeClass("is-invalid");
    				$("#newPwd1").removeClass("is-valid");
    				$("#newPwd1Check").text("");
    				
    				$("#newPwd2").prop("readonly",true);
    				$("#newPwd2").val("");
    				$("#newPwd2").removeClass("is-invalid");
    				$("#newPwd2").removeClass("is-valid");
    				$("#newPwd2Check").text("");
    				
    				signUpCheck.beforePwd = true;
    				signUpCheck.newPwd1 = true;
    				signUpCheck.newPwd2 = true;
    			} else {
    				$beforePwd.removeClass("is-valid");
    				$("#beforePwd").prop("readonly",false);
    				$("#beforePwdCheck").text("");
    				
    				signUpCheck.beforePwd = false;
    				signUpCheck.newPwd1 = false;
    				signUpCheck.newPwd2 = false;
    			}
    		});
    		
    		// 현재 비밀번호 일치 여부
    		$beforePwd.on("input",function(){
    			$.ajax({
            		url : "beforePwdCheck",
            		data : {beforePwd: $beforePwd.val(), memberNo : ${loginMember.memberNo} },
            		type : "post",
            		success : function(result){
            			
            			if(result == "true"){
            				$beforePwd.removeClass("is-invalid");
            				$beforePwd.addClass("is-valid");
            				$("#beforePwdCheck").text("비밀번호가 일치합니다.").css({"color":"green","font-weight":"bold"});
            				$("#newPwd1").prop("readonly",false);
            				$("#newPwd1").prop("placeholder","변경할 비밀번호를 입력하세요");
            				$("#newPwd2").prop("readonly",false);
            				$("#newPwd2").prop("placeholder","변경할 비밀번호를 다시 한번 입력하세요");
            				
            				signUpCheck.beforePwd = true;
            			}else{
            				$beforePwd.removeClass("is-valid");
            				$beforePwd.addClass("is-invalid");
            				$("#beforePwdCheck").text("비밀번호가 일치하지 않습니다.").css({"color":"red","font-weight":"bold"});
            				$("#newPwd1").prop("readonly",true);
            				$("#newPwd2").prop("readonly",true);
            				
            				signUpCheck.beforePwd = false;
            			}
            		},
            		
            		error : function(e){
            			console.log("ajax 통신 실패");
            			console.log(e);
            		}
            	});
    		});
    		
    		// 변경할 비밀번호 유효성 검사
    		$newPwd1.on("input",function(){
    			//영어 대,소문자 + 숫자, 총 6~12글자
				var regExp = /^[A-Za-z0-9]{6,12}$/;
				if(!regExp.test($newPwd1.val())){ 
					$newPwd1.removeClass("is-valid");
    				$newPwd1.addClass("is-invalid");
                	$("#newPwd1Check").text("비밀번호 형식이 유효하지 않습니다.").css("color","red").css("font-weight","bold");      	
                	signUpCheck.newPwd1 = false;
                }else{
                	$newPwd1.removeClass("is-invalid");
    				$newPwd1.addClass("is-valid");
                	$("#newPwd1Check").text("유효한 비밀번호 형식입니다.").css("color","green").css("font-weight","bold");
                	
                	signUpCheck.newPwd1 = true;
                }
    		});
    		
    		// 변경할 비밀번호 일치 여부
			$newPwd2.on("input", function(){
				if($newPwd1.val().trim() != $newPwd2.val().trim()){
					$newPwd2.removeClass("is-valid");
    				$newPwd2.addClass("is-invalid");
					$("#newPwd2Check").text("비밀번호 불일치").css("color","red").css("font-weight","bold");;
					
					signUpCheck.newPwd2 = false;
				}else{
					$newPwd2.removeClass("is-invalid");
    				$newPwd2.addClass("is-valid");
					$("#newPwd2Check").text("비밀번호 일치").css("color","green").css("font-weight","bold");;
					
					signUpCheck.newPwd2 = true;
				}
			});
    		
			// 전화번호 관련
		 	$(".phone").on("input",function(){
		 		
				// 전화번호 input 태그에 4글자 이상 입력하지 못하게 하는 이벤트
                if ($(this).val().length > $(this).prop("maxLength")){
                    $(this).val($(this).val().slice(0, $(this).prop("maxLength")));
                }
				
             	// 전화번호 유효성 검사
    		 	var $phone2 = $("#phone2");
    			var $phone3 = $("#phone3");
                var regExp1 =  /^\d{3,4}$/; // 숫자 3~4 글자
                var regExp2 =  /^\d{4,4}$/; // 숫자 4 글자
                
                if(!regExp1.test($phone2.val()) || !regExp2.test($phone3.val())){
                	signUpCheck.phone = false;
                }else{
                	signUpCheck.phone = true;
    			}
                
            });
    		
    	});
    	
    	// submit 동작
		function validate(){
    		
			for(var key in signUpCheck){
				if(!signUpCheck[key]){
					alert("일부 입력값이 잘못되었습니다.");
					var id = "#"+key;
					$(id).focus();
					return false;
				}
			}
  
		}
    </script>
					
    <!-- 프로필 사진 변경 -->
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('#updateProfile').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#imgInp").change(function() {
            readURL(this);
        });
    </script>
    <jsp:include page="../common/footer.jsp"/>
    </body>   
</html>