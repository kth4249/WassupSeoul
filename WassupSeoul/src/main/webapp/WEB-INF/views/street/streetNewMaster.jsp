<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골목 대장 위임</title>
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
					action="yesMaster?no=${streetNo}"
					enctype="multipart/form-data" role="form" onsubmit="">
					<div class="container-fluid">
						<!-- 골목 삭제 -->
						<div class="row">
							<h1 class="nanum">골목 대장 위임하기</h1>
						</div>
						<div class="row">
							<br>
						</div>

						<div class="row">
							<div class="col-md-12">
								<h3 class="nanum">주민 검색</h3>
							</div>
							<div class="col-md-6 nanum form-group">
								<input class="form-control nanum" type="text"
									placeholder="주민 닉네임" id="juminNickName">
							</div>
							<div class="nanum form-group">
								<button class="nanum btn btn-primary" type="button"
									id="juminSearch">검색</button>
							</div>
						</div>

						<div class="row">
							<br>
						</div>


						<div class="row">
						
							<div class="col-md-12">
								<h3 class="nanum">새로운 골목대장</h3>
							</div>
							<div class="col-md-6 nanum form-group">
								<input id="newLeader" name="newLeader"
									class="form-control nanum" type="text" readonly
									placeholder="지정된 골목대장 닉네임">
								<input type="hidden" id="newNo" name="newNo">
							</div>
							<div style="text-align: center;">
								<div style="display: inline-block;">
									<button type="submit" class="btn btn-info nanum" id="yesMaster">위임하기</button>
								</div>
							</div>
							<div style="text-align: center;">
								<div style="display: inline-block; margin-left:10px">
									<button class="btn btn-warning nanum" type="button">나가기</button>
								</div>
							</div>
							<span style="color:darksalmon"> * 골목대장 위임은 취소 할 수 없으므로, 다시 한번 확인하여 주시길 바랍니다 * </span>
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
			var $streetNo = ${streetNo};
			var $newLeader = $("#newLeader");
			var $newNo = $("#newNo");

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
							alert("주민이 이미 개설한 골목이 있거나 검색 결과가 없습니다.\n닉네임을 다시 입력해주세요");
							$newLeader.val("");
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
							$newNo.val("");
							$newNo.val(jumin.memberNo);
						}
					},

					error : function(e) {
						console.log("ajax 통신 실패");
						console.log(e);
					}
				});
			}
		});
		/* 알람 관련 해서 조금 수정 -태훈*/
		$("#yesMaster").on("click", function() {
			if ($("#newLeader").val() == "") {
				alert("위임할 주민을 검색해주세요.");
				return false;
			} else {
				if(!confirm("위임하시겠습니까?")){
					return false;
				} else {
					console.log($("#newNo").val());
					//sendAlarm($("#newNo").val());
					return true;
				}
			}

		});
		/* 알람 관련 해서 조금 수정*/
	</script>

</body>
</html>