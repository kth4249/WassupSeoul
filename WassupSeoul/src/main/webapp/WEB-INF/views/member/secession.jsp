<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <form action="#">
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
                        <input type="text" class="form-control-plaintext nanum" value="홍길동" style="font-size: 20px;">
                    </div>
                    <div class="col-sm-5"></div>
                </div>
                <br>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;font-size: 20px;">아이디</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control-plaintext nanum" value="hongd@abc.com" style="font-size: 20px;">
                    </div>
                    <div class="col-sm-5"></div>
                </div>
                <br>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;font-size: 20px;">*비밀번호 입력</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control nanum" name="memberPwd" value="" style="font-size: 20px;" placeholder="비밀번호 입력">
                    </div>
                    <div class="col-sm-5"></div>
                </div>
                <br>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;font-size: 20px;">*탈퇴사유</label>
                    <div class="col-sm-5">
                        <textarea class="form-control nanum" rows="5" cols="65" style="resize: none;" name="reason">공부해야 되서 모임 안함</textarea>
                    </div>
                    <div class="col-sm-5"></div>
                </div>
                <br>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label nanum" style="font-weight: bold;font-size: 20px;">*회원 탈퇴 약관</label>
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
                    <div class="col-sm-5"><button type="button" class="btn btn-secondary btn-lg btn-block nanum" style="font-size: 25px;">취소하기</button></div>
                    <div class="col-sm-5"><button type="submit" class="btn btn-primary btn-lg btn-block nanum" style="font-size: 25px;">탈퇴하기</button></div>
                    <div class="col-sm-1"></div>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>
        </form>
        <!-- 회원탈퇴 끝 -->
    </div>
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>