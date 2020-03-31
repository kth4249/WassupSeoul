<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<title>agree</title>

<script src="http://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
</head>

<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');

.container2 {
	padding-right: 15px;
	padding-left: 15px;
	width: 100%;
	height: 100%;
	text-align: center;
	position: relative;
	z-index: 1;
}

.container2::after {
	width: 100%;
	height: 100%;
	content: "";
	background:
		url("${pageContext.request.contextPath}/resources/img/서울2.jpg");
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
	opacity: 0.5;
}

body {
	height: 1000px;
}

.infoBox {
	background-color: white;
	background-color: rgba(255, 255, 255, 0.5);
	width: 800px;
	height: 600px;
}

/* number 태그 화살표 제거 */
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

.nanum {
	font-size: 20px;
}

.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
</style>

<script>
	$(document).ready(function() {
		$('.check-all').click(function() {
			$('.cb').prop('checked', this.checked);
		});
	});
</script>

<body>

	<div class="container2">


		<div class="row">
			<div class="col-md-12">
				<h1 class="mt-5" style="font-size: 80px;">Terms of Use</h1>
				<br>

				<div class="infoBox mx-auto">

					<fieldset class="join_contentback">
					<form class="form1" action="${pageContext.request.contextPath}/member/signUpForm" method="GET" name="agreeForm" id="form1"
                     onsubmit="return validate();">
						<div class="custom-control custom-checkbox" style="margin-top:50px">
							<input type="checkbox" id="total_agree"
								class="check-all custom-control-input"> <label
								for="total_agree" class="mt-3 custom-control-label">
								<h5 class="nanum" style="font-size: 35px; ">
									<strong>모두 확인, 동의합니다.</strong>
								</h5>
							</label>
						</div>
						<br>

						<div class="custom-control custom-checkbox">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" id="agree1"
								name="agree1" class="cb custom-control-input"> <label for="agree1"
								class="nanum custom-control-label">&nbsp;만
								14세 이상입니다.<strong>(필수)</strong>
							</label>
						</div>

						<div class="custom-control custom-checkbox">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" id="agree2"
								name="agree2" class="cb custom-control-input"> <label for="agree2"
								class="nanum custom-control-label">&nbsp;이용약관
								동의<strong>(필수)</strong>
							</label>

							<!-- 하이퍼링크로 만들기 -->
							&nbsp; <a href="#" data-toggle="modal"
								data-target="#exampleModalScrollable"> <u class="nanum"><small>내용보기</small></u>
							</a>
						</div>

						<div class="custom-control custom-checkbox">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" id="agree3"
								name="agree3" class="cb custom-control-input"> <label for="agree3"
								class="nanum custom-control-label">&nbsp;개인정보
								수집 및 이용 동의<strong>(필수)</strong>
							</label> &nbsp;
							<!-- 하이퍼링크로 만들기 -->
							<a href="#" data-toggle="modal"
								data-target="#exampleModalScrollable"> <u class="nanum"><small>내용보기</small></u>
							</a>
						</div>


						<div class="custom-control custom-checkbox">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" id="agree4"
								class="cb custom-control-input"> <label for="agree4"
								class="nanum custom-control-label">&nbsp;이메일 마케팅 수신 동의</label>
						</div>

						<div class="custom-control custom-checkbox">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" id="agree5"
								class="cb custom-control-input"> <label for="agree5"
								class="nanum custom-control-label">&nbsp;생년월일과 성별 및 수집및
								이용동의</label>
						</div>

						<div class="custom-control custom-checkbox">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" id="agree6"
								class="cb custom-control-input"> <label for="agree6"
								class="nanum custom-control-label">&nbsp;개인정보 유효기간 3년
								지정(미동의 시 1년)</label>
						</div>

						<br> <br>

						<%-- <button id="nextnext" type="button"
							class="btn btn-danger btn-lg nanum"
							onclick="location.href='${pageContext.request.contextPath}/member/signUpForm'">다음
							단계로 !</button> --%>
						<button id="nextnext" type="submit"
							class="btn btn-info btn-lg nanum">다음 단계로 !</button>
						</form>

						<p class="mt-5 mb-3 text-muted small text-center">&copy; WS
							Corp. All Rights Reserved.</p>
					</fieldset>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalScrollable">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<div class="nav-scroller py-1 mb-2">
						<ul class="nav nav-tabs">
							<li class="nav-item nanum"><a class="nav-link show active"
								data-toggle="tab" href="#terms1">이용약관</a></li>
							<li class="nav-item nanum"><a class="nav-link"
								data-toggle="tab" href="#terms2">개인정보 처리방침</a></li>
							<li class="nav-item nanum"><a class="nav-link"
								data-toggle="tab" href="#terms3">청소년 보호정책</a></li>
						</ul>

						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade show active" id="terms1">
								<pre style="white-space: pre-wrap" id="prespace">
대충 만 14세 이상이어야 한다는 내용
								</pre>
							</div>

							<div class="tab-pane fade" id="terms2">
								<pre style="white-space: pre-wrap" id="prespace">
대충 이용약관에 동의하라는 내용
                				</pre>
							</div>
							<div class="tab-pane fade" id="terms3">
								<pre style="white-space: pre-wrap" id="prespace">
대충 개인정보 수집하는데 동의하라는 내용
								</pre>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	
      
   </script>

		<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
			integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
			integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
			crossorigin="anonymous"></script>
			
		 <script>
		// 필수요소 체크 검사 결과를 저장할 객체
		var checkCheck = {
			"agree1" : false,
			"agree2" : false,
			"agree3" : false,
			"total_agree" : false
		};
			
		$(document).ready(
				function() {

					// jQuery 변수 : 변수에 직접적으로 jQuery메소드를 사용할 수 있음.
					var $agree1 = $("#agree1");
					var $agree2 = $("#agree2");
					var $agree3 = $("#agree3");
					var $total_agree = $("#total_agree");
					
					// 체크 유효성 검사
					$agree1.on("input", function(){
						if(!($agree1).prop("checked")){ 
							checkCheck.agree1 = false;
						}else{
							checkCheck.agree1 = true;
						}
					});
					
					$agree2.on("input", function(){
						if(!($agree2).prop("checked")){ 
							checkCheck.agree2 = false;
						}else{
							checkCheck.agree2 = true;
						}
					});
					
					$agree3.on("input", function(){
						if(!($agree3).prop("checked")){ 
							checkCheck.agree3 = false;
						}else{
							checkCheck.agree3 = true;
						}
					});
					
					$total_agree.on("input", function(){
						if(!($total_agree).prop("checked")){ 
							checkCheck.total_agree = false;
						}else{
							checkCheck.total_agree = true;
						}
					});
					
					
			        // submit 할때 체크하지 않아 색이 변한 font 를 다시 원래 색으로 바꾸는 부분. 
					function checkboxListener() {
			             checkCheck[this.name] = this.checked; 

			             if(this.checked) {
			                this.parentNode.style.color = "#000"; 
			             }
			        }
			        
			        
					agree1.onclick = agree2.onclick = agree3.onclick = checkboxListener; 

				    var all = document.getElementById('total_agree'); 

				    all.onclick = function() {
				         if (this.checked) {
				            setCheckbox(checkCheck, true); 
				         } else {
				            setCheckbox(checkCheck, false); 
				         }
				      }; 
				      // 여기까지 원래색 바꾸는 코드
				      
					 
				});//레디함수 종료
		
		// submit 동작 
		 function validate() {
					

		      if (checkCheck['total_agree'] ) {
		            return true; 
			     }
		         
			 if ( !checkCheck['agree1'] ) {
		            alert('14세 이상을 선택을 하지 않았습니다'); 
		            agree1.parentNode.style.color = 'red'; 
		            return false; 
		         }

		         if ( !checkCheck['agree2'] ) {
		            alert('이용약관에 동의하여 주시길 바랍니다.'); 
		            agree2.parentNode.style.color = 'red';
		            return false; 
		         }
		         
		         if ( !checkCheck['agree3'] ) {
		            alert('개인정보수집에 동의하여 주시길 바랍니다.'); 
		            agree3.parentNode.style.color = 'red';
		            return false; 
		         }
		} 
					
      </script> 
</body>
</html>