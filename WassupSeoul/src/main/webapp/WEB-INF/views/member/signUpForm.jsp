<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">

    <script src="http://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>


    <style>
        @import url('https://fonts.googleapis.com/css?family=Poor+Story&display=swap');

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
            background: url("${pageContext.request.contextPath}/resources/img/서울2.jpg");
            position: absolute;
            top: 0;
            left: 0;
            z-index: -1;
            opacity: 0.5;
        }


        body {
            height: 1400px;
        }

        .infoBox {
            background-color: white;
            background-color: rgba(255, 255, 255, 0.5);
            width: 800px;
            height: 1200px;
        }

        .profile {
            width: 200px;
            height: 200px;
            border-radius: 100px;
        }

        .profile img {
            max-width: 100%;
        }

        /* number 태그 화살표 제거 */
        input[type="number"]::-webkit-outer-spin-button,
        input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>

    <script type="text/javascript">
        var sel_file;

        $(document).ready(function () {
            $("#profile_img").on("change", handleImgFileSelect);
        });

        function handleImgFileSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);

            filesArr.forEach(function (f) {
                if (!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
                sele_file = f;

                var reader = new FileReader();
                reader.onload = function (e) {
                    $("#img").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
        }

    </script>

    <title> SignUp </title>
</head>

<body>
    <div class="container2">


        <div class="row">
            <div class="col-md-12">
                <h1 class="mt-5" style="font-size: 80px;">Who Are U?</h1><br>

                <div class="infoBox mx-auto">

                    <form method="POST" action="${pageContext.request.contextPath}/member/signUp" name="signUpForm" onsubmit="return validate();">
                        <br><br>

                        <!-- 이메일 입력 -->
                        <div class="row form-group">
                            <div class="col-md-4">
                                <label for="" class="nanum float-right" style="font-size: 25px">* 이메일</label>
                            </div>
                            <div class="col-md-6">
                                <input type="email" id="email" name="memberEmail" placeholder=" 사용하실 이메일을 입력해주세요"
                                    class="nanum form-control float-left" required>
                                <input type="hidden" name="emailDup" id="emailDup" value="false">
                                <div><span id="checkEmail"></span></div>
                            </div>
                        </div>

                        <!-- 비밀번호 입력 -->
                        <div class="row form-group">
                            <div class="col-md-4">
                                <label for="" class="nanum float-right" style="font-size: 25px;">*비밀번호</label>
                            </div>
                            <div class="col-md-6">
                                <input type="password" id="pwd1" name="memberPwd" placeholder=" 영문대소문자+숫자 6자 이상"
                                    class="nanum form-control float-left" maxlength="8" required>
                            </div>
                        </div>

                        <!-- 비밀번호 재확인 -->
                        <div class="row form-group">
                            <div class="col-md-4">
                                <label for="" class="nanum float-right" style="font-size: 25px;">* 비밀번호 확인</label>
                            </div>
                            <div class="col-md-6">
                                <input type="password" id="pwd2" placeholder=" 비밀번호를 확인해주세요" class="nanum form-control float-left"
                                    maxlength="8" required>
                            </div>
                        </div>

                        <!-- 이름 입력 -->
                        <div class="row form-group">
                            <div class="col-md-4">
                                <label for="" class="nanum float-right" style="font-size: 25px;">* 이름</label>
                            </div>
                            <div class="col-md-6">
                                <input type="text" id="name" name="memberNm" placeholder=" 이름을 입력해주세요" class="nanum form-control float-left"
                                    maxlength="4" required>
                            </div>
                        </div>

                        <!-- 닉네임 입력 -->
                        <div class="row form-group">
                            <div class="col-md-4">
                                <label for="" class="nanum float-right" style="font-size: 25px;">* 닉네임</label>
                            </div>
                            <div class="col-md-6">
                                <input type="text" id="nickName" name="memberNickname" placeholder=" 사용하실 닉네임을 설정해주세요" class="nanum form-control float-left"
                                    maxlength="5" required>
                            </div>
                        </div>

                        <!-- 전화번호 입력 -->
                        <div class="row form-group">
                            <div class="col-md-4">
                                <label for="" class="nanum float-right" style="font-size: 25px;">* 전화번호</label>
                            </div>
                            <div class="col-md-2">
                                <select class="form-control" id="phone1" name="phone1" required>
                                    <option selected>010</option>
                                    <option>011</option>
                                    <option>016</option>
                                    <option>016</option>
                                    <option>070</option>
                                    <option>019</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <input type="number" class="form-control" id="phone2" name="phone2" maxlength="4" required>
                            </div>
                            <div class="col-md-2">
                                <input type="number" class="form-control" id="phone3" name="phone3" maxlength="4" required>
                            </div>
                        </div>

                        <!-- 성별 선택 -->
                        <div class="row form-group">
                            <div class="col-md-4">
                                <label for="" class="nanum float-right" style="font-size: 25px;">* 성별</label>
                            </div>

                            <div class="col-md-3">
                                <label for="man" class="nanum" style="font-size: 25px;">남성</label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" id="M" name="memberGender">
                            </div>
                            <div class="col-md-3">
                                <label for="woman" class="nanum float-" style="font-size: 25px;">여성</label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" id="W" name="memberGender">
                            </div>
                        </div>

                        <!-- 나이 입력 -->
                        <div class="row form-group">
                            <div class="col-md-4">
                                <label for="" class="nanum float-right" style="font-size: 25px;">* 나이</label>
                            </div>

                            <div class="col-md-6">
                                <input type="number" name="memberAge" class="nanum form-control" maxlength="3"
                                    placeholder=" 나이를 입력해주세요(숫자만)">
                            </div>
                        </div>

                        <!-- 관심분야 검색 -->
                        <div class="row form-group">
                            <div class="col-md-4">
                                <label for="" class="nanum float-right" style="font-size: 25px;">* 관심분야</label>
                            </div>
                            <div class="col-md-4">
                                <input type="number" class="nanum form-control border-primary" placeholder="  관심분야 검색">
                            </div>
                            <div class="col-md-2">
                                <button class="nanum badge badge-primary" style="font-size: 19px;">검 색</button>
                            </div>
                        </div>

                        <!-- 관심분야 선택창 -->
                        <div class="row form-group">
                            <div class="col-md-4">
                                <p class="nanum float-right" style="color: midnightblue;">(1개 이상 필수 선택)</p>
                            </div>
                            <div class="col-md-6">
                                <select multiple="" class="nanum form-control" id="exampleSelect2">
                                    <option>와인 (100명)</option>
                                    <option>와인만들기 (65명)</option>
                                    <option>와인시음회 (14명)</option>
                                    <option>레드와인 (22명)</option>
                                    <option>화이트와인 (78명)</option>
                                </select>
                            </div>
                        </div>

                        <!-- 관심분야 선택창 -->
                        <div class="row form-group">
                            <div class="col-md-4">
                                <label for=""></label>
                            </div>
                            <div class="col-md-6">
                                <div class="card" style="max-width: 30rem;">
                                    <div class="card-body">
                                        <span class="nanum">프랑스여행</span>
                                        <button class="badge badge-pill badge-danger">X</button>
                                        <span class="nanum">와인만들기</a>
                                        <button class="badge badge-pill badge-danger">X</button>
                                        <span class="nanum">여행</a>
                                        <button class="badge badge-pill badge-danger">X</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <!-- 프로필 사진 영역 -->
                        <div class="row form-group">
                            <div class="col-md-4">
                                <label for="" class="nanum float-right" style="font-size: 25px;">프로필 사진</label><br><br>
                                <p class="nanum float-right" style="color: midnightblue;">(선택사항)</p>
                            </div>
                            <div class="col-md-6">
                                <!-- <input type="image" src="../img/골목.jpg" class="profile rounded-circle"> -->
                                <div class="profileDiv">
                                    <img id="img" class="profile" src="img/wm1.png">
                                </div>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-md-4">
                                <label for=""></label>
                            </div>
                            <div class="col-md-6">

                                <input type="file" id="profile_img">
                            </div>
                        </div>

                        <br>
                        <div class="row form-group">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                                <button type="submit" class="nanum btn btn-danger btn-lg btn-block">같이놀기</button>
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
     <script>
         // 각 유효성 검사 결과를 저장할 객체
        var signUpCheck = { 
        		"email":false,
        		"emailDup":false,
				"pwd1":false,
				"pwd2":false,
				"name":false,
				"nickName":false,
				"phone":false,
				};
        
   	 	// 실시간 입력 형식 검사
		// 정규표현식
		$(document).ready(function(){
			
			// jQuery 변수 : 변수에 직접적으로 jQuery메소드를 사용할 수 있음.
			var $email = $("#email");
			var $emailDup = $("#emailDup");
			var $pwd1 = $("#pwd1");
			var $pwd2 = $("#pwd2");
			var $name = $("#name");
			var $nickName = $("#nickName");
			var $phone = $("#phone");
			
			
			// 아이디  유효성 검사
			$id.on("input", function(){
				// 영어 대,소문자 + 숫자, 총 6~12글자
				var regExp = /^[A-Za-z0-9]{6,12}$/;
				if(!regExp.test($id.val())){
                	$("#checkEmail").text("이메일 형식이 유효하지 않습니다.").css({"color":"red","font-weight":"bold"});
                	signUpCheck.id = false;
                }else{
                	signUpCheck.id = true;
                	 $.ajax({
                		url : "idDupCheck",
                		data : {memberEmail: $id.val() },
                		type : "post",
                		success : function(result){
                			
                			if(result == "true"){
                				$("#checkEmail").text("사용 가능한 이메일 입니다.").css({"color":"green","font-weight":"bold"});
                				signUpCheck.idDup = true;
                			}else{
                				$("#checkEmail").text("사용할 수 없는 이메일 입니다.").css({"color":"red","font-weight":"bold"});
                				signUpCheck.idDup = false;
                			}
                		},
                		
                		error : function(e){
                			console.log("ajax 통신 실패");
                			console.log(e);
                		}
                	}); 
                	
                }
			});

			// 비밀번호  유효성 검사
			$pwd1.on("input", function(){
				//영어 대,소문자 + 숫자, 총 6~12글자
				var regExp = /^[A-Za-z0-9]{6,12}$/;
				if(!regExp.test($pwd1.val())){ 
                	$("#checkPwd1").text("비밀번호 형식이 유효하지 않습니다.").css("color","red");
                	signUpCheck.pwd1 = false;
                }else{
                	$("#checkPwd1").text("유효한 비밀번호 형식입니다.").css("color","green");
                	signUpCheck.pwd1 = true;
                }

			});
			
			
			// 비밀번호 일치 여부
			$pwd2.on("input", function(){
				if($pwd1.val().trim() != $pwd2.val().trim()){
					$("#checkPwd2").text("비밀번호 불일치").css("color","red");
					signUpCheck.pwd2 = false;
				}else{
					$("#checkPwd2").text("비밀번호 일치").css("color","green");
					signUpCheck.pwd2 = true;
				}
			});
			
			
			// 이름 유효성 검사
			$name.on("input", function(){
				var regExp =  /^[가-힣]{2,}$/; // 한글 두 글자 이상
				
				if(!regExp.test($(this).val())){ // 이름이 정규식을 만족하지 않을경우
					$("#checkName").text("한글 두 글자 이상을 입력하세요").css("color","red");
					signUpCheck.name = false;
				}else{
					$("#checkName").text("정상입력").css("color","green");
					signUpCheck.name = true;
				}
			});
			
			
			// 전화번호 관련
		 	$(".phone").on("input",function(){
		 		
				// 전화번호 input 태그에 4글자 이상 입력하지 못하게 하는 이벤트
                if ($(this).val().length > $(this).prop("maxLength")){
                    $(this).val($(this).val().slice(0, $(this).prop("maxLength")));
                }
                
				// 전화번호 유효성 검사
                var regExp1 =  /^\d{3,4}$/; // 숫자 3~4 글자
                var regExp2 =  /^\d{4,4}$/; // 숫자 4 글자
                
                if(!regExp1.test($phone2.val()) || !regExp2.test($phone3.val())){
                	$("#checkPhone").text("전화번호가 유효하지 않습니다.").css("color","red");
					signUpCheck.phone = false;
                }else{
					$("#checkPhone").text("유효한 전화번호입니다.").css("color","green");
					signUpCheck.phone = true;
				}
				
				
            });
			
			// 이메일 유효성 검사
			$email.on("input", function(){
				var regExp =  /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/; // 한글 두 글자 이상
				
				if(!regExp.test($(this).val())){ // 이름이 정규식을 만족하지 않을경우
					$("#checkEmail").text("이메일 형식이 유효하지 않습니다.").css("color","red");
					signUpCheck.email = false;
				}else{
					$("#checkEmail").text("유효한 이메일 형식입니다.").css("color","green");
					signUpCheck.email = true;
				}
			});
			
			
		});
        
		// submit 동작
		function validate(){
			
			// 아이디 중복 검사 결과
			//if( $("#idDup").val() == "true")	signUpCheck.idDup = true;
			//else				  				signUpCheck.idDup = false;
			
			for(var key in signUpCheck){
				if(!signUpCheck[key]){
					alert("일부 입력값이 잘못되었습니다.");
					var id = "#"+key;
					$(id).focus();
					return false;
				}
			}
		} 
		
		
		 
        </script>
    
    
    
    
    

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>

</body>

</html>