<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	background-image: url('${contextPath}/resources/img/서울3.jpg');
	background-size: cover;
	width: 100%;
	height: 100%;
	opacity: 0.6;
	z-index: -1;
	background-repeat: no-repeat;
}
</style>
<body class="nanum">
	<%@include file="../common/header.jsp"%>


	<form method="POST" action="insertStreet" enctype="multipart/form-data"
		role="form" onsubmit="">

		<!-- input 태그 clear 버튼 -->
		<!-- <div class="input-group">
            <div class="form-group has-feedback has-clear">
                <input type="text" class="form-control" placeholder="Enter">
                <span class="form-control-clear glyphicon glyphicon-remove form-control-feedback hidden"></span>
            </div>
            <div class="input-group-btn">
                <button>X</button>
            </div>
        </div>
        <script>
            $('.form-control').on('input change', function(){
                var $this = $(this);
                var visible = Boolean($this.val());
                $('.form-control-clear').toggleClass('hidden', !visible);
            }).trigger('propertychange');

            $('.form-control-clear').on('click', function(){
                $('.form-control').val('').trigger('change').focus();
                $(this).toggleClass('hidden', true);
            });
        </script> -->
		<!-- ------------------------------------------------------------------------- -->
		<div class="container-fluid headerMargin loungeBack">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<h1 class="nanum" style="font-weight: bold;">골목 개설하기</h1>

					<!-- 예시 -->
					<!-- <div class="form-group col-md-5">
                        <div class="col-xs-3">
                            <label for="ex2">col-xs-3</label>
                            <input class="form-control nanum" id="ex2" type="text">
                        </div>
                    </div> -->
				</div>
			</div>
			<div class="row">
				<br>
			</div>


			<div class="row">
				<div class="col-md-6 offset-md-3">
					<!-- 골목이름 -->
					<div class="form-group col-md-6 nanum" style="float: left;">
						<h3 class="nanum" style="font-weight: bold;">골목이름</h3>
						<div class="col-xs-4">
							<input type="text" class="form-control nanum" name="streetNm"
								id="streetNm" placeholder="2글자이상 15글자이하로 작성하기(특수문자제외)">
							<span class="nanum" id="checkStreetNm"
								style="font-size: smaller;">&nbsp;</span>
						</div>
					</div>

					<!-- 지역구 -->
					<div class="form-group col-md-6 nanum" style="float: left;">
						<h3 class="nanum" style="font-weight: bold;">지역구</h3>
						<div class="col-xs-4">
							<select class="form-control nanum" name="districtNo"
								id="districtNo" required>
								<option value="10">강서구</option>
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




					<!-- 내용 전체 지우기 -->
					<div class="col-md-12">
						<!-- <span id="streetTitleClear">X</span> -->
					</div>
				</div>
			</div>
			<div class="row">
				<br>
			</div>
			<!-- 내용 전체 지우기 스크립트 -->
			<script>
				var $ipt = $('#streetTitle'), $clearIpt = $('#streetTitleClear');

				$ipt.keyup(function() {
					$("#streetTitleClear").toggle(Boolean($(this).val()));
				});

				$clearIpt.toggle(Boolean($ipt.val()));
				$clearIpt.click(function() {
					$("#streetTitle").val('').focus();
					$(this).hide();
				});

				// src가 존재할 때만 넘어가게 
				// onsubmit 동작이 일어났을때 -> c:set 을 이용해서 thumbnailArea의 src 를 el 변수로 저장 
				// -> form action에 넘기고 싶은 주소랑 함께 뒤에 쿼리스트링으로 src를 함께 넘긴다
			</script>



			<div class="row">
				<div class="col-md-6 offset-md-3">
					<!-- 골목소개 수정 -->
					<div class="form-group col-md-6 nanum" style="float: left;">
						<h3 class="nanum" style="font-weight: bold;">골목소개</h3>
						<div class="col-xs-4">
							<input type="text" class="form-control nanum" name="streetIntro"
								id="streetIntro" placeholder="15글자 이하로 작성하기(특수문자 제외)"> <span
								class="nanum" id="checkStreetIntro" style="font-size: smaller;">&nbsp;</span>
						</div>
					</div>

					<!-- 골목 총 회원수 수정 -->
					<div class="form-group col-md-6 nanum" style="float: left;">
						<h3 class="nanum" style="font-weight: bold;">골목 총 회원수</h3>
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
						<h3 class="nanum" style="font-weight: bold;">골목 키워드</h3>
					</div>
				</div>
			</div>
			<!-- 골목 키워드 1 -->
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="form-group col-md-2 nanum"
						style="float: left; text-align: center;">
						<label for="streetKeyword1" class="nanum"
							style="font-size: 20px; font-weight: bolder;">키워드1 : </label>
					</div>
					<div class="form-group col-md-5 nanum" style="float: left;">
						<div class="col-xs-4">
							<input type="text" class="form-control nanum"
								name="streetKeyword1" id="streetKeyword1"
								placeholder="15글자 이하로 작성하기(특수문자 제외)"> <span
								class="nanum" id="checkStreetKeyword2"
								style="font-size: smaller;">&nbsp;</span> <br>
						</div>
					</div>
					<div class="form-group col-md-5 nanum" style="float: left;">
						<div class="col-xs-2" style="float: left;">
							<button type="button" class="btn btn-info nanum">키워드추가</button>
							&nbsp;&nbsp;&nbsp;
						</div>

						<div class="col-xs-2" style="float: left;">
							<button type="button" class="btn btn-danger nanum">키워드삭제</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 골목 키워드 2 -->
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="form-group col-md-2 nanum"
						style="float: left; text-align: center;">
						<label for="streetKeyword1" class="nanum"
							style="font-size: 20px; font-weight: bolder;">키워드2 : </label>
					</div>
					<div class="form-group col-md-5 nanum" style="float: left;">
						<div class="col-xs-4">
							<input type="text" class="form-control nanum"
								name="streetKeyword1" id="streetKeyword1"
								placeholder="15글자 이하로 작성하기(특수문자 제외)"> <span
								class="nanum" id="checkStreetKeyword1"
								style="font-size: smaller;">&nbsp;</span> <br>
						</div>
					</div>
					<div class="form-group col-md-5 nanum" style="float: left;">
						<div class="col-xs-2" style="float: left;">
							<button type="button" class="btn btn-info nanum">키워드추가</button>
							&nbsp;&nbsp;&nbsp;
						</div>

						<div class="col-xs-2" style="float: left;">
							<button type="button" class="btn btn-danger nanum">키워드삭제</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 골목 키워드 3 -->
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="form-group col-md-2 nanum"
						style="float: left; text-align: center;">
						<label for="streetKeyword3" class="nanum"
							style="font-size: 20px; font-weight: bolder;">키워드3 : </label>
					</div>
					<div class="form-group col-md-5 nanum" style="float: left;">
						<div class="col-xs-4">
							<input type="text" class="form-control nanum"
								name="streetKeyword3" id="streetKeyword3"
								placeholder="15글자 이하로 작성하기(특수문자 제외)"> <span
								class="nanum" id="checkStreetKeyword2"
								style="font-size: smaller;">&nbsp;</span> <br>
						</div>
					</div>
					<div class="form-group col-md-5 nanum" style="float: left;">
						<div class="col-xs-2" style="float: left;">
							<button type="button" class="btn btn-info nanum">키워드추가</button>
							&nbsp;&nbsp;&nbsp;
						</div>

						<div class="col-xs-2" style="float: left;">
							<button type="button" class="btn btn-danger nanum">키워드삭제</button>
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
						<h3 class="nanum" style="font-weight: bold;">골목 커버</h3>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="col-md-12 nanum" style="margin: 3px auto;">
						<!-- 골목 커버 미리보기 -->
						<div style="float: left; box-sizing: border-box;">
							<p style="display: inline-block; margin-bottom: 1px;">골목 커버
								미리보기</p>
							<div
								style="border: 1px solid black; width: 492px; height: 282px;"
								id="streetThumnailArea">
								<img id="streetThumbnail" style="width: 490px; height: 280px;">
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="col-md-12 nanum" style="margin: 3px auto;">
						<!-- 내 커버 추가하기 -->
						<div
							style="float: left; margin-left: 1px; margin-right: 1px; box-sizing: border-box;">
							<p
								style="font-size: smaller; display: inline-block; margin-bottom: 1px;">내
								커버</p>
							<div
								style="border: 1px solid black; width: 250px; height: 165px; background-color: rgb(236, 233, 233); position: relative; cursor: pointer;"
								id="myStreetCoverArea">
								<div
									style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
									<img id="myStreetCover"
										src="${contextPath}/resources/img/camera3(64px).png"
										style="width: 32px; height: 32px;">
								</div>
							</div>
						</div>
						<!-- 기본 제공 이미지-->
						<div style="float: left; margin: auto; box-sizing: border-box;">
							<div>
								<p class="nanum"
									style="display: inline-block; font-size: smaller; margin-bottom: 1px; margin-left: 1px;">
									기본 이미지</p>
							</div>

							<div style="float: left;">
								<div
									style="border: 1px solid black; width: 142px; height: 82px; margin-bottom: 1px; cursor: pointer;">
									<img class="streetCover" id="streetCover1"
										src="${contextPath}/resources/img/골목.jpg"
										style="width: 140px; height: 80px;">
								</div>
								<div
									style="border: 1px solid black; width: 142px; height: 82px; margin-top: 1px; cursor: pointer;">
									<img class="streetCover" id="streetCover2"
										src="${contextPath}/resources/img/골목2.jpg"
										style="width: 140px; height: 80px;">
								</div>
							</div>

							<div style="float: left; margin-left: 1px;">
								<div
									style="border: 1px solid black; width: 142px; height: 82px; margin-bottom: 1px; cursor: pointer;">
									<img class="streetCover" id="streetCover3"
										src="${contextPath}/resources/img/골목3.jpg"
										style="width: 140px; height: 80px;">
								</div>
								<div
									style="border: 1px solid black; width: 142px; height: 82px; margin-top: 1px; cursor: pointer;">
									<img class="streetCover" id="streetCover4"
										src="${contextPath}/resources/img/골목4.jpg"
										style="width: 140px; height: 80px;">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>



			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="col-md-12 nanum" style="margin: 3px auto;">
						<div style="float: left">
							<!-- 골목 커버 미리보기 -->
							<div style="float: left; box-sizing: border-box;">
								<p style="display: inline-block; margin-bottom: 1px;">골목 커버
									미리보기</p>
								<div
									style="border: 1px solid black; width: 492px; height: 282px;"
									id="streetThumnailArea">
									<img id="streetThumbnail" style="width: 490px; height: 280px;">
								</div>
							</div>
						</div>
						<div style="float: left; margin: 1px;">
							<!-- 내 커버 추가하기 -->
							<div
								style="margin-left: 1px; margin-right: 1px; box-sizing: border-box;">
								<p
									style="display: inline-block; margin-bottom: 1px;">내
									커버</p>
								<div
									style="border: 1px solid black; width: 300px; height: 80px; background-color: rgb(236, 233, 233); position: relative; cursor: pointer;"
									id="myStreetCoverArea">
									<div
										style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
										<img id="myStreetCover"
											src="${contextPath}/resources/img/camera3(64px).png"
											style="width: 32px; height: 32px;">
									</div>
								</div>
							</div>
							<!-- 기본 제공 이미지-->
							<div style="margin: auto; box-sizing: border-box;">
								<div>
									<p class="nanum"
										style="display: inline-block; margin-bottom: 1px; margin-left: 1px;">
										기본 이미지</p>
								</div>

								<div style="float: left;">
									<div
										style="border: 1px solid black; width: 142px; height: 82px; margin-bottom: 1px; cursor: pointer;">
										<img class="streetCover" id="streetCover1"
											src="${contextPath}/resources/img/골목.jpg"
											style="width: 140px; height: 80px;">
									</div>
									<div
										style="border: 1px solid black; width: 142px; height: 82px; margin-top: 1px; cursor: pointer;">
										<img class="streetCover" id="streetCover2"
											src="${contextPath}/resources/img/골목2.jpg"
											style="width: 140px; height: 80px;">
									</div>
								</div>

								<div style="float: left; margin-left: 1px;">
									<div
										style="border: 1px solid black; width: 142px; height: 82px; margin-bottom: 1px; cursor: pointer;">
										<img class="streetCover" id="streetCover3"
											src="${contextPath}/resources/img/골목3.jpg"
											style="width: 140px; height: 80px;">
									</div>
									<div
										style="border: 1px solid black; width: 142px; height: 82px; margin-top: 1px; cursor: pointer;">
										<img class="streetCover" id="streetCover4"
											src="${contextPath}/resources/img/골목4.jpg"
											style="width: 140px; height: 80px;">
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
			</div>




			<!-- 골목 공개여부 -->
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="col-md-12 nanum">
						<h3 class="nanum" style="font-weight: bold;">골목 공개여부</h3>
					</div>
					<div class="col-md-12 nanum form-group">
						<div class="custom-control custom-radio">
							<input type="radio" id="public" name="streetPublic"
								class="custom-control-input" checked=""> <label
								class="custom-control-label" for="public"
								style="font-size: larger;">공개</label>
							<p style="font-size: smaller;">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 골목에 게시된 일반게시글을 누구나 볼 수
								있습니다.</p>
						</div>
						<div class="custom-control custom-radio">
							<input type="radio" id="private" name="streetPublic"
								class="custom-control-input"> <label
								class="custom-control-label" for="private"
								style="font-size: larger;">비공개</label>
							<p style="font-size: smaller;">
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
						class="btn btn-primary btn-lg btn-block nanum">수정하기</button>
				</div>
				<div class="col-md-2" style="text-align: center;">
					<button type="button"
						class="btn btn-secondary btn-lg btn-block nanum">취소</button>
				</div>
			</div>
		</div>
	</form>


	<script>
		$(function() {
			// <input type="file"> 숨기기
			$("#fileArea").hide();

			// 내 커버 추가 클릭 시 이벤트
			$("#myStreetCoverArea").click(function() {
				$("#streetCoverUpload").click();
			});

			// 기본 제공 이미지 클릭 시 이벤트
			$(".streetCover").click(function() {
				var a = $(this).attr("src");
				$("#streetThumbnail").prop("src", a);
			});
		});

		// 골목커버 미리보기
		function LoadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					switch (num) {
					case 1:
						$("#streetThumbnail").prop("src", e.target.result);
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}

		// 골목이름 실시간 유효성 검사
		$("#streetTitle").on(
				"input",
				function() {
					var regExp = /^[A-Za-z가-힣0-9]{2,15}$/;

					if (!regExp.test($(this).val())) {
						$("#checkStreetTitle").text("골목이름 형식이 유효하지 않습니다.").css(
								"color", "red");
					} else {
						$("#checkStreetTitle").text("유효한 골목이름 형식입니다.").css(
								"color", "green");
					}
				});

		// 골목소개 실시간 유효성 검사
		$("#streetIntroduce").on(
				"input",
				function() {
					var regExp = /^[A-Za-z가-힣0-9]{0,15}$/;

					if (!regExp.test($(this).val())) {
						$("#checkStreetIntroduce").text("골목소개 형식이 유효하지 않습니다.")
								.css("color", "red");
					} else {
						$("#checkStreetIntroduce").text("유효한 골목소개 형식입니다.").css(
								"color", "green");
					}
				});

		// 골목 키워드 실시간 유효성 검사
		$("#streetKeyword1").on(
				"input",
				function() {
					var regExp = /^[A-Za-z가-힣0-9]{0,15}$/;

					if (!regExp.test($(this).val())) {
						$("#checkStreetKeyword1").text("키워드 형식이 유효하지 않습니다.")
								.css("color", "red");
					} else {
						$("#checkStreetKeyword1").text("유효한 키워드 형식입니다.").css(
								"color", "green");
					}
				});
		$("#streetKeyword2").on(
				"input",
				function() {
					var regExp = /^[A-Za-z가-힣0-9]{0,15}$/;

					if (!regExp.test($(this).val())) {
						$("#checkStreetKeyword2").text("키워드 형식이 유효하지 않습니다.")
								.css("color", "red");
					} else {
						$("#checkStreetKeyword2").text("유효한 키워드 형식입니다.").css(
								"color", "green");
					}
				});
		$("#streetKeyword3").on(
				"input",
				function() {
					var regExp = /^[A-Za-z가-힣0-9]{0,15}$/;

					if (!regExp.test($(this).val())) {
						$("#checkStreetKeyword3").text("키워드 형식이 유효하지 않습니다.")
								.css("color", "red");
					} else {
						$("#checkStreetKeyword3").text("유효한 키워드 형식입니다.").css(
								"color", "green");
					}
				});
	</script>

	<%@ include file="../common/footer.jsp"%>

</body>
</html>