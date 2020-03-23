<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body class="nanum">
	<%@ include file="../common/header.jsp" %>
	<%@ include file="streetDetail/streetNav.jsp" %>
	<div class="container" style="margin-top: 100px">	
		<h1 class="nanum" style="display: inline;">추천 친구</h1>
		&nbsp;&nbsp;&nbsp;
		<h5 class="nanum" style="display: inline; color: tomato;">회원님의
			관심사 : 
			<c:if test="${!empty myHobby }">
				<c:forEach items="${myHobby}" var="hobby">
					#${hobby.hobbyName}
				</c:forEach>
			</c:if>
			
			
			</h5>
		<hr>
		
		<c:if test="${!empty mList }">
			<c:forEach items="${mList}" var="member">
				<div class="row">
					<div class="col-md-2">
						<img src="${contextPath}/resources/profileImage/${member.memberProfileUrl}" class="friendRecommendProfile">
					</div>
					<div class="col-md-8">
						<h4 class="nanum friendRecommendName">${member.memberNm }</h4>
						<h5 class="nanum">
						<c:if test="${!empty hList}">
							<c:forEach items="${hList}" var="hobby" >
								<c:if test="${member.memberNo == hobby.memberNo }">
									#${hobby.hobbyName}
								</c:if>
							</c:forEach>
						</c:if>
						</h5>
					</div>
					<div class="col-md-2 mt-2">
						<button type="button" class="btn btn-sm btn-outline-info addFriend" value="${member.memberNo}">친구추가</button>
						<button type="button"
							class="btn btn-sm btn-outline-danger friendRecommendRemove">숨기기</button>
					</div> 
				</div>
				<hr>
			</c:forEach>
		
		</c:if>
		
		
		
	</div>

	<script>
		/* 친구 추가용 Ajax  */
		$(".addFriend").click(function(){
			console.log($(this).val());
			$.ajax({
				url : "addFriend",
				data : {"yourNum" : $(this).val()},
				success : function() {
					alert("친구 신청 완료");
					$(this).parent().parent().css("display", "none");
					$(this).parent().parent().next().css("display", "none");
				},
				error : function() {
					console.log("친구 요청 ajax 통신 실패")
					$(this).parent().parent().css("display", "none");
					$(this).parent().parent().next().css("display", "none");
				}
			})
		})
		
		
		/* 추천 친구 숨김용 Ajax */
		$(".friendRecommendRemove").click(function() {
			$(this).parent().parent().css("display", "none");
			$(this).parent().parent().next().css("display", "none");
		})
	</script>

</body>
</html>