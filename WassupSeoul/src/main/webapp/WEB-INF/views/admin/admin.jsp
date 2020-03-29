<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Poor+Story&display=swap');

.searchdiv
>
{
padding










:





 





50
px





 





20
px










;
}
.loungeHeader {
	width: 100%;
	height: 400px;
	position: relative;
}

.loungeBack {
	position: relative;
}

.loungeBack::after {
	content: "";
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	background-image: url('${contextPath}/resources/img/테스트서울.jpg');
	background-size: cover;
	width: 100%;
	height: 100%;
	opacity: 0.6;
	z-index: -1;
	background-repeat: no-repeat;
	/* background-color: white; !important; */
}
</style>


</head>
<body>

	<jsp:include page="../common/header.jsp" />
	<div style="margin-top: 50px;">
		<div class="container">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#member">회원관리</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#street">골목관리</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#like">관심사관리</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#report">활동보고서</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#complain">1:1문의</a></li>
			</ul>

			<div id="myTabContent" class="tab-content">

				<div class="tab-pane fade show active" id="member">
					<table class="table table-hover">
						<thead>
							<tr class="table-dark">
								<th scope="col">이름</th>
								<th scope="col">상세보기</th>
								<th scope="col">회원강퇴</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty mList }">
								<tr>
									<td colspan="6">존재하는 회원이 없습니다.</td>
								</tr>
							</c:if>


							<c:if test="${!empty mList }">
								<c:forEach var="member" items="${mList}" varStatus="vs">
									<tr class="table-Active">
										<th scope="row">${member.memberNm}</th>
										<td><button class="btn btn-outline-info nanum"
												data-toggle="modal" data-target="#adminModal1">상세보기</button></td>
										<td><button class="btn btn-outline-danger nanum"
												data-toggle="modal" data-target="#adminModal2" data-notifyid="${member.memberNo}">회원강퇴</button></td>
									</tr>
								</c:forEach>
							</c:if>



							<!-- 
							<tr class="table-Active">
								<th scope="row">김태훈</th>
								<td><button class="btn btn-outline-info nanum"
										data-toggle="modal" data-target="#adminModal1">상세보기</button></td>
								<td><button class="btn btn-outline-danger nanum"
										data-toggle="modal" data-target="#adminModal2">회원강퇴</button></td>
							</tr>
							<tr class="table-Active">
								<th scope="row">김지원</th>
								<td><button class="btn btn-outline-info nanum">상세보기</button></td>
								<td><button class="btn btn-outline-danger nanum">회원강퇴</button></td>
							</tr>
							<tr class="table-Active">
								<th scope="row">정승환</th>
								<td><button class="btn btn-outline-info nanum">상세보기</button></td>
								<td><button class="btn btn-outline-danger nanum">회원강퇴</button></td>
							</tr>
							<tr class="table-Active">
								<th scope="row">안중하</th>
								<td><button class="btn btn-outline-info nanum">상세보기</button></td>
								<td><button class="btn btn-outline-danger nanum">회원강퇴</button></td>
							</tr>
							<tr class="table-Active">
								<th scope="row">조미현</th>
								<td><button class="btn btn-outline-info nanum">상세보기</button></td>
								<td><button class="btn btn-outline-danger nanum">회원강퇴</button></td>
							</tr>
							 -->

						</tbody>
					</table>
					<div class="row justify-content-md-center">
						<select style="width: 150px;" class="form-control nanum">
							<option class="nanum" value="nickname">회원 닉네임</option>
							<option class="nanum" value="nickname">내용</option>
							<option class="nanum" value="nickname">회원 닉네임 + 내용</option>
						</select> <input style="width: 150px;" type="text"
							class="form-control nanum" name="searchValue">
						<button class="btn btn-outline-success">검색</button>
					</div>
				</div>

				<div class="tab-pane fade" id="street">
					<table class="table table-hover">
						<thead>
							<tr class="table-dark">
								<th scope="col">골목이름</th>
								<th scope="col">경고메일</th>
								<th scope="col">골목폐쇄</th>
							</tr>
						</thead>
						<tbody>

							<c:if test="${empty sList }">
								<tr>
									<td colspan="6">존재하는 골목이 없습니다.</td>
								</tr>
							</c:if>


							<c:if test="${!empty sList }">
								<c:forEach var="street" items="${sList}" varStatus="vs">
									<tr class="table-Active">
										<th scope="row"><a
											href="${contextPath}/street/streetMain?streetNo=${street.streetNo}"
											style="text-decoration: none"> ${street.streetNm}</a></th>
										<td><button class="btn btn-outline-info nanum"
												data-toggle="modal" data-target="#adminModal3">경고메일</button></td>
										<td><button class="btn btn-outline-danger nanum"
												data-toggle="modal" data-target="#adminModal4">골목폐쇄</button></td>
									</tr>
								</c:forEach>
							</c:if>


							<!-- 
							<tr class="table-Active">
								<th scope="row"><a href="#" style="text-decoration: none">강동구
										청춘남녀들</a></th>
								<td><button class="btn btn-outline-info nanum"
										data-toggle="modal" data-target="#adminModal3">경고메일</button></td>
								<td><button class="btn btn-outline-danger nanum"
										data-toggle="modal" data-target="#adminModal4">골목폐쇄</button></td>
							</tr>
							<tr class="table-Active">
								<th scope="row"><a href="#" style="text-decoration: none">영등포구
										풋살하는 사람 모여라</a></th>
								<td><button class="btn btn-outline-info nanum">경고메일</button></td>
								<td><button class="btn btn-outline-danger nanum">골목폐쇄</button></td>
							</tr>
							<tr class="table-Active">
								<th scope="row"><a href="#" style="text-decoration: none">면목동
										이쁜이들</a></th>
								<td><button class="btn btn-outline-info nanum">경고메일</button></td>
								<td><button class="btn btn-outline-danger nanum">골목폐쇄</button></td>
							</tr>
							<tr class="table-Active">
								<th scope="row"><a href="#" style="text-decoration: none">마포구
										드라마쟁이들</a></th>
								<td><button class="btn btn-outline-info nanum">경고메일</button></td>
								<td><button class="btn btn-outline-danger nanum">골목폐쇄</button></td>
							</tr>
							<tr class="table-Active">
								<th scope="row"><a href="#" style="text-decoration: none">테니스치는
										모임</a></th>
								<td><button class="btn btn-outline-info nanum">경고메일</button></td>
								<td><button class="btn btn-outline-danger nanum">골목폐쇄</button></td>
							</tr>
							
							 -->
						</tbody>
					</table>
					<div class="row justify-content-md-center">
						<select style="width: 150px;" class="form-control nanum">
							<option class="nanum" value="nickname">골목 이름</option>
						</select> <input style="width: 150px;" type="text"
							class="form-control nanum" name="searchValue">
						<button class="btn btn-outline-success">검색</button>
					</div>
				</div>


				<div class="tab-pane fade" id="like">
					<table class="table table-hover">
						<thead>
							<tr class="table-dark">
								<th scope="col">관심사명</th>
								<th scope="col">인원수</th>
								<th scope="col">삭제</th>
							</tr>
						</thead>
						<tbody>


							<c:if test="${empty hList }">
								<tr>
									<td colspan="6">존재하는 관심사가 없습니다.</td>
								</tr>
							</c:if>


							<c:if test="${!empty hList }">
								<c:forEach var="hobby" items="${hList}" varStatus="vs">
									<tr class="table-Active">
										<th scope="row"><span>${hobby.hobbyName}</span></th>
										<td><span>${hobby.hobbyCount}명</span></td>
										<td><a href="" class="btn btn-outline-danger nanum">삭제</a></td>
									</tr>
								</c:forEach>
							</c:if>


							<!-- 
							<tr class="table-Active">
								<th scope="row"><span>축구</span></th>
								<td><span>57명</span></td>
								<td><button class="btn btn-outline-danger nanum">삭제</button></td>
							</tr>
							<tr class="table-Active">
								<th scope="row"><span>영화</span></th>
								<td><span>203명</span></td>
								<td><button class="btn btn-outline-danger nanum">삭제</button></td>
							</tr>
							<tr class="table-Active">
								<th scope="row"><span>술</span></th>
								<td><span>178명</span></td>
								<td><button class="btn btn-outline-danger nanum">삭제</button></td>
							</tr>
							<tr class="table-Active">
								<th scope="row"><span>연애</span></th>
								<td><span>382명</span></td>
								<td><button class="btn btn-outline-danger nanum">삭제</button></td>
							</tr>
							<tr class="table-Active">
								<th scope="row"><span>운동</span></th>
								<td><span>192명</span></td>
								<td><button class="btn btn-outline-danger nanum">삭제</button></td>
							</tr>
							 -->

						</tbody>
					</table>
					<div class="row justify-content-md-center">
						<select style="width: 150px" ; class="form-control nanum">
							<option class="nanum" value="nickname">관심사명</option>
						</select> <input style="width: 150px" ; type="text"
							class="form-control nanum" name="searchValue">
						<button class="btn btn-outline-success">검색</button>
					</div>
				</div>

				<div class="tab-pane fade" id="report">
					<table class="table table-hover">
						<thead>
							<tr class="table-dark">
								<th scope="col">골목 이름</th>
								<th scope="col">보고서 확인</th>
							</tr>
						</thead>
						<tbody>


							<c:if test="${empty rList }">
								<tr>
									<td colspan="6">존재하는 활동보고서가 없습니다.</td>
								</tr>
							</c:if>


							<c:if test="${!empty rList }">
								<c:forEach var="report" items="${rList}" varStatus="vs">
									<tr class="table-Active">
										<th scope="row"><span>${report.streetNm}</span></th>
										<td><button class="btn btn-outline-info nanum"
												data-toggle="modal" data-target="#adminModal5">보고서
												확인</button></td>

									</tr>
								</c:forEach>
							</c:if>


<!-- 

							<tr class="table-Active">
								<th scope="row"><a href="#" style="text-decoration: none">강동구
										청춘남녀들</a></th>
								<td><button class="btn btn-outline-info nanum"
										data-toggle="modal" data-target="#adminModal5">보고서 확인</button></td>
							</tr>
							<tr class="table-Active">
								<th scope="row"><a href="#" style="text-decoration: none">영등포구
										풋살하는 사람 모여라</a></th>
								<td><button class="btn btn-outline-info nanum">보고서
										확인</button></td>
							</tr>
							<tr class="table-Active">
								<th scope="row"><a href="#" style="text-decoration: none">면목동
										이쁜이들</a></th>
								<td><button class="btn btn-outline-info nanum">보고서
										확인</button></td>
							</tr>
							<tr class="table-Active">
								<th scope="row"><a href="#" style="text-decoration: none">마포구
										드라마쟁이들</a></th>
								<td><button class="btn btn-outline-info nanum">보고서
										확인</button></td>
							</tr>
							<tr class="table-Active">
								<th scope="row"><a href="#" style="text-decoration: none">테니스치는
										모임</a></th>
								<td><button class="btn btn-outline-info nanum">보고서
										확인</button></td>
							</tr>
							
							 -->
						</tbody>
					</table>
					<div class="row justify-content-md-center">
						<select style="width: 150px;" class="form-control nanum">
							<option class="nanum" value="nickname">골목 이름</option>
						</select> <input style="width: 150px;" type="text"
							class="form-control nanum" name="searchValue">
						<button class="btn btn-outline-success">검색</button>
					</div>
				</div>


				<div class="tab-pane fade" id="complain">
					<table class="table table-hover">
						<thead>
							<tr class="table-dark">
								<th scope="col">1:1 문의글</th>
							</tr>
						</thead>
						<tbody>
							<tr class="table-Active">
								<th scope="row"><a href="#" style="text-decoration: none"
									data-toggle="modal" data-target="#adminModal6">이런 기능을 추가해줄
										수 없나요?</a></th>
							</tr>
							<tr class="table-Active">
								<th scope="row"><a href="#" style="text-decoration: none">자꾸
										광고목적으로 가입해서 도배하는 사람좀 어떻게 해줘잉</a></th>
							</tr>
							<tr class="table-Active">
								<th scope="row"><a href="#" style="text-decoration: none">골목대장이
										잠수 타서 골목 관리가 안돼요 ㅡㅡ</a></th>
							</tr>
							<tr class="table-Active">
								<th scope="row"><a href="#" style="text-decoration: none">아니
										ㅡㅡ 관리자 뭐함 </a></th>
							</tr>
							<tr class="table-Active">
								<th scope="row"><a href="#" style="text-decoration: none">비밀번호가
										안 찾아져요</a></th>
							</tr>
						</tbody>
					</table>
					<div class="row justify-content-md-center">
						<select style="width: 150px" ; class="form-control nanum">
							<option class="nanum" value="title">글 제목</option>
							<option class="nanum" value="nickname">닉네임</option>
						</select> <input style="width: 150px" ; type="text"
							class="form-control nanum" name="searchValue">
						<button class="btn btn-outline-success">검색</button>
					</div>
				</div>


			</div>

			<!-- 프로필 상세보기 모달 -->
			<div class="modal fade" id="adminModal1">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title nanum" style="font-size: 30px;">미니
								프로필</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" style="font-size: 20px;">
							<form action="">
								<div>
									<img src="../img/usericon.png" width="200px" height="200px"
										class="ml-5 mr-5 mt-5 mb-3">
								</div>
								<div class="nanum text-center" style="font-size: 35px;">
									<span class="">김태훈</span>
								</div>
								<div class="nanum text-center"
									style="font-size: 20px; color: darkblue;">
									<span class="">남성</span> <span class="">25세</span>
								</div>
								<br>
								<div class="nanum text-center"
									style="font-size: 20px; color: brown;">
									<span class="">#음주</span> <span class="">#연애</span> <span
										class="">#흡연</span>
								</div>
								<br>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary nanum"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 회원 강퇴 모달 -->
			<div class="modal fade" id="adminModal2">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header text-center">
							<h5 class="modal-title nanum" style="font-size: 30px;">정말로 이
								회원을 강퇴하시겠습니까?</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" style="font-size: 20px;">
							<form action="">
								<div class="nanum text-center" style="font-size: 35px;">
									<button class="btn btn-outline-danger nanum" id="memberDeleteBtn">강퇴하기</button>
								</div>
								<br>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary nanum"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
			<script>
			$(function(){
				
				var memberNo;
				
				$("#memberDeleteBtn").on("click", function(){
					
					console.log(${member.memberNo});
					
					memberNo = $(event.relatedTarget).data('notifyid');
					
					$.ajax({
						
						url : "admin/deleteMember",
						data : {memberNo : memberNo},
						type : "post",
						dataType : "json",
						success : function(result){
							
							if(result > 0){
								alert("강퇴 실패");								
							} else{
								alert("회원이 강퇴되었습니다.");
							}
							
						},
						
						error : function(){
							console.log("ajax통신 실패");
						}
					});
					
				});
				
			});
			
			</script>

			<!-- 메일 보내기 모달 (메일 API 도입후 어떻게 할지 결정)-->
			<div class="modal fade" id="adminModal3">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title nanum" style="font-size: 30px;">메일
								보내기</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" style="font-size: 20px;">
							<form action="">
								<div class="nanum text-center" style="font-size: 35px;">
									<div class="form-group">
										<label class="col-form-label" for="inputDefault">제목</label> <input
											type="text" class="form-control" id="inputDefault">
									</div>
								</div>
								<div class="nanum text-center" style="font-size: 35px;">
									<div class="form-group">
										<label for="exampleTextarea">내용</label>
										<textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
									</div>
								</div>
								<br>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary nanum"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>


			<!-- 골목 폐쇄 모달 -->
			<div class="modal fade" id="adminModal4">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header text-center">
							<h5 class="modal-title nanum" style="font-size: 30px;">정말로 이
								골목을 폐쇄하시겠습니까?</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" style="font-size: 20px;">
							<form action="">
								<div class="nanum text-center" style="font-size: 35px;">
									<button class="btn btn-outline-danger nanum">폐쇄하기</button>
								</div>
								<br>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary nanum"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 보고서 확인하기 모달 -->
			<div class="modal fade" id="adminModal5">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title nanum" style="font-size: 30px;">미니
								프로필</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" style="font-size: 20px;">
							<form action="">
								<div class="nanum text-center" style="font-size: 35px;">
									<span class="">보고서 제목 들어오는 공간</span>
								</div>
								<div class="nanum text-center"
									style="font-size: 20px; color: darkblue;">
									<span class="">보고서 내용 들어오는 공간</span>
								</div>
								<br>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary nanum"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 1:1 문의글 확인 모달 -->
			<div class="modal fade" id="adminModal6">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title nanum" style="font-size: 30px;">미니
								프로필</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" style="font-size: 20px;">
							<form action="">
								<div class="nanum text-center" style="font-size: 35px;">
									<span class="">문의글 제목 들어오는 공간</span>
								</div>
								<div class="nanum text-center"
									style="font-size: 20px; color: darkblue;">
									<span class="">문의글 내용 들어오는 공간</span>
								</div>
								<br>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary nanum"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />


</body>
</html>