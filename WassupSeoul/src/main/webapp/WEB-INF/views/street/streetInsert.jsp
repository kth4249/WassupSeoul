<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골목 개설</title>
</head>
<style>
.loungeBack {
	position: relative;
}

.loungeBack::after {
	content: "";
	display: block;
	position: absolute;
	top: 0;
	left: 0;
 	background-image: url('${contextPath}/resources/img/테스트서울.jpg');
	background-size: cover;
	width: 100%;
	height: 100%;
	opacity: 0.4;
	z-index: -1;
	background-repeat: no-repeat;
}
</style>
<body class="nanum">
	<jsp:include page="../common/header.jsp"/>


	<form method="POST" action="insertStreet" enctype="multipart/form-data"
		role="form" onsubmit="return validate();">

		<div class="container-fluid loungeBack">
			<div class="row">
				<div class="col-md-6 offset-md-3 headerMargin">
					<h1 class="nanum" style="font-weight: bold; margin-top:50px; margin-left: 10px; margin-bottom: 40px;">골목 개설하기</h1>
				</div>
			</div>
			<div class="row">
				<br>
			</div>


			<div class="row">
				<div class="col-md-6 offset-md-3">
					<!-- 골목이름 -->
					<div class="form-group col-md-6 nanum" style="float: left;">
						<h3 class="nanum" style="font-size:1.5rem !important">골목이름</h3>
						<div class="col-xs-4">
							<input type="text" class="form-control nanum" name="streetNm"
								id="streetNm" placeholder="2글자이상 15글자이하로 작성하기(특수문자제외)">
							<span class="nanum" id="checkStreetNm"
								style="font-size: smaller;">&nbsp;</span>
						</div>
					</div>

					<!-- 지역구 -->
					<div class="form-group col-md-6 nanum" style="float: left;">
						<h3 class="nanum" style="font-size:1.5rem !important">지역구</h3>
						<div class="col-xs-4">
							<select class="form-control nanum" name="districtNo"
								id="districtNo" required>
								<option selected value="10">강서구</option>
								<option value="8">양천구</option>
								<option value="11">구로구</option>
								<option value="9">영등포구</option>
								<option value="7">금천구</option>
								<option value="5">동작구</option>
								<option value="6">관악구</option>
								<option value="4">서초구</option>
								<option value="3">강남구</option>
								<option value="2">송파구</option>
								<option value="1">강동구</option>
								<option value="15">광진구</option>
								<option value="16">중랑구</option>
								<option value="13">노원구</option>
								<option value="14">도봉구</option>
								<option value="17">성동구</option>
								<option value="18">동대문구</option>
								<option value="19">성북구</option>
								<option value="12">강북구</option>
								<option value="20">중구</option>
								<option value="21">종로구</option>
								<option value="22">용산구</option>
								<option value="23">서대문구</option>
								<option value="24">은평구</option>
								<option value="25">마포구</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<br>
			</div>
			
<!--
				// src가 존재할 때만 넘어가게 
				// onsubmit 동작이 일어났을때 -> c:set 을 이용해서 thumbnailArea의 src 를 el 변수로 저장 
				// -> form action에 넘기고 싶은 주소랑 함께 뒤에 쿼리스트링으로 src를 함께 넘긴다
 -->

			<div class="row">
				<div class="col-md-6 offset-md-3">
					<!-- 골목소개 수정 -->
					<div class="form-group col-md-6 nanum" style="float: left;">
						<h3 class="nanum" style="font-size:1.5rem !important">골목소개</h3>
						<div class="col-xs-4">
							<input type="text" class="form-control nanum" name="streetIntro"
								id="streetIntro" placeholder="15글자 이하로 작성하기(특수문자 제외)"> <span
								class="nanum" id="checkStreetIntro" style="font-size: smaller;">&nbsp;</span>
						</div>
					</div>

					<!-- 골목 총 회원수 수정 -->
					<div class="form-group col-md-6 nanum" style="float: left;">
						<h3 class="nanum" style="font-size:1.5rem !important">골목 총 회원수</h3>
						<div class="col-xs-4">
							<select class="form-control nanum" name="streetMaxMember"
								id="streetMaxMember" required>
								<option value="50">50</option>
								<option value="100">100</option>
								<option value="150">150</option>
								<option value="200">200</option>
								<option value="250">250</option>
								<option value="300">300</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<br>
			</div>


			<!-- 골목 키워드 -->
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="form-group col-md-6 nanum" style="float: left;">
						<h3 class="nanum" style="font-size:1.5rem !important">골목 키워드</h3>
					</div>
				</div>
			</div>
			
			
			
			<!-- 키워드 직접입력 -->
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="row">
						<div class="form-group col-md-2 nanum"
							style="float: left; text-align: center;">
							<label for="writeKeyword" class="nanum"
								style="font-size: 20px; font-weight: bolder;">키워드 추가 </label>
						</div>
						<div class="form-group col-md-5 nanum" style="float: left;">
							<div class="col-xs-4">
								<input type="text" class="form-control nanum"
									name="" id="writeKeyword"
									placeholder="15글자 이하로 작성하기(특수문자 제외)"> <span
									class="nanum" id="checkWriteKeyword"
									style="font-size: smaller;">&nbsp;</span> <br>
							</div>
						</div>
						<div class="form-group col-md-2">
							<button class="nanum badge badge-primary" id="insertKeyword"
								type="button" style="font-size: 19px;">추가</button>
						</div>
					</div>

				</div>
			</div>




			<!-- 키워드 출력 창-->
			<div class="row form-group">
				<div class="col-md-4">
					<label for=""></label>
				</div>
				<div class="col-md-6">
					<div class="card" style="max-width: 30rem;">
						<div class="card-body" id="printKeyword">
							<!-- 키워드 출력부분 -->
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<br>
				</div>
			</div>



			<!-- 골목 커버-->
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="form-group col-md-6 nanum" style="float: left;">
						<h3 class="nanum" style="">골목 커버</h3>
					</div>
				</div>
			</div>


			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="col-md-12 nanum" style="margin: 3px auto;">
						<div style="float: left">
							<!-- 골목 커버 미리보기 -->
							<div style="float: left; box-sizing: border-box;">
								<p style="display: inline-block; margin-bottom: 1px; color:#5a5a5a">골목 커버
									미리보기</p>
								<div style="width: 500px; height: 290px; overflow: hidden; padding: 0px;"
									id="streetThumbnailArea" class="form-control">
									<img id="streetThumbnail" style="width: 100%; height: 100%; object-fit: cover;">
								</div>
							</div>
						</div>
						<div style="float: left; margin: 1px;">
							<!-- 내 커버 추가하기 -->
							<div style="/* margin-left: 1px; margin-right: 1px; */ box-sizing: border-box;">
								<p style="display: inline-block; margin-bottom: 1px; color:#5a5a5a; margin-left: 10px;">내 커버</p>
								<div style="height: 80px; background-color: rgb(242, 213, 207); position: relative; cursor: pointer; margin-left: 10px;"
									id="myStreetCoverArea">
									<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
										<img id="myStreetCover" src="${contextPath}/resources/img/camera3(64px).png" style="width: 32px; height: 32px;">
									</div>
								</div>
							</div>
							<!-- 기본 제공 이미지-->
							<div style="margin: auto; box-sizing: border-box;">
								<div>
									<p class="nanum" style="display: inline-block; margin-bottom: 1px; margin-left: 10px; color:#5a5a5a">기본 이미지</p>
								</div>

								<div style="float: left;">
									<div style="width: 156px; height: 90px; margin-bottom: 1px; cursor: pointer; padding: 0; overflow: hidden; margin-left: 10px;">
										<img class="streetCover" id="streetCover1" src="${contextPath}/resources/streetCoverImage/골목.jpg" style="width: 100%; height: 100%; object-fit: cover; padding: 0;">
									</div>
									<div style="width: 156px; height: 90px; margin-top: 1px; cursor: pointer; padding: 0; overflow: hidden; margin-left: 10px;">
										<img class="streetCover" id="streetCover2" src="${contextPath}/resources/streetCoverImage/골목2.jpg" style="width: 100%; height: 100%; object-fit: cover; padding: 0;">
									</div>
								</div>

								<div style="float: left; margin-left: 1px;">
									<div style="width: 156px; height: 90px; margin-bottom: 1px; cursor: pointer; padding: 0; overflow: hidden;">
										<img class="streetCover" id="streetCover3" src="${contextPath}/resources/streetCoverImage/골목3.jpg" style="width: 100%; height: 100%; object-fit: cover; padding: 0;">
									</div>
									<div style="width: 156px; height: 90px; margin-top: 1px; cursor: pointer; padding: 0; overflow: hidden;">
										<img class="streetCover" id="streetCover4" src="${contextPath}/resources/streetCoverImage/골목4.jpg" style="width: 100%; height: 100%; object-fit: cover; padding: 0;">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<br>
				</div>
			</div>
			<!-- 파일업로드부분 -->
			<div class="col-md-12" id="fileArea">
				<input type="file" class="form-control nanum" id="streetCoverUpload"
					name="streetCoverUpload" onchange="LoadImg(this,1)"> 
				<input type="hidden" class="form-contrle nanum" id="sampleImg"
					name="sampleImg">
			</div>




			<!-- 골목 공개여부 -->
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="col-md-12 nanum">
						<h3 class="nanum mt-5" style="font-weight: bold;">골목 공개여부</h3>
					</div>
					<div class="col-md-12 nanum form-group">
						<div class="custom-control custom-radio">
							<input type="radio" id="public" name="streetPublic" value="Y"
								class="custom-control-input" onclick="checkPublic(this.value);"> <label
								class="custom-control-label" for="public"
								style="font-size: larger; color: darkgreen;">공개</label>
							<p style="font-size: smaller; color: #5a5a5a;">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 골목에 게시된 일반게시글을 누구나 볼 수
								있습니다.</p>
						</div>
						<div class="custom-control custom-radio">
							<input type="radio" id="private" name="streetPublic" value="N"
								class="custom-control-input" onclick="checkPublic(this.value);"> <label
								class="custom-control-label" for="private"
								style="font-size: larger; color: darkred">비공개</label>
							<p style="font-size: smaller; color: #5a5a5a;">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 골목에 게시된 일반 게시글은 골목에 가입한 회원만
								볼 수 있습니다.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<br>
			</div>



			<div class="row">
				<div class="col-md-2 offset-md-4" style="text-align: center;">
					<button type="submit"
						class="btn btn-primary btn-lg btn-block nanum">개설하기</button>
				</div>
				<div class="col-md-2" style="text-align: center;">
					<button type="button"
						class="btn btn-warning btn-lg btn-block nanum">취소</button>
						<br><br>
				</div>
			</div>
			<%-- <%@ include file="../common/footer.jsp"%> --%>
			<jsp:include page="../common/footer.jsp"/>
		</div>
	</form>


	<script>
		
		var insertStreetCheck = {
				
				"streetNm" : false,
				"streetIntro" : false,
				"streetPublic" : false,
				"streetPrivate" : false
		};
		
		function checkPublic(value){
			
			if(value == 'Y'){
				insertStreetCheck.streetPublic = true;
				insertStreetCheck.streetPrivate = true;	
			}
			else if(value == 'N'){
				insertStreetCheck.streetPublic = true;
				insertStreetCheck.streetPrivate = true;
			}
		}
		
		$(document).ready(function(){
				
			var $streetNm = $("#streetNm");
			var $streetIntro = $("#streetIntro");
			var $writeKeyword = $("#writeKeyword");
						
			
			// 골목이름 실시간 유효성 검사
			$streetNm.on("input", function() {
				var regExp = /^.{2,15}$/;

				if (!regExp.test($(this).val())) {
					$("#checkStreetNm").text("골목이름 형식이 유효하지 않습니다.")
									.css("color", "red");
					insertStreetCheck.streetNm = false;
				} else {
					$("#checkStreetNm").text("유효한 골목이름 형식입니다.")
									.css("color", "green");
					insertStreetCheck.streetNm = true;
				}
			});

			// 골목소개 실시간 유효성 검사
			$streetIntro.on("input", function() {
				var regExp = /^.{0,15}$/;

				if (!regExp.test($(this).val())) {
					$("#checkStreetIntro").text("골목소개 형식이 유효하지 않습니다.")
										.css("color", "red");
					insertStreetCheck.streetIntro = false;
					
				} else {
					$("#checkStreetIntro").text("유효한 골목소개 형식입니다.")
									.css("color", "green");
					insertStreetCheck.streetIntro = true;
				}
			});
			
			
			// 골목 키워드 실시간 유효성 검사
			$writeKeyword.on("input", function() {
				var regExp = /^.{0,15}$/;

				if (!regExp.test($(this).val())) {
					$("#checkWriteKeyword").text("키워드 형식이 유효하지 않습니다.")
										.css("color", "red");
					//insertStreetCheck.streetKeyword = false;
					$("#insertKeyword").prop("disabled", true);
				} else {
					$("#checkWriteKeyword").text("유효한 키워드 형식입니다.")
										.css("color", "green");
					//insertStreetCheck.streetKeyword = true;
					$("#insertKeyword").prop("disabled", false);
				}
			});
			
			
		});
		
		/* 관심사 제거 버튼 클릭시 관심사 제거 */
    	$(document).on("click",".deleteKeyword",function(){
    		$(this).parent().parent().remove();	
    	});
	
		/* 키워드 추가 삭제 관련 */
		$(document).on("click", "#insertKeyword", function(){	
			
			if( $("input[name=streetKeywords]").length > 2){
				alert("골목 키워드는 최대 3개까지만 입력 가능합니다.");
				$("#writeKeyword").val("");
			}
			else if($("#writeKeyword").val() == ""){
				alert("키워드를 입력하세요.");
			}
			else{ //키워드 3개 미만
				var inputs = $("#printKeyword").find("input");
				var insertVal = $("#writeKeyword").val();
				var count = 0;
				$.each(inputs, function(index, item){
					if(insertVal == $(item).val()){
						count ++;
					}
				});
				
				var writeKeyword = $("#writeKeyword").val();
				var $divPlus = $("<div></div>").addClass("form-group row");
				
				
				var $divPlus1 = $("<div></div>").addClass("col-sm-9");
	       		var $divPlus2 = $("<div></div>").addClass("col-sm-3");
	       		var $divPlus3 = $("<div></div>").addClass("col-sm-11").css({"background-color":"black","height":"2px"});
	       		var inputPlus = $("<input></input>")
					.prop({"type":"text", "readonly":"true", "name":"streetKeywords"})
					.val(writeKeyword).addClass("form-control-plaintext nanum")
					.css({"font-size":"18px","color":"black"});
				var buttonPlus = $("<button></button>").prop("type","button").addClass("badge badge-pill badge-danger deleteKeyword").html("X");		
				
				
				$divPlus1 = $divPlus1.append(inputPlus);
	            $divPlus2 = $divPlus2.append(buttonPlus);
	            $divPlus = $divPlus.append($divPlus1).append($divPlus2).append($divPlus3);
	            
	            $("#printKeyword").append($divPlus);
	            $("#writeKeyword").val("");
			}
		});
	
		$(function() {
			// <input type="file"> 숨기기
			$("#fileArea").hide();

			// 내 커버 추가 클릭 시 이벤트
			$("#myStreetCoverArea").click(function() {

				$("#streetCoverUpload").click();
			});

			// 기본 제공 이미지 클릭 시 이벤트
			$(".streetCover").on("click", function() {

				// 기본 이미지 미리보기
				var a = $(this).attr("src");
				$("#streetThumbnail").prop("src", a);



				// 미리보기 이미지 src 갖고오기
				var $streetThumbnail = $("#streetThumbnail").attr("src");

				// src 중 서버에 저장된 이름만 잘라내기
				var serverNm = $streetThumbnail.substring(40,$streetThumbnail.length);

				// string 값에 따라 #sampleImg value 변경
				if (serverNm == "골목.jpg") {

					$("#sampleImg").val("");
					$("#sampleImg").val("골목.jpg");

				} else if (serverNm == "골목2.jpg") {

					$("#sampleImg").val("");
					$("#sampleImg").val("골목2.jpg");

				} else if (serverNm == "골목3.jpg") {

					$("#sampleImg").val("");
					$("#sampleImg").val("골목3.jpg");

				} else if (serverNm == "골목4.jpg") {

					$("#sampleImg").val("");
					$("#sampleImg").val("골목4.jpg");
				}

			});
		});

		// 골목커버 미리보기
		function LoadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					if (num == 1) {
						$("#streetThumbnail").prop("src", e.target.result);
						$("#sampleImg").val("");
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}

				
			// submit 동작
			function validate() {

				for ( var key in insertStreetCheck) {
					if (!insertStreetCheck[key]) {
						alert("입력되지 않은 값이 있습니다. 입력해주세요.");
						return false;
					}
				}
				
				var streetThumbnail = $("#streetThumbnail").prop("src");
				
			
				if(streetThumbnail == ""){
					return false;
				}
			}		
				
	</script>


</body>
</html>