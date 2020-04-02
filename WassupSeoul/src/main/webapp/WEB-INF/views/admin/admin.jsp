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
	<div style="margin-top: 50px; text-align: center;">
		<div class="container nanum">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#member">회원관리</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#street">골목관리</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#like">관심사관리</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#report">활동보고서</a></li>
				<!-- <li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#complain">1:1문의</a></li> -->
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
										<td><button
												class="btn btn-outline-info nanum selectMember"
												data-toggle="modal" data-target="#adminModal1"
												id="${member.memberNo}">상세보기</button></td>
										<td><button
												class="btn btn-outline-danger nanum deleteMember"
												data-toggle="modal" data-target="#adminModal2"
												id="${member.memberNo}">회원강퇴</button></td>
									</tr>
								</c:forEach>
							</c:if>


						</tbody>
					</table>
					
					<!-- 검색창 지움
					<div class="row justify-content-md-center">
						<select style="width: 150px;" class="form-control nanum">
							<option class="nanum" value="nickname">회원 닉네임</option>
							<option class="nanum" value="nickname">내용</option>
							<option class="nanum" value="nickname">회원 닉네임 + 내용</option>
						</select> <input style="width: 150px;" type="text"
							class="form-control nanum" name="searchValue">
						<button class="btn btn-outline-success">검색</button>
					</div>
					 -->
				</div>

				<div class="tab-pane fade" id="street">
					<table class="table table-hover">
						<thead>
							<tr class="table-dark">
								<th scope="col">골목이름</th>
								<!-- <th scope="col">경고메일</th> -->
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
										<!-- <td><button class="btn btn-outline-info nanum"
												data-toggle="modal" data-target="#adminModal3">경고메일</button></td> -->
										<td><button
												class="btn btn-outline-danger nanum deleteStreet"
												data-toggle="modal" data-target="#adminModal4"
												id="${street.streetNo}">골목폐쇄</button></td>
									</tr>
								</c:forEach>
							</c:if>


						</tbody>
					</table>
				<!--	검색창 지움
					<div class="row justify-content-md-center">
						<select style="width: 150px;" class="form-control nanum">
							<option class="nanum" value="nickname">골목 이름</option>
						</select> <input style="width: 150px;" type="text"
							class="form-control nanum" name="searchValue">
						<button class="btn btn-outline-success">검색</button>
					</div>
				  -->
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
										<td><a href="deleteHobby?deleteHobbyNo=${hobby.hobbyNo}"
											class="btn btn-outline-danger nanum">삭제</a></td>
									</tr>
								</c:forEach>
							</c:if>

						</tbody>
					</table>
					<!-- 검색창 삭제 
					<div class="row justify-content-md-center">
						<select style="width: 150px" class="form-control nanum">
							<option class="nanum" value="nickname">관심사명</option>
						</select> <input style="width: 150px" type="text"
							class="form-control nanum" name="searchValue">
						<button class="btn btn-outline-success">검색</button>
					</div>
					-->
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
										<th scope="row"><span class="streetNm">${report.streetNm}</span></th>
										<td><button
												class="btn btn-outline-info nanum selectReport"
												data-toggle="modal" data-target="#adminModal5"
												id="${report.reportNo}">보고서 확인</button></td>
									</tr>
								</c:forEach>
							</c:if>

						</tbody>
					</table>
					
					<!-- 검색창 지움 
					<div class="row justify-content-md-center">
						<select style="width: 150px;" class="form-control nanum">
							<option class="nanum" value="nickname">골목 이름</option>
						</select> <input style="width: 150px;" type="text"
							class="form-control nanum" name="searchValue">
						<button class="btn btn-outline-success">검색</button>
					</div>
					
					-->
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
									<img width="200px" height="200px" class="ml-5 mr-5 mt-5 mb-3"
										id="adminPageMemberProfileUrl">
								</div>
								<div class="nanum text-center" style="font-size: 35px;">
									<span class="" id="adminPageMemberNickname"></span>
								</div>
								<div class="nanum text-center"
									style="font-size: 20px; color: darkblue;">
									<span id="adminPageMemberGender"></span> <span
										id="adminPageMemberAge"></span>
								</div>
								<br>
								<div class="nanum text-center"
									style="font-size: 20px; color: brown;">
									<span id="adminPageHobby0" class="adminPageHobby"></span> <span
										id="adminPageHobby1" class="adminPageHobby"></span> <span
										id="adminPageHobby2" class="adminPageHobby"></span>
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
							<form action="deleteMember" method="POST">
								<div class="nanum text-center" style="font-size: 35px;">
									<button class="btn btn-outline-danger nanum"
										id="memberDeleteBtn">강퇴하기</button>
								</div>
								<br> <input type="hidden" id="deleteMemberNo"
									name="deleteMemberNo">
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary nanum"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>


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
							<form action="deleteStreet" method="POST">
								<div class="nanum text-center" style="font-size: 35px;">
									<button class="btn btn-outline-danger nanum">폐쇄하기</button>
								</div>
								<br> <input type="hidden" id="deleteStreetNo"
									name="deleteStreetNo">
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
				<div class="modal-dialog" role="document" >
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title nanum" style="font-size: 30px;">보고서
								확인</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" style="height: 500px; width: 500px; font-size: 20px; overflow: scroll;">
							<form action="">
								<div class="nanum text-center" style="font-size: 20px;">
									<span>골목이름 : </span>
									<br>
									<span id="reportStreetNm"></span>
								</div>
								<div class="nanum text-center" 
									style="font-size: 15px; color: darkblue; margin-top: 10px">
									
									<span>활동보고서 내용 : </span>
									<br>
									<span id="reportContent"></span>
									
								</div>
								<div class="nanum text-center" 
									style="font-size: 15px; margin-top: 10px;">
									<span>활동사진 : </span>
									<div style="margin-top: 10px">
										<img id="reportImgUrl" style="width: 150px; height: 150px;">
									</div>
								</div>								
								<br>
							</form>
						</div>
						<div class="modal-footer">
								<button type="button"
									class="btn btn-primary nanum giveStreetPoint"
									data-dismiss="modal">점수부여</button>
								<input type="hidden" id="giveStreetPointReportNo" name="giveStreetPointReportNo">
								<button type="button"
									class="btn btn-primary nanum deleteStreetReport"
									data-dismiss="modal">삭제</button>
								<input type="hidden" id="deleteStreetReportNo" name="deleteStreetReportNo">
							<button type="button" class="btn btn-primary nanum"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
			<script>
				$(function() {

					/* 회원 상세보기 */
					$(".selectMember").on("click",function() {
						var selectMemberNo;
						selectMemberNo = $(this).prop("id");
						console.log("회원 번호 : "+ selectMemberNo);

						$.ajax({
							url : "selectMember",
							data : {selectMemberNo : selectMemberNo},
							type : "post",
							dataType : "json",
							success : function(map) {
								if (map != null) {

									var member = map.member;

									var hobby = map.hobby;

									var memberNickname = member.memberNickname;

									var memberGender;
									if (member.memberGender == 'M') {
										memberGender = "남성";
									} else if (member.memberGender == 'F') {
										memberGender = "여성";
									}

									var memberAge = member.memberAge;
									var memberProfileUrl = member.memberProfileUrl;

									$("#adminPageMemberNickname").text(memberNickname);
									$("#adminPageMemberGender").text(memberGender);
									$("#adminPageMemberAge").text(memberAge+ "세");
									$("#adminPageMemberProfileUrl").prop("src","${contextPath}/resources/profileImage/"+ memberProfileUrl);

									if (hobby != null) {
										hobby.forEach(function(item,index) {
											$("#adminPageHobby"+ index).text("#"+ item);
										});
									}
								} else {
									alert("데이터가 없습니다.");
								}
							},
							error : function() {
								console
										.log("ajax 통신 실패");
								console.log(e);
							}
						});
					});

					/* 회원 강퇴 */
					$(".deleteMember").on("click", function() {
						var deleteMemberNo;
						deleteMemberNo = $(this).prop("id");
						$("#deleteMemberNo").val(deleteMemberNo);
					});

					/* 경고 메일 */

					/* 골목 폐쇄 */
					$(".deleteStreet").on("click", function() {
						var deleteStreetNo;
						deleteStreetNo = $(this).prop("id");
						$("#deleteStreetNo").val(deleteStreetNo);
					});

					/* 보고서 확인 */
					$(".selectReport").on("click",function() {

						var selectReportNo;
						selectReportNo = $(this).prop("id");

						$(".giveStreetPoint").prop("id", selectReportNo);
						$(".deleteStreetReport").prop("id",selectReportNo);


						$.ajax({

							url : "selectReport",
							data : {selectReportNo : selectReportNo},
							type : "post",
							dataType : "json",
							success : function(report) {
								if (report != null) {

									$("#reportStreetNm").text(report.streetNm);
									$("#reportContent").html(report.reportContent);
									$("#reportImgUrl").prop("src", "${contextPath}/resources/reportImage/"+ report.meetingImgUrl);

								} else {
									alert("데이터가 없습니다.");
								}
							},
							error : function() {
								console.log("ajax 통신 실패");
								console.log(e);
							}
						});
					});

					/* 골목 점수 부여 후 삭제*/
					$(".giveStreetPoint").on("click", function() {
						var giveStreetPointReportNo;
						giveStreetPointReportNo = $(this).prop("id");
						
						$.ajax({
														
							url : "giveStreetPoint",
							data : {giveStreetPointReportNo : giveStreetPointReportNo},
							type : "post",
							dataType : "json",
							success : function(result) {
								if (result > 0) {
									alert("점수 부여 성공");

								} else {
									alert("점수 부여 실패");
								}
							},
							error : function() {
								console.log("ajax 통신 실패");
								console.log(e);
							}
							
						});
					});

					/* 보고서 삭제 */
					$(".deleteStreetReport").on("click", function(){
						var deleteStreetReportNo;
						deleteStreetReportNo = $(this).prop("id");
						
						$.ajax({
							
							url : "deleteReport",
							data : {deleteStreetReportNo : deleteStreetReportNo},
							type : "post",
							dataType : "json",
							success : function(result) {
								if (result > 0) {
									alert("보고서 삭제 성공");

								} else {
									alert("보고서 삭제 실패");
								}
							},
							error : function() {
								console.log("ajax 통신 실패");
								console.log(e);
							}
							
						});
						
					});

				});
			</script>
	
	<jsp:include page="../common/footer.jsp" />


</body>
</html>