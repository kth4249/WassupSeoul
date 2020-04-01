<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>deleteMember</title>
</head>

<body>
	<!-- 헤더 추가 시작-->
    <jsp:include page="../common/header.jsp"/>
    <div class="form-group row" style="height : 86px;"></div>
    <!-- 헤더 추가  끝-->
    <div class="container-fluid">
        <!-- 회원탈퇴 시작 -->
        <form action="${contextPath}/member/delete" method="POST" role="form" onsubmit="return validate();">
        <br>    
        <div class="form-group row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="form-group row">
                    <div class="col-md-5"><h1 class="nanum">회원정보 탈퇴하기</h1></div>
                    <div class="col-md-6"></div>
                </div>
                <hr>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;font-size: 20px;">이름</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control-plaintext nanum" value="${loginMember.memberNm}" style="font-size: 20px;">
                    </div>
                    <div class="col-sm-5"></div>
                </div>
                <br>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;font-size: 20px;">아이디</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control-plaintext nanum" value="${loginMember.memberEmail}" style="font-size: 20px;">
                    </div>
                    <div class="col-sm-5"></div>
                </div>
                <br>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;font-size: 20px;">*비밀번호 입력</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control nanum" id="pwdCheck" name="memberPwd" style="font-size: 20px;" placeholder="비밀번호 입력">
                    </div>
                    <div class="col-sm-5"><span class="nanum" id="pwdCheckResult"></span></div>
                </div>
                <br>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;font-size: 20px;">*탈퇴사유</label>
                    <div class="col-sm-5">
                        <textarea class="form-control nanum" rows="5" cols="65" style="resize: none;" name="reason" id="deleteReason"></textarea>
                    </div>
                    <div class="col-sm-5"></div>
                </div>
                <br>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;font-size: 19px;">*회원 탈퇴 약관</label>
                    <div class="col-sm-5"></div>
                    <div class="col-sm-5"></div>
                </div>
                <div class="form-group row">
                    <div class="col-md-12">
<pre class="nanum" style="font-size: 18px;">

계정을 삭제하면:
        
- 내 프로필, 친구목록이력, 골목 내 작성글 및 다운로드 내역, 작성 게시글내 사진 내역이 
모두 사라지고, 애드포스트 미디어 등록이 해제되며 복구가 불가능합니다.
            
- 참여 중인 모든 골목과 페이지에서 탈퇴됩니다. Wassup Seoul 서비스 내에서 작성한 
콘텐츠를 삭제하거나 수정할 수 없으니, 원하시면 계정 삭제 전에 지우거나 
수정하시기 바랍니다.
            
*가입한 골목 중 하나만 탈퇴하고 싶다면?
탈퇴하고 싶은 골목에 들어가서
[골목 탈퇴하기]를 선택하세요.
        
</pre>
                </div>
                </div>
                <div class="form-group row">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="agree" style="font-size: 18px;">
                        <label class="custom-control-label nanum" for="agree" style="font-size: 18px;">위 약관에 동의합니다</label>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-5"><a class="btn btn-secondary btn-lg btn-block nanum" href="${contextPath}/square" role="button" style="font-size: 25px;">광장으로</a></div>
                    <div class="col-sm-5"><button type="submit" class="btn btn-primary btn-lg btn-block nanum" style="font-size: 25px;">탈퇴하기</button></div>
                    <div class="col-sm-1"></div>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>
        </form>
        <!-- 회원탈퇴 끝 -->
    </div>
    <script>
    
 	// 각 유효성 검사 결과를 저장할 객체
    var signUpCheck = { 
    		"deleteCheck":false,
    		"pwdCheck":false,
    		"reasonCheck":false
			};
 	
 	// 유효성 검사
 	$(function(){
 		var $pwdCheck = $("#pwdCheck");
 		var $agree = $("#agree");
 		var $deleteReason = $("#deleteReason");
 		
 		
 		// 비밀번호 검사
 		$("#pwdCheck").on("input",function(){
 			var regExp = /^[a-zA-Z0-9]{6,12}$/;
 			if(!regExp.test($pwdCheck.val())) {
				$pwdCheck.removeClass("is-valid");
				$pwdCheck.addClass("is-invalid");
				$("#pwdCheckResult").text("비밀번호 형식이 유효하지 않습니다.").css({"color":"red","font-size":"20px"})
				signUpCheck.pwdCheck = false;
 			} else {
 				$pwdCheck.removeClass("is-invalid");
				$pwdCheck.addClass("is-valid");
				$("#pwdCheckResult").text("유효한 형식의 비밀번호입니다.").css({"color":"green","font-size":"20px"});
				signUpCheck.pwdCheck = true;
 			}
 		});
 		
 		
 		// 체크박스 검사
 		$("#agree").on("input",function(){
 			if(!$agree.prop("checked")) {
 				signUpCheck.deleteCheck = false;
 			} else {
 				signUpCheck.deleteCheck = true;
 			}
 		});
 		
 		
 		// 탈퇴사유 검사
 		$("#deleteReason").on("input",function(){
 			if($deleteReason.val().trim().length == 0) {
 				signUpCheck.reasonCheck = false;
 			} else {
 				signUpCheck.reasonCheck = true;
 			}
 		});
 		
 	});
 	
 	// 유효성 함수
 	function validate(){
 		
 		for(var key in signUpCheck){
 			
			if(!signUpCheck[key]){
				if(key == "deleteCheck") {
					alert("약관에 동의하셔야 회원탈퇴가 가능합니다.");
					return false;	
				} else if(key == "pwdCheck") {
					alert("일부 입력값이 잘못되었습니다.");
					$("#pwdCheck").focus();
					return false;	
				} else {
					alert("탈퇴사유를 입력하셔야 회원탈퇴가 가능합니다.");
					return false;	
				}
				
			}
		}
 		
 	}
 	
 	
 	</script>
	<jsp:include page="../common/footer.jsp"/>
	
</body>

</html>