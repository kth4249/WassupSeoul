<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wassup, Seoul Lounge</title>
</head>
<style>
.loungeHeader {
	width: 100%;
	height: 400px;
	position: relative;
}

.loungeBack {
	position: relative;
}

.loungeBack::after {
	content: "";
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	background-image: url('${contextPath}/resources/img/서울3.jpg');
	background-size: cover;
	width: 100%;
	height: 100%;
	opacity: 0.6;
	z-index: -1;
	background-repeat: no-repeat;
}

.streetBtn {
	background-color: rgba(100, 255, 255, 0.2) !important;
}

/* .streetBtn:hover{
    color: #333;
    text-decoration: none;
    background-color: #dee2e6 !important;
  } */
.streetBtnActive {
	color: #212529;
	background-color: #f7f7f9;
}

#createStreet {
	position: absolute;
	bottom: 0px;
	right: 20px;
}

.btn-custom {
	background-color: rgba(100, 255, 255, 0.5) !important;
	color: black !important;
}

.streetSize {
	width: 17%;
	margin: 20px 20px;
}
</style>

<body>
	<%@include file="common/header.jsp"%>
	<div class="container-fluid loungeBack">
		<div class="row">
			<div class="col-md-12">

				<div class="loungeHeader headerMargin nanum text-center">
					<br> <br> <br> <br> <br> <br> <br>
					<h1 style="text-shadow: 0px 0px 2px #0874c6, 0px 0px 5px #c60850">
						<strong>Wassup, Seoul!</strong>
					</h1>
					<div id="createStreet">
						<div class="form-group" style="display: inline-block;">
							<select class="custom-select nanum" id="streetSort">
								<option value="0">인기 골목 순</option>
								<option value="1">주민 많은 순</option>
								<option value="2">주민 적은 순</option>
								<option value="3">최신 개설 순</option>
							</select>
						</div>
						<button type="button" class="btn btn-primary btn-custom nanum">골목
							개설</button>


						<script>
			            	$("#streetSort").on("change", function(e){
								<c:url var="detailUrl" value="square">
									<c:param name="currentPage" value="${pInf.currentPage}" />
									<c:if test="${!empty param.districtNo}">
										<c:param name="districtNo" value="${param.districtNo}" />
									</c:if>
								</c:url>
			            		
			            		console.log($(this).val())
			            		location.href = "${detailUrl}&streetSort="+this.value
			            	})
			            	<c:if test="${!empty param.streetSort}">
			            		$("#streetSort>option").each(function(index, item){
			            			if($(item).val() == "${param.streetSort}"){
			            				$(item).prop("selected", true);
			            			}
			            		})
			            	</c:if>
			            	
			            </script>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-2">
				<ul class="nav nav-tabs">
					<a href="#" class="btn btn-primary" style="color: white;"> 전체 </a>
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#gangnam" id="gangnamFor">강남</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#gangbuk" id="gangbukFor">강북</a></li>
				</ul>
				<div id="myTabContent" class="tab-content districtTab">
					<ul class="list-group streetBtn tab-pane fade active show"
						id="gangnam">
						<li class="list-group-item list-group-item-action streetBtn"
							value=3>강남구</li>
						<li class="list-group-item list-group-item-action streetBtn"
							value=1>강동구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=10>강서구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=11>구로구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=7>금천구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=6>관악구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=5>동작구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=4>서초구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=2>송파구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=8>양천구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=9>영등포구</li>
					</ul>
					<ul class="list-group streetBtn tab-pane fade" id="gangbuk">
						<li class="list-group-item list-group-item-action streetBtn" value=12>강북구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=15>광진구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=13>노원구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=14>도봉구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=18>동대문구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=25>마포구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=23>서대문구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=17>성동구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=19>성북구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=22>용산구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=24>은평구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=21>종로구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=20>중구</li>
						<li class="list-group-item list-group-item-action streetBtn" value=16>중랑구</li>
					</ul>
				</div>
			</div>
			<div class="col-md-10">
				<div class="row">

					<c:if test="${!empty sList}">
						<c:forEach var="street" items="${sList}" varStatus="vs">
							<div class="streetSize">
								<div class="card h-100">
									<a href="street/streetMain?streetNo=${street.streetNo}"><img
										class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
									<div class="card-body">
										<h4 class="card-title nanum">
											<a href="#">${street.streetNm }</a>
										</h4>
										<p class="card-text">streetNo(test) : ${street.streetNo}</p>
										<p class="card-text">#키워드</p>
										<p class="card-text">#키워드</p>
									</div>
									<div class="card-footer">
										<small class="text-muted">&#9733; &#9733; &#9733;
											&#9733; &#9734;</small>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<script>
	        	$(".districtTab li").on("click", function(e){
	        		<c:url var="detailUrl" value="square">
						<c:param name="currentPage" value="${pInf.currentPage}" />
						<c:if test="${!empty param.streetSort}">
							<c:param name="streetSort" value="${param.streetSort}" />
						</c:if>
					</c:url>
	        		var districtNo = $(e.target).val();
	        		location.href = "${detailUrl}&districtNo="+districtNo;
	        	})
	        	
            	<c:if test="${!empty param.districtNo}">
            		$(".districtTab li").each(function(index, item){
            			if($(item).val() == "${param.districtNo}"){
	            			console.log($(item).val())
            				$(item).prop("class", "list-group-item list-group-item-action streetBtnActive");
	            			console.log($(item).parent().prop("id"))
	            			var division = $(item).parent().prop("id");
	            			if(division == "gangnam") {
	            				$("#"+division).prop("class", "list-group streetBtn tab-pane fade active show")
	            				$("#gangbuk").prop("class", "list-group streetBtn tab-pane fade")
	            				division = division + "For";
	            				$("#"+division).prop("class", "nav-link active")
	            				$("#gangbukFor").prop("class", "nav-link")
	            				
	            			} else {
	            				$("#"+division).prop("class", "list-group streetBtn tab-pane fade active show")
	            				$("#gangnam").prop("class", "list-group streetBtn tab-pane fade")
	            				division = division + "For";
	            				$("#"+division).prop("class", "nav-link active")
	            				$("#gangnamFor").prop("class", "nav-link")
	            				
	            			}
            			}
            		})
            	</c:if>
	        	
	        </script>

				</div>
				<!-- row end -->
			</div>
		</div>


		<%@ include file="common/footer.jsp"%>


	</div>



</body>
</html>