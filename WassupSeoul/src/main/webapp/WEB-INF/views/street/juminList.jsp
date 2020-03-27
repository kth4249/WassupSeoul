<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>주민 목록</title>
</head>
<body style="background-color : rgb(221, 233, 218);">
	<!-- 골목 네비바 여백 -->
	<div class="container-fluid" style="margin-top: 57px;">
		<div class="row"  style="padding: 0px; height:44px"></div>
	</div>
	<!-- 고정된 골목 네비바  -->
	<%-- <%@ include file="../street/streetDetail/streetNav.jsp"%> --%>
	<jsp:include page="../street/streetDetail/streetNav.jsp"/>
	
	<!-- 고정된 헤더 -->
	<%-- <%@include file="../common/header.jsp"%> --%>
	<jsp:include page="../common/header.jsp"/>
	
	
	<div class="container-fluid" style="margin-top: 10px;">
		<div class="row">
			<jsp:include page="streetDetail/streetSide.jsp"/>
			<div class="col-md-4"></div>
			<div class="col-md-4">
			<c:set var="count" value="0"/>
			<c:forEach items="${mList}" var="member">
				<c:if test="${member.citizenStatus eq 'Y'}">
					<c:set var="count" value="${count + 1}"/>
				</c:if> 
			</c:forEach>
				<h1 class="nanum" style="display: inline;" id="juminCount">주민(${count})</h1>&nbsp;&nbsp;
					<c:if test="${mList.size() != count and citizenGrade eq 'M'}">
						<div style="display: inline; color: orange; cursor: pointer" id="applyBtn">
							가입 신청 <span class="badge badge-pill badge-success" id="applyCount">${mList.size() - count}</span>
						</div>
					</c:if>
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
						var ct = 0;
						
						$("#applyBtn").click(function(){
							$("#applyMember").toggle(0);
						})
						
						$("#applyMember td").click(function(e){
							var memberNo = $(this).parent().children(0).val();
							var applyCheck = confirm("골목 가입을 허가하시겠습니까?")
							var juminCount = ${count};
							var applyCount = $("#applyCount").text();
							ct++;
							juminCount += ct;
							$.ajax({
								url : "joinCheck",
								data : {"applyCheck":applyCheck, "memberNo":memberNo},
								success : function(result){
									if(result > 0){
										var $thisMem = $(e.target).parent().prop("class", "table-active");
										var $btn = $("<button>").prop("class", "btn btn-sm btn-outline-success addFriend").val(memberNo).text("친구요청");
										var $td = $("<td>").prop("class", "text-center").append($btn);
										$thisMem.append($td);
										$("#juminList").append($thisMem);
										$thisMem.append($td);
										$("#juminList").append($thisMem);
										$("#juminCount").html("주민("+ juminCount + ")")
										$(this).parent().remove();
										$(this).parent().next().remove();
										sendAlarm(result);
										eventer = result
									} else {
										$(e.target).parent().next().remove();
										$(e.target).parent().remove();
									}
									$("#applyCount").html(applyCount - 1)
									if(applyCount == 1){
										$("#applyBtn").remove();
									}
									
									console.log("ajax 통신 성공")
									removeAlarm("1", eventer);
								},
								error : function() {
									console.log("ajax 통신 실패")
								}
							})
						})
						
						function removeAlarm(alarmType, eventer) { // 알람을 확인하지 않고 골목 가입신청을 하였을 때 알람 확인상태로 변경
							$.ajax({
								url : "removeAlarm",
								data : {"eventer":eventer, "alarmType":alarmType},
								success : function() {
									alarmView();
								},
								error : function() {
									console.log("알람 삭제 ajax 실패")
								}
							})
						}
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
										<c:set var="count" value="0"/>
										<td class="text-center">
											<c:if test="${!empty rList and loginMember.memberNo != member.memberNo}">
												<c:forEach items="${rList}" var="relationShip" varStatus="vs">
													<c:if test="${relationShip.yourNum == member.memberNo}">
														<c:choose>
															<c:when test="${relationShip.requestStatus eq '1'.charAt(0)}">
																<c:remove var="count"/>
																<button type="button" class="btn btn-sm btn-success disabled" value="${member.memberNo}">친구 요청중</button>
															</c:when>
															<c:when test="${relationShip.requestStatus eq '2'.charAt(0)}">
																<c:remove var="count"/>
																<button type="button" class="btn btn-sm btn-success" value="${member.memberNo}">친구</button>
															</c:when>
															<c:otherwise>
																<c:remove var="count"/>
																<button type="button" class="btn btn-sm btn-outline-success addFriend" value="${member.memberNo}">친구요청</button>
															</c:otherwise>
														</c:choose>
													</c:if>
													<c:if test="${relationShip.yourNum != member.memberNo}">
														<c:if test="${vs.last and !empty count}">
															<button type="button" class="btn btn-sm btn-outline-success addFriend" value="${member.memberNo}">친구요청</button>
														</c:if>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${empty rList and loginMember.memberNo != member.memberNo}">
												<button type="button" class="btn btn-sm btn-outline-success addFriend" value="${member.memberNo}">친구요청</button>
											</c:if>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</c:if>
						<c:if test="${empty mList }">
							<tr class="table-active">
								<th colspan="5">조회된 주민이 없습니다.</th>
							</tr>
						</c:if>
						
					</tbody>
				</table>
				
				
				<script>
					/* 친구 추가용 Ajax */
					$(document).on("click", ".addFriend", function(event){
					/* $(".addFriend").click(function(){ */
						console.log($(this).val());
						var yourNum = $(this).val()
						$.ajax({
							url : "addFriend",
							data : {"yourNum" : yourNum},
							success : function() {
								alert("친구 신청 완료");
								$(event.target).prop("class", "btn btn-sm btn-success disabled").text("친구 요청중");
							},
							error : function() {
								console.log("친구 요청 ajax 통신 실패")
							}
						})
					})
					
					// 주민목록에 조회된 멤버가 나에게 친구요청,
					
				
				</script>
			</div>
			<div class="col-md-4">
			</div>
		</div>
	</div>

</body>
</html>