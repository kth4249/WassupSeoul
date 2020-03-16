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
<style>
.profileBox{
  width: 100%;
  height: 120px; 
  border-radius: 70%;
  overflow: hidden;
}
.profileImage{
width: 100%;
height: 100%;
object-fit: cover;
}
</style>
</head>
<body class="nanum">
	
	<c:if test="${!empty msg}">
		<script>alert("${msg}")</script>
		<c:remove var="msg"/>
	</c:if>
	
	
	<c:url var="detailUrl" value="square">
		<c:param name="currentPage" value="1" />
		<c:if test="${!empty param.districtNo}">
			<c:param name="districtNo" value="${param.districtNo}" />
		</c:if>
		<c:if test="${!empty param.streetSort}">
			<c:param name="streetSort" value="${param.streetSort}" />
		</c:if>
	</c:url>
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top headerOpacity">
		<form class="form-inline my-2 my-lg-0" action="${detailUrl}"
			onsubmit="return searchValidate();">
			<input class="form-control mr-sm-2" type="text"
				placeholder="검색할 골목 키워드" id="searchStreet" name="searchStreet"
				size="50">
			<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
		</form>
		<script>
			function searchValidate() {
				alert("${param.districtNo}")
				alert("${param.streetSort}")
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
					<a class="dropdown-item nanum" data-toggle="modal">'조미현'님이 친구요청을 수락하셨습니다.</a> 
					<a class="dropdown-item nanum" data-toggle="modal">'20대 인싸들' 골목에서 추방당하셨습니다.</a>
				</div>
			</div>


			<div class="dropdown">
				<div class="dropdown-toggle headerImg" type="button"
					id="mypageButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">
					<img src="${contextPath}/resources/memberImg/${loginMember.memberProfileUrl}">
				</div>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="mypageButton">
					<a class="dropdown-item nanum" data-toggle="modal" data-target="#profileModal">내정보 조회</a> 
					<a class="dropdown-item nanum" data-toggle="modal" data-target="#golmokModal">내골목 조회</a>
					<a class="dropdown-item nanum" data-toggle="modal">1:1 문의</a> 
					<a class="dropdown-item nanum" data-toggle="modal">공지사항</a>
					<hr>
					<a class="dropdown-item nanum" href="${contextPath}/member/logout">로그아웃</a>
				</div>
			</div>
		</div>
	</nav>
	
	<!-- profile Modal -->
    <div class="modal fade" id="profileModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
            <h2 class="modal-title nanum" id="profileModalLabel" style="font-weight: bold;">내정보 조회</h2>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          	<span aria-hidden="true">&times;</span>
        	</button>
            </div>
            <div class="modal-body">
            <!-- content start -->
                <!-- profile image start -->
                <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="profileBox">
                    <img class="profileImage" src="${contextPath}/resources/memberImg/${loginMember.memberProfileUrl}" alt="이미지">
                    </div>
                </div>
                <div class="col-md-4"></div>
                </div>
                <!-- profile image end-->
                <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <input type="text" value="${loginMember.memberNickname}" class="nanum form-control-plaintext text-center" style="font-size: 35px;font-weight: bold;" readonly>
                </div>
                <div class="col-md-4"></div>
                </div>
                <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8"><input type="text" value="${loginMember.memberEmail}" class="nanum form-control-plaintext text-center" style="font-size: 25px;font-weight: bold;" readonly></div>
                <div class="col-md-2"></div>
                </div>
                <div class="row">
                <label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold; font-size: 16px;">이름</label>
                <div class="col-sm-4">
                    <input type="text" readonly class="nanum form-control-plaintext text-center" value="${loginMember.memberNm}" style="font-size: 25px;">
                </div>
                <label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold; font-size: 16px;">나이</label>
                <div class="col-sm-4">
                    <input type="text" readonly class="nanum form-control-plaintext text-center" value="${loginMember.memberAge}" style="font-size: 25px;">
                </div>
                </div>

                <div class="row">
                <label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold; font-size: 16px;">성별</label>
                <div class="col-sm-4">
                	<c:choose>
                		<c:when test="${loginMember.memberGender == 'M'}">
                			<input type="text" readonly class="nanum form-control-plaintext text-center" value="남성" style="font-size: 25px;">	
                		</c:when>
                		<c:otherwise>
                			<input type="text" readonly class="nanum form-control-plaintext text-center" value="여성" style="font-size: 25px;">
                		</c:otherwise>
                	</c:choose>
                </div>
                <label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold; font-size: 16px;">전화번호</label>
                <div class="col-sm-4">
                    <input type="text" readonly class="nanum form-control-plaintext text-center" value="${loginMember.memberPhone}" style="font-size: 22px;">
                </div>
                </div>

                <div class="row">
                
                <c:if test="${!empty sessionScope.myHobby}">
                	<c:forEach var="hobby" items="${myHobby}" varStatus="vs">
                		<c:choose>
                			<c:when test="${vs.index == 0}">
                				<label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold; font-size: 16px;">관심분야</label>
                				<div class="col-sm-10">
                					<input type="text" readonly class="nanum form-control-plaintext" value="#${hobby.hobbyNm}" style="font-size: 25px;color: blue;">
                				</div>
                			</c:when>
                			<c:otherwise>
                				<label class="col-sm-2 col-form-label text-center nanum" style="font-weight: bold; font-size: 20px;"></label>
		                		<div class="col-sm-10">
		                			<input type="text" readonly class="nanum form-control-plaintext" value="#${hobby.hobbyNm}" style="font-size: 25px;color: blue;">
		                		</div>
                			</c:otherwise>
                		</c:choose>	
                	</c:forEach>
                </c:if>
                </div>
            
                <div class="row">
                <div class="col-md-6">
                    <a class="btn btn-primary btn-lg btn-block nanum" href="${contextPath}/member/updateForm" role="button" style="font-weight: bold;">내정보 수정</a>
                </div>
                <div class="col-md-6">
                    <a class="btn btn-primary btn-lg btn-block nanum" href="${contextPath}/member/deleteForm" role="button" style="font-weight: bold;">회원 탈퇴</a>
                </div>
                </div>
                <!-- content end -->
                </div>
            </div>
            </div>
        </div>
        <!-- end -->
        
        <!-- golmok Modal -->
        <div class="modal fade" id="golmokModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="golmokModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <h2 class="modal-title nanum" id="golmokModalLabel" style="font-weight: bold;">내골목 조회</h2>
                </div>
                <div class="modal-body">
                <!-- content start -->
                <div class="container-fluid">
					<c:choose>
						<c:when test="${!empty myStreet}">
						<%-- 골목이 있는 경우 --%>
							<c:forEach var="street" items="${myStreet}" varStatus="vs">
								<!-- 골목 2 시작 -->
			                    <div class="row">
			                    	<div class="col-md-4" style="position: relative">
				                        <img src="${contextPath}/resources/img/${street.imgUrl}" alt="이미지" width="100%" height="100%" style="position: absolute; z-index: 10;">
				                        <c:if test="${street.citizenGrade == 'M'.charAt(0) }">
				                        	<span class="badge badge-pill badge-info" style="position: absolute; z-index: 100; font-size:15px">개설 골목</span>
				                        </c:if>
				                        <%-- <img src="${contextPath}/resources/img/iconmonstr-certificate-3-48.png" style="position: absolute; z-index: 100;"> --%>
				                    </div>
				                    <div class="col-md-1"></div>
				                    <div class="col-md-7">
				                        <div class="row">
				                        <div class="col-md-9"><input type="text" readonly class="form-control-plaintext nanum" value="${street.streetNm}" style="font-weight: bold;font-size: 25px;"></div>
				                        <div class="col-md-3"><button type="button" class="btn btn-outline-success text-center" disabled style="font-size: 13px;font-weight: bold;">${street.districtNm}</button></div>
				                        </div>
				                        <div class="row">
				                        <div class="col-md-12"><textarea rows="2" cols="65" style="resize: none;" class="form-control" readonly>${street.streetIntro}</textarea></div>
				                        </div>
				                        <%-- 키워드 작성 부분 시작--%>
				                        <c:forEach var="streetKeyword" items="${myStreetKeyword}" varStatus="vs">
				                        	<c:if test="${street.streetNo eq streetKeyword.streetNo}">
				                        		<div class="row">
					                        		<div class="col-md-12 golmokKeywordBox" style="background-color: #36be81;">
					                        			<input type="text" readonly class="form-control-plaintext nanum" value="#${streetKeyword.keywordContent}" style="color: white;">
					                       			</div>
				                       			</div>
				                        	</c:if>	
				                        </c:forEach>
				                    	<%-- 키워드 작성 부분 끝--%>
				                        <div class="row">
				                        <label class="col-sm-3 col-form-label text-center nanum" style="font-weight: bold; font-size: 16px;">골목 총 인원</label>
				                        <div class="col-sm-3"><input type="text" readonly class="nanum form-control-plaintext" value="${street.streetMaxMember}" style="font-size: 25px;"></div>
				                        <label class="col-sm-3 col-form-label text-center nanum" style="font-weight: bold; font-size: 20px;">골목대장</label>
				                        <div class="col-sm-3"><input type="text" readonly class="nanum form-control-plaintext" value="${street.memberNm}" style="font-size: 25px;"></div>
				                        </div>
				                        <div class="row">
				                        <div class="col-md-12"><button type="button" class="btn btn-primary btn-lg btn-block nanum" style="font-weight: bold;">골목 이동</button></div>
				                        </div>
				                    </div>
			                    </div>
			                    <!-- 골목 2 끝 -->
							</c:forEach> 	 
						</c:when>
						<c:otherwise>
						<%-- 골목이 없는 경우 --%>
						<h4 class="nanum">가입한 골목이 없습니다.</h4>
						</c:otherwise>
					</c:choose>
					
                      
                    
                </div>
                <!-- content end -->
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary nanum" data-dismiss="modal" style="font-weight: bold;">나가기</button>
                </div>
            </div>
            </div>
        </div>
        <!-- end -->

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