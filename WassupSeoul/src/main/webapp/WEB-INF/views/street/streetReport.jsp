<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>활동 보고서 작성</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<form action="sendReport" method="POST" enctype="multipart/form-data"
		role="form">

		<div class="container-fluid headerMargin loungeBack">

			<div class="row">
				<div class="col-md-6 offset-md-3">
					<h1 class="nanum" style="margin-top: 50px;">활동보고서 작성</h1>
				</div>
			</div>
			<div class="row">
				<br>
			</div>

			<div class="row form-inline my-2 my-lg-0">
				<div class="col-md-6 offset-md-3">
					<h3 class="nanum">오프라인모임 날짜</h3>
					<hr>
					<div class="row">
						<div class="col-md-6" style="display: inline-block;">
							<input class="nanum form-control" type="date"
								id="meetingStartDate" name="meetingStartDate"> &nbsp; <span
								class="nanum">(시작일)부터</span>
						</div>
						<div class="col-md-6" style="display: inline-block;">
							<input class="nanum form-control" type="date" id="meetingEndDate"
								name="meetingEndDate"> &nbsp; <span class="nanum">(종료일)까지</span>

						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<br> <br>
			</div>


			<div class="row">
				<div class="col-md-6 offset-md-3">
					<h3 class="nanum">오프라인모임 장소</h3>
					<hr>

					<div class="form-row form-group mb-3">
						<div class="col-md-3">
							<label style="font-size: larger;" for="postcodify_search_button">우편번호</label>
						</div>
						<div class="col-md-4">
							<input type="text" name="post"
								class="form-control nanum postcodify_postcode5" id="post">
						</div>
						<div class="col-md-3">
							<button type="button" class="btn btn-info nanum"
								id="postcodify_search_button">검색</button>
						</div>
					</div>

					<div class="form-row form-group mb-3">
						<div class="col-md-3 nanum">
							<label for="address1" style="font-size: larger;">도로명 주소</label>
						</div>

						<div class="col-md-9">
							<input type="text" class="form-control nanum postcodify_address"
								name="address1" id="address1">
						</div>
					</div>


					<div class="form-row form-group mb-3">
						<div class="col-md-3 nanum">
							<label for="address2" style="font-size: larger;">상세주소</label>
						</div>
						<div class="col-md-9">
							<input type="text" class="form-control nanum postcodify_details"
								name="address2" id="address2">
						</div>
					</div>

				</div>
			</div>


			<!-- 주소 -->
			<!-- 오픈소스 도로명 주소 API -->
			<!-- https://www.poesis.org/postcodify/ -->

			<!-- jQuery와 postcodify 를 로딩한다. -->
			<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
			<script>
				// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
				$(function() {
					$("#postcodify_search_button").postcodifyPopUp();
				});
			</script>

			<div class="row">
				<br> <br>
			</div>

			<div class="row form-inline my-2 my-lg-0">
				<div class="col-md-6 offset-md-3">
					<h3 class="nanum">오프라인모임 참여 인원</h3>
					<hr>

				</div>
				<div class="col-md-6 offset-md-3">
					<input class="nanum form-control mr-sm-3" type="number"
						placeholder="모임 참여  인원(명)" id="meetingMember" name="meetingMember">

				</div>
			</div>
			<div class="row">
				<br> <br>
			</div>




			<div class="row">
				
			</div>


			



			<div class="row">
				<div class="col-md-12">
					<br>
				</div>
			</div>
			<!-- 파일업로드부분 -->
			<div class="col-md-12" id="fileArea">
				<input type="file" class="form-control nanum" id="reportImgUpload"
					name="reportImgUpload" onchange="LoadImg(this,1)">
			</div>










			<div class="row">
				<div class="col-md-6 offset-md-3">
					<h3 class="nanum">오프라인모임 활동내역</h3>
					<hr>
				</div>
				<div class="col-md-6 offset-md-3">
					<textarea class="form-control nanum" id="reportContent"
						name="reportContent" rows="20" cols="20" style="resize: none;" placeholder="1500자  내외로 작성해주세요 :)"></textarea>
				</div>
				<div class="col-md-6 offset-md-3">
					<div class="col-md-12 nanum" style="margin: 3px auto;">
						<div style="float: left; margin: 1px;">
							<div style="margin-left: 1px; margin-right: 1px; box-sizing: border-box;">
								<p style="display: inline-block; margin-bottom: 10px; font-size: 25px;">+ 활동 사진</p>
								<div class="form-control" style="width: 800px; height: 500px; position: relative; padding: 0; 
											cursor: pointer; overflow: hidden; margin-left: 5%;" id="reportImgArea">
									<img style="width: 100%; height: 100%; object-fit: cover;" id="reportImg">
									<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);" id="addImgArea">
										<img id="addImg" src="${contextPath}/resources/img/camera3(64px).png" style="width: 64px; height: 64px;">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<br> <br>
			</div>



			<div class="row">
				<div class="col-md-6 offset-md-3" style="text-align: center;">
					<span class="nanum" style="font-size: 15px; color: red;"> *
						제출된 활동보고서 일부 정보가 누락되거나 위조시 활동점수에 반영되지 않으며 해당 골목에 패널티가 부여될수 있습니다. </span>
				</div>
			</div>
			<div class="row">
				<br> <br>
			</div>

			<div class="row">
				<div class="form-group col-md-6 offset-md-3"
					style="position: relative;">
					<div class="custom-control custom-checkbox"
						style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
						<input type="checkbox" class="custom-control-input" id="checkAll" name="checkAll"
						onchange="checkcheckcheck();">
						<label class="nanum custom-control-label" for="check">주의사항을 확인했습니다.</label>
					</div>
				</div>
			</div>
			<div class="row">
				<br> <br>
			</div>


			<div class="row">
				<div class="col-md-2 offset-md-4" style="text-align: center;">
					<button type="submit"
						class="btn btn-primary btn-lg btn-block nanum mb-5">제출하기</button>
				</div>
				<div class="col-md-2" style="text-align: center;">
					<a href="${header.referer}"
						class="btn btn-warning btn-lg btn-block nanum mb-5">취소</a>
				</div>
			</div>

		</div>
	</form>
	
	<script>
				/* var allCheck = {
						
						"meetingStartDate" : false,
						"meetingEndDate" : false,
						"post" : false,
						"address1" : false,
						"address2" : false,
						"meetingMember" : false,
						"reportContent" : false,
						"checkAll" : false					
						
				}
			
				
				$(document).ready(function(){
					
					var $meetingStartDate = $("#meetingStartDate");
					var $meetingEndDate = $("#meetingEndDate");
					var $post = $("#post");
					var $address1 = $("#address1");
					var $address2 = $("#address2");
					var $meetingMember = $("#meetingMember");
					var $reportImg = $("#reportImg");
					var $reportContent = $("#reportContent");
					var $checkAll = $("#checkAll");					
					
					 $meetingStartDate.on("input", function(){
						if($(this).val() == ""){
							allCheck.meetingStarDate = false;
						} else{
							allCheck.meetingStartDate = true;
						}
					});
					
					$meetingEndDate.on("input", function(){
						if($(this).val() == ""){
							allCheck.meetingEndDate = false;
						} else{
							allCheck.meetingEndDate = true;
						}
					}); 
					$post.on("input", function(){
						if($(this).val() == ""){
							allCheck.post = false;
						} else{
							allCheck.post = true;
						}
					});
					$address1.on("input", function(){
						if($(this).val() == ""){
							allCheck.address1 = false;
						} else{
							allCheck.address1 = true;
						}
					});
					$address2.on("input", function(){
						if($(this).val() == ""){
							allCheck.address2 = false;
						} else{
							allCheck.address2 = true;
						}
					});
					$meetingMember.on("input", function(){
						if($(this).val() == ""){
							allCheck.meetingMember = false;
						} else{
							allCheck.meetingMember = true;
						}
					});
					$reportContent.on("input", function(){
						if($(this).val() == ""){
							allCheck.reportContent = false;
						} else{
							allCheck.reportContent = true;
						}
					});
					
				});
				
				function checkcheckcheck(){
					
					if($(this).prop("checked") == true){
						allCheck.checkAll = true;
					}
					else($(this).prop("checke") == false){
						allCheck.checkAll = false;
					}
				}
				
				 */
			
				$(function() {
					// <input type="file"> 숨기기
					$("#fileArea").hide();

					
					$("#reportImgArea").click(function() {

						$("#reportImgUpload").click();
					});

				});

				
				function LoadImg(value, num) {
					if (value.files && value.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
							if (num == 1) {
								$("#reportImg").prop("src", e.target.result);
								$("#addImgArea").css("display", "none");
								$("#reportImgArea").css("background-color",
										"white");
							}
						}
						reader.readAsDataURL(value.files[0]);
					}
				}
				
				/* 
				function validate(){
					for( var key in allCheck){
						if(!allCheck[key]){
							alert("입력되지 않은 값이 있습니다. 입력해주세요.");
							return false;
						}
					}
					
					var reportImg = $("#reportImg").prop("src");
					
					if(reportImg == ""){
						return false;
					}
				} */
			</script>

	
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>

