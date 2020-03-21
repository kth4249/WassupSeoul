<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>주민 목록</title>
</head>
<body class="nanum">
	<%@include file="../common/header.jsp"%>
	<%@include file="streetDetail/streetNav.jsp"%>
	<%@include file="streetDetail/streetSide.jsp"%>
	<div class="container" style="margin-top: 100px;">
		<div class="row">
			<div class="col-md-3">
			</div>
			<div class="col-md-6">
				<h1 class="nanum" style="display: inline;">주민(${mList.size()})</h1>
				<table class="table table-hover">
					<thead>
						<tr class="table-info">
							<th scope="col">프사</th>
							<th scope="col">주민</th>
							<th scope="col">나이, 성별</th>
							<th scope="col">관심사</th>
							<th>친구 요청</th>
						</tr>
					</thead>
					<tbody>
						
						<c:if test="${!empty mList }">
							<c:forEach items="${mList}" var="member">
								<tr class="table-active">
									<th scope="row"><img src="${contextPath}/resources/profileImage/${member.memberProfileUrl}" width="45px"
										height="45px"></th>
									<td>${member.memberNickname }</td>
									<td>${member.memberAge}세, ${member.memberGender}</td>
									<td>
										<c:if test="${!empty hList}">
											<c:forEach items="${hList}" var="hobby" >
												<c:if test="${member.memberNo == hobby.memberNo }">
													${hobby.hobbyName}
												</c:if>
											</c:forEach>
										</c:if>
									</td>
									<td><button type="button" class="btn btn-sm btn-outline-success addFriend" value="${member.memberNo}">친구요청</button></td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty mList }">
							<tr class="table-active">
								<th colspan="4">조회된 주민이 없습니다.</th>
							</tr>
						</c:if>
						
					</tbody>
				</table>
				<script>
					/* 친구 추가용 Ajax */
					$(".addFriend").click(function(){
						console.log($(this).val());
						$.ajax({
							url : "addFriend",
							data : {"yourNum" : $(this).val()},
							success : function() {
								alert("친구 신청 완료");
							},
							error : function() {
								console.log("친구 요청 ajax 통신 실패")
							}
						})
					})
				
				</script>
				<form>
					<div class="form-group">
						<div class="row">
							<div class="col-md-6">
								<select class="form-control nanum" id="SearchKey">
									<option>닉네임</option>
									<option>관심사</option>
								</select>
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control nanum"
									placeholder="검색어를 써주세요" id="SearchValue">
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-3">
			</div>
		</div>
	</div>

</body>
</html>