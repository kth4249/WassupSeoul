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
<body style="background-color : rgb(255, 255, 255);">
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
			<div class="row">
				<div class="col-md-12 container">
					<c:forEach items="${list}" var="image">
						<div class="photobox">
		              	  <img src="${image}" alt="" class="photoSize" data-toggle="modal"
		                    data-target="#clickPhotoModal" style="cursor:pointer">
	                    </div>
	               	</c:forEach>
		        </div>
	        </div>
	        
	  	 <div class="container-fluid">
			<div class="row">
				<div class="col-md-12 d-flex justify-content-center">
					<div class="text-center" style="margin-bottom: 4rem;">
						<br><br>
					  	<ul class="pagination">
						
						<c:if test="${pInf.currentPage >= pInf.startPage + 10}">
						    <li class="page-item">
			    			  	<c:url var="Album" value="photoAlbum">
									<c:param name="currentPage" value="${pInf.currentPage-1}" />
								</c:url>
						    	<a class="page-link" href="${Album}">&laquo;</a>
						    </li>
						</c:if>
						<c:if test="${pInf.currentPage < pInf.startPage + 10}">
							<c:url var="Album" value="photoAlbum">
								<c:param name="currentPage" value="${pInf.startPage}" />
							</c:url>
						    <li class="page-item 
						    	<c:if test="${pInf.currentPage == pInf.startPage }">
						    		disabled
						    	</c:if>">
						      <a class="page-link" href="${Album}">&laquo;</a>
						    </li>
						</c:if>
					    
					    <c:forEach var="p" begin="${pInf.startPage}" end="${pInf.endPage}">
					    	<c:url var="Album" value="photoAlbum">
								<c:param name="currentPage" value="${p}" />
							</c:url>
					    	<c:if test="${p == pInf.currentPage}">
							    <li class="page-item active">
							      <a class="page-link">${p}</a>
							    </li>
							</c:if>
							<c:if test="${p != pInf.currentPage}">
							    <li class="page-item">
							      <a class="page-link" 
							      	href="${Album}">${p}</a>
							    </li>
							</c:if>
						</c:forEach>
						
						<c:if test="${pInf.currentPage <= pInf.maxPage - 10 }">
							<c:url var="Album" value="photoAlbum">
								<c:param name="currentPage" value="${pInf.currentPage+10}" />
							</c:url>
						    <li class="page-item">
						    	<a class="page-link" href="${Album}">&raquo;</a>
						    </li>
						 </c:if>
						<c:if test="${pInf.currentPage > pInf.maxPage - 10 }">
							<c:url var="Album" value="photoAlbum">
								<c:param name="currentPage" value="${pInf.maxPage}" />
							</c:url>
						    <li class="page-item 
						    	<c:if test="${pInf.currentPage == pInf.maxPage}">
						    		disabled
						    	</c:if>"
						    >
						    	<a class="page-link" href="${Album}">&raquo;</a>
						    </li>
						 </c:if>
					  </ul>
					</div>
				</div>
			</div>
        </div>
	</div>
</div>


<%-- 

	<div class="modal fade" id="clickPhotoModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<img src="${image}">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary nanum"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-danger nanum uploadBtn">작성</button>
				</div>
			</div>
		</div>
	</div>  --%>

	
		
	
	

</body>
</html>