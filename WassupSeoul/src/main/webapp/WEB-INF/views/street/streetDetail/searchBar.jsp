<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/timeline.css" type="text/css">

<title>검색 Bar</title>
</head>
<body>

					<div class="container" id="searchBox"
						style="padding: 0; width: 100%; background-color: rgb(221, 233, 218)">
						<div id="searchWrap">
							<form method="GET" id="login-form-input">
								<div style="margin: 0px; width: 100%; background-color: rgb(221, 233, 218);">
									<input type="text" class="form-control nanum"
										placeholder=" 내용, @작성자 검색" id="searchBox"
										style="width: 91%; margin-right: 1%; border-right: black 2px solid;">
									<button type="submit" class="btn " id="searchBtn">
										<img src="${contextPath}/resources/img/searchButton.png"
											style="width: 90%; height: 90%; border-left: black 2px solid;">
									</button>
								</div>
							</form>
						</div>
					</div>

</body>
</html>