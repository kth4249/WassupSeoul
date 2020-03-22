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
			<c:set var="count" value="0"/>
			<c:forEach items="${mList}" var="member">
				<c:if test="${member.citizenStatus eq 'Y'}">
					<c:set var="count" value="${count + 1}"/>
				</c:if> 
			</c:forEach>
				<h1 class="nanum" style="display: inline;" id="juminCount">주민(${count})</h1>&nbsp;&nbsp;
					<div style="display: inline; color: orange; cursor: pointer" id="applyBtn">
						가입 신청 <span class="badge badge-pill badge-success" id="applyCount">${mList.size() - count}명</span>
					</div>
					<table class="table table-hover" id="applyMember" style="display:none">
						<c:if test="${!empty mList}">
							<c:forEach items="${mList}" var="member">
								<c:if test="${member.citizenStatus eq 'W'}">
									<tr class="table-success">
										<input type="hidden" value="${member.memberNo}">
										<td><img src="${contextPath}/resources/profileImage/${member.memberProfileUrl}" width="45px"
											height="45px"></td>
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
									</tr>
								</c:if>
							</c:forEach>
						</c:if>
					</table>
					<script>
						$("#applyBtn").click(function(){
							$("#applyMember").toggle(500);
						})
						
						$("#applyMember td").click(function(e){
							var memberNo = $(this).parent().children(0).val();
							var applyCheck = confirm("골목 가입을 허가하시겠습니까?")
							$.ajax({
								url : "joinCheck",
								data : {"applyCheck":applyCheck, "memberNo":memberNo},
								success : function(result){
									if(result == 1){
										var $thisMem = $(e.target).parent().prop("class", "table-active");
										var $btn = $("<button>").prop("class", "btn btn-sm btn-outline-success addFriend").val(memberNo).text("친구요청");
										var $td = $("<td>").append($btn);
										$thisMem.append($td);
										$("#juminList").append($thisMem);
										$thisMem.append($td);
										$("#juminList").append($thisMem);
										<c:set var="count" value="${count+1}"/>
										$("#juminCount").html("주민(${count})")
										$(this).parent().remove();
										$(this).parent().next().remove();
									} else {
										$(e.target).parent().next().remove();
										$(e.target).parent().remove();
									}
									$("#applyCount").html("${mList.size() - count}명")
									
									console.log("ajax 통신 성공")
								},
								error : function() {
									console.log("ajax 통신 실패")
								}
							})
						})
					</script>
				<hr>
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
					<tbody id="juminList">
						
						<c:if test="${!empty mList }">
							<c:forEach items="${mList}" var="member">
								<c:if test="${member.citizenStatus eq 'Y'}">
									<tr class="table-active">
										<td scope="row"><img src="${contextPath}/resources/profileImage/${member.memberProfileUrl}" width="45px"
											height="45px"></td>
										<td>${member.memberNickname }</td>
										<td>${member.memberAge}세, ${member.memberGender}</td>
										<td>
											<c:if test="${!empty hList}">
												<c:forEach items="${hList}" var="hobby" >
													<c:if test="${member.memberNo == hobby.memberNo }">
														#${hobby.hobbyName}
													</c:if>
												</c:forEach>
											</c:if>
										</td>
										<td><button type="button" class="btn btn-sm btn-outline-success addFriend" value="${member.memberNo}">친구요청</button></td>
									</tr>
								</c:if>
							</c:forEach>
						</c:if>
						<c:if test="${empty mList }">
							<tr class="table-active">
								<th colspan="4">조회된 주민이 없습니다.</th>
							</tr>
						</c:if>
						
					</tbody>
				</table>
				
				<hr>
				
				<script>
					/* 친구 추가용 Ajax */
					$(document).on("click", ".addFriend", function(){
					/* $(".addFriend").click(function(){ */
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