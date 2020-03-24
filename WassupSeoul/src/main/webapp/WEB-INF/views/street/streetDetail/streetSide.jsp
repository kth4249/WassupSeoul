<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<!-- 고정 사이드바 왼쪽 시작 -->
    <div class="col-md-2 fixed-top" style="left: 17%; top: 110px;" style="background-color: rgb(221, 233, 218);">
    <!-- <div class="col-md-2 fixed-top" style="left: 366px; top: 110px;" style="background-color: rgb(221, 233, 218);"> -->
      <div class="card mb-3">
        <img style="height: 200px; width: 100%; display: block;" src="${contextPath}/resources/streetCoverImage/${imgUrl}" alt="Card image">
        <div class="card-body">
          <div class="row">
            <div class="col-sm-10">
            	<input type="text" class="form-control-plaintext nanum" value="${street.streetNm}" style="font-size: 25px; font-weight: bold;">
			</div>
			<!-- 골목 등급을 나타내는 이미지 영역 시작 -->
            <div class="col-sm-2" style="padding: 0px;">
            	<img src="${contextPath}/resources/img/${badgeUrl}" alt="badge" style="height: 40px; width: 30px;">
            </div>
            <!-- 골목 등급을 나타내는 이미지 영역 끝 -->
          </div>
          <div class="row">
            <label class="col-sm-4 col-form-label nanum" style="font-weight: bold;font-size: 15px;">멤버</label>
            <div class="col-sm-8">
              <input type="text" readonly class="form-control-plaintext nanum" value="${citizenCount}" style="font-size: 15px;">
            </div>
            <label class="col-sm-4 col-form-label nanum" style="font-weight: bold;font-size: 15px;">골목대장</label>
            <div class="col-sm-8">
              <input type="text" readonly class="form-control-plaintext nanum" value="${streetMasterNm}" style="font-size: 15px;">
            </div>
            <label class="col-sm-4 col-form-label nanum" style="font-weight: bold;font-size: 15px;">활동점수</label>
            <div class="col-sm-8">
              <input type="text" readonly class="form-control-plaintext nanum" value="${street.streetPoint}" style="font-size: 15px;">
            </div>
          </div>
          <div class="col-sm-12" style="margin:5px">
          	<textarea class="form-control nanum" rows="2" readonly style="resize: none;">${street.streetIntro}</textarea>
          </div>
          
          <c:forEach var="keyword" items="${streetKeyword}" varStatus="vs">
          	<div class="col-md-12 golmokKeywordBox" style="background-color: #36be81; border-radius: 20px; margin-bottom: 5px;">
          		<input type="text" readonly class="form-control-plaintext nanum" value="#${keyword.keywordContent}" style="color: white;">
          	</div>
          </c:forEach>
          
          <div class="row">
          	<c:if test="${empty citizenStatus}">
	           <div class="col-sm-12" style="margin-top:5px;margin-bottom:5px">
	           	<button type="button" class="btn btn-secondary btn-lg btn-block nanum" style="font-size: 20px; font-weight: bold;"
				onclick="streetJoin()">골목 가입하기</button>
	           </div>
            </c:if>
            <c:if test="${citizenStatus eq 'W'}">
	            <div class="col-sm-12" style="margin-top:5px;margin-bottom:5px">
	            	<button type="button" class="btn btn-secondary btn-lg btn-block nanum" style="font-size: 20px; font-weight: bold;"
	            	disabled>골목 가입요청중</button>
	            </div>
            </c:if>
            <c:if test="${not empty citizenStatus && citizenStatus ne 'W'}">
            	<div class="col-sm-12" style="margin-top:5px;margin-bottom:5px">
	            	<button type="button" class="btn btn-secondary btn-lg btn-block nanum" style="font-size: 20px; font-weight: bold;"
	            	disabled>골목 가입완료</button>
	            </div>
            </c:if>
          </div>
          <script>
			function streetJoin() {
				if (confirm("가입을 신청하시겠습니까?")) {
					$.ajax({
						url : "${contextPath}/street/streetJoin",
						success : function(result) {
							if (result == -1) {
								alert("더 이상 골목에 가입할 수 없습니다");
							} else {
								alert("골목 가입 신청 완료");
							}
						},
						error : function() {
							alert("골목 가입 신청 과정 중 오류 발생");
						}
					})
				}
			}
		  </script>
		  <div class="row">
				<c:if test="${citizenGrade eq 'M'}">
					<div class="col-sm-6">
						<a onclick="return confirm('정말로 이 골목을 삭제하시겠습니까?');"
							href="streetDelete?no=${streetNo}" class="btn btn-link nanum"
							style="color: red; font-weight: bold; font-size: 15px"> <img
							src="${contextPath}/resources/img/streetOut.svg" alt="이미지"
							style="width: 15px; height: 15px;"> 골목 삭제하기
						</a>
					</div>
				</c:if>
				<!-- 일반 주민 영역 -->
		  	<c:if test="${citizenGrade eq 'G' || citizenGrade eq 'M'}">
	           	<div class="col-sm-6" style="padding: 0px; padding-left: 12px;">
	             		<a href="streetDelete?no=${streetNo}" class="btn btn-link nanum" style="color : red; font-weight : bold; font-size: 15px">
	               	<img src="${contextPath}/resources/img/streetOut.svg" alt="이미지" style="width: 15px; height: 15px;">
	              	 	골목 탈퇴하기
	             		</a>
	           	</div>
		  	</c:if>
            <!-- 일반 주민 영역 -->
            
            <!-- 골목대장 영역 -->
           <c:if test="${citizenGrade eq 'M'}"> 
		  	    	<div class="col-sm-6" style="padding: 0px; padding-left: 12px;">
	             		<a href="streetUpdate?no=${streetNo}" class="btn btn-link nanum" style="font-weight : bold; font-size: 15px">
	               	<img src="${contextPath}/resources/img/streetChange.svg" alt="이미지" style="width: 15px; height: 15px;">
	                                   	골목 변경하기
	             		</a>
	           	</div>
	           	<div class="col-sm-6" style="padding: 0px; padding-left: 12px;">
	             		<button type="button" class="btn btn-link nanum" style="font-weight : bold; font-size: 15px; padding-left: 6px; padding-right: 6px;">
	               	<img src="${contextPath}/resources/img/actReport.svg" alt="이미지" style="width: 15px; height: 15px;">
	                                   	활동보고서 작성
	             		</button>
	           	</div>
	  	    </c:if>
            <!-- 골목대장 영역 -->
            
          </div>
        </div>
        
       <c:if test="${street.streetStatus eq 'Y'.charAt(0)}">
        	<div class="card-footer text-muted nanum">
          	누구나 골목을 검색해 찾을 수 있고, <br>게시물을 볼 수 있습니다.
        	</div>
        </c:if>
        <c:if test="${street.streetStatus eq 'N'.charAt(0)}">
        	<div class="card-footer text-muted nanum">
         	 이 골목은 누구나 검색해 찾을 수 있지만, 게시물은 주민만 볼 수 있습니다.
        	</div>
        </c:if>
        
      </div>
    </div>
    <!-- 고정사이드바 왼쪽 끝 -->

    <!-- 고정사이드바 오른쪽 시작 -->
    <div class="col-md-2 fixed-top" style="left: 66%; top: 110px; opacity: 1.0; z-index: 0">
    <!-- <div class="col-md-2 fixed-top" style="left: 1223px; top: 110px;"> -->
    	<div class="card border-primary mb-3" style="max-width: 20rem;">
			<div class="card-header nanum" style="font-size: 25px;">다가오는 일정</div>
			<div class="card-body" style="padding-bottom:10px;">
				<h4 class="card-title nanum" style="font-weight: bolder;" id="sideMonth"></h4>
				<p class="card-text nanum">13일 - DB설계 보고서 제출</p>
				<p class="card-text nanum">31일 - 클래스 설계 보고서 제출</p>
			</div>
		</div>
		<!-- 현재 월 입력 -->
		<script>
			var nowDate = new Date();
			$("#sideMonth").text((nowDate.getMonth()+1) + "월");
		</script>
		
     	<!-- 친구목록 버튼 -->
     	<div style="border-radius: 70%; background-color: gray; width: 100px; height: 100px; position: relative;">
			<div style="position: absolute; top: 15px; left: 20px;">
				<img src="${contextPath}/resources/img/iconmonstr-user-8-64.png" alt="이미지" style="cursor: pointer;">
			</div>
		</div>

      <!-- 탑버튼 -->
      <%-- <a style="display: scroll; position: fixed; bottom: 10px; right: 10px;" href="#" title="맨 위로">
      	<img src="${contextPath}/resources/img/img_top.png" alt="탑버튼" style="width: 70px; height: 100px;">
	  </a> --%>

    </div>
    <%-- 아이콘 제작자 <a href="https://www.flaticon.com/kr/authors/phatplus" title="phatplus">phatplus</a> from <a href="https://www.flaticon.com/kr/" title="Flaticon"> www.flaticon.com</a> --%>
    <!-- 고정사이드바 오른쪽 끝 -->
