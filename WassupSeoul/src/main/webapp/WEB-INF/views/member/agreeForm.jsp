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
		url("${pageContext.request.contextPath}/resources/img/서울커버.jpg");
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
								<pre style="white-space: pre-wrap; font-size:15px" id="prespace" class="nanum">
  
  
  본 서비스는 전 연령대 누구나 가입 및 서비스 이용이 가능합니다
  
  
								</pre>
							</div>

							<div class="tab-pane fade" id="terms2">
								<pre style="white-space: pre-wrap; font-size:15px" id="prespace" class="nanum">
 
 
 1. 개인정보 처리방침이란?
 
  주식회사 와썹서울(이하"회사")은 이용자의 ‘동의를 기반으로 개인정보를 수집·이용 및 제공’하고 있으며, ‘이용자의 권리 (개인정보 자기결정권)를 적극적으로 보장’합니다.
  회사는 정보통신서비스제공자가 준수하여야 하는 대한민국의 관계 법령 및 개인정보보호 규정, 가이드라인을 준수하고 있습니다.
 “개인정보처리방침”이란 이용자의 소중한 개인정보를 보호함으로써 이용자가 안심하고 서비스를 이용할 수 있도록 회사가 준수해야 할 지침을 의미합니다.

  본 개인정보처리방침은 회사가 제공하는 와썹계정 기반의 서비스(이하 ‘서비스'라 함)에 적용됩니다.
  
  
  
 2. 개인정보 수집
 
  서비스 제공을 위한 필요 최소한의 개인정보를 수집하고 있습니다.
  회원 가입 시 또는 서비스 이용 과정에서 홈페이지 또는 개별 어플리케이션이나 프로그램 등을 통해 아래와 같은 서비스 제공을 위해 필요한 최소한의 개인정보를 수집하고 있습니다.

 [와썹계정]
  필수
  이메일, 비밀번호, 이름(닉네임), 프로필사진, 연락처, 서비스 이용내역
  선택
  프로필사진
  
 개인정보를 수집하는 방법은 다음과 같습니다.
 개인정보를 수집하는 경우에는 반드시 사전에 이용자에게 해당 사실을 알리고 동의를 구하고 있으며, 아래와 같은 방법을 통해 개인정보를 수집합니다.

 회원가입 및 서비스 이용 과정에서 이용자가 개인정보 수집에 대해 동의를 하고 직접 정보를 입력하는 경우
 제휴 서비스 또는 단체 등으로부터 개인정보를 제공받은 경우
 고객센터를 통한 상담 과정에서 웹페이지, 메일, 팩스, 전화 등
 온·오프라인에서 진행되는 이벤트/행사 등 참여
 서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
 
 서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
 PC웹, 모바일 웹/앱 이용 과정에서 단말기정보(OS, 화면사이즈, 디바이스 아이디, 폰기종, 단말기 모델명), IP주소, 쿠키, 방문일시, 부정이용기록, 서비스 이용 기록 등의 정보가 자동으로 생성되어 수집될 수 있습니다.

 서비스 간 제휴, 연계 등으로 제3자로부터 개인정보를 제공받고 있습니다.
 
 
 
 3. 개인정보 이용
 
  회원관리, 서비스 제공·개선, 신규 서비스 개발 등을 위해 이용합니다.
  회원 가입 시 또는 서비스 이용 과정에서 홈페이지 또는 개별 어플리케이션이나 프로그램 등을 통해 아래와 같이 서비스 제공을 위해 필요한 최소한의 개인정보를 수집하고 있습니다.
  회원 식별/가입의사 확인, 본인/연령 확인, 부정이용 방지
  만 14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 법정 대리인 권리행사 시 본인 확인
  이용자간 메시지 전송, 친구등록 및 친구추천 기능의 제공
  친구에게 활동내역을 알리거나 이용자 검색, 등록 등의 기능 제공
  신규 서비스 개발, 다양한 서비스 제공, 문의사항 또는 불만처리, 공지사항 전달
  유료서비스 이용 시 컨텐츠 등의 전송이나 배송·요금 정산
  서비스의 원활한 운영에 지장을 주는 행위(계정 도용 및 부정 이용 행위 등 포함)에 대한 방지 및 제재
  인구통계학적 특성과 이용자의 관심, 기호, 성향의 추정을 통한 맞춤형 컨텐츠 추천 및 마케팅에 활용
  음성명령 처리 및 음성인식 향상, 개인화 서비스 제공
  서비스 이용 기록, 접속 빈도 및 서비스 이용에 대한 통계, 프라이버시 보호 측면의 서비스 환경 구축, 서비스 개선에 활용
  
  
  
 4. 개인정보 제공
 
  와썹서울은 이용자의 별도 동의가 있는 경우나 법령에 규정된 경우를 제외하고는 이용자의 개인정보를 제3자에게 제공하지 않습니다.
  제3자 서비스와의 연결을 위해 아래와 같이 개인정보를 제공하고 있습니다.
  와썹서울은 이용자의 사전 동의 없이 개인정보를 제3자에게 제공하지 않습니다. 
  다만, 이용자가 외부 제휴사 등의 서비스를 이용하기 위하여 필요한 범위 내에서 이용자의 동의를 얻은 후에 개인정보를 제3자에게 제공하고 있습니다.
  
  서비스 제공을 위해 아래와 같은 업무를 위탁하고 있습니다.
  서비스 제공에 있어 필요한 업무 중 일부를 외부 업체로 하여금 수행하도록 개인정보를 위탁하고 있습니다. 그리고 위탁 받은 업체가 관계 법령을 준수하도록 관리·감독하고 있습니다.
  개인정보 처리위탁 중 국외에서 처리하는 위탁업무는 아래와 같습니다.
  
 
 
 5. 개인정보 파기
 
  개인정보는 수집 및 이용목적이 달성되면 지체없이 파기하며, 절차 및 방법은 아래와 같습니다.
  전자적 파일 형태인 경우 복구 및 재생되지 않도록 안전하게 삭제하고, 그 밖에 기록물, 인쇄물, 서면 등의 경우 분쇄하거나 소각하여 파기합니다.
  다만, 내부 방침에 따라 일정 기간 보관 후 파기하는 정보는 아래와 같습니다. 

 1) 아래 정보는 탈퇴일부터 최대 1년간 보관 후 파기합니다.
  안내메일 발송 및 CS문의 대응을 위해 와썹계정과 탈퇴안내 이메일 주소를 암호화하여 보관
  서비스 부정이용 기록
 2) 아래 정보는 프로젝트 모금함 최종 종료일부터 3년 경과 후 파기합니다.(단, 미선정의 경우, 미선일로부터 90일 경과 후 파기)
  또한, 와썹계정은 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관 또는 삭제하고 있으며, 
  분리 보관된 개인정보는 4년간 보관 후 지체없이 파기합니다.

  이 외에 법령에 따라 일정기간 보관해야 하는 개인정보 및 해당 법령은 아래 표와 같습니다.
  
 
  
 6. 기타
 
 와썹서울은 여러분의 권리를 보호합니다.
 이용자(만 14세 미만인 경우 법정 대리인)는 언제든지 자신의 개인정보를 조회하거나 수정할 수 있으며, 수집・이용에 대한 동의 철회 또는 가입 해지를 요청할 수 있습니다.
 보다 구체적으로는 서비스 내 설정을 통한 회원정보 수정 기능이나 회원탈퇴 기능을 이용할 수 있고, 고객센터를 통해 서면, 전화 또는 이메일로 요청하시면 지체 없이 조치하겠습니다.
 개인정보의 오류에 대한 정정을 요청하신 경우 정정을 완료하기 전까지 해당 개인정보를 이용 또는 제공하지 않습니다.
 또한, '온라인 맞춤형 광고 개인정보보호 가이드 라인'에 따른 이용자 권리보호를 위한 페이지도 제공하고 있습니다.
 
 
 
                				</pre>
							</div>
							<div class="tab-pane fade" id="terms3">
								<pre style="white-space: pre-wrap; font-size:15px" id="prespace" class="nanum">
 
 
 와썹서울 청소년 보호정책
 와썹서울은 모든 연령대가 자유롭게 이용할 수 있는 공간으로써 유해 정보로부터 청소년을 보호하고 청소년의 안전한 인터넷 사용을 돕기 위해 아래와 같이 정보통신망 이용촉진 및 정보보호 등에 관한 법률에서 정한 청소년 보호정책을 시행하고 있습니다.

 앞으로도 와썹서울은 깨끗하고 건전한 인터넷 문화를 조성하고 청소년이 올바른 정보공유 활동을 통하여 건강한 인격체로 성장할 수 있도록 더욱 노력하겠습니다.
 
 1. 청소년 보호를 위한 목표 및 기본 원칙
  청소년이 정신적·신체적으로 유해한 환경으로부터 보호받고 유익한 환경을 조성하도록 노력하며, 안전하게 인터넷을 이용할 수 있는 서비스를 제공하기 위해 청소년보호정책을 명시하고 있습니다.

 2. 청소년 보호 장치
  청소년이 정신적·신체적으로 유해한 환경으로부터 보호받고 유익한 환경을 조성하도록 노력하며, 안전하게 인터넷을 이용할 수 있는 서비스를 제공하기 위해 청소년보호정책을 명시하고 있습니다.

 3. 유해정보로 인한 피해상담 및 고충처리
  유해정보로 인한 피해상담 및 고충처리를 위한 전문인력을 배치하여 구제조치의 지연 및 처리 미숙으로 인한 피해가 확산되지 않도록 노력하고 있으며 자체적으로 처리가 곤란할 경우 피해 특성별 관련기관을 안내해 드리고 있습니다.

 4. 유해정보에 대한 청소년접근제한 및 관리조치
  유해정보로 인한 피해상담 및 고충처리를 위한 전문인력을 배치하여 구제조치의 지연 및 처리 미숙으로 인한 피해가 확산되지 않도록 노력하고 있으며 자체적으로 처리가 곤란할 경우 피해 특성별 관련기관을 안내해 드리고 있습니다.

 5. 유해정보로부터 청소년을 보호하기 위한 교육
  청소년보호담당자 및 각 서비스 담당자들을 대상으로 청소년 보호를 위한 각종 관련 법령 및 제재기준, 유해정보 발견시 대처방법, 위반사항 처리에 대한 보고절차 등을 교육하고 있습니다.

 6. 전체 이용자들의 인식제고를 통한 청소년 보호
  서비스이용약관 등을 통하여 불건전한 행위를 할 경우 이용제한 또는 민·형사상의 책임을 받을 수 있음을 고지하고 있으며, 신종 유해정보가 발생했을 경우 공지사항 또는 이메일을 통하여 이를 신속히 전파함으로써 청소년 및 전체 이용자를 보호하고 있습니다. 또한 각종 정보건전화 교육 및 캠페인 등을 통하여 네티켓 의식 고취를 위하여 노력하고 있습니다.

 7. 청소년보호책임자 및 담당자의 지정
  아래와 같이 청소년보호책임자 및 청소년보호담당자를 지정하여 청소년유해정보의 차단 및 관리, 청소년유해정보로부터의 청소년보호정책을 수립하는 등 청소년보호업무를 수행하고 있습니다.
								
  청소년 보호 책임자
  이름: 백동현
  직위: 이용자보호팀장
  전화: 010-9031-0000
 FAX: 02-0000-0000
 e-mail: 문의하기
  
  청소년 보호 담당자
  이름: 백동현
  소속: 이용자보호팀 팀장
  전화: 010-9031-0000
 FAX: 02-0000-0000
 e-mail: 문의하기							
						
						
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