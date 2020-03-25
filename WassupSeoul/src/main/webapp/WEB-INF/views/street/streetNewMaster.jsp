<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골목 삭제</title>
</head>
<body>
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
					action="deleteStreet?no=${streetNo}&imgNo=${imgNo}"
					enctype="multipart/form-data" role="form" onsubmit="">
					<div class="container-fluid">
						<!-- 골목 삭제 -->
						<div class="row">
							<h1 class="nanum">골목 삭제하기</h1>
						</div>
						<div class="row">
							<br>
						</div>

						<div class="row">
							<div class="col-md-12">
								<h3 class="nanum">골목대장 위임하기</h3>
							</div>
							<div class="col-md-6 nanum form-group">
								<input class="form-control nanum" type="text"
									placeholder="주민 닉네임" id="juminNickName">
							</div>
							<div class="col-md-2 nanum form-group">
								<button class="nanum btn btn-primary" type="button"
									id="juminSearch">검색</button>
							</div>
						</div>

						<div class="row">
							<br>
						</div>


						<div class="row">
							<div class="col-md-12 nanum form-group">
								<label class="col-form-label" for="newLeader">새로운 골목대장</label>
								&nbsp;&nbsp; 
							</div>
							<div class="col-md-6 nanum form-group">
								<input id="newLeader" name="newLeader"
									class="form-control nanum" type="text" readonly
									placeholder="지정된 골목대장 닉네임">
							</div>
							<div class="col-md-2 nanum form-group">
								<button class="nanum btn btn-primary" type="button"
									id="yesMaster">위임</button>
							</div>
						</div>

						<div class="row">
							<br>
						</div>


						<div class="row">
							<div class="col-md-12 nanum">
								<h5 class="nanum">골목 탈퇴*삭제하기</h5>
							</div>
							<div class="col-md-12">
								<table class="table table-hover nanum"
									style="text-align: center; line-height: 50px;">
									<tbody>
										<tr>
											<th>골목탈퇴</th>
											<td><button type="button" class="btn btn-warning nanum">골목탈퇴</button></td>
										</tr>
										<tr>
											<th>골목삭제</th>
											<td><button type="button" class="btn btn-danger nanum">골목삭제</button></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div class="row">
							<br>
						</div>


						<div class="row">
							<div class="col-md-6" style="text-align: center;">
								<div style="display: inline-block;">
									<button class="btn btn-primary nanum" type="button">나가기</button>
								</div>
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
		$("#juminSearch").on("click", function() {
			var $juminNickName = $("#juminNickName");
			var $streetNo = $
			{
				streetNo
			}
			;
			console.log("골목 번호 : ${streetNo}");
			var $newLeader = $("#newLeader");

			if ($juminNickName.val() == "") {
				alert("검색할 주민 닉네임을 입력하세요.");
			} else {
				$.ajax({
					url : "searchJumin",
					data : {
						juminNickName : $juminNickName.val(),
						no : $streetNo
					},
					type : "post",
					dataType : "json",
					success : function(jumin) {

						if (jumin == null) {
							alert("검색 결과가 없습니다. 닉네임을 다시 입력해주세요");
							$juminNickName.focus();
						} else {
							/* $jumin = jumin;
							console.log("주민 : " + $jumin); 
							지원아, jumin을  $jumin에 넣는다고 그대로 그 값이 들어가지 않아
							가령 jumin.val()을 써야 한다던가 jumin.html()을 써야할
							경우가 있기도 해. 근데 아무튼 지금은 그럴 필요가 없이
							위처럼 console.log(jumin)으로 하면 다 데이터 받아와.
							이후 화면 만드는건 알아서 하렴. 난 그건 좆도 못해서 나도 힘들단다.
							(참고로 이거 승환이가 개고수임)*/
							$newLeader.val("");
							$newLeader.val(jumin.memberNickname);
						}
					},

					error : function(e) {
						console.log("ajax 통신 실패");
						console.log(e);
					}
				});
			}
		});
		
		$("#yesMaster").on("click", function(){
			// 위임하기 위임 취소... 
			if($("#newLeader").val()==""){
				alert("위임할 주민을 검색해주세요.");
			} else{
				
			}
			
		});
		
		</script>

</body>
</html>