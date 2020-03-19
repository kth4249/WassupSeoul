<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recommend Friend</title>
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
<body class="nanum">
	<%@ include file="../common/header.jsp" %>
	<div class="container headerMargin">
		<h1 class="nanum" style="display: inline;">추천 친구</h1>
		&nbsp;&nbsp;&nbsp;
		<h5 class="nanum" style="display: inline; color: tomato;">회원님의
			관심사 : 
			<c:if test="${!empty myHobby }">
				<c:forEach items="${myHobby}" var="hobby" >
					#${hobby.hobbyName}
				</c:forEach>
			</c:if>
			
			
			</h5>
		<hr>
		
		<c:if test="${!empty mList }">
			<c:forEach items="${mList}" var="member">
				<div class="row">
					<div class="col-md-2">
						<img src="${contextPath}/resources/profileImage/${member.memberProfileUrl} class="friendRecommendProfile">
					</div>
					<div class="col-md-8">
						<h4 class="nanum friendRecommendName">${member.memberNm }</h4>
						<h5 class="nanum">
						<c:if test="${!empty hList}">
							<c:forEach items="${hList}" var="hobby" >
								#${hobby.hobbyName}
							</c:forEach>
						</c:if>
						</h5>
					</div>
					<div class="col-md-2 mt-2">
						<button type="button" class="btn btn-sm btn-outline-info">친구추가</button>
						<button type="button"
							class="btn btn-sm btn-outline-danger friendRecommendRemove">숨기기</button>
					</div> 
				</div>
				<hr>
			</c:forEach>
		
		</c:if>
		
		
		<div class="row">
			<div class="col-md-2">
				<img src="${contextPath}/resources/img/usericon.png" class="friendRecommendProfile">
			</div>
			<div class="col-md-8">
				<h4 class="nanum friendRecommendName">문영준 (31세, 남)</h4>
				<h5 class="nanum">#타투#클럽#포마드</h5>
			</div>
			<div class="col-md-2 mt-2">
				<button type="button" class="btn btn-sm btn-outline-info">친구추가</button>
				<button type="button"
					class="btn btn-sm btn-outline-danger friendRecommendRemove">숨기기</button>
			</div> 
		</div>
		<hr>
		
		
		
		<div class="row">
			<div class="col-md-2">
				<img src="${contextPath}/resources/img/usericon.png" class="friendRecommendProfile">
			</div>
			<div class="col-md-8">
				<h4 class="nanum friendRecommendName">조미현 (24세, 여)</h4>
				<h5 class="nanum">#다이어트#음주#넷플릭스</h5>
			</div>
			<div class="col-md-2 mt-2">
				<button type="button" class="btn btn-sm btn-outline-info">친구추가</button>
				<button type="button"
					class="btn btn-sm btn-outline-danger friendRecommendRemove">숨기기</button>
			</div>
		</div>
		<hr>
		
		
		<div class="row">
			<div class="col-md-2">
				<img src="${contextPath}/resources/img/usericon.png" class="friendRecommendProfile">
			</div>
			<div class="col-md-8">
				<h4 class="nanum friendRecommendName">김지원 (27세, 여)</h4>
				<h5 class="nanum">#곤듀#눈없새#정뚝떨</h5>
			</div>
			<div class="col-md-2 mt-2">
				<button type="button" class="btn btn-sm btn-outline-info">친구추가</button>
				<button type="button"
					class="btn btn-sm btn-outline-danger friendRecommendRemove">숨기기</button>
			</div>
		</div>
		<hr>
		
		
	</div>

	<script>
		$(".friendRecommendRemove").click(function() {
			$(this).parent().parent().css("display", "none");
			$(this).parent().parent().next().css("display", "none");
		})
	</script>

</body>
</html>