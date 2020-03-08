<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
<link rel="stylesheet" href="${contextPath}/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/css/common.css" type="text/css">
<title>header</title>
</head>
<body class="nanum">
	
	<c:if test="${!empty msg}">
		<script>alert("${msg}")</script>
		<c:remove var="msg"/>
	</c:if>
	
	
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top headerOpacity">
		<form class="form-inline my-2 my-lg-0"
			onsubmit="return searchValidate();">
			<input class="form-control mr-sm-2" type="text"
				placeholder="검색할 골목 키워드" id="searchStreet" name="searchStreet"
				size="50">
			<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
		</form>
		<script>
			function searchValidate() {
				var regExp = /^[\w가-힣]{2,}$/;
				if (!regExp.test($("#searchStreet").val())) {
					alert("키워드를 2글자 이상 입력해주세요.");
					return false;
				}
			}
		</script>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
			</ul>


			<div class="dropdown">
				<div class="dropdown-toggle headerImg" type="button"
					id="alarmButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">
					<img src="${contextPath}/resources/img/alarm2.png">
				</div>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="alarmButton">
					<a class="dropdown-item nanum" data-toggle="modal"
						data-target="#profileModal">'조미현'님이 친구요청을 수락하셨습니다.</a> <a
						class="dropdown-item nanum" data-toggle="modal"
						data-target="#golmokModal">'20대 인싸들' 골목에서 추방당하셨습니다.</a>
				</div>
			</div>


			<div class="dropdown">
				<div class="dropdown-toggle headerImg" type="button"
					id="mypageButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">
					<img src="${contextPath}/resources/img/골목.jpg">
				</div>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="mypageButton">
					<a class="dropdown-item nanum" data-toggle="modal">내 정보</a> <a
						class="dropdown-item nanum" data-toggle="modal">내골목 조회</a> <a
						class="dropdown-item nanum" data-toggle="modal">1:1 문의</a> <a
						class="dropdown-item nanum" data-toggle="modal">공지사항</a>
					<hr>
					<a class="dropdown-item nanum" data-toggle="modal">로그아웃</a>
				</div>
			</div>
		</div>
	</nav>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>
</html>