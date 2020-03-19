<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

		<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
					crossorigin="anonymous"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/timeline.css" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fullcalendar.css" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/daygrid.css" type="text/css">
    <script type="text/javascript" src="${contextPath}/resources/js/painter.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/drawengine.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/timeLine.js"></script>
		<%--     <script src="<c:url value="/resources/js/painter.js" />"></script>
    <script src="<c:url value="/resources/js/drawengine.js" />"></script>
    <script src="<c:url value="/resources/js/timeLine.js" />"></script> --%>
    
<title>타임라인 사이드,네비바 </title>

</head>

<style>

</style>
<body>
	
	<div class="container-fluid" style="margin-top: 57px;">
		<div class="row">

			<div class="col-md-12" style="padding: 0px;">
				<nav class="navbar navbar-dark bg-dark py-1" disabled>
					<div class="container" disabled>
						<a class="py-1" href="#" aria-label="Product"></a> <a
							class="py-1 d-none d-md-inline-block nanum" href="#">게시판</a> <a
							class="py-1 d-none d-md-inline-block nanum" href="#">사진첩</a> <a
							class="py-1 d-none d-md-inline-block nanum" href="#">일정</a> <a
							class="py-1 d-none d-md-inline-block nanum" href="#">주민목록</a> <a
							class="py-1" href="#" aria-label="Product"></a>
					</div>
				</nav>
			</div>
		</div>
	</div>

	

</body>
</html>