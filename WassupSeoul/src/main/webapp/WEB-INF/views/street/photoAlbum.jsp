<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>photoAlbum</title>
</head>

<style>

  .photobox{
  	  border: solid 2px white;
  	  width: 287px;
      height: 287px;
      float: left;
      overflow: hidden;
      background-color: black;
      text-align: center;
	}
  
  .photoSize {
      background-repeat: no-repeat;
      background-position: 50%;
      width: auto;
      height: 287px;
  }
  
  .album{
  	margin : auto;
  }
  .nullPhoto{
  }
</style>
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

	 <!-- 본문 시작 -->
	 <div>
		 <jsp:include page="streetDetail/streetSide.jsp"/>
			
			 <div class="col-md-4 nanum album" id="photoAlbum">
			    <br>
			    <h1 class="nanum" style="font-weight: bold;">사진첩</h1>
			    <hr>
			
			    <br><br>
			
		        	<c:if test="${empty list }">
						<h1 class="nanum nullPhoto">아직 등록된 사진이 없네요!</h1>
					</c:if>
					
					<div class="col-md-12 container">
						<c:forEach items="${list}" var="image">
							<div class="photobox">
			              	  <img src="${image}" alt="" class="photoSize" data-toggle="modal"
			                    data-target="#clickPhoto" style="cursor:pointer">
		                    </div>
		               	</c:forEach>
			        </div>
			</div>
		</div>

</body>
</html>