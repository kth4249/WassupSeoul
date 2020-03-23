<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    
<title>타임라인 사이드,네비바 </title>

</head>

<style>

</style>
<body>
	
	
	
	<!-- 컨텐츠영역-->
	<div class="container" style="margin-top: 10px;">

		<div class="row">
			<div class="col-md-12" id="devideArea">

				<!-- 사이드 2 시작 -->
				<div class="row" style="background-color: rgb(221, 233, 218);">
					<div class="card border-primary mb-3" style="max-width: 20rem;">
						<div class="card-header nanum" style="font-size: 25px;">다가오는 일정</div>
						<div class="card-body">
							<h4 class="card-title nanum" style="font-weight: bolder;">2월</h4>
							<p class="card-text nanum">13일 - 일정이 지정한 내용1</p>
							<p class="card-text nanum">17일 - 일정이 지정한 내용2</p>
						</div>
					</div>
					<!-- 친구목록 버튼 -->
					<div
						style="border-radius: 70%; background-color: gray; width: 100px; height: 100px; position: relative;">
						<div style="position: absolute; top: 15px; left: 20px;">
							<img src="${contextPath}/resources/img/iconmonstr-user-8-64.png" alt="이미지" style="cursor: pointer;">
						</div>
					</div>

					<!-- 탑버튼 -->
					<a style="display: scroll; position: fixed; bottom: 10px; right: 10px;"	href="#" title="맨 위로">
					<img src="${contextPath}/resources/img/img_top.png" alt="탑버튼" style="width: 70px; height: 100px;"></a>
				</div>
				<!-- 사이드 2 끝 -->

			</div>
		</div>
	</div>
	<!-- 컨텐츠영역 종료 -->


</body>
</html>