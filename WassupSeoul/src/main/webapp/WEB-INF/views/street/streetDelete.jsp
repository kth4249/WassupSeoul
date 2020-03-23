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


			<form method="POST"
				action="deleteStreet?no=${streetNo}&imgNo=${imgNo}"
				enctype="multipart/form-data" role="form" onsubmit="">
				<div class="container-fluid">
					<!-- 골목 삭제 -->
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<h1 class="nanum">골목 삭제하기</h1>
						</div>
						<div class="col-md-3"></div>
					</div>
					<div class="row">
						<br>
					</div>

					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<div class="col-md-12 nanum form-group">
								<h5 class="nanum">골목대장 위임하기</h5>
								<input class="nanum" type="text" placeholder="주민 닉네임">
								<button class="nanum" type="button">검색</button>
							</div>
							<div class="col-md-12 nanum">
								<table class="table table-hover"
									style="text-align: center; line-height: 50px;">
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">주민이름</th>
											<th scope="col">상세정보</th>
											<th scope="col">위임하기</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">1</th>
											<td>김태훈</td>
											<td><button type="button"
													class="btn btn-secondary nanum">상세정보조회</button></td>
											<td><button type="button" class="btn btn-info nanum">위임하기</button></td>
										</tr>
										<tr>
											<th scope="row">2</th>
											<td>정승환</td>
											<td><button type="button"
													class="btn btn-secondary nanum">상세정보조회</button></td>
											<td><button type="button" class="btn btn-info nanum">위임하기</button></td>
										</tr>
										<tr>
											<th scope="row">3</th>
											<td>안중하</td>
											<td><button type="button"
													class="btn btn-secondary nanum">상세정보조회</button></td>
											<td><button type="button" class="btn btn-info nanum">위임하기</button></td>
										</tr>
										<tr>
											<th scope="row">4</th>
											<td>문영준</td>
											<td><button type="button"
													class="btn btn-secondary nanum">상세정보조회</button></td>
											<td><button type="button" class="btn btn-info nanum">위임하기</button></td>
										</tr>
										<tr>
											<th scope="row">5</th>
											<td>조미현</td>
											<td><button type="button"
													class="btn btn-secondary nanum">상세정보조회</button></td>
											<td><button type="button" class="btn btn-info nanum">위임하기</button></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col-md-12 nanum" style="text-align: center;">
								<div style="display: inline-block; width: 50%;">
									<ul class="pagination">
										<li class="page-item disabled"><a class="page-link"
											href="#">&laquo;</a></li>
										<li class="page-item"><a class="page-link" href="#">1</a>
										</li>
										<li class="page-item"><a class="page-link" href="#">2</a>
										</li>
										<li class="page-item"><a class="page-link" href="#">3</a>
										</li>
										<li class="page-item"><a class="page-link" href="#">4</a>
										</li>
										<li class="page-item"><a class="page-link" href="#">5</a>
										</li>
										<li class="page-item"><a class="page-link" href="#">&raquo;</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-3"></div>
					</div>

					<div class="row">
						<br>
					</div>


					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<div class="col-md-12 nanum">
								<label class="col-form-label" for="newLeader">새로 지정된
									골목대장</label> &nbsp;&nbsp; <input id="newLeader" name="newLeader"
									class="form-control nanum" type="text" value="지정된 골목대장 이름">
							</div>
						</div>
						<div class="col-md-3"></div>
					</div>

					<div class="row">
						<br>
					</div>


					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<div class="col-md-12 nanum">
								<h5 class="nanum">골목 탈퇴 & 삭제하기</h5>
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
						<div class="col-md-3"></div>
					</div>

					<div class="row">
						<br>
					</div>


					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6" style="text-align: center;">
							<div style="display: inline-block;">
								<button class="btn btn-primary nanum" type="button">나가기</button>
							</div>
						</div>
						<div class="col-md-3"></div>
					</div>




				</div>
			</form>


			<!-- 사이드2 여백 -->
			<div class="col-md-4" id="devideArea"></div>
			<!-- 사이드2 여백 -->
		</div>
	</div>

</body>
</html>