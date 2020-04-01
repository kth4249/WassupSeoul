<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천 친구</title>
<style>
.friendRecommendProfile {
	width: 50px;
	height: 50px;
}

.friendRecommendName {
	line-height: 20px;
}
</style>
</head>
<body style="background-color: rgb(255,255,255);">
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


	<div class="container-fluid" style="margin-top: 10px;">
		<jsp:include page="streetDetail/streetSide.jsp" />
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div>
					<div>
						<h1 class="nanum" style="display: inline;">추천 친구</h1><br><br>
						<h5 class="nanum" style="display: inline; color: tomato;">
							회원님의 관심사 :
							<c:if test="${!empty myHobby }">
								<c:forEach items="${myHobby}" var="hobby">
							#${hobby.hobbyName}
						</c:forEach>
							</c:if>

						</h5>
					</div>
				</div>
				<hr>

				<c:if test="${empty mList }">
					<div class="card">
						<div class="card-body">회원님과 비슷한 관심사를 가진 주민이 없습니다.</div>
					</div>
				</c:if>

				<c:if test="${!empty mList }">
					<c:forEach items="${mList}" var="member">
						<div class="mb-1">
							<div>
								<div class="row">
									<div style="width: 50px !important; height: 50px !important; overflow: hidden; border-radius: 70%; margin-left: 30px;">
										<img src="${contextPath}/resources/profileImage/${member.memberProfileUrl}"
											class="friendRecommendProfile" style="width: 100%; height: 100%; object-fit: cover;">
									</div>
									<div class="col-md-6">
										<h4 class="nanum friendRecommendName">${member.memberNm }</h4>
										<h5 class="nanum" style="color: darkgreen; font-size: 18px;">
											<c:if test="${!empty hList}">
												<c:forEach items="${hList}" var="hobby">
													<c:if test="${member.memberNo == hobby.memberNo }">
											#${hobby.hobbyName}
										</c:if>
												</c:forEach>
											</c:if>
										</h5>
									</div>
									<div class="col-md-4 mt-2">
										<button type="button"
											class="btn btn-sm btn-outline-info addFriend"
											value="${member.memberNo}">친구추가</button>
										<button type="button"
											class="btn btn-sm btn-outline-danger friendRecommendRemove"
											value="${member.memberNo}">숨기기</button>
									</div>	
								</div>
							</div>
						</div>
					</c:forEach>

				</c:if>
			</div>

			<div class="col-md-4"></div>
		</div>
	</div>

	<script>
		/* 친구 추가용 Ajax  */
		$(".addFriend").click(function(event) {
			var yourNum = $(this).val()
			$.ajax({
				url : "addFriend",
				data : {
					"yourNum" : yourNum
				},
				success : function() {
					alert("친구 신청 완료");
					$(event.target).parent().parent().parent().parent().css("display", "none");
					sendAlarm(yourNum);
				},
				error : function() {
					console.log("친구 요청 ajax 통신 실패")
				}
			})
		})

		/* 추천 친구 숨김용 Ajax */
		$(".friendRecommendRemove").click(function(event) {
			$.ajax({
				url : "hideFriend",
				data : {
					"yourNum" : $(this).val()
				},
				success : function() {
					$(event.target).parent().parent().parent().parent().css("display", "none");
				},
				error : function() {
					console.log("친구 요청 ajax 통신 실패")
				}
			})
			
		})
	</script>

</body>
</html>