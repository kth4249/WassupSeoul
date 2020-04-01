<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/timeline.css" type="text/css">

<title>타임라인 게시글 영역</title>
</head>

<style>
	.writerImg:hover{
		cursor : pointer;
	}
	.writerNickName:hover{
		cursor : pointer;
	}
	a{
	style="color: black; text-decoration: none;"
	}
	.profileBox{
	  width: 100%;
	  height: 160px; 
	  border-radius: 70%;
	  overflow: hidden;
	}
	.profileImage{
	width: 100%;
	height: 100%;
	object-fit: cover;
	}
	
	
</style>
<body>
	 				<!-- 프로필모달 -->
					<div class="modal fade" id="writerModal" data-backdrop="static"
						tabindex="-1" role="dialog" aria-labelledby="checkMemModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document" style="width: 496px;">
							<div class="modal-content">
								<div class="modal-header">
									<h2 class="modal-title nanum" id="checkMemModalLabel"
										style="font-weight: bold;">작성자 회원 정보</h2>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
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
												<img class="profileImage checkMemProfileUrl" src="" alt="이미지">
											</div>
										</div>
										<div class="col-md-4"></div>
									</div>
									<!-- profile image end-->
									<div class="row">
					                <div class="col-md-3"></div>
					                <div class="col-md-6">
					                    <input type="text" class="checkMemNickName" class="nanum form-control-plaintext text-center" 
					                    					style="font-size: 35px;font-weight: bold; border : 0px solid black; width: 200px; margin-left:30px;" readonly>
					                </div>
										<div class="col-md-3"></div>
									</div>
									<!-- <div class="row">   회원정보 이메일 
							                <div class="col-md-2"></div>
							                <div class="col-md-8"><input type="text" id="memberEmail" class="nanum form-control-plaintext text-center" style="font-size: 25px;font-weight: bold;" readonly></div>
							                <div class="col-md-2"></div>
							              </div> -->
									<div class="row">
										<label class="col-sm-2 col-form-label text-center nanum"
											style="font-weight: bold; font-size: 16px; margin-top:10px; color:black;">이름</label>
										<div class="col-sm-4">
											<input type="text" readonly 
												class="nanum form-control-plaintext text-center checkMemName"
												style="font-size: 25px; margin-bottom:20px;">
										</div>
										<label class="col-sm-2 col-form-label text-center nanum"
											style="font-weight: bold; font-size: 16px; margin-top:; color:black;">나이</label>
										<div class="col-sm-4">
											<input type="text" readonly 
												class="nanum form-control-plaintext text-center checkMemAge"
												style="font-size: 25px;">
										</div>
									</div>

									<div class="row">
										<label class="col-sm-2 col-form-label text-center nanum"
											style="font-weight: bold; font-size: 16px; margin-top:10px; color:black;">성별</label>
										<div class="col-sm-4">
											<input type="text" readonly 
												class="nanum form-control-plaintext text-center checkMemGender"
												style="font-size: 25px;">
										</div>
										<label class="col-sm-2 col-form-label text-center nanum"
											style="font-weight: bold; font-size: 16px; margin-top:10px; color:black; width:140px;">전화번호</label>
										<div class="col-sm-4">
											<input type="text" readonly 
												class="nanum form-control-plaintext text-center checkMemPhone"
												style="font-size: 22px;">
										</div>
									</div>

									<div class="row checkMemProfileHobby">
										<!-- 관심사 영역 -->
									</div>
									<!-- content end -->
									
								</div>
							</div>
						</div>
					</div>
					<!-- end -->

</body>
</html>