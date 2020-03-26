<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골목 수정</title>
<style>
.drawColor:hover {
	cursor: pointer;
}

#canvas {
	border: 1px solid black;
}

.jb_table {
	display: table;
}

.drawing {
	border-radius: 10px;
	display: table-row;
}

#draw {
	display: table-cell;
	vertical-align: top;
}

.drawColor {
	width: 32px;
	height: 32px;
	margin-left: 10px;
}

a:hover {
	color: #0d0d0d;
	text-decoration: none;
}
</style>
</head>
<body style="background-color: rgb(221, 233, 218);">


	<!-- 골목 네비바 여백 -->
	<div class="container-fluid" style="margin-top: 57px;">
		<div class="row" style="padding: 0px; height: 44px"></div>
	</div>


	<!-- 고정된 골목 네비바  -->
	<%-- <%@ include file="../street/streetDetail/streetNav.jsp"%> --%>
	<jsp:include page="../street/streetDetail/streetNav.jsp" />



	<!-- 고정된 헤더 -->
	<%-- <%@include file="../common/header.jsp"%> --%>
	<jsp:include page="../common/header.jsp" />



	<!-- 컨텐츠영역-->
	<div class="container-fluid">
		<div class="row">

			<%-- <%@ include file="../street/streetDetail/streetSide.jsp"%> --%>
			<jsp:include page="../street/streetDetail/streetSide.jsp" />


			<!-- 사이드1 여백 -->
			<div class="col-md-4" id="devideArea"></div>
			<!-- 사이드1 여백 -->
			
			<div class="col-md-4" id="devideArea" style="margin-top: 10px;">

				<form method="POST"
					action="updateStreet?no=${streetNo}&imgNo=${imgNo}"
					enctype="multipart/form-data" role="form" onsubmit="">

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
					<div class="container-fluid">
						<div class="row">
							<h1 class="nanum" style="font-weight: bold;">골목 수정하기</h1>
						</div>
						<div class="row">
							<br>
						</div>


						<div class="row">
							<!-- 골목이름 시작 -->
							<div class="form-group col-md-6 nanum" style="float: left;">
								<h3 class="nanum" style="font-weight: bold;">골목이름</h3>
								<div class="col-xs-4">
									<input type="text" class="form-control nanum" name="streetNm"
										id="streetNm" placeholder="2글자이상 15글자이하로 작성하기(특수문자제외)"
										value="${street.streetNm}"> <span class="nanum"
										id="checkStreetNm" style="font-size: smaller;">&nbsp;</span>
								</div>
							</div>
							<!-- 골목이름 끝 -->

							<!-- 지역구 시작 -->
							<div class="form-group col-md-6 nanum" style="float: left;">
								<h3 class="nanum" style="font-weight: bold;">지역구</h3>
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
							<!-- 지역구 끝 -->
							<script>
								$
										.each(
												$("#districtNo>option"),
												function(index, item) {

													if ($(item).attr("value") == "${street.districtNo}") {
														$(item).prop(
																"selected",
																"true");
														// 킬킬킬킬킬킬킬킬킬 잘 안되죠? 
														// 그래도 힘 내셔야죠?
														// 왜인줄앎?
														// 넌 할 수 있거든
														// 이건 되는데 밑에거는 안되는이유좀..

													}
												});
							</script>

							<!-- 내용 전체 지우기 -->
							<div class="col-md-12">
								<!-- <span id="streetTitleClear">X</span> -->
							</div>
						</div>

						<div class="row">
							<br>
						</div>
						<!-- 내용 전체 지우기 스크립트 -->
						<script>
							var $ipt = $('#streetTitle'), $clearIpt = $('#streetTitleClear');

							$ipt.keyup(function() {
								$("#streetTitleClear").toggle(
										Boolean($(this).val()));
							});

							$clearIpt.toggle(Boolean($ipt.val()));
							$clearIpt.click(function() {
								$("#streetTitle").val('').focus();
								$(this).hide();
							});
						</script>



						<div class="row">
							<!-- 골목소개 수정 -->
							<div class="form-group col-md-6 nanum" style="float: left;">
								<h3 class="nanum" style="font-weight: bold;">골목소개</h3>
								<div class="col-xs-4">
									<input type="text" class="form-control nanum"
										name="streetIntro" id="streetIntro"
										placeholder="15글자 이하로 작성하기(특수문자 제외)"
										value="${street.streetIntro }"> <span class="nanum"
										id="checkStreetIntro" style="font-size: smaller;">&nbsp;</span>
								</div>
							</div>

							<!-- 골목 총 회원수 수정 -->
							<div class="form-group col-md-6 nanum" style="float: left;">
								<h3 class="nanum" style="font-weight: bold;">골목 총 회원수</h3>
								<div class="col-xs-4">
									<select class="form-control nanum" name="streetMaxMember"
										id="streetMaxMember" required>
										<option selected value="50">50</option>
										<option value="100">100</option>
										<option value="150">150</option>
										<option value="200">200</option>
										<option value="250">250</option>
										<option value="300">300</option>
									</select>
								</div>
							</div>

						</div>
						<div class="row">
							<br>
						</div>
						<script>
							$
									.each(
											$("#streetMaxMember>option"),
											function(index, item) {

												if ($(item).attr("value") == "${street.streetMaxMember}") {
													$(item).prop("selected",
															"true");
													// 킬킬킬킬킬킬킬킬킬 잘 안되죠? 
													// 그래도 힘 내셔야죠?
													// 왜인줄앎?
													// 넌 할 수 있거든
													// 이건 되는데 밑에거는 안되는이유좀..

												}
											});
						</script>


						<!-- 골목 키워드 -->
						<div class="row">
							<div class="form-group col-md-6 nanum" style="float: left;">
								<h3 class="nanum" style="font-weight: bold;">골목 키워드</h3>
							</div>
						</div>
						<!-- 골목 키워드 1 -->
						<div class="row">
							<div class="form-group col-md-2 nanum"
								style="float: left; text-align: center;">
								<label for="streetKeyword1" class="nanum"
									style="font-size: 20px; font-weight: bolder;">키워드1 : </label>
							</div>
							<div class="form-group col-md-5 nanum" style="float: left;">
								<div class="col-xs-4">
									<input type="text" class="form-control nanum"
										name="streetKeywords" id="streetKeyword1"
										placeholder="15글자 이하로 작성하기(특수문자 제외)"> <span
										class="nanum" id="checkStreetKeyword1"
										style="font-size: smaller;">&nbsp;</span> <br>
								</div>
							</div>
						</div>
						<!-- 골목 키워드 2 -->
						<div class="row">
							<div class="form-group col-md-2 nanum"
								style="float: left; text-align: center;">
								<label for="streetKeyword2" class="nanum"
									style="font-size: 20px; font-weight: bolder;">키워드2 : </label>
							</div>
							<div class="form-group col-md-5 nanum" style="float: left;">
								<div class="col-xs-4">
									<input type="text" class="form-control nanum"
										name="streetKeywords" id="streetKeyword2"
										placeholder="15글자 이하로 작성하기(특수문자 제외)"> <span
										class="nanum" id="checkStreetKeyword2"
										style="font-size: smaller;">&nbsp;</span> <br>
								</div>
							</div>
						</div>
						<!-- 골목 키워드 3 -->
						<div class="row">
							<div class="form-group col-md-2 nanum"
								style="float: left; text-align: center;">
								<label for="streetKeyword3" class="nanum"
									style="font-size: 20px; font-weight: bolder;">키워드3 : </label>
							</div>
							<div class="form-group col-md-5 nanum" style="float: left;">
								<div class="col-xs-4">
									<input type="text" class="form-control nanum"
										name="streetKeywords" id="streetKeyword3"
										placeholder="15글자 이하로 작성하기(특수문자 제외)"> <span
										class="nanum" id="checkStreetKeyword3"
										style="font-size: smaller;">&nbsp;</span> <br>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<br>
							</div>
						</div>

						<c:forEach var="key" items="${keywords}" varStatus="vs">
							<script>
								console.log("${key.keywordContent}");
								var kIndex = 1;

								$(function() {
									var keywordTag;
									var keyword = "${key.keywordContent}";
									keywordTag = "#streetKeyword" + kIndex;
									kIndex++;

									$(keywordTag).val(keyword);
								});
							</script>
						</c:forEach>


						<!-- 골목 커버-->
						<div class="row">
							<div class="form-group col-md-6 nanum" style="float: left;">
								<h3 class="nanum" style="font-weight: bold;">골목 커버</h3>
							</div>
						</div>


						<div class="row">
							<div class="col-md-12 nanum" style="margin: 3px auto;">
								<div style="float: left">
									<!-- 골목 커버 미리보기 -->
									<div style="float: left; box-sizing: border-box;">
										<p style="display: inline-block; margin-bottom: 1px;">골목
											커버 미리보기</p>
										<div
											style="border: 1px solid black; width: 506px; height: 290px;"
											id="streetThumbnailArea">
											<img id="streetThumbnail"
												style="width: 504px; height: 288px;"
												src="${contextPath}/resources/streetCoverImage/${imgUrl}">
										</div>
									</div>
								</div>
								<div style="float: left; margin: 1px;">
									<!-- 내 커버 추가하기 -->
									<div
										style="margin-left: 1px; margin-right: 1px; box-sizing: border-box;">
										<p style="display: inline-block; margin-bottom: 1px;">내 커버</p>
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
												style="border: 1px solid black; width: 156px; height: 90px; margin-bottom: 1px; cursor: pointer;">
												<img class="streetCover" id="streetCover1"
													src="${contextPath}/resources/streetCoverImage/골목.jpg"
													style="width: 154px; height: 88px;">
											</div>
											<div
												style="border: 1px solid black; width: 156px; height: 90px; margin-top: 1px; cursor: pointer;">
												<img class="streetCover" id="streetCover2"
													src="${contextPath}/resources/streetCoverImage/골목2.jpg"
													style="width: 154px; height: 88px;">
											</div>
										</div>

										<div style="float: left; margin-left: 1px;">
											<div
												style="border: 1px solid black; width: 156px; height: 90px; margin-bottom: 1px; cursor: pointer;">
												<img class="streetCover" id="streetCover3"
													src="${contextPath}/resources/streetCoverImage/골목3.jpg"
													style="width: 154px; height: 88px;">
											</div>
											<div
												style="border: 1px solid black; width: 156px; height: 90px; margin-top: 1px; cursor: pointer;">
												<img class="streetCover" id="streetCover4"
													src="${contextPath}/resources/streetCoverImage/골목4.jpg"
													style="width: 154px; height: 88px;">
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
							<input type="file" class="form-control nanum"
								id="streetCoverUpload" name="streetCoverUpload"
								onchange="LoadImg(this,1)"> <input type="hidden"
								class="form-contrle nanum" id="sampleImg" name="sampleImg">
						</div>




						<!-- 골목 공개여부 -->
						<div class="row">
							<div class="col-md-12 nanum">
								<h3 class="nanum" style="font-weight: bold;">골목 공개여부</h3>
							</div>
							<div class="col-md-12 nanum form-group">
								<div class="custom-control custom-radio">
									<input type="radio" id="public" name="streetPublic" value="Y"
										class="custom-control-input"> <label
										class="custom-control-label" for="public"
										style="font-size: larger;">공개</label>
									<p style="font-size: smaller;">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 골목에 게시된 일반게시글을 누구나 볼 수
										있습니다.</p>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" id="private" name="streetPublic" value="N"
										class="custom-control-input"> <label
										class="custom-control-label" for="private"
										style="font-size: larger;">비공개</label>
									<p style="font-size: smaller;">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 골목에 게시된 일반 게시글은 골목에 가입한
										회원만 볼 수 있습니다.</p>
								</div>
							</div>
						</div>
						<div class="row">
							<br>
						</div>
						<script>
							$
									.each(
											$("input[name=streetPublic]"),
											function(index, item) {
												if ($(item).attr("value") == "${street.streetPublic}") {
													$(item).prop("checked",
															"true");
												}
											});
						</script>



						<div class="row">
							<div class="col-md-3" style="text-align: center;">
								<button type="submit"
									class="btn btn-primary btn-lg btn-block nanum">수정하기</button>
							</div>
							<div class="col-md-3" style="text-align: center;">
								<button type="button"
									class="btn btn-secondary btn-lg btn-block nanum">취소</button>
							</div>
						</div>
					</div>
				</form>
			</div>

			<!-- 사이드2 여백 -->
			<div class="col-md-4" id="devideArea"></div>
			<!-- 사이드2 여백 -->
		</div>
	</div>


	<script>
		$(function() {
			// <input type="file"> 숨기기
			$("#fileArea").hide();

			// 내 커버 추가 클릭 시 이벤트
			$("#myStreetCoverArea").click(function() {

				$("#streetCoverUpload").click();
			});

			// 기본 제공 이미지 클릭 시 이벤트
			$(".streetCover").on(
					"click",
					function() {

						// 기본 이미지 미리보기
						var a = $(this).attr("src");
						$("#streetThumbnail").prop("src", a);

						
						// 기본이미지 값 등록
						// 미리보기 이미지 src 갖고오기
						var $streetThumbnail = $("#streetThumbnail")
								.attr("src");

						// src 중 서버에 저장된 이름만 잘라내기
						var serverNm = $streetThumbnail.substring(40,
								$streetThumbnail.length);

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
						console.log("sampleImg 비어있는지 확인  : "
								+ $("#sampleImg").val());
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}

		// 골목이름 실시간 유효성 검사
		$("#streetNm").on(
				"input",
				function() {
					var regExp = /^[A-Za-z가-힣0-9\s]{2,15}$/;

					if (!regExp.test($(this).val())) {
						$("#checkStreetNm").text("골목이름 형식이 유효하지 않습니다.").css(
								"color", "red");
					} else {
						$("#checkStreetNm").text("유효한 골목이름 형식입니다.").css(
								"color", "green");
					}
				});

		// 골목소개 실시간 유효성 검사
		$("#streetIntro").on(
				"input",
				function() {
					var regExp = /^[A-Za-z가-힣0-9\s]{0,15}$/;

					if (!regExp.test($(this).val())) {
						$("#checkStreetIntro").text("골목소개 형식이 유효하지 않습니다.").css(
								"color", "red");
					} else {
						$("#checkStreetIntro").text("유효한 골목소개 형식입니다.").css(
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

	<%-- <%@ include file="../common/footer.jsp"%> --%>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>